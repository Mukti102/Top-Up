<?php

namespace App\Providers;

use App\Models\BrandProduct;
use App\Models\News;
use App\Models\ProductGroup;
use App\Observers\BrandProductObserver;
use App\Observers\NewsObserver;
use App\Observers\ProductGroupObserver;
use App\Observers\SettingObserver;
use Illuminate\Support\Facades\Vite;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Inertia\Inertia;
use Outerweb\Settings\Models\Setting;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {

        Setting::observe(SettingObserver::class);
        BrandProduct::observe(BrandProductObserver::class);
        News::observe(NewsObserver::class);
        ProductGroup::observe(ProductGroupObserver::class);
        // Ambil hanya key yang diperlukan
        $settings = Setting::whereIn('key', [
            'seo.title',
            'seo.description',
            'slider',
            'theme',
            'general.brand.favicon',
            'general.brand.logo'
        ])->pluck('value', 'key')->toArray();


        // Bagikan ke semua halaman Inertia
        Inertia::share('Setting', $settings);

        // Jika masih ada tampilan Blade, bagikan juga ke semua views
        View::share('Setting', $settings);

        Vite::prefetch(concurrency: 3);
    }
}
