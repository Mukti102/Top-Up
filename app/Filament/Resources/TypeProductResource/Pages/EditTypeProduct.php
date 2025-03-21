<?php

namespace App\Filament\Resources\TypeProductResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\TypeProductResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Auth;

class EditTypeProduct extends EditRecord
{
    protected static string $resource = TypeProductResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
    protected function afterSave(): void
    {
        event(new UserLogged(Auth::user(), 'User Berhasil Mengupdate Type Produk'));
    }
    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
