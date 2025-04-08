<?php

namespace App\Filament\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends BaseWidget
{
    protected function getStats(): array
    {
        // Get saldo Digiflazz
        $saldo = \App\Helpers\digiflazzHelper::getBalance();
        $total = $saldo ?  $saldo['data']['deposit'] : "0.00";

        // Inisialisasi jam dari 0 - 23
        $hours = range(0, 23);

        // Fungsi helper untuk membuat chart berdasarkan status transaksi
        $buildChart = function ($statusColumn, $statusValue) use ($hours) {
            $chartData = \App\Models\Transaction::selectRaw('HOUR(created_at) as hour, COUNT(*) as total')
                ->where($statusColumn, $statusValue)
                ->whereDate('created_at', today())
                ->groupBy('hour')
                ->orderBy('hour')
                ->pluck('total', 'hour');

            $chart = [];
            foreach ($hours as $hour) {
                $chart[] = $chartData[$hour] ?? 0;
            }
            return $chart;
        };

        // Hitung total per status
        $transaksiPending   = \App\Models\Transaction::where("status", 'pending')->whereDate('created_at', today())->count();
        $transaksiProcess   = \App\Models\Transaction::where("status", 'processing')->whereDate('created_at', today())->count();
        $transaksiSuccess   = \App\Models\Transaction::where("status", 'success')->whereDate('created_at', today())->count();
        $transaksiFailed    = \App\Models\Transaction::where("status", 'failed')->whereDate('created_at', today())->count();
        $transaksiExpired   = \App\Models\Transaction::where("status_payment", 'expired')->whereDate('created_at', today())->count();

        return [
            Stat::make('Saldo Digiflazz', number_format($total, 2, ',', '.'))
                ->descriptionIcon('heroicon-o-currency-dollar')
                ->description('Total Saldo digiflazz'),

            Stat::make('Transaksi Pending Hari ini', $transaksiPending)
                ->description('Transaksi baru dibuat hari ini')
                ->chart($buildChart('status', 'pending'))
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('warning'),

            Stat::make('Transaksi Processing Hari ini', $transaksiProcess)
                ->description('Pembayaran berhasil dan siap diproses')
                ->chart($buildChart('status', 'processing'))
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('info'),

            Stat::make('Transaksi Success Hari ini', $transaksiSuccess)
                ->description('Transaksi selesai hari ini')
                ->chart($buildChart('status', 'success'))
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success'),

            Stat::make('Transaksi Gagal Hari ini', $transaksiFailed)
                ->description('Transaksi gagal hari ini')
                ->chart($buildChart('status', 'failed'))
                ->descriptionIcon('heroicon-m-arrow-trending-down')
                ->color('danger'),

            Stat::make('Transaksi Expired Hari ini', $transaksiExpired)
                ->description('Transaksi kadaluarsa hari ini')
                ->chart($buildChart('status_payment', 'expired'))
                ->descriptionIcon('heroicon-m-arrow-trending-down')
                ->color('indigo'),
        ];
    }
}
