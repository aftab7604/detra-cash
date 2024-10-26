@extends($theme.'layouts.form')
@section('title',trans($page_title))

@section('content')
    <div class="entry-right-inner">
        <form action="{{route('user.twoFAverifyOTP')}}"  method="post">
            @csrf
            <div class="content-title">
                <h3>{{trans($page_title)}}</h3>
            </div>

            <div class="form-group">
                <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <label for="code">@lang('Enter Code')</label>
                <input type="text" id="code"  name="code" value="{{old('code')}}"/>
                @error('code')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
                @error('error')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
            </div>



            <div class="remember d-flex flex-wrap justify-content-start align-items-center mt-3">
                <a href="{{route('user.resendCode2Fa')}}?type=email" class="font-14 text-dark"> @lang("Send OTP to your Email") <span class="text--base">@lang('Send Code')</span></a>
            </div>

            <div class="remember d-flex flex-wrap justify-content-start align-items-center mt-3">
                <a href="{{route('user.resendCode2Fa')}}?type=mobile" class="font-14 text-dark"> @lang("Send OTP to your Mobile") <span class="text--base">@lang('Send code')</span></a>
            </div>

            @error('resend')
            <p class="text-danger  mt-1">{{ trans($message) }}</p>
            @enderror



            <div class="entry-button">
                <button>@lang('Submit')</button>
            </div>
        </form>
    </div>
@endsection
