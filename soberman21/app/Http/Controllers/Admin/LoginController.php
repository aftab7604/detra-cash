<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\AdminLoginLog;
use App\Providers\RouteServiceProvider;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

class LoginController extends Controller
{
    use AuthenticatesUsers;
    protected $redirectTo = '/admin/dashboard';

    public function __construct()
    {
        $this->middleware('guest:admin')->except('logout');
    }

    public function showLoginForm()
    {
        $data['title'] = "Admin Login";
        return view('admin.auth.login', $data);
    }


    public function login(Request $request)
    {
        $input = $request->all();
        $this->validate($request, [
            $this->username() => 'required',
            'password' => 'required',
        ]);
        $fieldType = filter_var($request->username, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
        if(auth()->guard('admin')->attempt(array($fieldType => $input['username'], 'password' => $input['password']))){
            return $this->sendLoginResponse($request);
//            return redirect()->intended(route('admin.dashboard'));
        }else{
            return redirect()->route('admin.login')
                ->with('error','Email-Address And Password Are Wrong.');
        }

    }

    public function username()
    {
        $login = request()->input('username');
        $field = filter_var($login, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
        request()->merge([$field => $login]);
        return $field;
    }

    protected function validateLogin(Request $request)
    {
        $request->validate([
            $this->username() => 'required|string',
            'password' => 'required|string',
        ]);
    }

    protected function guard()
    {
        return Auth::guard('admin');
    }


    public function logout(Request $request)
    {
        $user = Auth::guard('admin')->user();
        $user->two_fa_verify = 0;
        $user->save();
        
        $this->guard('guard')->logout();
        $request->session()->invalidate();
        return $this->loggedOut($request) ?: redirect()->route('admin.login');
    }

    /**
     * Send the response after the user was authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    protected function sendLoginResponse(Request $request)
    {
        $request->session()->regenerate();
        $this->clearLoginAttempts($request);
        if ($response = $this->authenticated($request, $this->guard('admin')->user())) {
            return $response;
        }

        return $request->wantsJson()
            ? new JsonResponse([], 204)
            : redirect()->intended($this->redirectPath());
    }



    /**
     * The user has been authenticated.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  mixed $user
     * @return mixed
     */
	
	//old function
	
    /*
	protected function authenticated(Request $request, $user)
    {
        if($user->status == 0){
            $this->guard('guard')->logout();
//            return $this->loggedOut($request) ?: redirect()->route('admin.login');
            return redirect()->route('admin.login')->with('error', 'You are banned from this application. Please contact with system Administrator.');
        }

        $user->last_login = Carbon::now();
        $user->last_login_ip = request()->ip();
        $user->save();


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
        AdminLoginLog::create($ul);


        $list = collect(config('role'))->pluck(['access','view'])->collapse()->intersect($user->admin_access);
        if(count($list) == 0){
            $list = collect(['admin.profile']);
        }
        return redirect()->intended(route($list->first()));
    }
	*/
	
	protected function authenticated(Request $request, $user)
	{
		if ($user->status == 0) {
			$this->guard('guard')->logout();
			return redirect()->route('admin.login')->with('error', 'You are banned from this application. Please contact the system Administrator.');
		}

		$user->last_login = Carbon::now();
		$user->last_login_ip = request()->ip();
		$user->save();

		$info = @json_decode(json_encode(getIpInfo()), true);
		$ul['user_id'] = $user->id;
		$ul['user_ip'] = request()->ip();

		if (isset($info['long'])) {
			$ul['longitude'] = implode(',', $info['long']);
		} else {
			$ul['longitude'] = '';
		}

		if (isset($info['lat'])) {
			$ul['latitude'] = implode(',', $info['lat']);
		} else {
			$ul['latitude'] = '';
		}

		$locationParts = [];
		if (isset($info['city'])) {
			$locationParts[] = implode(',', $info['city']);
		}
		if (isset($info['area'])) {
			$locationParts[] = implode(',', $info['area']);
		}
		if (isset($info['country'])) {
			$locationParts[] = implode(',', $info['country']);
		}
		if (isset($info['code'])) {
			$locationParts[] = implode(',', $info['code']);
		}
		$ul['location'] = implode(' - ', $locationParts);

		if (isset($info['code'])) {
			$ul['country_code'] = implode(',', $info['code']);
		} else {
			$ul['country_code'] = '';
		}

		if (isset($info['browser'])) {
			$ul['browser'] = $info['browser'];
		} else {
			$ul['browser'] = '';
		}

		if (isset($info['os_platform'])) {
			$ul['os'] = $info['os_platform'];
		} else {
			$ul['os'] = '';
		}

		if (isset($info['country'])) {
			$ul['country'] = implode(',', $info['country']);
		} else {
			$ul['country'] = '';
		}

		AdminLoginLog::create($ul);

		$list = collect(config('role'))->pluck(['access', 'view'])->collapse()->intersect($user->admin_access);
		if (count($list) == 0) {
			$list = collect(['admin.profile']);
		}
		return redirect()->intended(route($list->first()));
	}



}
