<?php

namespace App\Providers\Filament;

use App\Filament\Pages\OptimizeTools;
use App\Filament\Pages\Settings\Settings;
use App\Filament\Widgets\StatsOverview;
use App\Http\Middleware\LogFilamentLogin;
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Pages;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Widgets;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Joaopaulolndev\FilamentEditProfile\FilamentEditProfilePlugin;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use Joaopaulolndev\FilamentGeneralSettings\FilamentGeneralSettingsPlugin;
use Outerweb\FilamentSettings\Filament\Plugins\FilamentSettingsPlugin;
use Outerweb\Settings\Models\Setting;
use TomatoPHP\FilamentSettingsHub\Facades\FilamentSettingsHub;
use TomatoPHP\FilamentSettingsHub\Services\Contracts\SettingHold;

class AdminPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        $settings = Setting::where('key', 'general.brand.logo')->pluck('value', 'key')->toArray();
        $settingBrand = Setting::where('key', 'general.brand_name')->pluck('value', 'key')->toArray();
        return $panel
            ->navigationGroups([
                "Data Product",
                "Data Utama",
                "Data Lainya",
                "Pengaturan",
            ])
            ->brandName($settingBrand['general.brand_name'] ?? 'My App')
            ->favicon(asset('storage/' . ($settings['general.brand.logo'] ?? '')))
            ->default()
            ->spa()
            ->sidebarFullyCollapsibleOnDesktop()
            ->id('admin')
            ->path('admin')
            ->login()
            ->plugins([
                FilamentSettingsPlugin::make()
                    ->pages([
                        Settings::class,
                    ]),
                FilamentEditProfilePlugin::make()
                    ->setNavigationGroup('Pengaturan')
                    ->setIcon('heroicon-o-user')
                    ->setTitle('Profile')
                    ->setNavigationLabel('Profile')
                // ->shouldShowAvatarForm()
            ])
            ->colors([
                'primary' => Color::Emerald,
            ])
            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\\Filament\\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\\Filament\\Pages')
            ->pages([
                // Pages\Dashboard::class,
                \App\Filament\Pages\Dashboard::class,
                // \Filament\Pages\Profile::class,
                OptimizeTools::class,
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\\Filament\\Widgets')
            ->widgets([
                // Widgets\AccountWidget::class,
            ])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
                // LogFilamentLogin::class,
            ])
            ->authMiddleware([
                Authenticate::class,
            ]);
    }
}
