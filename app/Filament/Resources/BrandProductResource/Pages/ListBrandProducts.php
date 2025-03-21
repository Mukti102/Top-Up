<?php

namespace App\Filament\Resources\BrandProductResource\Pages;

use App\Filament\Resources\BrandProductResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBrandProducts extends ListRecords
{
    protected static string $resource = BrandProductResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
