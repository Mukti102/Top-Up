<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Http;

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


    public function transaction($method = 'BRIVA', $customer = [], $orderItems = [], $amount = 1000000)
    {
        $merchantRef = "TRX-" . time();
        $expiredTime = time() + (24 * 60 * 60); // 24 jam

        $data = [
            'method'         => $method,
            'merchant_ref'   => $merchantRef,
            'amount'         => $amount,
            'customer_name'  => $customer['name'] ?? 'NAMA PELANGGAN',
            'customer_email' => $customer['email'] ?? 'emailpelanggan@domain.com',
            'customer_phone' => $customer['phone'] ?? '081234567890',
            'order_items'    => $orderItems ?: [
                [
                    'sku'         => 'FB-06',
                    'name'        => 'Nama Produk 1',
                    'price'       => 500000,
                    'quantity'    => 1,
                    'product_url' => 'https://tokokamu.com/product/nama-produk-1',
                    'image_url'   => 'https://tokokamu.com/product/nama-produk-1.jpg',
                ],
                [
                    'sku'         => 'FB-07',
                    'name'        => 'Nama Produk 2',
                    'price'       => 500000,
                    'quantity'    => 1,
                    'product_url' => 'https://tokokamu.com/product/nama-produk-2',
                    'image_url'   => 'https://tokokamu.com/product/nama-produk-2.jpg',
                ]
            ],
            'expired_time' => $expiredTime,
            'signature'    => hash_hmac('sha256', $this->merchanCode . $merchantRef . $amount, $this->privateKey),
        ];

        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $this->apiKey
        ])->post($this->baseUrl . 'transaction/create', $data);
        return $response->json();
    }
}
