@extends($theme.'layouts.form')
@section('title',trans('Sign Up'))

@section('content')

    <div class="entry-right-inner">
        <form action="{{ route('register') }}" method="post" onsubmit="return submitUserForm();">
            @csrf

            <div class="content-title">
                <h3>{{trans('Sign Up')}}</h3>
            </div>
            @if(session()->get('sponsor') != null)
            <label for="sponsor">@lang('Sponsor Name')</label>
            <input type="text" name="sponsor"  id="sponsor"  value="{{session()->get('sponsor')}}" placeholder="{{trans('Sponsor By') }}" readonly>
                @error('sponsor')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
            @endif


            <label for="firstname" class="mt-2">@lang('First Name')</label>
            <input type="text" id="firstname" name="firstname" value="{{old('firstname')}}" placeholder="@lang('First Name')">
            @error('firstname')<span class="text-danger mt-1">{{ trans($message) }}</span>@enderror


            <label for="lastname" class="mt-2">@lang('Last Name')</label>
            <input type="text" id="lastname" name="lastname" value="{{old('lastname')}}" placeholder="@lang('Last Name')">
            @error('lastname')<span class="text-danger mt-1">{{ trans($message) }}</span>@enderror

            <label for="username" class="mt-2">@lang('Username')</label>
            <input type="text" id="username" name="username" value="{{old('username')}}" placeholder="@lang('Username')">
            @error('username')<span class="text-danger mt-1">{{ trans($message) }}</span>@enderror


            <label for="email" class="mt-2">@lang('Email Address')</label>
            <input type="email" id="email" name="email" value="{{old('email')}}" placeholder="@lang('Email Address')">
            @error('email')<span class="text-danger mt-1">{{ trans($message) }}</span>@enderror

            <style>
                .select-country{
                    width: 100%;
                    border: 1px solid #cccccc;
                    border-radius: 4px;
                    padding: 16px 16px;
                    margin: 8px 0;
                    outline: initial;
                }
            </style>

            <label for="country" class="mt-2">@lang('Country')</label>
            <select name="country" id="country" class="form-control form-control-lg" style="height: 50px !important;">
                <option value="" selected disabled>@lang('Select Country')</option>
                @foreach($countries as $item)
                    <option value="{{$item['iso_code']}}">{{$item['name']}}</option>
                @endforeach
            </select>
            @error('country')<span class="text-danger mt-1">{{ trans($message) }}</span>@enderror


            <label for="phone" class="mt-2">@lang('Phone Number')</label>
            {{-- <input type="text" id="phone" name="phone" value="{{old('phone')}}" placeholder="@lang('Phone Number')"> --}}
            <input type="text" class="form-control form-control-lg dialcode-set"
		                                               aria-label="Large" aria-describedby="inputGroup-sizing-lg"
		                                               id="phone" name="phone"
		                                               value="{{old('phone')}}">
            @error('phone')<span class="text-danger mt-1">{{ trans($message) }}</span>@enderror

			<input type="hidden" name="country_code" id="country_code" value="{{old('phone','+49')}}"/>

            <label for="password" class="mt-2">@lang('Password')</label>
            <div class="d-flex justify-content-between password-visual">
                <input type="password"  id="password" name="password"  value="{{old('password')}}" placeholder="@lang('Password')">

                <div class="input-group-append ">
                    <span class="show-password input-group-text" id="inputGroup-sizing-default">
                        <a href="javascript:void(0)"
                           class="text-white  clickShowPassword">
                            <i class="fa fa-eye-slash"></i>
                        </a>
                    </span>
                </div>
            </div>
            @error('password')<span class="text-danger mt-1">{{ trans($message) }}</span>@enderror


            <label for="password_confirmation">@lang('Confirm Password')</label>

            <div class="d-flex justify-content-between password-visual">
                <input type="password"  id="password_confirmation" name="password_confirmation"  value="{{old('password_confirmation')}}" placeholder="@lang('Confirm Password')">

                <div class="input-group-append ">
                    <span class="show-password input-group-text" id="inputGroup-sizing-default">
                        <a href="javascript:void(0)"
                           class="text-white  clickShowPassword">
                            <i class="fa fa-eye-slash"></i>
                        </a>
                    </span>
                </div>
            </div>


            @if(config('basic.google_captcha') == 1)
                <label for="recaptcha" class="form-label mt-2">&nbsp;</label>
                <div>
                    <div class="g-recaptcha ms-3" id="recaptcha"
                         data-sitekey="{{config('basic.google_captcha_key')}}"></div>
                    <span id="captcha" class="text-danger ms-3"></span>
                </div>
            @endif

            <div class="remember d-flex flex-wrap justify-content-between align-items-center mt-3">
                <div class="checkbox">
                    <input type="checkbox" name="remember" id="remember"  {{ old('remember') ? 'checked' : '' }} required>
                    <label for="remember">@lang('I accept ') <a href="{{route('terms-and-conditions')}}" target="_blank">@lang('terms and conditions')</a> & <a href="{{route('privacy-policy')}}" target="_blank">@lang('privacy policy')</a></label>
                </div>
            </div>

            <div class="entry-button">
                <button>@lang('Sign Up')</button>
            </div>
        </form>
        <div class="content-title text-center my-2">
            <span>{{trans('Or')}}</span>
        </div>
        <p class="login-link text-center">@lang("Already have an account?") <a href="{{ route('login')}}"><span class="text--base"> @lang('Sign In')</span></a></p>
    </div>


@endsection


@push('style')
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <link rel="stylesheet" href="{{asset($themeTrue.'css/intlTelInput.css')}}">
    <script src="{{asset($themeTrue.'js/intlTelInput.js')}}"></script>
@endpush
@push('script')
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.12/js/intlTelInput.min.js"></script>
    <script>
        $(document).ready(function () {
            var inputCountry = document.querySelector("#country");
            var inputPhone = document.querySelector("#phone");

            var iti = window.intlTelInput(inputPhone, {
                separateDialCode: true,
                preferredCountries: ["de"],
                utilsScript: "{{asset($themeTrue.'js/utils.js')}}",
            });

            // Listen for the country change event on the country select element
            $(inputCountry).change(function () {
                var selectedCountry = $(this).val();
                iti.setCountry(selectedCountry); // Set the selected country in the phone input
            });

            // Initialize the selected country
            var selectedCountry = $(inputCountry).val();
            iti.setCountry(selectedCountry); // Set the selected country in the phone input initially
        });
    </script>
    <script>
        "use strict";




        
        // var inputphone = document.querySelector("#phone");
            
        // var iti = window.intlTelInput(inputphone, {
        //     separateDialCode: true,
        //     preferredCountries : ["de"],
        //     utilsScript: "{{asset($themeTrue.'js/utils.js')}}",
        // })

        // inputphone.addEventListener("countrychange", function(e,countryData) {
        //     var country_code = iti.getSelectedCountryData().dialCode;
        //     $('#country_code').val('+'+country_code)
        // });
        
        function submitUserForm() {
            var isCapcha = "{{config('basic.google_captcha')}}"
            if (isCapcha == '0') {
                return true
            }

            var v = grecaptcha.getResponse();
            if (v.length == 0) {
                document.getElementById('captcha').innerHTML = "{{trans('Captcha field is required.')}}";
                document.getElementById('captcha').classList.remove("text-info");
                document.getElementById('captcha').classList.add("text-danger");
                return false;
            } else {
                document.getElementById('captcha').innerHTML = "{{trans('Captcha completed')}}";
                document.getElementById('captcha').classList.remove("text-danger");
                document.getElementById('captcha').classList.add("text-info");
                return true;
            }
        }


        $(document).on('click', '.clickShowPassword', function () {
            var passInput = $(this).closest('.password-visual').find('input');
            if (passInput.attr('type') === 'password') {
                $(this).children().removeClass('fa-eye-slash');
                $(this).children().addClass('fa-eye');
                passInput.attr('type', 'text');
            } else {
                $(this).children().removeClass('fa-eye');
                $(this).children().addClass('fa-eye-slash');
                passInput.attr('type', 'password');
            }
        })
    </script>
@endpush
