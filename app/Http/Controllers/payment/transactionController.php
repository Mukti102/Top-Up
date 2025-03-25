<?php

namespace App\Http\Controllers\payment;

use App\Events\UserLogged;
use App\Helpers\digiflazzRequest;
use App\Helpers\TripayHelper;
use App\Http\Controllers\Controller;
use App\Models\PaymentMethod;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;

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

    public function store(Request $request)
    {
        try {
            $response = $this->tripay->transaction();
            $response = $response['data'];

            $db = Transaction::create([
                'product_id'        => 1,
                'costumer_number'   => '12345',
                'quantity'          => 1,
                'price'             => 1000000,
                'reference_number'  => $response['merchant_ref'],
                'response'          => json_encode($response), // Ubah array menjadi JSON
                'email'             => $response['customer_email'],
                'phone'             => $response['customer_phone'],
                'payment_method_id' => PaymentMethod::where('code', $response['payment_method'])->first()->id,
            ]);

            event(new UserLogged("", 'User Berhasil Membuat Transaksi'));

            return $db;
        } catch (\Exception $e) {
            return $e->getMessage();
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
                    $transaction->update(['status_payment' => 'success', 'processed_at' => now()]);
                    break;

                case 'EXPIRED':
                    $transaction->update(['status_payment' => 'failed']);
                    break;

                case 'FAILED':
                    $transaction->update(['status_payment' => 'failed']);
                    break;

                default:
                    return Response::json([
                        'success' => false,
                        'message' => 'Unrecognized payment status',
                    ]);
            }

            $this->sendToDigiflazz($transaction);
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
