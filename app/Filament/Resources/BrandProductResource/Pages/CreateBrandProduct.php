<?php

namespace App\Filament\Resources\BrandProductResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\BrandProductResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateBrandProduct extends CreateRecord
{
    protected static string $resource = BrandProductResource::class;

    protected function afterCreate(): void
    {
        try {

            // Trigger event setelah berhasil
            event(new UserLogged(Auth::user(), 'User Berhasil Menambahkan Brand'));
        } catch (\Exception $e) {

            // Jika ingin mencatat error dengan pesan yang lebih spesifik
            event(new UserLogged(Auth::user(), 'User Gagal Menambahkan Brand: ' . $e->getMessage()));
        }
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
