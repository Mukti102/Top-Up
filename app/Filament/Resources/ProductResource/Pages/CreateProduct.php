<?php

namespace App\Filament\Resources\ProductResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\ProductResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateProduct extends CreateRecord
{
    protected static string $resource = ProductResource::class;

    protected function afterCreate(): void
    {
        try {

            // Trigger event setelah berhasil
            event(new UserLogged(Auth::user(), 'User Berhasil Menambahkan Product'));
        } catch (\Exception $e) {

            // Jika ingin mencatat error dengan pesan yang lebih spesifik
            event(new UserLogged(Auth::user(), 'User Gagal Menambahkan Product: ' . $e->getMessage()));
        }
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
