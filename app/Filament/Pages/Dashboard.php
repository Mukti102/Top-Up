<?php

namespace App\Filament\Pages;

use App\Filament\Widgets\ProfitChart;
use Filament\Pages\Dashboard as BaseDashboard;
use App\Filament\Widgets\StatsOverview;
use App\Filament\Widgets\TransactionChart;
use App\Filament\Widgets\TransactionFailedChart;
use App\Filament\Widgets\TransactionPendingChart;
use App\Filament\Widgets\TransactionProcessChart;
use App\Filament\Widgets\TransactionSuccessChart;
use Filament\Widgets\AccountWidget;

class Dashboard extends BaseDashboard
{
    protected static ?string $navigationIcon = 'heroicon-o-home';
    protected static ?string $navigationLabel = 'Dashboard';

    public function getWidgets(): array
    {
        return [
            AccountWidget::class,
            \App\Filament\Widgets\StatsOverview::class,
            TransactionSuccessChart::class,
            TransactionPendingChart::class,
            TransactionProcessChart::class,
            TransactionFailedChart::class,
            ProfitChart::class,
        ];
    }
}
