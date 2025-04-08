<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GeneralModel extends Model
{
    protected $table = 'general_models'; // Sesuai dengan nama tabel di migrasi
    protected $fillable = ['site_name', 'site_description', 'site_owner', 'site_logo', 'site_keywords'];
    protected $casts = [
        'site_keywords' => 'array', // Supaya otomatis dikonversi ke JSON
    ];
}
