<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $table = 'transactions';

    protected $fillable = [
        'user_id',
        'product_id',
        'costumer_number',
        'quantity',
        'price',
        'reference_number',
        'response',
        'email',
        'phone',
        'payment_method_id',
        'status',
        'status_payment',
        'processed_at',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class);
    }
}
