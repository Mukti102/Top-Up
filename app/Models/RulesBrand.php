<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RulesBrand extends Model
{
    protected $fillable = [
        'name',
        'field_input_id',
    ];

    public function fieldInput()
    {
        return $this->hasMany(FieldInput::class, 'rules_brands_id');
    }
}
