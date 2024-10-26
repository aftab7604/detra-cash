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
        $list = collect(config('role'))->pluck(['access'])->flatten();
        $roles = Role::find($user->role_id);
    
        // Two-factor authentication check
        if ($user->two_fa_verify) {
            return $next($request);
        } else {
            return redirect(route('admin.admincheck'));
        }  
        
        // Check for role permissions and access control
        $filtered = $list->intersect($roles->permissions);
        
        if (!in_array($request->route()->getName(), $list->toArray()) || in_array($request->route()->getName(), $filtered->toArray())) {
            return $next($request);
        }
    
        return redirect()->route('admin.403');
    }
    
}
