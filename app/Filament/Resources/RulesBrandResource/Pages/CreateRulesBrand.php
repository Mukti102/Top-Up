<?php

namespace App\Filament\Resources\RulesBrandResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\RulesBrandResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateRulesBrand extends CreateRecord
{
    protected static string $resource = RulesBrandResource::class;

    protected function afterCreate(): void
    {
        event(new UserLogged(Auth::user(), 'User Berhasil Menambahkan Aturan Brand '));
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
