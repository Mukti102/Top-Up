<?php

use App\Events\UserLogged;
use App\Helpers\digiflazzRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get(
    '/',
    function () {
        $data = [
            "customer_no" => "1234554321",
            "testing" => true, //optional
        ];
        $testing = new digiflazzRequest();
        return $testing->cekValidasiPln($data);
        return view('welcome');
    }
);

// webhook digiflazz
Route::post('/digiflazz', function (Request $request) {
    event(new UserLogged(Auth::user(), 'WebHook Success' . $request->all()));
});
