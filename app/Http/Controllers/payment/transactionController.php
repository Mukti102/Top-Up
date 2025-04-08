<?php

namespace App\Http\Controllers\payment;

use App\Events\UserLogged;
use App\Helpers\ApiGames;
use App\Helpers\digiflazzRequest;
use App\Helpers\templateWhatsappHelper;
use App\Helpers\TripayHelper;
use App\Http\Controllers\Controller;
use App\Jobs\SendWa;
use App\Models\Kupon;
use App\Models\PaymentMethod;
use App\Models\Product;
use App\Models\Transaction;
use App\Models\User;
use App\Models\WhatsappTemplate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Inertia\Inertia;
use Outerweb\Settings\Models\Setting;

use function Pest\Laravel\json;

class transactionController extends Controller
{

    protected $tripay;
    protected $privateKey;
    protected $digiflazz;

    public function __construct()
    {
        $this->tripay = new TripayHelper();
        $this->digiflazz = new digiflazzRequest();
        $this->privateKey = config('tripay.private_key');
    }

    public function testing()
    {
        $id = Crypt::encrypt(1);
        return redirect()->route('transaction.detail', ['id' => urlencode($id), 'response' => "success"]);
    }




    public function store(Request $request)
    {

        $request->validate([
            'product_id'        => 'required',
            'costumer_number'   => 'required',
            'quantity'          => 'required',
            'email'             => 'nullable',
            'phone'             => 'required',
            'payment_method_id' => 'required',
            'voucher_id'         => 'nullable'
        ]);

        try {
            $product = Product::with('brand')->findOrFail($request->product_id);
            $paymentMethod = PaymentMethod::findOrFail($request->payment_method_id);
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Produk atau metode pembayaran tidak ditemukan.']);
        }

        $brand = $product->brand;
        if ($brand->name == "MOBILE LEGENDS" || $brand->name == "FREE FIRE") {
            $checkIdGame = apiGames::checkIdUser($request->costumer_number, $brand);
            if ($checkIdGame['status'] !== 1) {
                return back()->withErrors(['error' => 'ID Game Tidak di temukan']);
            }
        }

        // Ambil kupon jika ada
        $kupon = Kupon::find($request->voucher_id);


        // fee tripay
        $fee = $paymentMethod->fee_fixed;

        // is member premium
        $isPremium = Auth::user() && Auth::user()->level == "premium";

        $productPrice = $isPremium ? $product->membership_price : $product->total_price;

        // Hitung total harga sebelum diskon
        $subtotal = $productPrice * $request->quantity + $fee;


        // Jika ada kupon, kurangkan diskon dalam bentuk persentase
        $discount = $kupon ? (($kupon->discount / 100) * $subtotal) : 0;


        // Hitung total setelah diskon
        $amount = max(0, $subtotal - $discount);
        $prefix = Setting::where('key', 'transaction.prefix.code')->first()->value;
        $merchantRef = $prefix . "-" . time() . "-" . rand(1000000, 9999999);

        $menit = $paymentMethod->expired_time ?? 24;

        if ($paymentMethod->expired_time == null) {
            $menit = Setting::where('key', 'transaction.expired.time')->first()->value;
        }


        if ($paymentMethod->type == "Saldo Member") {
            $auth = Auth::user();
            // cek saldo cukup
            if ($auth->saldo >= $amount) {
                $auth->decrement('saldo', $amount); // kurangi saldo
                $auth->save();
                // simpan transaksi ke database
                $transaction = Transaction::create([
                    'product_id'        => $request->product_id,
                    'costumer_number'   => is_array($request->costumer_number) ? implode(' ', $request->costumer_number) : $request->costumer_number,
                    'quantity'          => $request->quantity,
                    'price'             => $amount,
                    'reference_number'  => $merchantRef,
                    // 'response'          => json_encode($transactionData),
                    'phone'             => $transactionData['customer_phone'] ?? $request->phone,
                    'payment_method_id' => $paymentMethod->id,
                    'kupon_id'          => $kupon ? $kupon->id : null,
                    'status'            => "processing",
                    'status_payment'    => "success",
                    'user_id'           => $auth->id
                ]);

                // sendwa to user
                SendWa::dispatch($auth->phone, "Halo " . $auth->name . ", kamu sudah melakukan pembayaran sebesar " . $amount . " untuk produk " . $product->name . " dengan metode pembayaran " . $paymentMethod->name . "kami  akan segera memroses pesanan kamu.Terima kasih.");

                // pesan ke admin
                // send wa to admin 
                $admin = User::where('role_id', '1')->get();

                foreach ($admin as $ad) {
                    SendWa::dispatch($ad->phone, "Halo Admin, ada transaksi baru dengan nomor invoice " . $merchantRef . ". dengan metode pembayaran " . $paymentMethod->name . " Silahkan cek di panel admin.");
                }


                if ($product->provider == "DigiFlazz") {
                    $this->sendToDigiflazz($transaction);
                } else {
                    // pesan ke admin 
                    // send wa to admin 
                    $admin = User::where('role_id', '1')->get();

                    foreach ($admin as $ad) {
                        SendWa::dispatch($ad->phone, "Halo Admin, ada transaksi baru dengan nomor invoice " . $merchantRef . ". dengan provider *non vendor* Silahkan cek di panel admin.");
                    }
                }

                $id = Crypt::encrypt($transaction->id);

                return redirect()->route('transaction.detail', ['id' => urlencode($id)]);
            } else {
                return back()->withErrors([
                    'error' => 'Saldo kamu tidak cukup',
                ]);
            }
        }



        $expiredTime = time() + ($menit * 60);
        $data = [
            'product'             => $product,
            'merchant_ref'        => $merchantRef,
            'customer_name'       => $request->name ?? "Guest",
            'email'               => $request->email ?? "emailpelanggan@domain.com",
            'phone'               => $request->phone,
            'payment_method_code' => $paymentMethod->code,
            'quantity'            => $request->quantity,
            'amount'              => $amount,
            'expired_time'        => $expiredTime
        ];

        try {
            $response = $this->tripay->transaction($data);

            // Pastikan response ada dan valid
            if (isset($response['success']) && $response['success'] === false) {
                return back()->withErrors(['error' => 'Terjadi kesalahan saat memproses transaksi, Pastikan data benar ']);
            }

            if (!isset($response['data'])) {
                return back()->withErrors(['error' => 'Gagal mendapatkan data transaksi dari Tripay.']);
            }

            $transactionData = $response['data'];

            // Simpan transaksi ke database
            $transaction = Transaction::create([
                'product_id'        => $request->product_id,
                'costumer_number'   => is_array($request->costumer_number) ? implode(' ', $request->costumer_number) : $request->costumer_number,
                'quantity'          => $request->quantity,
                'price'             => $amount,
                'reference_number'  => $merchantRef,
                'response'          => json_encode($transactionData),
                'email'             => $transactionData['customer_email'] ?? $request->email,
                'phone'             => $transactionData['customer_phone'] ?? $request->phone,
                'payment_method_id' => $paymentMethod->id,
                'kupon_id'          => $kupon ? $kupon->id : null
            ]);

            // send wa
            templateWhatsappHelper::userTransactionMessage($transaction, $expiredTime);

            $id = Crypt::encrypt($transaction->id);

            return redirect()->route('transaction.detail', ['id' => urlencode($id)]);
        } catch (\Exception $e) {
            return back()->withErrors(['error' => 'Terjadi kesalahan: ' . $e->getMessage()]);
        }
    }


    public function detail($id)
    {
        try {
            $id = Crypt::decrypt(urldecode($id));
            $transaction = Transaction::with('paymentMethod', 'product.brand')->findOrFail($id);
            // $reference = json_decode($transaction['response'])->reference;
            // $response = $this->tripay->detailTransaction($reference);
            if (!$transaction) {
                abort(404, 'Transaction not found');
            }
            return Inertia::render('DetailTransaction', [
                'transaction' => $transaction,
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Invalid ID', 'message' => $e->getMessage()], 400);
        }
    }

    public function callback(Request $request)
    {
        $callbackSignature = $request->server('HTTP_X_CALLBACK_SIGNATURE');
        $json = $request->getContent();
        $signature = hash_hmac('sha256', $json, $this->privateKey);


        if ($signature !== (string) $callbackSignature) {
            return Response::json([
                'success' => false,
                'message' => 'Invalid signature',
            ]);
        }

        if ('payment_status' !== (string) $request->server('HTTP_X_CALLBACK_EVENT')) {
            return Response::json([
                'success' => false,
                'message' => 'Unrecognized callback event, no action was taken',
            ]);
        }

        $data = json_decode($json);
        if (JSON_ERROR_NONE !== json_last_error()) {
            return Response::json([
                'success' => false,
                'message' => 'Invalid data sent by tripay',
            ]);
        }


        $merchantRef  = $data->merchant_ref;
        $tripayReference = $data->reference;
        $status = strtoupper((string) $data->status);



        if ($data->is_closed_payment === 1) {
            $transaction  = Transaction::where('reference_number', $merchantRef)->first();

            if (!$transaction) {
                return Response::json([
                    'success' => false,
                    'message' => 'No invoice found or already paid: ' . $merchantRef,
                ]);
            }

            switch ($status) {
                case 'PAID':
                    if ($transaction->type == 'deposit') {
                        $transaction->update(['status_payment' => 'success', 'processed_at' => now()]);
                        $transaction->update(['status' => 'success']);
                        $user = User::find($transaction->user_id);
                        $user->increment("saldo", $transaction->price);
                        SendWa::dispatch($transaction->phone, "Pembayaran Succes Silahkan Cek Saldo Anda Di Web/Aplikasi");
                        templateWhatsappHelper::adminMessageAfterUserSuccessPayment($transaction);
                        break;
                    } else {
                        $transaction->update(['status_payment' => 'success', 'processed_at' => now()]);
                        $transaction->update(['status' => 'processing']);
                        templateWhatsappHelper::userSuccessPaymentMessage($transaction);
                        templateWhatsappHelper::adminMessageAfterUserSuccessPayment($transaction);
                        break;
                    }

                case 'EXPIRED':
                    $transaction->update(['status_payment' => 'expired']);
                    $transaction->update(['status' => 'failed']);
                    // send wa to user
                    SendWa::dispatch($transaction->phone, "Halo Transaksi kamu dengan Nomor Invoice " . $transaction->reference_number . " Pembayaran Gagal Karena Expired silahkan lakukan pesan ulang");
                    break;

                case 'FAILED':
                    $transaction->update(['status_payment' => 'failed']);
                    $transaction->update(['status' => 'failed']);
                    // send wa to user
                    SendWa::dispatch($transaction->phone, "Halo Transaksi kamu dengan Nomor Invoice " . $transaction->reference_number . " Pembayaran Gagal");
                    break;
                default:
                    return Response::json([
                        'success' => false,
                        'message' => 'Unrecognized payment status',
                    ]);
            }
            if ($transaction->type == "deposit") {
                return Response::json(['success' => true]);
            }
            if ($transaction->product->provider == "DigiFlazz") {
                $this->sendToDigiflazz($transaction);
            } else {
                $admin = User::where('role_id', '1')->get();
                // send wa to admin
                foreach ($admin as $a) {
                    SendWa::dispatch($a->phone, "Halo admin transaksi  Nomor Invoice " . $transaction->reference_number . " baru saja selesai melakukan pembayaran untuk product non vendor silahkan cek dan proses");
                }
            }
            return Response::json(['success' => true]);
        }
    }

    public function sendToDigiflazz($transaction)
    {
        try {
            $response = $this->digiflazz->topup([
                'customer_no' => $transaction->costumer_number,
                'buyer_sku_code' =>  optional($transaction->product)->sku_code,
                'ref_id' => $transaction->reference_number,
                'testing' => false,
            ]);

            event(new UserLogged("callbakc", json_encode($response)));


            $response = $response['data'];

            // update status transaction
            $transaction->update([
                'status' => $response['status'] == 'Pending' ? "processing" : $response['status'],
                'response' => json_encode($response)
            ]);

            Log::info($response);
            // return $respoonse;
        } catch (\Exception $e) {
            Log::error('Digiflazz Error', ['error' => $e->getMessage()]);
            return $e->getMessage();
        }
    }

    public function CekStatusDigiflazz()
    {
        try {
            $response  = $this->digiflazz->cekStatus([
                "buyer_sku_code" => "1BCC",
                "ref_id" => "TRX-1742724681-2961",
                "customer_no" => "12345",
            ]);

            Log::info($response);
            return $response;
        } catch (\Exception $e) {
            Log::error('Digiflazz Error', ['error' => $e->getMessage()]);
            return $e->getMessage();
        }
    }
}
