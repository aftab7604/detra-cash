<?php

namespace App\Providers;

use App\Actions\Fortify\CreateNewUser;
use App\Actions\Fortify\ResetUserPassword;
use App\Actions\Fortify\UpdateUserPassword;
use App\Actions\Fortify\UpdateUserProfileInformation;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;
use Laravel\Fortify\Fortify;
use App\Models\UserLogin;
use App\Models\User;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;

class FortifyServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        RateLimiter::for('login', function (Request $request) {
            $throttleKey = Str::transliterate(Str::lower($request->input(Fortify::username())).'|'.$request->ip());

            return Limit::perMinute(5)->by($throttleKey);
        });

        RateLimiter::for('two-factor', function (Request $request) {
            return Limit::perMinute(5)->by($request->session()->get('login.id'));
        });

        Fortify::loginView(function () {
            return view('themes.minimal.auth.login');
        });

        Fortify::loginView(function () {
            return view('themes.minimal.auth.login');
        });

        Fortify::registerView(function () {
            return view('themes.minimal.auth.register');
        });

        Fortify::twoFactorChallengeView(function () {
            return view('themes.minimal.auth.two-factor-challenge');
        });

        Fortify::authenticateUsing(function (Request $request) {
            $user = User::where('email', $request->email)->first();

            if($user && $user->two_fa==1 && $user->two_fa_verify==1){
                $user->two_fa_verify=0;
                $user->save();
                
            }

            // check 2FA ADMIN

            if($user && !config('basic.twofaauth'))
            {
                $user->two_factor_secret = null;
            }
            // 0 means on and 1 off
            else if($user && $user->two_fa_auth)
            {
                $user->two_factor_secret = null;
            }
        
            if ($user && $user->status && Hash::check($request->password, $user->password)) {
                
                $info = @json_decode(json_encode(getIpInfo()), true);
                $ul['user_id'] = $user->id;
                $ul['user_ip'] =  request()->ip();
                $ul['longitude'] =  @implode(',',@$info['long']);
                $ul['latitude'] =  @implode(',',@$info['lat']);
                $ul['location'] =  @implode(',',@$info['city']) . (" - ". @implode(',',@$info['area']) ."- ") . @implode(',',$info['country']) . (" - ". @implode(',',$info['code']) . " ");
                $ul['country_code'] = @implode(',',@$info['code']);
                $ul['browser'] = @$info['browser'];
                $ul['os'] = @$info['os_platform'];
                $ul['country'] =  @implode(',', @$info['country']);
                UserLogin::create($ul);
                return $user;
            }
        });

        Fortify::confirmPasswordView(function () {
            return view('themes.minimal.auth.confirm-password');
        });
    }
}
