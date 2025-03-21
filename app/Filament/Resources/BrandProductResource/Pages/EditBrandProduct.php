<?php

namespace App\Filament\Resources\BrandProductResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\BrandProductResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Auth;

class EditBrandProduct extends EditRecord
{
    protected static string $resource = BrandProductResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function afterSave(): void
    {
        event(new UserLogged(Auth::user(), 'User Berhasil Mengupdate Brand'));
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
