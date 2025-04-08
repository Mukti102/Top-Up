<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProductResource\Pages;
use App\Filament\Resources\ProductResource\RelationManagers;
use App\Models\Product;
use Filament\Forms\Components\Split;
use Filament\Tables\Columns\IconColumn;
use Filament\Forms;
use Illuminate\Support\Str;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Toggle;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Log;

use function Laravel\Prompts\warning;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $navigationIcon = 'heroicon-o-shopping-bag';
    protected static ?string $navigationGroup = 'Data Utama';

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Grid::make(12) // Gunakan grid dengan total 12 kolom
                    ->schema([
                        Section::make('Informasi Utama')
                            ->description('Informasi Utama')
                            ->schema([
                                Forms\Components\TextInput::make('sku_code')
                                    ->required()
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('name')
                                    ->required()
                                    ->debounce(500)
                                    ->afterStateUpdated(fn($state, callable $set) => $set('slug', Str::slug($state)))
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('slug')
                                    ->required()
                                    ->readOnly()
                                    ->maxLength(255),
                                Forms\Components\TextInput::make('seller_name')
                                    ->label('Nama Penjual')
                                    ->required()
                                    ->maxLength(255),
                                Forms\Components\FileUpload::make('icon')
                                    ->disk('public')
                                    ->directory('product-icon')
                                    ->image(),
                                Forms\Components\Textarea::make('description')
                                    ->label('Keterangan'),
                            ])->columnSpan(8),


                        Section::make("Informasi Status")
                            ->schema([
                                Toggle::make('status')
                                    ->live()
                                    ->afterStateUpdated(
                                        fn($state, callable $set) => $set('status', $state ? true : false)
                                    )
                                    ->helperText('Status ini menentukan apakah produk ini terlihat dan bisa dibeli oleh pelanggan.')
                                    ->default('inactive'),
                                Toggle::make('seller_status')
                                    ->live()
                                    ->afterStateUpdated(
                                        fn($state, callable $set) => $set('seller_status', $state ? true : false)
                                    )
                                    ->helperText('Status ini menentukan apakah produk ini terlihat dan bisa dibeli oleh pelanggan.')
                                    ->default(false),  // Default value set to a boolean
                                Select::make('category_id')
                                    ->relationship('category', 'name')
                                    ->required(),
                                Select::make('brand_product_id')
                                    ->relationship('brand', 'name')
                                    ->required(),
                                Select::make('type_product_id')
                                    ->relationship('type', 'name')
                                    ->required(),
                                Select::make('group_id')
                                    ->relationship('group', 'name')
                                    ->required(),
                            ])
                            ->columnSpan(4), // 1/4 dari layar
                    ]),


                // harga produk
                Grid::make(12) // Gunakan grid dengan total 12 kolom
                    ->schema([
                        Section::make('Informasi Harga')
                            ->description('Inputkan Harga Tanpa menggunakan titik atau koma')
                            ->schema([
                                Grid::make(2)
                                    ->schema([
                                        Forms\Components\TextInput::make('base_price')
                                            ->required()
                                            ->label('Harga Beli')
                                            ->prefix('Rp')
                                            ->numeric()
                                            ->debounce(500)
                                            ->afterStateUpdated(
                                                function ($state, callable $set, callable $get) {
                                                    $set('benefit', max(
                                                        0,
                                                        (float)($get('total_price') - (float)$state)
                                                    ));
                                                }
                                            ),
                                        Forms\Components\TextInput::make('selling_price')
                                            ->required()
                                            ->label('Harga Jual')
                                            ->prefix('Rp')
                                            ->default(0)
                                            ->numeric()
                                            ->debounce(1000)
                                            ->afterStateUpdated(
                                                function ($state, callable $set, callable $get) {
                                                    $sellingPrice = (float)$state;
                                                    $discount = (float)$get('premium_price') ?? 0;

                                                    // Calculate discounted price
                                                    $discountedPrice = $sellingPrice * (1 - ($discount / 100));
                                                    $set('membership_price', max(0, $discountedPrice));

                                                    // Update total price
                                                    $adminFee = (float)$get('admin_fee') ?? 0;
                                                    $totalPrice = $discountedPrice + $adminFee;
                                                    $set('total_price', max(0, $totalPrice));

                                                    // Update profit
                                                    $basePrice = (float)$get('base_price') ?? 0;
                                                    $set('benefit', max(0, $totalPrice - $basePrice));
                                                }
                                            ),
                                    ]),
                                Grid::make(2)
                                    ->schema([
                                        Forms\Components\TextInput::make('admin_fee')
                                            ->required()
                                            ->label('Biaya Admin')
                                            ->helperText('Biaya Admin Jika Ada, Digiflazz, Tripay, dll')
                                            ->prefix('Rp')
                                            ->numeric()
                                            ->default(0)
                                            ->debounce(500)
                                            ->afterStateUpdated(
                                                function ($state, callable $set, callable $get) {
                                                    $adminFee = (float)$state;
                                                    $discountedPrice = (float)$get('membership_price') ?? 0;
                                                    $totalPrice = $discountedPrice + $adminFee;
                                                    $set('total_price', max(0, $totalPrice));

                                                    // Update profit
                                                    $basePrice = (float)$get('base_price') ?? 0;
                                                    $set('benefit', max(0, $totalPrice - $basePrice));
                                                }
                                            ),
                                        Forms\Components\TextInput::make('premium_price')
                                            ->required()
                                            ->default(0)
                                            ->debounce(500)
                                            ->afterStateUpdated(
                                                function ($state, callable $set, callable $get) {
                                                    $discount = (float)$state;
                                                    $sellingPrice = (float)$get('selling_price') ?? 0;

                                                    // Calculate discounted price
                                                    $discountedPrice = $sellingPrice * (1 - ($discount / 100));
                                                    $set('membership_price', max(0, $discountedPrice));

                                                    // Update total price
                                                    $adminFee = (float)$get('admin_fee') ?? 0;
                                                    $totalPrice = $discountedPrice + $adminFee;
                                                    $set('total_price', max(0, $sellingPrice));

                                                    // Update profit
                                                    $basePrice = (float)$get('base_price') ?? 0;
                                                    $set('benefit', max(0, $totalPrice - $basePrice));
                                                }
                                            )
                                            ->label('Potongan Membership')
                                            ->helperText('Potongan Harga untuk membership dalam persen (%)')
                                            ->prefix('%')
                                            ->numeric()
                                    ]),
                                Grid::make(2)
                                    ->schema([
                                        Forms\Components\TextInput::make('total_price')
                                            ->required()
                                            ->numeric()
                                            ->default(0)
                                            ->label('Total Harga')
                                            ->readOnly()
                                            ->helperText('Harga Setelah Diskon + Biaya Admin')
                                            ->prefix('Rp'),
                                        Forms\Components\TextInput::make('benefit')
                                            ->readOnly()
                                            ->label('Keuntungan')
                                            ->numeric()
                                            ->helperText('Keuntungan dihitung dari Total Harga - Harga Beli')
                                            ->prefix('Rp'),
                                        Forms\Components\TextInput::make('membership_price')
                                            ->readOnly()
                                            ->label('Harga Setelah Diskon')
                                            ->prefix('Rp')
                                            ->numeric()
                                            ->helperText('Harga Jual setelah potongan membership'),
                                    ]),
                            ])->columnSpan(8),
                    ]),


                // reward coin 
                Grid::make(12)
                    ->schema([
                        Section::make('Informasi Reward Coin')
                            ->schema([
                                Forms\Components\TextInput::make('reward_points')
                                    ->required()
                                    ->label('Koin Reward Pembeli')
                                    ->helperText('Jumlah koin reward yang akan diberikan kepada pembeli saat membeli produk ini.')
                                    ->numeric()
                                    ->default(0),
                            ])->columnSpan(8),
                    ]),

                // stock
                Grid::make(12)
                    ->schema([
                        Section::make('Informasi Stock')
                            ->schema([
                                Toggle::make('is_unlimed_stock')
                                    ->label('Unlimited Stock')
                                    ->helperText('Jika produk ini memiliki stok yang tak terbatas, maka stock akan diabaikan.')
                                    ->live() // Agar perubahan langsung bereaksi
                                    ->afterStateUpdated(
                                        fn($state, callable $set) =>
                                        $set('stock', $state ? 'Unlimited' : 0)
                                    )
                                    ->dehydrated(false), // Tidak menyimpan ke database

                                Forms\Components\TextInput::make('stock')
                                    ->label('Stock')
                                    ->required()
                                    ->disabled(fn($get) => $get('is_unlimed_stock')) // Nonaktifkan input jika unlimited
                                    ->default(0),
                            ])
                            ->columnSpan(8),
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('sku_code')
                    ->label('Kode SKU')
                    ->searchable(),
                Tables\Columns\TextColumn::make('name')
                    ->label('Nama')
                    ->searchable(),
                Tables\Columns\TextColumn::make('stock')
                    ->numeric()
                    ->label('Stock')
                    ->sortable(),
                Tables\Columns\TextColumn::make('seller_name')
                    ->label('Nama Penjual')
                    ->searchable(),
                IconColumn::make('status')
                    ->label('Status')
                    ->boolean(),
                IconColumn::make('seller_status')
                    ->label('Status Penjual')
                    ->boolean(),
                Tables\Columns\TextColumn::make('type.name')
                    ->label('Type Produk')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('category.name')
                    ->numeric()
                    ->label('Category')
                    ->sortable(),
                Tables\Columns\TextColumn::make('brand.name')
                    ->label('Brand Produk')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('base_price')
                    ->label('Harga Beli')
                    ->numeric()
                    ->formatStateUsing(fn($state): string => "Rp " . number_format($state))
                    ->sortable(),
                Tables\Columns\TextColumn::make('total_price')
                    ->label('Harga Jual')
                    ->numeric()
                    ->sortable()
                    ->numeric()
                    ->formatStateUsing(fn($state): string => "Rp " . number_format($state))
                    ->sortable(),
                Tables\Columns\TextColumn::make('membership_price')
                    ->label('Membership')
                    ->numeric()
                    ->formatStateUsing(fn($record) => "Rp " . number_format($record->membership_price), 0, ',', '.')
                    ->sortable(),
                Tables\Columns\TextColumn::make('reward_points')
                    ->label('Koin Reward')
                    ->formatStateUsing(fn($state) => $state . ' 🪙'),
                Tables\Columns\TextColumn::make('admin_fee')
                    ->label('Biaya Admin')
                    ->numeric()
                    ->formatStateUsing(fn($state): string => "Rp " . number_format($state))
                    ->sortable(),

                Tables\Columns\TextColumn::make('created_at')
                    ->label('Tanggal Dibuat')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label('Tanggal Diubah')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('provider')
                    ->formatStateUsing(fn($state) => $state !== null  ? $state :  'Non Vendor')
                    ->badge()
                    ->color(fn($state) => $state == 'DigiFlazz' ? "success" : "warning"),
                Tables\Columns\ImageColumn::make('icon')
                    ->searchable(),
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
                    Tables\Actions\BulkAction::make('updateGroup')
                        ->label('Update Group')
                        ->icon('heroicon-o-pencil')
                        ->form([
                            Forms\Components\Select::make('group_id')
                                ->label('Select Group')
                                ->relationship('group', 'name')
                                ->required(),
                        ])
                        ->action(function (Collection $records, array $data) {
                            foreach ($records as $record) {
                                if ($record instanceof Product) {
                                    $record->update(['group_id' => $data['group_id']]);
                                }
                            }
                            // Menambahkan notifikasi setelah update
                            Notification::make()
                                ->title('Success')
                                ->body('Group updated successfully for the selected products.')
                                ->success()
                                ->send();
                        })
                        ->deselectRecordsAfterCompletion(),
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
            'index' => Pages\ListProducts::route('/'),
            'create' => Pages\CreateProduct::route('/create'),
            'edit' => Pages\EditProduct::route('/{record}/edit'),
        ];
    }
}
