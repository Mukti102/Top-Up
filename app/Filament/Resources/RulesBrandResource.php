<?php

namespace App\Filament\Resources;

use App\Filament\Resources\RulesBrandResource\Pages;
use App\Filament\Resources\RulesBrandResource\RelationManagers;
use App\Models\RulesBrand;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\KeyValue;
use Filament\Forms\Components\Placeholder;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Forms\Get;
use Filament\Infolists\Components\TextEntry;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class RulesBrandResource extends Resource
{
    protected static ?string $model = RulesBrand::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Grid::make([
                    'default' => 0,
                    'md' => 3,
                ])->schema([
                    Section::make()
                        ->schema([
                            Forms\Components\TextInput::make('name')
                                ->required()
                                ->maxLength(255),
                        ])->columnSpan(2),
                ]),
                Grid::make([
                    'default' => 0,
                    'md' => 3,
                ])->schema([
                    //  relasi ke table field input
                    Section::make("Field Input")
                        ->schema([
                            Section::make('Format DigiFlazz')
                                ->schema([
                                    Placeholder::make("Keterangan:")
                                        ->content('Format Customer No. / Isi Request Untuk Transaksi ke DigiFlazz
                                        123')
                                ]),
                            Repeater::make('fieldInput')
                                ->relationship()
                                ->label("")
                                ->schema([
                                    TextInput::make("name")
                                        ->required()
                                        ->label('Nama')
                                        ->placeholder('User Id')
                                        ->maxLength(255),
                                    TextInput::make("label")
                                        ->required()
                                        ->label('Label')
                                        ->placeholder('Id User')
                                        ->maxLength(255),
                                    TextInput::make("placeholder")
                                        ->required()
                                        ->label('Placeholder')
                                        ->placeholder('Hanya Angka Tanpa Spasi Contoh: 123456789')
                                        ->maxLength(255),
                                    Select::make('type_status')
                                        ->label('Tipe')
                                        ->options([
                                            'text' => 'Input Text',
                                            'select' => 'Select Input',
                                        ])
                                        ->reactive()
                                        ->required(),
                                    KeyValue::make('options')
                                        ->hidden(fn(Get $get) => $get('type_status') !== 'select') // Mengambil state dalam item repeater
                                        ->columns(2)
                                        ->columnSpan(2),
                                ])
                                ->default([])
                                ->createItemButtonLabel("Tambah Field Input") // Label tombol tambah
                        ])->columnSpan(2),
                ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->label('Di Buat Pada')
                    ->sortable(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->label('Di Update Pada')
                    ->sortable()
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListRulesBrands::route('/'),
            'create' => Pages\CreateRulesBrand::route('/create'),
            'edit' => Pages\EditRulesBrand::route('/{record}/edit'),
        ];
    }
}
