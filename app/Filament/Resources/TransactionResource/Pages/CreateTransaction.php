<?php

namespace App\Filament\Resources\TransactionResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\TransactionResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateTransaction extends CreateRecord
{
    protected static string $resource = TransactionResource::class;
}
