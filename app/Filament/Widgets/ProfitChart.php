<?php

namespace App\Filament\Widgets;

use App\Models\Transaction;
use Filament\Widgets\ChartWidget;

class ProfitChart extends ChartWidget
{
    protected static ?string $heading = 'Grafik Keuntungan';

    protected  int|string|array $columnSpan = "full";

    protected function getType(): string
    {
        return 'line';
    }

    protected function getFilters(): ?array
    {
        return [
            'today' => 'Hari Ini',
            'this_month' => 'Bulan Ini',
            'this_year' => 'Tahun Ini',
            'all_time' => 'Semua Waktu',
        ];
    }

    protected function getData(): array
    {
        $filter = $this->filter ?? 'today';

        $query = Transaction::where('status', 'success')->with('product');

        $labels = [];
        $datasets = [];

        switch ($filter) {
            case 'today':
                $query->whereDate('created_at', today());

                $labels = range(0, 23);
                $profits = $query
                    ->get()
                    ->groupBy(fn($t) => $t->created_at->format('H'))
                    ->map(
                        fn($transactions) =>
                        $transactions->sum(fn($t) => $t->total_price - ($t->product->base_price ?? 0))
                    );

                foreach ($labels as $hour) {
                    $hourStr = str_pad($hour, 2, '0', STR_PAD_LEFT);
                    $datasets[] = $profits[$hourStr] ?? 0;
                    $labelList[] = "$hourStr:00";
                }

                $labels = $labelList;
                break;

            case 'this_month':
                $query->whereMonth('created_at', now()->month)
                    ->whereYear('created_at', now()->year);

                $days = range(1, now()->daysInMonth);
                $profits = $query
                    ->get()
                    ->groupBy(fn($t) => $t->created_at->format('d'))
                    ->map(
                        fn($transactions) =>
                        $transactions->sum(fn($t) => $t->total_price - ($t->product->base_price ?? 0))
                    );

                foreach ($days as $day) {
                    $dayStr = str_pad($day, 2, '0', STR_PAD_LEFT);
                    $datasets[] = $profits[$dayStr] ?? 0;
                    $labels[] = "Tanggal $day";
                }
                break;

            case 'this_year':
                $query->whereYear('created_at', now()->year);

                $monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
                $profits = $query
                    ->get()
                    ->groupBy(fn($t) => $t->created_at->format('m'))
                    ->map(
                        fn($transactions) =>
                        $transactions->sum(fn($t) => $t->total_price - ($t->product->base_price ?? 0))
                    );

                foreach (range(1, 12) as $month) {
                    $monthStr = str_pad($month, 2, '0', STR_PAD_LEFT);
                    $datasets[] = $profits[$monthStr] ?? 0;
                    $labels[] = $monthNames[$month - 1];
                }
                break;

            case 'all_time':
            default:
                $profits = $query
                    ->get()
                    ->groupBy(fn($t) => $t->created_at->format('Y'))
                    ->map(
                        fn($transactions) =>
                        $transactions->sum(fn($t) => $t->total_price - ($t->product->base_price ?? 0))
                    );

                foreach ($profits as $year => $value) {
                    $labels[] = $year;
                    $datasets[] = $value;
                }
                break;
        }

        return [
            'datasets' => [
                [
                    'label' => 'Keuntungan',
                    'data' => $datasets,

                ],
            ],
            'labels' => $labels,
        ];
    }
}
