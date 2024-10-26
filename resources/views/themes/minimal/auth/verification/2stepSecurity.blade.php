@extends($theme.'layouts.form')
@section('title',trans($page_title))

@section('content')
<style>
    .or-divider {
    display: flex;
    align-items: center;
    position: relative;
}

.or-divider hr {
    width: 100%;
    border: none;
    border-top: 1px solid #ddd;
    margin: 0;
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
}
.custom-hover {
    transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transition for hover effects */
}

.custom-hover:hover {
    background:  linear-gradient(to right, rgba(56, 80, 129, 0.95), rgba(56, 80, 129, 0.95));; /* Change to your desired hover background color */
    color: white !important; /* Change to your desired hover text color */
}
</style>
<div class="entry-right-inner">
    <form action="{{route('user.twoFAverifyOTP')}}" method="post">
        @csrf
        <div class="content-title">
            <h3>{{trans($page_title)}}</h3>
        </div>

        <div class="form-group">
            <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <label for="code">@lang('Enter Code')</label>
            <input type="text" id="code" name="code" value="{{old('code')}}" />
            @error('code')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
            @error('error')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
            @if($type=="already_sent")
            <span class="text-danger  mt-1">{{ trans($text) }}</span>
            @elseif($type=="sent_now")
            <span class="text-success  mt-1">OTP is sent via email at {{ $text }}</span>
            @endif
        </div>

        <!-- <div class="remember d-flex flex-wrap justify-content-start align-items-center mt-3">
                <a href="{{route('user.resendCode2Fa')}}?type=email" class="font-14 text-dark"> @lang("Send OTP to your Email") <span class="text--base">@lang('Send Code')</span></a>
            </div>

            <div class="remember d-flex flex-wrap justify-content-start align-items-center mt-3">
                <a href="{{route('user.resendCode2Fa')}}?type=mobile" class="font-14 text-dark"> @lang("Send OTP to your Mobile") <span class="text--base">@lang('Send code')</span></a>
            </div> -->
            @php
                 $basic = (object) config('basic');
            @endphp
            <div class="remember">
                <p class="h4">@lang("Didn't receive a code?")</p>
            </div>
            <div class="remember d-flex flex-wrap justify-content-start  mt-3 flex-column">
                <p class="font-14 mb-2">@lang("Resend via:")</p>
                <div class="d-flex align-items-center">
                    @if($basic->email_notification &&  $basic->sms_notification)
                    <a href="{{ route('user.resendCode2Fa') }}?type=email" class="btn btn-outline-primary font-14 me-2 custom-hover">@lang("Email")</a>
                    
                    <div class="or-divider position-relative mx-3 d-flex align-items-center">
                        <span class="font-14 px-2 bg-white">OR</span>
                        <hr class="w-100 m-0" style="border: 1px solid #ddd;"/>
                    </div>
                  
                    <a href="{{ route('user.resendCode2Fa') }}?type=mobile" class="btn btn-outline-primary font-14 custom-hover">@lang("SMS")</a>
                    @elseif($basic->email_notification)
                    <a href="{{ route('user.resendCode2Fa') }}?type=email" class="btn btn-outline-primary font-14 me-2 custom-hover">@lang("Email")</a>
                    @elseif($basic->sms_notification)
                    <a href="{{ route('user.resendCode2Fa') }}?type=mobile" class="btn btn-outline-primary font-14 custom-hover">@lang("SMS")</a>
                    
                    @endif
                </div>
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