<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BrandProduct extends Model
{
    protected $fillable = [
        'name',
        'slug',
        'image',
        'rules_brands_id',
        'provider',
        'status',
        'seo_description',
        'is_payment_costum',
        'rules_brands_id',
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
}
