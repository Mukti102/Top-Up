<?php

namespace App\Filament\Resources\PaymentMethodResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\PaymentMethodResource;
use App\Helpers\TripayHelper;
use App\Models\PaymentMethod;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Support\Facades\Auth;

class ListPaymentMethods extends ListRecords
{
    protected static string $resource = PaymentMethodResource::class;

    protected function syncPaymentMethodToDB()
    {
        try {
            $tripay  = new TripayHelper();
            $chanels = $tripay->getChannel();

            if (!empty($chanels['data'])) {
                $paymentMethods = $chanels['data'];

                foreach ($paymentMethods as $paymentMethod) {
                    if (!empty($paymentMethod['code'])) {
                        $data = [
                            'name' => $paymentMethod['name'] ?? null,
                            'type' => $paymentMethod['group'] ?? null,
                            'fee_percentage' => $paymentMethod['total_fee']['percent'] ?? 0,
                            'fee_fixed' => $paymentMethod['total_fee']['flat'] ?? 0,
                            'minimum_amount' => $paymentMethod['minimum_amount'] ?? 0,
                            'maximum_amount' => $paymentMethod['maximum_amount'] ?? 0,
                            'img_url' => $paymentMethod['icon_url'] ?? null,
                            'img' => $paymentMethod['img'] ?? null,
                            'status' => $paymentMethod['active'] ?? false,
                            'timing' => $paymentMethod['timing'] ?? null,
                            'expired_time' => 60,
                        ];

                        PaymentMethod::updateOrCreate(
                            ['code' => $paymentMethod['code']],
                            $data
                        );
                    }
                }
                event(new UserLogged(Auth::user(), 'User Berhasil Sinkronisasi Payment Method'));
                return Notification::make()
                    ->title('Syncronize Success')
                    ->body('Berhasil Sinkronisasi')
                    ->success()
                    ->color('success')
                    ->send();
            }
        } catch (\Exception $e) {
            event(new UserLogged(Auth::user(), "    "));
            if ($e->getMessage() == "cURL error 28: Failed to connect to tripay.co.id port 443 after 10009 ms: Timeout was reached (see https://curl.haxx.se/libcurl/c/libcurl-errors.html) for https://tripay.co.id/api-sandbox/merchant/payment-channel") {
                return Notification::make()
                    ->title('Syncronize Failed')
                    ->body('Koneksi Timeout Harup Tunggu Selama 5 menit')
                    ->success()
                    ->color('danger')
                    ->send();
            }
            return Notification::make()
                ->title('Syncronize Failed')
                ->body($e->getMessage())
                ->success()
                ->color('danger')
                ->send();
        }
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            Actions\Action::make('Syncronize Payment Method')
                ->label('Syncronize Payment Method')
                ->icon('heroicon-o-arrow-path')
                ->color('info')
                ->action(
                    fn() => $this->syncPaymentMethodToDB()
                )
        ];
    }
}
