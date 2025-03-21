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

    private static function generateSignature($amount = null)
    {
        $privateKey   = 'ytf6ooi2gmlNPfpchd94jDOk8hRWOu';
        $merchantCode = 'T0001';
        $merchantRef  = 'INV55567';

        $signature = hash_hmac('sha256', $merchantCode . $merchantRef . $amount, $privateKey);
    }

    /**
     * General request handler using Laravel HTTP Client
     */
    private function request($endpoint, $params = [])
    {
        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $this->apiKey
        ])->get($this->baseUrl . $endpoint, $params);

        return $response->json();
    }

    public function getChannel()
    {
        return $this->request("payment-channel");
    }

    public function calculateFee($code = 'QRIS', $amount = 100000)
    {
        return $this->request("fee-calculator", [
            'code' => $code,
            'amount' => $amount,
        ]);
    }

    public function getListTransaction($page = 1, $perPage = 25)
    {
        return $this->request("transactions", [
            'page' => $page,
            'per_page' => $perPage,
        ]);
    }
}
