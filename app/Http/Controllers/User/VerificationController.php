<?php

namespace App\Http\Controllers\User;

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
        $this->middleware(['auth']);

        $this->middleware(function ($request, $next) {
            $this->user = auth()->user();
            return $next($request);
        });

        $this->theme = template();
    }

    public function checkValidOTPCode($user, $code, $add_min = 10000)
    {
        if (!$code) return false;
        
        // Make sure sent_at is not empty and is a valid date
        if (!$user->sent_at instanceof Carbon || !$user->sent_at->isValid()) return false;

        if ($user->sent_at->addMinutes($add_min)->isPast()) return false;
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
        $user = $this->user;
        if (!$user->status) {
            Auth::logout();
        }
        elseif(!config('basic.twofaotp')){
            return redirect()->route('user.home');
        }
        
        elseif (!$user->email_verification) {

            if (!$this->checkValidCode($user, $user->verify_code)) {
                $user->verify_code = code(6);
                $user->sent_at = Carbon::now();
                $user->save();
                $this->mail($user, 'VERIFICATION_CODE', [
                    'code' => $user->verify_code
                ]);
            }
            $page_title = 'Email Verification';
            return view(template().'auth.verification.email', compact('user', 'page_title'));
        }
        elseif (!$user->sms_verification) {
            if (!$this->checkValidCode($user, $user->verify_code)) {
                $user->verify_code = code(6);
                $user->sent_at = Carbon::now();
                $user->save();

                $this->sms($user, 'VERIFICATION_CODE', [
                    'code' => $user->verify_code
                ]);
            }
            $page_title = 'SMS Verification';
            return view(template().'auth.verification.sms', compact('user', 'page_title'));
        }
        elseif (!$user->two_fa_verify) {
            $page_title = '2FA Code';

            if (!$this->checkValidOTPCode($user, $user->two_fa_code,2)) {
                $verification_code = code(6);
                $user->two_fa_code = $verification_code;
                $user->sent_at = Carbon::now();
                $user->save();
                // $this->sms($user, 'VERIFICATION_CODE_2FA', [
                //     'code' => $verification_code
                // ]);

                $this->mail($user, 'VERIFICATION_CODE_2FA', [
                    'code' => $verification_code
                ]);
                $type  = "sent_now";
                $text  = substr($user->email, 0, 3) . '***@***' . substr($user->email, strpos($user->email, '@') + 4);
               
            }
            else
            {
                $target_time = $user->sent_at->addSeconds(30)->timestamp;
                $delay = $target_time - time();
                    $type  = "already_sent";
                    $text  = 'Please Try after ' . gmdate("i:s", $delay) . ' seconds';
            }

//            checkValidOTPCode




               
            return view(template().'auth.verification.2stepSecurity', compact('user', 'page_title','type','text'));

        }
        return redirect()->route('user.home');
    }


    public function resendCode()
    {

        $type = request()->type;
        $user  = $this->user;
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
        $user  = $this->user;
        if ($this->checkValidOTPCode($user, $user->two_fa_code, 2)) {
            $target_time = $user->sent_at->addSeconds(30)->timestamp;
            $delay = max(0, $target_time - time()); // Ensure delay is never negative
        
            if ($delay > 0) {
                throw ValidationException::withMessages(['resend' => 'Please Try after ' . gmdate("i:s", $delay) . ' seconds']);
            }
        }
        
        if (!$this->checkValidOTPCode($user, $user->two_fa_code)) {
            $user->two_fa_code = code(6);
            $user->sent_at = Carbon::now();
            $user->save();
        } else {
            $user->sent_at = Carbon::now();
            $user->save();
        }


        if ($type === 'email') {
            $this->mail($user,'VERIFICATION_CODE_2FA',[
                'code' => $user->two_fa_code
            ]);

            return back()->with('success', '2FA Email verification code has been sent');
        } elseif ($type === 'mobile') {
            $this->sms($user,'VERIFICATION_CODE_2FA',[
                'code' => $user->two_fa_code
            ]);
            return back()->with('success', '2FA SMS verification code has been sent');
        } else {
            throw ValidationException::withMessages(['error' => 'Sending Failed']);
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
        $user = $this->user;

        if ($this->checkValidCode($user, $request->code)) {
            $user->email_verification = 1;
            $user->verify_code = null;
            $user->sent_at = null;
            $user->save();
            log_action('Email verification', '');
            return redirect()->intended(route('user.home'));
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
            log_action('SMS verification', '');
            return redirect()->intended(route('user.home'));
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
        $user = $this->user;

        if ($this->checkValidOTPCode($user, $request->code)) {
            $user->two_fa_verify = 1;
            $user->two_fa_code = null;
            $user->sent_at = null;
            $user->save();
            log_action('OTP verification', '');
            return redirect()->intended(route('user.home'));
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
            log_action('2FA verification', '');
            return redirect()->intended(route('user.home'));
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
