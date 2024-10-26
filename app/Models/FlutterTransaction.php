<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FlutterTransaction extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    protected $casts = ['details' => 'object'];

    public function send_money()
    {
        return $this->belongsTo(SendMoney::class,'send_money_id');
    }
}
