<?php

use App\Events\UserLogged;
use App\Helpers\digiflazzRequest;
use App\Http\Controllers\digiflazzController;
use App\Http\Controllers\homeController;
use App\Http\Controllers\payment\transactionController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

// frontend
Route::get('/', [homeController::class, 'index']);
Route::get('/{slug}', [HomeController::class, 'show'])->name('show');


// paymet gateway
Route::get('/transaction', [transactionController::class, 'store']);
Route::post('tripay/callback', [transactionController::class, 'callback']);



// webhook digiflazz
Route::post('/digiflazz/callback', [digiflazzController::class, 'webhook']);
Route::get('cek-status', [transactionController::class, 'CekStatusDigiflazz']);
