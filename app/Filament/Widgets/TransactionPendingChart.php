<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;

class TransactionPendingChart extends TransactionChart
{
    public static string $status = 'pending';
    public static string $judul = 'Grafik Transaksi Pending';


    protected function getType(): string
    {
        return 'bar';
    }
}
