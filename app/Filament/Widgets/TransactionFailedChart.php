<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;

class TransactionFailedChart extends TransactionChart
{
    public static string $status = 'failed';
    public static string $judul = 'Grafik Transaksi Gagal';

    protected function getType(): string
    {
        return 'bar';
    }
}
