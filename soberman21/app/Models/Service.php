<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;
    protected $guarded = ['id'];


    public function childrenServices()
    {
        $code = session()->get('trans');
		$language = Language::where('short_name', $code)->first();
		$language_id = $language->id;

        return $this->hasMany(Service::class, 'parent_id')->where('language_id',$language_id);
    }

    public function countries()
    {
        return $this->belongsToMany(Country::class, 'country_service');
    }
}

