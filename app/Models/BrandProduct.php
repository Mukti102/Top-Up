<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BrandProduct extends Model
{
    protected $fillable = [
        'name',
        'slug',
        'description',
    ];
}
