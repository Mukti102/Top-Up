<?php

namespace App\Filament\Resources\PaymentMethodResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\PaymentMethodResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreatePaymentMethod extends CreateRecord
{
    protected static string $resource = PaymentMethodResource::class;

    protected function afterCreate(): void
    {
        try {

            // Trigger event setelah berhasil
            event(new UserLogged(Auth::user(), 'User Berhasil Menambahkan Metode Pembayaran'));
        } catch (\Exception $e) {

            // Jika ingin mencatat error dengan pesan yang lebih spesifik
            event(new UserLogged(Auth::user(), 'User Gagal Menambahkan Metode Pembayaran: ' . $e->getMessage()));
        }
    }
}
