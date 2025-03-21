<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Http;

class digiflazzRequest
{

    private $username;
    public function __construct()
    {
        $this->username = config('digiflazz.username');
    }

    private static function generateSignature($parameter = null)
    {
        return md5(config('digiflazz.username') . config('digiflazz.api_key') . $parameter);
    }

    private function request($endpoint, $params = [])
    {
        $response = Http::withHeaders([
            'Content-Type' => 'application/json'
        ])->post(config('digiflazz.endpoint') . $endpoint, $params);

        return $response->json();
    }

    public function deposit($parameter)
    {
        $data =  [
            'username' => $this->username,
            'amount' => $parameter['amount'],
            "Bank" => $parameter['bank'],
            "owner_name" =>  $parameter['owner_name'],
            "sign" => self::generateSignature('deposit')
        ];
        return $this->request("deposit", $data);
    }

    public function topup($parameter)
    {
        $data = [
            "username" => $this->username,
            "sign" => self::generateSignature($parameter['ref_id']),
            "buyer_sku_code" => $parameter['buyer_sku_code'],
            "customer_no" => $parameter['customer_no'],
            "ref_id" => $parameter['ref_id'],
        ];

        return $this->request("transaction", $data);
    }

    public function cekTagihan($parameter)
    {
        $data = [
            "command" => "inq-pasca",
            "username" => $this->username,
            "sign" => self::generateSignature($parameter['ref_id']),
            "buyer_sku_code" => $parameter['buyer_sku_code'],
            "customer_no" => $parameter['customer_no'],
            "ref_id" => $parameter['ref_id'],
        ];

        return $this->request("transaction", $data);
    }

    public function bayarTagihan($parameter)
    {
        $data = [
            "command" => "pay-pasca",
            "username" => $this->username,
            "buyer_sku_code" => $parameter['buyer_sku_code'],
            "customer_no" => $parameter['customer_no'],
            "ref_id" => $parameter['ref_id'],
            "sign" => self::generateSignature($parameter['ref_id']),
        ];

        return $this->request("transaction", $data);
    }

    public function cekStatus($parameter)
    {
        $data = [
            "command" => "status-pasca",
            "username" => $this->username,
            "buyer_sku_code" => $parameter['buyer_sku_code'],
            "customer_no" => $parameter['customer_no'],
            "ref_id" => $parameter['ref_id'],
            "sign" => self::generateSignature($parameter['ref_id']),
        ];

        return $this->request('transaction', $data);
    }


    public function cekValidasiPln($parameter)
    {
        $data = [
            "username" => $this->username,
            "costumer_no" => $parameter['customer_no'],
            "sign" => self::generateSignature($parameter['customer_no']),
        ];

        return  $this->request("inquiry-pln", $data);
    }
}
