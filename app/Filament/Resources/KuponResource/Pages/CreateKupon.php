<?php

namespace App\Filament\Resources\KuponResource\Pages;

use App\Filament\Resources\KuponResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateKupon extends CreateRecord
{
    protected static string $resource = KuponResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
