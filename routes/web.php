<?php

use App\Events\UserLogged;
use App\Helpers\digiflazzRequest;
use App\Http\Controllers\payment\transactionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get(
    '/',
    function () {
        return inertia('Home', [
            'title' => 'Home',
            'name' => 'John Doe',
        ]);
    }
);

// paymet gateway
Route::get('/transaction', [transactionController::class, 'store']);



// webhook digiflazz
Route::post('/digiflazz', function (Request $request) {
    event(new UserLogged(Auth::user(), 'WebHook Success' . $request->all()));
});
