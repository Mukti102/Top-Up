<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Http;

class DigiflazzHelper
{

    private static function generateSignature($parameter = null)
    {
        return md5(config('digiflazz.username') . config('digiflazz.api_key') . $parameter);
    }

    public static function getPriceList()
    {
        $response = Http::post(config('digiflazz.endpoint') . "price-list", [
            "cmd" => "prepaid",
            "username" => config('digiflazz.username'),
            "sign" => self::generateSignature()
        ]);

        return $response->json();
    }

    /**
     * Check Digiflazz Balance
     */
    public static function getBalance()
    {
        $response = Http::post(config('digiflazz.endpoint') . "cek-saldo", [
            "cmd" => "deposit",
            "username" => config('digiflazz.username'),
            "sign" => self::generateSignature('depo')
        ]);
        return $response->json();
    }
}
