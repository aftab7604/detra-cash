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
                    <input id="code" type="text" class="form-control" placeholder="Enter 6-digit code" name="code"
                        value="{{old('code')}}" autofocus>
                    @error('code')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
                    @error('error')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
                </div>
            </div>
            <!-- <div class="col-lg-12">
                    <div class="remember d-flex flex-wrap justify-content-start align-items-center mt-3">
                        <a href="{{route('admin.resendCode2Fa')}}?type=email" class="font-14 text-dark"> @lang("Send OTP to your Email") <span class="text--base">@lang('Send Code')</span></a>
                    </div>

                    <div class="remember d-flex flex-wrap justify-content-start align-items-center mt-3">
                        <a href="{{route('admin.resendCode2Fa')}}?type=mobile" class="font-14 text-dark"> @lang("Send OTP to your Mobile") <span class="text--base">@lang('Send code')</span></a>
                    </div>
                </div> -->
            <div class="col-lg-12">
                <div class="remember align-items-center">
                    <p>@lang("Didn't receive a code?")</p>
                </div>
                <div class="remember d-flex flex-wrap justify-content-start align-items-start mt-3 flex-column">
                    <a href="{{route('admin.resendCode2Fa')}}?type=email" class="font-14">@lang("Resend via Email")</a>
                    <a href="{{route('admin.resendCode2Fa')}}?type=mobile" class="font-14 mb-2">@lang("Resend via SMS")</a>
                </div>
            </div>
            <div class="col-lg-12 text-center">
                @error('resend')
                <p class="text-danger  mt-1" id="timer-message">{{ trans($message) }}</p>
                @enderror

                <button type="submit" class="btn btn-block btn-dark">@lang('Submit')</button>
            </div>



        </div>
    </form>
</div>

    <script>

        const timerMessageText = document.getElementById('timer-message').textContent;
        const timerRegex = /(\d{2}):(\d{2})/; // Regular expression to match mm:ss
        const match = timerMessageText.match(timerRegex);

        let delayInSeconds = 0;
        if (match) {
            const minutes = parseInt(match[1], 10); // Get minutes
            const seconds = parseInt(match[2], 10); // Get seconds
            delayInSeconds = (minutes * 60) + seconds; // Convert to total seconds
        }

        const timerMessage = document.getElementById('timer-message');
        const resendButton = document.getElementById('resend-otp-button');

        function startTimer(duration) {
            let timer = duration, minutes, seconds;
            const countdown = setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                // Format time as mm:ss
                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                // Display the countdown
                timerMessage.textContent = `Please try again in ${minutes}:${seconds} seconds`;

                if (--timer < 0) {
                    clearInterval(countdown);
                    timerMessage.textContent = '';
                    resendButton.style.display = 'block'; // Show the resend button
                }
            }, 1000);
        }

        // Start the timer
        if (delayInSeconds > 0) {
            startTimer(delayInSeconds);
        }

    </script>

@endsection
