@extends('admin.layouts.login')
@section('title',trans('2FA Code'))

@section('content')
    <div class="p-3">
        <div class="text-center">

        </div>
        <h2 class="mt-3 text-center">@lang('2FA Code')</h2>

        <form method="POST" action="{{route('admin.twoFAverifyOTP')}}" aria-label="{{ __('Login') }}">
            @csrf
            <div class="row mb-5">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label class="text-dark" for="code">@lang('Enter Code')</label>
                        <input id="code" type="text" class="form-control" name="code"
                               value="{{old('code')}}" autofocus>
                        @error('code')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
                        @error('error')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="remember d-flex flex-wrap justify-content-start align-items-center mt-3">
                        <a href="{{route('admin.resendCode2Fa')}}?type=email" class="font-14 text-dark"> @lang("Send OTP to your Email") <span class="text--base">@lang('Send Code')</span></a>
                    </div>
                    
                    <div class="remember d-flex flex-wrap justify-content-start align-items-center mt-3">
                        <a href="{{route('admin.resendCode2Fa')}}?type=mobile" class="font-14 text-dark"> @lang("Send OTP to your Mobile") <span class="text--base">@lang('Send code')</span></a>
                    </div>
                </div>
                <div class="col-lg-12 text-center">
                    @error('resend')
                    <p class="text-danger  mt-1">{{ trans($message) }}</p>
                    @enderror
                    
                    <button type="submit" class="btn btn-block btn-dark">@lang('Submit')</button>
                </div>
                


            </div>
        </form>
    </div>
@endsection


