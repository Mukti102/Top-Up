<?php

namespace App\Filament\Resources\RulesBrandResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\RulesBrandResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Support\Facades\Auth;

class EditRulesBrand extends EditRecord
{
    protected static string $resource = RulesBrandResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    protected function afterCreate(): void
    {
        event(new UserLogged(Auth::user(), 'User Berhasil Mengupdate Aturan Brand'));
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
