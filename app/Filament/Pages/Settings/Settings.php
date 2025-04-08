<?php

namespace App\Filament\Pages\Settings;

use Closure;
use Faker\Provider\ar_EG\Text;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\ColorPicker;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Components\TagsInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Pages\Actions\ButtonAction;
use Filament\Forms\Components\Actions;
use Filament\Forms\Components\Actions\Action;
use Filament\Forms\Components\Group;
use Illuminate\Support\Facades\Artisan;
use Filament\Notifications\Notification;


use Outerweb\FilamentSettings\Filament\Pages\Settings as BaseSettings;

class Settings extends BaseSettings
{

    public static function getNavigationLabel(): string
    {
        return 'Setting';
    }

    public static function getNavigationGroup(): ?string
    {
        return 'Pengaturan';
    }

    public function getTitle(): string
    {
        return 'General Setting';
    }


    public function schema(): array|Closure
    {
        return [
            Tabs::make('Settings')
                ->schema([
                    Tabs\Tab::make('General')
                        ->label("Perusahaan")
                        ->schema([
                            Grid::make()
                                ->schema([
                                    TextInput::make('general.brand_name')
                                        ->label("Nama Peusahaan")
                                        ->columnSpanFull()
                                        ->required(),
                                    TextInput::make("general.brand.phone")
                                        ->label("Nomor Telepon Perusahaan")
                                        ->nullable(),
                                    TextInput::make("general.brand.email")
                                        ->label("Email Perusahaan")
                                        ->nullable(),
                                    Textarea::make('general.brand.decription')
                                        ->label("Deskripsi Perusahaan")
                                        ->helperText("Masukan deskripsi seperti bidang, kelebihan, dll perusahaan.")
                                        ->nullable(),
                                    Textarea::make('general.brand.address')
                                        ->label("Alamat Perusahaan")
                                        ->nullable(),

                                    FileUpload::make('general.brand.logo')
                                        ->label("Logo Perusahaan")
                                        ->disk('public')
                                        ->imageEditor()
                                        ->directory('brand'),
                                    FileUpload::make('general.brand.favicon')
                                        ->label("Favicon")
                                        ->disk('public')
                                        ->imageEditor()
                                        ->directory('brand/favicon'),
                                ])
                        ]),
                    Tabs\Tab::make('Seo')
                        ->label("Situs")
                        ->schema([
                            Grid::make()
                                ->schema([
                                    TextInput::make('seo.title')
                                        ->label('Judul')
                                        ->required(),
                                    TextInput::make("seo.owner")
                                        ->label("Pemilik"),
                                    TagsInput::make('seo.keywords')
                                        ->label("Kata Kunci")
                                        ->required(),
                                    Textarea::make('seo.description')
                                        ->label("Deskripsi")
                                        ->rows(6)
                                        ->required(),
                                    RichEditor::make('syarat_dan_ketentuan')
                                        ->columnSpanFull(),
                                ])
                        ]),
                    Tabs\Tab::make('Sosmed')
                        ->label("Sosial Media")
                        ->schema([
                            Grid::make()
                                ->schema([
                                    TextInput::make('sosmed.facebook')
                                        ->label("Facebook")
                                        ->nullable(),
                                    TextInput::make('sosmed.twitter')
                                        ->label("Twitter")
                                        ->nullable(),
                                    TextInput::make('sosmed.instagram')
                                        ->label("Instagram")
                                        ->nullable(),
                                    TextInput::make('sosmed.youtube')
                                        ->label("Youtube")
                                        ->nullable(),
                                    TextInput::make('sosmed.linkedin')
                                        ->label("Linkedin")
                                        ->nullable(),
                                ])
                        ]),
                    Tabs\Tab::make('Transaction')
                        ->label("Transaksi")
                        ->schema([
                            Grid::make()
                                ->schema([
                                    TextInput::make('transaction.prefix.code')
                                        ->label("Prefix Kode Transaksi")
                                        ->nullable(),
                                    TextInput::make("transaction.benefit")
                                        ->label("Keuntungan Penjualan / Margin")
                                        ->numeric()
                                        ->suffix('%')
                                        ->helperText("Masukan persentase keuntungan penjualan (Harga beli + Keuntungan%).dan sinkronkan ulang product setelah mengupdate margin penjualan")
                                        ->nullable(),
                                    TextInput::make("transaction.dicount.premium.member")
                                        ->label("Diskon Premium Member")
                                        ->numeric()
                                        ->suffix('%')
                                        ->helperText("Masukan persentase diskon untuk member premium (Harga awal - Diskon%) . dan sinkronkan ulang product setelah mengupdate diskon untuk member premium")
                                        ->nullable(),
                                    TextInput::make("transaction.expired.time")
                                        ->label("Default Waktu Expired")
                                        ->numeric()
                                        ->suffix("menit")
                                ])
                        ]),
                    Tabs\Tab::make("frontend")
                        ->label("Frontend")
                        ->schema([
                            ColorPicker::make("theme")
                                ->label("Theme"),
                            ColorPicker::make("dark_theme")
                                ->label("Dark Theme"),
                            FileUpload::make("background.home")
                                ->label("Background")
                                ->disk("public")
                                ->helperText("Background image saat dak mode")
                                ->directory("background")
                                ->maxFiles(2255)
                                ->imageEditor(),
                            FileUpload::make("background.show")
                                ->label("Background Image Brand Detail")
                                ->disk("public")
                                ->directory("background")
                                ->helperText("Latar Belakang brand detail ")
                                ->maxFiles(2255)
                                ->imageEditor(),
                            Repeater::make("slider")
                                ->schema([
                                    FileUpload::make("slide")
                                        ->disk('public')
                                        ->directory('slider')
                                        ->imageEditor()
                                ])->collapsed()
                        ]),
                    Tabs\Tab::make("authPage")
                        ->label("Auth SVG")
                        ->schema([
                            Grid::make()
                                ->schema([
                                    FileUpload::make("login.svg")
                                        ->label("Login")
                                        ->nullable()
                                        ->disk('public')
                                        ->directory('auth')
                                        ->imageEditor(),
                                    FileUpload::make("register.svg")
                                        ->label("Register")
                                        ->nullable()
                                        ->disk('public')
                                        ->directory('auth')
                                        ->imageEditor(),
                                    FileUpload::make("forgot.svg")
                                        ->nullable()
                                        ->label('Forgot Password')
                                        ->disk('public')
                                        ->directory('auth')
                                        ->imageEditor(),
                                    FileUpload::make("OTP.svg")
                                        ->label("Halaman OTP")
                                        ->nullable()
                                        ->disk('public')
                                        ->directory('auth')
                                        ->imageEditor(),
                                    FileUpload::make("reset.svg")
                                        ->label("Reset Password")
                                        ->nullable()
                                        ->disk('public')
                                        ->directory('auth')
                                        ->imageEditor(),
                                ]),

                        ]),
                ]),
        ];
    }
}
