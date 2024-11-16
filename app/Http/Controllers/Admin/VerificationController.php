<?php

namespace App\Http\Controllers\Admin;

use App\Helper\GoogleAuthenticator;
use App\Http\Controllers\Controller;
use App\Http\Traits\Notify;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class VerificationController extends Controller
{

    use Notify;

    public function __construct()
    {
        /*$this->middleware(['auth']);

        $this->middleware(function ($request, $next) {
            $user = Auth::guard('admin')->user();
            return $next($request);
        });*/
        $this->user = Auth::guard('admin')->user();
    }

    public function checkValidOTPCode($user, $code, $add_min = 10000)
    {
        if (!$code) return false;

        // Make sure sent_at is not empty and is a valid date
        //if (!$user->sent_at instanceof Carbon || !$user->sent_at->isValid()) return false;

        //if ($user->sent_at->addMinutes($add_min)->isPast()) return false;
        if ($user->two_fa_code !== $code) return false;
        return true;
    }

    public function checkValidCode($user, $code, $add_min = 10000)
    {
        if (!$code) return false;
        if (!$user->sent_at) return false;
        if ($user->sent_at->addMinutes($add_min) < Carbon::now()) return false;
        if ($user->verify_code !== $code) return false;
        return true;
    }

    public function check()
    {
        $user = Auth::guard('admin')->user();
        //app()->make(\Illuminate\Contracts\Config\Repository::class)->set('app.locale', $user->preferred_locale);
        if (!isset($user->status) || !$user->status) {
            Auth::logout();
        }
        // elseif(!config('basic.twofaotp')) {
        //     return redirect()->route('admin.dashboard');
        // }
        else {
            $page_title = '2FA Code';
            if (!$this->checkValidOTPCode($user, $user->two_fa_code)) {
                $verification_code = code(6);
                $user->two_fa_code = $verification_code;
                $user->sent_at = Carbon::now();
                $user->save();
                $this->sms($user, 'VERIFICATION_CODE_2FA', [
                    'code' => $verification_code
                ]);

                $this->mail($user, 'VERIFICATION_CODE_2FA', [
                    'code' => $verification_code
                ]);

            }

//            checkValidOTPCode
            return view('admin.auth.verification.2stepSecurity', compact('user', 'page_title'));

        }
        return redirect()->route('admin.profile');
    }


    public function resendCode()
    {

        $type = request()->type;
        $user  = Auth::guard('admin')->user();
        if ($this->checkValidCode($user, $user->verify_code, 2)) {
            $target_time = $user->sent_at->addSeconds(30)->timestamp;

            $delay = $target_time - time();


            throw ValidationException::withMessages(['resend' => 'Please Try after ' . gmdate("i:s", $delay) . ' minutes']);
        }
        if (!$this->checkValidCode($user, $user->verify_code)) {
            $user->verify_code = code(6);
            $user->sent_at = Carbon::now();
            $user->save();
        } else {
            $user->sent_at = Carbon::now();
            $user->save();
        }

        if ($type === 'email') {
            $this->mail($user,'VERIFICATION_CODE',[
               'code' => $user->verify_code
            ]);

            return back()->with('success', 'Email verification code has been sent');
        } elseif ($type === 'mobile') {
            $this->sms($user,'VERIFICATION_CODE',[
                'code' => $user->verify_code
            ]);
            return back()->with('success', 'SMS verification code has been sent');
        } else {
            throw ValidationException::withMessages(['error' => 'Sending Failed']);
        }
    }

    public function resendCode2Fa()
    {
        $type = request()->type;
        $user = Auth::guard('admin')->user();

        // Validate the request type first
        if (!in_array($type, ['email', 'mobile'])) {
            throw ValidationException::withMessages(['error' => 'Invalid verification type specified.']);
        }

        // Check if user should wait before resending the code
        if ($this->checkValidOTPCode($user, $user->two_fa_code, 2) && $user->code_expire_at > Carbon::now()) {
            $target_time = $user->sent_at->addSeconds(30)->timestamp;
            $delay = $target_time - time();
            if ($delay <= 30) {
                $user->code_expire_at = Carbon::now()->addSeconds(30);
                $user->save(); // Save the updated expiration time to the database
            }
            throw ValidationException::withMessages([
                'resend' => 'Please try again after ' . gmdate("i:s", max($delay, 0)) . ' seconds'
            ]);
        }

        // Generate a new 2FA code if the current one is invalid
//        if (!$this->checkValidOTPCode($user, $user->two_fa_code)) {
//            $user->two_fa_code = code(6);
//        }

        // Update the sent timestamp
        $user->sent_at = Carbon::now();
        $user->code_expire_at = Carbon::now()->addSeconds(30);
        $user->save();

        // Send the code based on the specified type
        if ($type === 'email') {
            $this->mail($user, 'VERIFICATION_CODE_2FA', ['code' => $user->two_fa_code]);
            return back()->with('success', '2FA email verification code has been sent.');
        } elseif ($type === 'mobile') {
            $this->sms($user, 'VERIFICATION_CODE_2FA', ['code' => $user->two_fa_code]);
            return back()->with('success', '2FA SMS verification code has been sent.');
        }
    }



    public function mailVerify(Request $request)
    {
        $rules = [
            'code' => 'required',
        ];
        $msg = [
            'code.required' => 'Email verification code is required',
        ];
        $validate = $this->validate($request, $rules, $msg);
        $user = Auth::guard('admin')->user();

        if ($this->checkValidCode($user, $request->code)) {
            $user->email_verification = 1;
            $user->verify_code = null;
            $user->sent_at = null;
            $user->save();
            return redirect()->intended(route('admin.dashboard'));
        }
        throw ValidationException::withMessages(['error' => "Verification code didn't match!"]);
    }

    public function smsVerify(Request $request)
    {
        $rules = [
            'code' => 'required',
        ];
        $msg = [
            'code.required' => 'Email verification code is required',
        ];
        $validate = $this->validate($request, $rules, $msg);
        $user = Auth::user();

        if ($this->checkValidCode($user, $request->code)) {
            $user->sms_verification = 1;
            $user->verify_code = null;
            $user->sent_at = null;
            $user->save();

            return redirect()->intended(route('admin.dashboard'));
        }
        throw ValidationException::withMessages(['error' => "Verification code didn't match!"]);
    }

    public function twoFAverifyOTP(Request $request)
    {

        $rules = [
            'code' => 'required',
        ];
        $msg = [
            'code.required' => 'Email verification code is required',
        ];
        $validate = $this->validate($request, $rules, $msg);
        $user = Auth::guard('admin')->user();

        if ($this->checkValidOTPCode($user, $request->code)) {
            $user->two_fa_verify = 1;
            $user->two_fa_code = null;
            $user->sent_at = null;
            $user->save();
            return redirect()->intended(route('admin.profile'));
        }
        throw ValidationException::withMessages(['error' => "Verification code didn't match!"]);
    }

    public function twoFAverify(Request $request)
    {
        $this->validate($request, [
            'code' => 'required',
        ], [
            'code.required' => 'Email verification code is required',
        ]);
        $ga = new GoogleAuthenticator();
        $user = Auth::user();
        $getCode = $ga->getCode($user->two_fa_code);
        if ($getCode == trim($request->code)) {
            $user->two_fa_verify = 1;
            $user->save();
            return redirect()->intended(route('admin.dashboard'));
        }
        throw ValidationException::withMessages(['error' => 'Wrong Verification Code']);

    }

    public function inactive()
    {
        $user = Auth::user();
        $user->status=0;
        $user->save();

        return redirect()->back();
    }

}
