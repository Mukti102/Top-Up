<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use App\Models\Transaction;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class TransactionChart extends ChartWidget
{

    public static string $status = 'success'; // default
    public static string $judul = 'Grafik Transaksi Berhasil';



    // Gunakan method ini untuk heading dinamis
    public function getHeading(): ?string
    {
        return static::$judul;
    }


    protected function getType(): string
    {
        return 'bar';
    }

    protected function getFilters(): ?array
    {
        return [
            'today' => 'Hari Ini',
            'this_month' => 'Bulan Ini',
            'this_year' => 'Tahun Ini',
            'all_time' => 'Selama Ini',
        ];
    }

    protected function getData(): array
    {
        $filter = $this->filter ?? 'today';
        $query = Transaction::where('status', static::$status);

        // Default values
        $labels = [];
        $data = [];

        switch ($filter) {
            case 'today':
                $query->whereDate('created_at', today());

                $labels = range(0, 23);
                $data = $query
                    ->selectRaw('HOUR(created_at) as hour, COUNT(*) as total')
                    ->groupBy('hour')
                    ->orderBy('hour')
                    ->pluck('total', 'hour');

                $datasets = [];
                foreach ($labels as $hour) {
                    $datasets[] = $data[$hour] ?? 0;
                    $hour = str_pad($hour, 2, '0', STR_PAD_LEFT);
                    $hourLabels[] = $hour . ':00';
                }
                $labels = $hourLabels;
                break;

            case 'this_month':
                $query->whereMonth('created_at', now()->month)
                    ->whereYear('created_at', now()->year);

                $labels = range(1, now()->daysInMonth);
                $data = $query
                    ->selectRaw('DAY(created_at) as day, COUNT(*) as total')
                    ->groupBy('day')
                    ->orderBy('day')
                    ->pluck('total', 'day');

                $datasets = [];
                foreach ($labels as $day) {
                    $datasets[] = $data[$day] ?? 0;
                    $labels[$day - 1] = 'Tanggal ' . $day;
                }
                break;

            case 'this_year':
                $query->whereYear('created_at', now()->year);

                $monthNames = [
                    'Jan',
                    'Feb',
                    'Mar',
                    'Apr',
                    'Mei',
                    'Jun',
                    'Jul',
                    'Agu',
                    'Sep',
                    'Okt',
                    'Nov',
                    'Des'
                ];
                $data = $query
                    ->selectRaw('MONTH(created_at) as month, COUNT(*) as total')
                    ->groupBy('month')
                    ->orderBy('month')
                    ->pluck('total', 'month');

                $datasets = [];
                foreach (range(1, 12) as $month) {
                    $datasets[] = $data[$month] ?? 0;
                    $labels[] = $monthNames[$month - 1];
                }
                break;

            case 'all_time':
            default:
                $data = $query
                    ->selectRaw('YEAR(created_at) as year, COUNT(*) as total')
                    ->groupBy('year')
                    ->orderBy('year')
                    ->pluck('total', 'year');

                $years = $data->keys()->toArray();
                $datasets = [];
                foreach ($years as $year) {
                    $datasets[] = $data[$year];
                    $labels[] = (string) $year;
                }
                break;
        }

        return [
            'datasets' => [
                [
                    'label' => 'Transaksi Berhasil',
                    'data' => $datasets ?? [],
                ],
            ],
            'labels' => $labels,
        ];
    }
}
