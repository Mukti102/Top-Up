<?php

namespace App\Http\Controllers\payment;

use App\Helpers\TripayHelper;
use App\Http\Controllers\Controller;
use App\Models\PaymentMethod;
use App\Models\Transaction;
use Illuminate\Http\Request;

class transactionController extends Controller
{

    protected $tripay;

    public function __construct()
    {
        $this->tripay = new TripayHelper();
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

            return $db;
        } catch (\Exception $e) {
            return $e->getMessage();
        }
    }
}
