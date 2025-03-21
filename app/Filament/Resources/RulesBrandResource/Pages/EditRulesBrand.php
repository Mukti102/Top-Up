<?php

namespace App\Filament\Resources\RulesBrandResource\Pages;

use App\Filament\Resources\RulesBrandResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditRulesBrand extends EditRecord
{
    protected static string $resource = RulesBrandResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
