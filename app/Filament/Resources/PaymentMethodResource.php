<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PaymentMethodResource\Pages;
use App\Filament\Resources\PaymentMethodResource\RelationManagers;
use App\Models\PaymentMethod;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class PaymentMethodResource extends Resource
{
    protected static ?string $model = PaymentMethod::class;

    protected static ?string $navigationIcon = 'heroicon-o-credit-card';
    protected static ?string $navigationLabel = 'Metode Pembayaran';
    protected static ?string $navigationGroup = 'Data Lainya';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([

                Grid::make(12)
                    ->schema([
                        Section::make('Informasi Utama')
                            ->description('Informasi Utama')
                            ->schema([
                                Forms\Components\TextInput::make('code')
                                    ->required()
                                    ->label('Kode')
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('name')
                                    ->label('Nama Metode Pembayaran')
                                    ->required()
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('type')
                                    ->required()
                                    ->label('Tipe Metode Pembayaran')
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('timing')
                                    ->label('Waktu Pembayaran')
                                    ->maxLength(255),
                            ])->columnSpan(7),
                        Section::make('Informasi Tambahan')
                            ->description('Informasi Tambahan')
                            ->schema([
                                Grid::make(2)
                                    ->schema([
                                        Forms\Components\TextInput::make('fee_percentage')
                                            ->required()
                                            ->label('Fee (Persentase)')
                                            ->numeric()
                                            ->default(0.00),
                                        Forms\Components\TextInput::make('fee_fixed')
                                            ->required()
                                            ->numeric()
                                            ->label('Fee (Nominal)')
                                            ->default(0.00),
                                        Forms\Components\TextInput::make('minimum_amount')
                                            ->required()
                                            ->numeric()
                                            ->label('Minimum Pembayaran')
                                            ->default(0.00),
                                        Forms\Components\TextInput::make('maximum_amount')
                                            ->required()
                                            ->label('Maksimum Pembayaran')
                                            ->numeric()
                                            ->default(0.00),
                                    ]),

                            ])->columnSpan(5),
                    ]),

                Section::make('Informasi Tambahan')
                    ->description('Informasi Tambahan')
                    ->schema([
                        Forms\Components\TextInput::make('img_url')
                            ->required()
                            ->label('URL Gambar Metode Pembayaran')
                            ->maxLength(255),
                        FileUpload::make('img')
                            ->disk('public')
                            ->label('Gambar Metode Pembayaran')
                            ->directory('payment-methods')
                            ->maxSize(1024)
                            ->image(),
                        Toggle::make('status')
                            ->afterStateUpdated(fn($set, $state) => $set('status', $state ? 'active' : 'inactive'))
                            ->label('Status Metode Pembayaran')
                            ->helperText("Status Metode Pembayaran yang bisa digunakan untuk transaksi"),
                    ]),

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('code')
                    ->label('Kode')
                    ->searchable(),
                Tables\Columns\TextColumn::make('name')
                    ->label('Nama Metode Pembayaran')
                    ->searchable(),
                ImageColumn::make('img_url')
                    ->label('Ikon Metode Pembayaran'),
                Tables\Columns\TextColumn::make('type')
                    ->label('Tipe Metode Pembayaran')
                    ->searchable(),
                IconColumn::make('status')
                    ->label('Status')
                    ->icon(fn($state) => $state === 'active' ? 'heroicon-o-check-circle' : 'heroicon-o-x-circle')
                    ->color(fn($state) => $state === 'active' ? 'success' : 'danger'),

                Tables\Columns\TextColumn::make('created_at')
                    ->label("Di Buat Pada")
                    ->dateTime()
                    ->sortable()
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\ViewAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPaymentMethods::route('/'),
            'create' => Pages\CreatePaymentMethod::route('/create'),
            'edit' => Pages\EditPaymentMethod::route('/{record}/edit'),
        ];
    }
}
