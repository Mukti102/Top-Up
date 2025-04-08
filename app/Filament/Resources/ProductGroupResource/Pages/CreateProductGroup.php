<?php

namespace App\Filament\Resources\ProductGroupResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\ProductGroupResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateProductGroup extends CreateRecord
{
    protected static string $resource = ProductGroupResource::class;
    protected function afterCreate(): void
    {
        try {

            // Trigger event setelah berhasil
            event(new UserLogged(Auth::user(), 'User Berhasil Menambahkan Group'));
        } catch (\Exception $e) {

            // Jika ingin mencatat error dengan pesan yang lebih spesifik
            event(new UserLogged(Auth::user(), 'User Gagal Menambahkan Group: ' . $e->getMessage()));
        }
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
