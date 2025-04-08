<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class ApiGames
{
    private $secret_key;
    private $merchant_id;

    public function __construct()
    {
        $this->secret_key = config('apigames.secret_key');
        $this->merchant_id = config('apigames.merchant_id');
    }

    public static function cekUserName($game, $user_id)
    {
        $helper = new self();

        $sign = md5($helper->merchant_id . $helper->secret_key);

        $url = "https://v1.apigames.id/merchant/{$helper->merchant_id}/cek-username/{$game}";
        $url .= "?user_id={$user_id}&signature={$sign}"; // langsung tempel query ke URL

        $response = Http::get($url);

        Log::info($response->body()); // debug isi body-nya

        if ($response->successful()) {
            return $response->json();
        }

        return [
            'success' => false,
            'message' => 'Gagal mengambil data username.',
            'error'   => $response->body(),
        ];
    }


    public static function checkIdUser($costumer_number, $brand)
    {
        $costumer = $costumer_number;

        if ($brand->name == "MOBILE LEGENDS") {
            $values = array_values($costumer);
            Log::info("ini setelah di array values", $values);
            $id_user = $values[0] . ' ' . $values[1];
            Log::info("ini setelah di values[0] values[1] " . $id_user);
            $res  = self::cekUserName('mobilelegend', $id_user);
            Log::info('dan ini hasilnya', $res);
            return $res;
        } elseif ($brand->name == "FREE FIRE") {
            $values = array_values($costumer);
            Log::info("ini setelah di array values", $values);
            $id_user = (string) $values[0];
            Log::info("ini setelah di values[0]" . $id_user);
            $res = self::cekUserName('freefire', $id_user);
            Log::info('dan ini hasilnya', $res);
            return $res;
        } else {
            return [
                'success' => false,
                'message' => 'Brand tidak dikenali.',
            ];
        }
    }
}
