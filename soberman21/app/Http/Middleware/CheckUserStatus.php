<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckUserStatus
{
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

        if ($basic->twofaotp) {
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
