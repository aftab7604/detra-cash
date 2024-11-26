<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Stevebauman\Purify\Facades\Purify;


class CouponController extends Controller
{
    public function coupon()
    {
        $data['page_title'] = "Coupon List";
        $data['coupons'] = $this->getAllCouponsForAdmin();
        // $data['coupons'] = Coupon::select('id','code','reduce_fee')->latest()->whereNull('used_at')->paginate(config('basic.paginate'));
        return view('admin.coupon.index',$data);
    }

    public function getAllCouponsForAdmin()
    {
        $coupons = Coupon::with(['assignments.user', 'assignments.usageLogs'])
            ->get()
            ->map(function ($coupon) {
                // Check if the coupon has expired
                $isExpired = $coupon->expiry_date && Carbon::now()->greaterThan($coupon->expiry_date);

                // Calculate the total usage count for user-specific coupons
                $totalUsedCount = $coupon->assignments->sum('used_count');

                // Determine if the usage limit is reached for promotional coupons
                $isUsageLimitReached = $coupon->usage_limit !== null && $totalUsedCount >= $coupon->usage_limit;

                // Add validity flag
                $coupon->is_valid = !$isExpired && !$isUsageLimitReached;

                return $coupon;
            });

        return $coupons;
    }
    public function couponUsed()
    {
        $data['page_title'] = "Used Coupon List";
        // $data['coupons'] = Coupon::select('id','code','reduce_fee','user_id','used_at')->latest()->whereNotNull('user_id')->with(['user:id,username,email'])->paginate(config('basic.paginate'));
        $data['coupons'] = $this->getExpiredOrUsedCoupons(10);
        return view('admin.coupon.used',$data);
    }

    public function getExpiredOrUsedCoupons($perPage = 10)
    {
        // Get expired or fully used coupons
        $coupons = Coupon::where(function ($query) {
            // Expired coupons
            $query->whereNotNull('expiry_date')
                ->where('expiry_date', '<', now());
        })
        ->orWhere(function ($query) {
            // Fully used coupons
            $query->whereNotNull('usage_limit')
                ->whereColumn('usage_limit', '<=', 'used_count');
        })
        ->latest()
        ->paginate($perPage);

        return $coupons;
    }


    public function store(Request $request)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'level' => 'required|numeric',
            'usage_limit' => 'required|numeric',
            'discount' => 'required|numeric',
            'discount_type' => 'required|string',
        ];
        $validate = Validator::make($request->all(), $rules);
        if ($validate->fails()) {
            return back()->withErrors($validate)->withInput();
        }

        for($i=0 ; $i < $excp['level']; $i++ ){
            $data = new  Coupon();
            $data->code = $this->generateUniqueCouponCode();
            $data->type = 'promotional';
            $data->discount_type = $excp['discount_type'];
            $data->discount_value = (float) $excp['discount'];
            $data->usage_limit = (float) $excp['usage_limit'];
            $data->used_count = 0;
            $data->expiry_date = null;
            $data->created_by = 1;

            $data->save();
        }

        log_admin_activity('Update coupon list', 'Updated coupon list');
        return back()->with('success', $excp['level'] .' '.'Coupons Has Been Added.');
    }

    private function generateUniqueCouponCode(){
        do {
            // Generate a random alphanumeric code
            $code = strtoupper(Str::random(10));
        } while (Coupon::where('code', $code)->exists());

        return $code;
    }
}
