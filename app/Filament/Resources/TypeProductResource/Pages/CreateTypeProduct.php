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
        event(new UserLogged(Auth::user(), 'User Berhasil Menambahkan Type Produk'));
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
