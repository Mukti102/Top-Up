<?php

namespace App\Filament\Resources\KuponResource\Pages;

use App\Filament\Resources\KuponResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditKupon extends EditRecord
{
    protected static string $resource = KuponResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
