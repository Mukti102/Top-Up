<?php

namespace App\Filament\Resources\UserLogsResource\Pages;

use App\Filament\Resources\UserLogsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditUserLogs extends EditRecord
{
    protected static string $resource = UserLogsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
