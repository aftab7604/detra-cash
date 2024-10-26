<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected $casts = [
        'facilities' => 'object',
        'limit' => 'object',
    ];

    protected $appends =['flag'];

    public function getFlagAttribute()
    {
        return getFile(config('location.country.path').$this->image);
    }

    public function continent()
    {
        return $this->belongsTo(Continent::class,'continent_id');
    }

    public function services()
    {
        // return $this->belongsToMany(Service::class, 'country_service')->with('childrenServices');
        return $this->belongsToMany(Service::class, 'country_service');
    }
}
