<?php

namespace App\Filament\Resources\RulesBrandResource\Pages;

use App\Filament\Resources\RulesBrandResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListRulesBrands extends ListRecords
{
    protected static string $resource = RulesBrandResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
