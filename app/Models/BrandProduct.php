<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BrandProduct extends Model
{
    protected $fillable = [
        'name',
        'slug',
        'category_id',
        'image',
        'provider',
        'status',
        'seo_description',
        'seo_title',
        'is_payment_costum',
        'rules_brands_id',
        'isRecommended',
        "isPopular",
        "background_image",
        'description',
    ];



    public function paymentMethods()
    {
        return $this->belongsToMany(PaymentMethod::class, 'brand_payment_method', 'brand_id', 'payment_method_id');
    }
    public function rules()
    {
        return $this->belongsTo(RulesBrand::class, 'rules_brands_id', 'id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'brand_product_id');
    }
}
