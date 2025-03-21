<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class FieldInput extends Model
{
    protected $guarded = ['id'];


    protected $casts = [
        'options' => 'array', // Pastikan options tersimpan sebagai JSON
    ];

    public function rulesBrand(): BelongsTo
    {
        return $this->belongsTo(RulesBrand::class, 'rules_brands_id');
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($fieldInput) {
            if (request()->route('record')) {
                $fieldInput->rules_brands_id = request()->route('record');
            }
        });
    }
}
