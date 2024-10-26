<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Auth;
use App\Models\Role;

class AdminAuthorizeMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $user = Auth::guard('admin')->user();
        $basic = (object) config('basic');
        $list = collect(config('role'))->pluck(['access'])->flatten();
        $roles = Role::find($user->role_id);
        //$filtered = $list->intersect($user->admin_access);
        //echo $basic->twofaotp." - ".$user->two_fa_verify;
        //die();
        if ($basic->twofaotp) {
            if ($user->two_fa_verify) {
                return $next($request);
            } else {
                return redirect(route('admin.admincheck'));
            }  
        } else {
            $filtered = $list->intersect($roles->permissions);
            if(!in_array($request->route()->getName(), $list->toArray()) ||  in_array($request->route()->getName(), $filtered->toArray()) ){
                return $next($request);
            }
        }

        return  redirect()->route('admin.403');
    }
}
