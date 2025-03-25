<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BrandProductResource\Pages;
use App\Filament\Resources\BrandProductResource\RelationManagers;
use App\Models\BrandProduct;
use Filament\Forms;
use Filament\Forms\Components\CheckboxList;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Set;
use Illuminate\Support\Str;

use Filament\Forms\Form;
use Filament\Forms\Get;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class BrandProductResource extends Resource
{
    protected static ?string $model = BrandProduct::class;

    protected static ?string $navigationIcon = 'heroicon-o-bold';
    protected static ?string $navigationGroup = 'Data Product';

    protected static ?int $navigationSort = 2; // Angka lebih kecil akan muncul lebih atas


    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Brand')
                    ->schema([
                        Grid::make([
                            'default' => 0,
                            'md' => 4,
                        ])->schema([
                            Forms\Components\TextInput::make('name')
                                ->required()
                                ->debounce(500)
                                ->afterStateUpdated(
                                    fn(Set $set, $state) =>
                                    $set('slug', Str::slug($state))
                                )
                                ->maxLength(255)
                                ->columnSpan(2),
                            Forms\Components\TextInput::make('slug')
                                ->required()
                                ->readOnly()
                                ->maxLength(255)
                                ->columnSpan(2),
                            // select categoy
                            Select::make('category')
                                ->relationship('category', 'name')
                                ->required()
                                ->searchable()
                                ->columnSpan(2),
                            Select::make('rules')
                                ->relationship('rules', 'name')
                                ->searchable()
                                ->label('Aturan Brand')
                                ->preload()
                                ->required()
                                ->columnSpan(2),
                            TextInput::make('seo_description')
                                ->label('Keterangan SEO')
                                ->columnSpan(2),
                            FileUpload::make('image')
                                ->image()
                                ->label('Gambar Brand')
                                ->disk('public')
                                ->maxSize("2048")
                                ->directory('brandProduct')
                                ->imageEditor()
                                ->imageEditorAspectRatios([
                                    '1:1',
                                    '16:9',
                                    '4:3',
                                    '3:2',
                                    '2:1',
                                ])
                                ->required()
                                ->columnSpan(2),
                            Toggle::make('status')
                                ->label('Status')
                                ->default(true)
                                ->helperText('User Tidak Bisa Melihat Dan Membeli Brand Ini Jika Di Nonaktifkan')
                                ->columnSpan(2),
                            Forms\Components\RichEditor::make('description')
                                ->columnSpanFull(),
                        ])
                    ]),
                Grid::make([
                    'default' => 0,
                    'md' => 4,
                ])
                    ->schema([
                        Section::make('Metode Pembayaran')
                            ->schema([
                                Toggle::make('is_payment_costum')
                                    ->label('Status')
                                    ->helperText("Jika kamu aktifkan, silahkan pilih Metode Pembayaran apa saja yang ingin digunakan.")
                                    ->live(), // Tambahkan agar langsung memperbarui state

                                CheckboxList::make('paymentMethods')
                                    ->relationship('paymentMethods', 'name')
                                    ->label('Metode Pembayaran')
                                    ->visible(fn(Get $get) => $get('is_payment_costum')) // Ubah dari hidden() ke visible()
                                    ->columns(3),
                            ])->columnSpan(3),
                    ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('slug')
                    ->searchable(),

                Tables\Columns\TextColumn::make('category.name')
                    ->searchable(),

                Tables\Columns\TextColumn::make('created_at')
                    ->label("Di Buat Pada")
                    ->dateTime()
                    ->sortable(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label("Di Update Pada")
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
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
            'index' => Pages\ListBrandProducts::route('/'),
            'create' => Pages\CreateBrandProduct::route('/create'),
            'edit' => Pages\EditBrandProduct::route('/{record}/edit'),
        ];
    }
}
