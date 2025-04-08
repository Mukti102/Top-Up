<?php

namespace App\Filament\Resources\WhatsappTemplateResource\Pages;

use App\Filament\Resources\WhatsappTemplateResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditWhatsappTemplate extends EditRecord
{
    protected static string $resource = WhatsappTemplateResource::class;

    public function getTitle(): string
    {
        return $this->record->name;
    }

    protected function getHeaderActions(): array
    {
        return [];
    }
}
