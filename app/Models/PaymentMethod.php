<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaymentMethod extends Model
{
    protected $table = 'payment_methods';

    protected $fillable = [
        'code',
        'name',
        'type',
        'fee_percentage',
        'fee_fixed',
        'minimum_amount',
        'maximum_amount',
        'img_url',
        'img',
        'status',
        'timing',
    ];
    public function brands()
    {
        return $this->belongsToMany(BrandProduct::class, 'brand_payment_method', 'payment_method_id', 'brand_id');
    }
}
