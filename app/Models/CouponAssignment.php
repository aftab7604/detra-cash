<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CouponAssignment extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function coupon()
    {
        return $this->belongsTo(Coupon::class);
    }

    public function usageLogs()
    {
        return $this->hasMany(CouponUsageLog::class, 'coupon_id', 'coupon_id')
            ->where('user_id', $this->user_id);
    }
}
