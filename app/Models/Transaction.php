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
        'kupon_id',
        'status_payment',
        'processed_at',
        "type",
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class);
    }

    public function kupon()
    {
        return $this->belongsTo(Kupon::class);
    }
}
