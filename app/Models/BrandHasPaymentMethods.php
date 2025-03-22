<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BrandHasPaymentMethods extends Model
{
    protected $guarded = ['id'];


    public function brand()
    {
        return $this->belongsTo(BrandProduct::class, 'brand_product_id', 'id');
    }

    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class);
    }
}
