<?php

namespace App\Filament\Resources\TypeProductResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\TypeProductResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateTypeProduct extends CreateRecord
{
    protected static string $resource = TypeProductResource::class;

    protected function afterCreate(): void
    {
        try {

            // Trigger event setelah berhasil
            event(new UserLogged(Auth::user(), 'User Berhasil Menambahkan Tipe'));
        } catch (\Exception $e) {

            // Jika ingin mencatat error dengan pesan yang lebih spesifik
            event(new UserLogged(Auth::user(), 'User Gagal Menambahkan Tipe: ' . $e->getMessage()));
        }
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
