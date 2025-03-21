<?php

namespace App\Filament\Resources\ProductResource\Pages;

use App\Events\UserLogged;
use App\Filament\Resources\ProductResource;
use App\Helpers\DigiflazzHelper;
use App\Models\BrandProduct;
use App\Models\Category;
use App\Models\Product;
use App\Models\TypeProduct;
use Doctrine\DBAL\Types\Type;
use Illuminate\Support\Str;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Support\Facades\Auth;

use function PHPSTORM_META\type;

class ListProducts extends ListRecords
{
    protected static string $resource = ProductResource::class;

    protected function syncProductToDB()
    {
        try {
            $products_digiflazz = DigiflazzHelper::getPriceList();
            $products = $products_digiflazz['data'];
            // update type product
            if (!empty($products)) {
                foreach ($products as $product) {
                    if (isset($product['type']) && !empty($product['type'])) {
                        TypeProduct::updateOrCreate([
                            'name' => $product['type'],
                            'slug' => Str::slug($product['type'])
                        ]);
                    }
                }
            }

            // update brand 
            if (!empty($products)) {
                foreach ($products as $product) {
                    if (isset($product['brand']) && !empty($product['brand'])) {
                        BrandProduct::updateOrCreate([
                            'name' => $product['brand'],
                            'slug' => Str::slug($product['brand'])
                        ]);
                    }
                }
            }

            // update category 
            if (!empty($products)) {
                foreach ($products as $product) {
                    Category::updateOrCreate([
                        'name' => $product['category'],
                        'slug' => Str::slug($product['category'])
                    ]);
                }
            }

            // update product
            if (!empty($products)) {
                foreach ($products as $product) {
                    $basePrice = $product['price'];
                    $premiumPrice = 2; // 2% diskon membership
                    $adminFee = 0;
                    // Harga jual (5% keuntungan dari harga beli)
                    $sellingPrice = $basePrice + (5 / 100 * $basePrice);
                    // Total harga (harga jual + admin fee)
                    $totalPrice = $sellingPrice + $adminFee;
                    // Harga membership (total harga dikurangi diskon membership)
                    $membershipPrice = $totalPrice - ($premiumPrice / 100 * $totalPrice);
                    // Keuntungan (total harga - harga beli)
                    $benefit = $totalPrice - $basePrice;

                    Product::updateOrCreate(
                        ['sku_code' => $product['buyer_sku_code']], // Kunci unik untuk update
                        [
                            'name' => $product['product_name'],
                            'slug' => Str::slug($product['product_name']),
                            'type_product_id' => TypeProduct::where('name', $product['type'])->value('id'),
                            'brand_product_id' => BrandProduct::where('name', $product['brand'])->value('id'),
                            'category_id' => Category::where('name', $product['category'])->value('id'),
                            'seller_name' => $product['seller_name'],
                            'reward_points' => 1,
                            'provider' => 'DigiFlazz',
                            'stock' => $product['unlimited_stock'] ? 'unlimited' : $product['stock'],
                            'status' => $product['buyer_product_status'],
                            'seller_status' => $product['buyer_product_status'],
                            'base_price' => $basePrice,
                            'premium_price' => $premiumPrice,
                            'selling_price' => $sellingPrice,
                            'admin_fee' => $adminFee,
                            'total_price' => $totalPrice,
                            'membership_price' => $membershipPrice,
                            'benefit' => $benefit,
                        ]
                    );
                }
            }

            // munculkan notifikasi
            Notification::make()
                ->title('Success Syncronize Product')
                ->success()
                ->send();
            event(new UserLogged(Auth::user(), 'Berhasil Synkronisasi Product DigiFlazz'));
        } catch (\Exception $e) {
            Notification::make()
                ->title('Gagal Syncronize Product')
                ->success()
                ->color('danger')
                ->send();
            event(new UserLogged(Auth::user(), "Gagal Sinkonisasi Karena ->" . $e->getMessage()));
        }
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            Actions\Action::make('Syncronize Product')
                ->label('Syncronize Product')
                ->icon('heroicon-o-arrow-path')
                ->color('warning')
                ->action(
                    fn() => $this->syncProductToDB()
                ),
        ];
    }
}
