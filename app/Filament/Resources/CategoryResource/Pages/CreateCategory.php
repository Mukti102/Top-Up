<?php

namespace App\Filament\Resources\CategoryResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\CategoryResource;
use Filament\Actions;

use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateCategory extends CreateRecord
{
    protected static string $resource = CategoryResource::class;

    protected function afterCreate(): void
    {
        event(new UserLogged(Auth::user(), 'User Berhasil Menambahkan Kategori'));
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
