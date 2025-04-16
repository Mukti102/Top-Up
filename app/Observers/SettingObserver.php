<?php

namespace App\Observers;

use Illuminate\Support\Facades\Storage;
use Outerweb\Settings\Models\Setting;


class SettingObserver
{
    /**
     * Handle the Setting "created" event.
     */
    public function created(Setting $setting): void
    {
        //
    }

    /**
     * Handle the Setting "updated" event.
     */
    public function updated(Setting $setting): void
    {
        $fileKeys = [
            'background.home',
            'background.show',
            'general.brand.logo',
            'general.brand.favicon',
            'login.svg',
            'register.svg',
            'forgot.svg',
            'OTP.svg',
            'reset.svg',
        ];

        if (in_array($setting->key, $fileKeys) && $setting->isDirty('value')) {
            $oldFile = $setting->getOriginal('value');

            if ($oldFile && Storage::disk('public')->exists($oldFile)) {
                Storage::disk('public')->delete($oldFile);
            }
        }

        if ($setting->key === 'slider') {
            $oldValue = $setting->getOriginal('value');
            $newValue = $setting->value;

            try {
                $oldSlides = json_decode($oldValue, true);
                $newSlides = json_decode($newValue, true);

                if (is_array($oldSlides) && is_array($newSlides)) {
                    // Ambil semua file lama
                    $oldFiles = collect($oldSlides)->pluck('slide')->filter()->values()->all();
                    $newFiles = collect($newSlides)->pluck('slide')->filter()->values()->all();

                    // Cari file yang tidak ada di list baru (berarti terhapus)
                    $deletedFiles = array_diff($oldFiles, $newFiles);

                    foreach ($deletedFiles as $file) {
                        if (Storage::disk('public')->exists($file)) {
                            Storage::disk('public')->delete($file);
                        }
                    }
                }
            } catch (\Throwable $e) {
                // Optional: log error
            }
        }
    }



    /**
     * Handle the Setting "deleted" event.
     */
    public function deleted(Setting $setting): void
    {
        //
    }

    /**
     * Handle the Setting "restored" event.
     */
    public function restored(Setting $setting): void
    {
        //
    }

    /**
     * Handle the Setting "force deleted" event.
     */
    public function forceDeleted(Setting $setting): void
    {
        //
    }
}
