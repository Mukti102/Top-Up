<?php

namespace App\Http\Controllers;

use App\Helpers\TemplateWhatsappHelper;
use App\Helpers\TripayHelper;
use App\Models\PaymentMethod;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class depositController extends Controller
{
    protected $tripay;

    public function __construct()
    {
        $this->tripay = new TripayHelper();
    }

    public function index()
    {
        $paymentMethods = PaymentMethod::with('brands')->get();
        return Inertia::render('Deposit', [
            'paymentMethods' => $paymentMethods
        ]);
    }

    public function deposit(Request $request)
    {
        $request->validate([
            "amount" => 'required',
            'payment_method' => 'required',
        ]);

        try {
            $paymentMethod = PaymentMethod::findOrFail($request->payment_method);
        } catch (ValidationException $e) {
            return back()->withErrors([
                'message' => 'Jumlah atau methode Pembayaran Tidak Boleh Kosong', // Pesan error umum
            ]);
        } catch (\Exception $e) {
            Log::error('Product atau PaymentMethod tidak ditemukan', ['error' => $e->getMessage()]);
            return back()->withErrors(['message' => 'Produk atau metode pembayaran tidak ditemukan.']);
        }

        $amount = str_replace(".", "", $request->amount);

        $merchantRef = "TRX-" . time() . "-" . rand(1000000, 9999999);


        $menit = $paymentMethod->expired_time ?? 24;

        $expiredTime = time() + ($menit * 60);

        $quantity = 1;

        $product = [
            "sku_code" => "Deposit",
            "name" => "deposit",
            "id" => rand(10000, 99999),
            "price" => $amount,
            "quantity" => $quantity,
        ];

        $data = [
            'product'             => $product,
            'merchant_ref'        => $merchantRef,
            'customer_name'       => Auth::check() ? Auth::user()->name : "GUEST",
            'phone'               => Auth::user()->phone,
            'payment_method_code' => $paymentMethod->code,
            'quantity'            => $quantity,
            'amount'              => $amount,
            'expired_time'        => $expiredTime
        ];


        try {
            $response = $this->tripay->transaction($data);

            // Pastikan response ada dan valid
            if (isset($response['success']) && $response['success'] === false) {
                Log::error('Tripay API Error', ['response' => $response]);
                return back()->withErrors(['message' => 'Terjadi kesalahan saat memproses transaksi.']);
            }

            if (!isset($response['data'])) {
                Log::error('Tripay response tidak memiliki data', ['response' => $response]);
                return back()->withErrors(['message' => 'Gagal mendapatkan data transaksi dari Tripay.']);
            }

            $transactionData = $response['data'];

            // Simpan transaksi ke database
            $transaction = Transaction::create([
                'user_id'           =>   Auth::user()->id,
                'type'              => "deposit",
                'quantity'          => 1,
                'price'             => $amount,
                'reference_number'  => $merchantRef,
                'response'          => json_encode($transactionData),
                'phone'             => $transactionData['customer_phone'] ?? Auth::user()->phone,
                'payment_method_id' => $paymentMethod->id,
            ]);

            // send wa
            TemplateWhatsappHelper::userTransactionMessage($transaction, $expiredTime);

            $id = Crypt::encrypt($transaction->id);
            return redirect()->route('transaction.detail', ['id' => urlencode($id)]);
        } catch (\Exception $e) {
            Log::error('Gagal membuat transaksi', ['error' => $e->getMessage()]);
            return back()->withErrors(['message' => 'Terjadi kesalahan: ' . $e->getMessage()]);
        }
    }
}
