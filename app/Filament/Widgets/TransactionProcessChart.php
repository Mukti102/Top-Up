<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;

class TransactionProcessChart extends TransactionChart
{
    public static string $status = 'processing';
    public static string $judul = 'Grafik Transaksi pembayaran berhasil dan siap  Diproses';



    protected function getType(): string
    {
        return 'bar';
    }
}
