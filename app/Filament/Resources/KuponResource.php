<?php

namespace App\Filament\Resources;

use App\Filament\Resources\KuponResource\Pages;
use App\Filament\Resources\KuponResource\RelationManagers;
use App\Models\Kupon;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Components\Actions\Action;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class KuponResource extends Resource
{
    protected static ?string $model = Kupon::class;

    protected static ?string $navigationIcon = 'heroicon-o-ticket';
    protected static ?string $navigationGroup = 'Data Lainya';

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }

    public static function generateCouponCode(): string
    {
        $part1 = Str::upper(Str::random(2)) . rand(0, 9); // Contoh: "FY8"
        $part2 = rand(100, 999); // Contoh: "453"
        return "{$part1}-{$part2}";
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Kupon')
                    ->description('Kupon Voucher Untuk Mendapatkan Potongan Harga')
                    ->schema([
                        TextInput::make('code')
                            ->required()
                            ->maxLength(7) // Sesuai format "FY8-453"
                            ->suffixAction(
                                Action::make('generateCoupon')
                                    ->icon('heroicon-o-arrow-path')
                                    ->tooltip('Generate Unique Coupon')
                                    ->action(fn($state, callable $set) => $set('code', self::generateCouponCode()))
                            ),
                        Forms\Components\TextInput::make('name')
                            ->required()
                            ->maxLength(255),
                        Forms\Components\TextInput::make('discount')
                            ->required()
                            ->suffix('%')

                            ->numeric(),
                        DatePicker::make('expiration_date'),
                        Forms\Components\Toggle::make('status')
                            ->default(true)
                            ->helperText('User Tidak Bisa Menggunakan Kupon Ini Jika Di Nonaktifkan')
                            ->required(),
                    ])->columns(2),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('code')
                    ->label('Kode Kupon')
                    ->searchable(),
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('discount')
                    ->numeric()
                    ->formatStateUsing(fn($state) => $state . '%')
                    ->sortable(),
                Tables\Columns\TextColumn::make('expiration_date')
                    ->label('Tanggal Kadaluarsa')
                    ->date()
                    ->sortable(),
                Tables\Columns\IconColumn::make('status')
                    ->boolean(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\ViewAction::make()->color('info')->icon('heroicon-o-eye'),
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
            'index' => Pages\ListKupons::route('/'),
            'create' => Pages\CreateKupon::route('/create'),
            'edit' => Pages\EditKupon::route('/{record}/edit'),
        ];
    }
}
