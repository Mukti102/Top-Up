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
use Illuminate\Support\Facades\Log;
use Outerweb\Settings\Models\Setting;

use function PHPSTORM_META\type;

class ListProducts extends ListRecords
{
    protected static string $resource = ProductResource::class;

    protected function syncProductToDB()
    {
        try {
            $products_digiflazz = DigiflazzHelper::getPriceList();
            $products = $products_digiflazz['data'];
            $digiflazzSkuCodes = collect($products)->pluck('buyer_sku_code')->toArray();

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

            // update category 
            if (!empty($products)) {
                foreach ($products as $product) {
                    Category::updateOrCreate([
                        'name' => $product['category'],
                        'slug' => Str::slug($product['category'])
                    ]);
                }
            }

            // update brand 
            if (!empty($products)) {
                foreach ($products as $product) {
                    $category = Category::where('name', $product['category'])->value('id');
                    if (isset($product['brand']) && !empty($product['brand'])) {
                        BrandProduct::updateOrCreate(
                            [
                                'name' => $product['brand'],
                                "slug" => Str::slug($product['brand']),
                                'category_id' => $category ?? null,
                            ],
                        );
                    }
                }
            }

            // update product
            if (!empty($products)) {
                foreach ($products as $product) {
                    $basePrice = $product['price'];

                    // Mengambil nilai margin dan diskon premium dengan fallback 0
                    $margin = (float) optional(Setting::where('key', 'transaction.benefit')->first())->value ?? 0;
                    $premiumDiscount = (float) optional(Setting::where('key', 'transaction.dicount.premium.member')->first())->value ?? 0;

                    // Menghitung harga jual dengan margin keuntungan
                    $sellingPrice = $basePrice + ($margin / 100 * $basePrice);

                    // Biaya admin (jika ada, bisa diatur dinamis)
                    $adminFee = 0;

                    // Total harga setelah ditambah admin fee
                    $totalPrice = $sellingPrice + $adminFee;

                    // Menghitung harga setelah diskon premium
                    $membershipPrice = $totalPrice - ($premiumDiscount / 100 * $totalPrice);


                    // Keuntungan dari transaksi
                    $benefit = $totalPrice - $basePrice;


                    $result = Product::updateOrCreate(
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
                            'premium_price' => $premiumDiscount,
                            'selling_price' => $sellingPrice,
                            'admin_fee' => $adminFee,
                            'total_price' => $totalPrice,
                            'membership_price' => $membershipPrice,
                            'benefit' => $benefit,
                        ]
                    );

                    Product::where('provider', 'digi_flazz') // hanya provider DigiFlazz
                        ->whereNotIn('sku_code', $digiflazzSkuCodes) // yang tidak ada di list baru
                        ->delete();

                    // Hapus brand yang tidak punya produk
                    BrandProduct::doesntHave('products')->delete();

                    // Hapus type yang tidak punya produk
                    TypeProduct::doesntHave('products')->delete();

                    // Hapus category yang tidak punya produk
                    Category::doesntHave('products')->delete();
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
