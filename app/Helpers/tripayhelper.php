<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class TripayHelper
{
    private $apiKey;
    private $baseUrl;
    private $privateKey;
    private $merchanCode;

    public function __construct()
    {
        $this->apiKey = config('tripay.api_key');
        $this->baseUrl = config('tripay.base_url');
        $this->privateKey = config('tripay.private_key');
        $this->merchanCode = config('tripay.merchant_code');
    }

    private function getRequest($endpoint, $params = [])
    {
        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $this->apiKey
        ])->get($this->baseUrl . $endpoint, $params);

        return $response->json();
    }

    public function getChannel()
    {
        return $this->getRequest("merchant/payment-channel");
    }


    public function transaction($customer)
    {
        $expiredTime = $customer["expired_time"] ?? time() + (60 * 60); // 1 jam

        $product = $customer['product'];
        $paymentMethod = $customer['payment_method_code'];
        $email = $customer['email'] ?? "admin@gmail.com";
        $phone = $customer['phone'] ?? '081234567890';
        $amount = (string) $customer['amount'];
        $merchantRef = $customer['merchant_ref'] ?? "TRX-" . time() . "-" . rand(10000, 99999);

        $data = [
            'method'         => $paymentMethod,
            'merchant_ref'   => $merchantRef,
            'amount'         => number_format(ceil($amount), 0, '', ''),
            'customer_name'  => $customer['customer_name'] ?? 'Guest',
            'customer_email' => $email ?? 'abdulmukti40390@gmail.com',
            'customer_phone' => $phone,
            'order_items'    => [
                [
                    'sku'       => $product->sku_code ?? "KODE",
                    'id'       => $product->id ?? "1",
                    'name'     => $product->name ?? "Produuct",
                    'price'    => number_format(ceil($amount), 0, '', ''),
                    'quantity' => $customer['quantity'] ?? '1',
                ]
            ],
            'expired_time' => $expiredTime,
            'signature'    => hash_hmac('sha256', $this->merchanCode . $merchantRef . number_format($amount, 0, '', ''), $this->privateKey),
        ];

        Log::info("tripay", $data);

        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $this->apiKey
        ])->post($this->baseUrl . 'transaction/create', $data);
        return  json_decode($response->body(), true);
    }


    public function detailTransaction($reference)
    {

        $payload = ['reference'    => $reference];

        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $this->apiKey
        ])->get($this->baseUrl . 'transaction/detail?' . http_build_query($payload));

        return json_decode($response);
    }
}
