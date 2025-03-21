<?php

namespace App\Filament\Resources\UserLogsResource\Pages;

use App\Filament\Resources\UserLogsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListUserLogs extends ListRecords
{
    protected static string $resource = UserLogsResource::class;

    protected function getHeaderActions(): array
    {
        return [];
    }
}
