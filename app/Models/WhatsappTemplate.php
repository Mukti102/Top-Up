<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WhatsappTemplate extends Model
{
    protected $fillable = [
        'name',
        'message',
        'role_id',
        "parameters"
    ];


    public function role()
    {
        return $this->belongsTo(Role::class, 'role_id');
    }
}
