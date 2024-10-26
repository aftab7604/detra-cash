<?php

namespace App\Http\Middleware;

use App\Http\Traits\Notify;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
class CheckUserStatus
{
    use Notify;
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $basic = (object) config('basic');
        $user = Auth::user();
        //var_dump($basic);
        //die();

        if ($basic->twofaotp && ($basic->email_verification || $basic->sms_verification)) {
            if($user->status && $user->email_verification && $user->sms_verification && $user->two_fa_verify){
                return $next($request);
            } else {
                return redirect(route('user.check'));
            }
        } else {
            return $next($request);
        }
    }
}
