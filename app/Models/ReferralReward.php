<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReferralReward extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','referral_amount','referral_coupon','refree_code','refree_amount','refree_coupon'];
}
