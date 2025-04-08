<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';

    protected $fillable = [
        'name',
        'slug',
        'sku_code',
        'type_product_id',
        'brand_product_id',
        'seller_status',
        'category_id',
        'description',
        'provider',
        'icon',
        'seller_name',
        'benefit',
        'base_price',
        'premium_price',
        'selling_price',
        'admin_fee',
        'total_price',
        'reward_points',
        'status',
        'stock',
        'price',
        'membership_price',
        'group_id'
    ];

    protected $attributes = [
        'provider' => 'Non Vendor',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function brand()
    {
        return $this->belongsTo(BrandProduct::class, 'brand_product_id');
    }

    public function type()
    {
        return $this->belongsTo(TypeProduct::class, 'type_product_id');
    }

    public function group()
    {
        return $this->belongsTo(ProductGroup::class);
    }
}
