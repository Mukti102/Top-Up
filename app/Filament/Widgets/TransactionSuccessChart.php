<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;

class TransactionSuccessChart extends TransactionChart
{
    public static string $status = 'success';
    public static string $judul = 'Grafik Transaksi Berhasil';



    protected function getType(): string
    {
        return 'bar';
    }
}
