<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use Illuminate\Support\Facades\Artisan;
use Filament\Notifications\Notification;

class OptimizeTools extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-rocket-launch';
    protected static string $view = 'filament.pages.optimize-tools';
    protected static ?string $navigationLabel = 'Optimize';
    protected static ?string $navigationGroup = 'Pengaturan';
    protected static ?string $title = 'Optimize Tools';

    public function clearCache()
    {
        Artisan::call('optimize:clear');

        Notification::make()
            ->title('Cache Cleared!')
            ->success()
            ->send();
    }

    public function optimizeApp()
    {
        Artisan::call('optimize');

        Notification::make()
            ->title('App Optimized!')
            ->success()
            ->send();
    }
}
