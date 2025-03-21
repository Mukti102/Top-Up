<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kupon extends Model
{
    protected $fillable = [
        'code',
        'name',
        'discount',
        'expiration_date',
        'status'
    ];
}
