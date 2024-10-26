<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Gateway extends Model
{
    protected $casts = [
        'parameters' => 'object',
        'currencies' => 'object',
        'extra_parameters' => 'object'
    ];

    protected $guarded = [];

    public function scopeAutomatic()
    {
        return $this->where('id', '<', 1000);
    }

    public function scopeManual()
    {
        return $this->where('id', '>=', 1000);
    }

    public function withdrainfo()
    {
        return $this->hasMany(withdrainfo::class, 'gateway_id');
    }

}
