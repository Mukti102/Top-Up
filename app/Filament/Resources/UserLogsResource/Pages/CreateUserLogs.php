<?php

namespace App\Filament\Resources\UserLogsResource\Pages;

use App\Filament\Resources\UserLogsResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateUserLogs extends CreateRecord
{
    protected static string $resource = UserLogsResource::class;
    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
