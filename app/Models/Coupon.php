<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    // public function user()
    // {
    //     return $this->belongsTo(User::class);
    // }

    public function assignments()
    {
        return $this->hasMany(CouponAssignment::class, 'coupon_id');
    }

    public function usageLogs()
    {
        return $this->hasMany(CouponUsageLog::class);
    }
}
