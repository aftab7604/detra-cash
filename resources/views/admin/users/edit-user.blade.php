@extends('admin.layouts.app')
@section('title')
    @lang($user->username)
@endsection
@section('content')

    <div class="m-0 m-md-4 my-4 m-md-0">
        <div class="row">

            <div class="col-lg-4">
                <div class="card card-primary ">
                    <div class="card-body">
                        <h4 class="card-title ">@lang('Profile')
                            @if($user->merchant == 1)
                            <span class="badge bg-success badge-pill text-white float-right">{{trans('Merchant')}}</span>
                            @endif
                        </h4>
                        <div class="form-group text-center">
                            <img class="rounded mx-auto d-block w-50"
                                 src="{{getFile(config('location.user.path').$user->image) }}"
                                 alt="preview image">
                        </div>
                        <h3> @lang(ucfirst($user->username))</h3>
                        <p>@lang('Joined At') @lang($user->created_at->format('d M,Y h:i A')) </p>
                    </div>
                </div>

                <div class="card card-primary">
                    <div class="card-body">
                        <h4 class="card-title">@lang('User information')</h4>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between align-items-center">@lang('Email')
                                <span>{{ $user->email }}</span></li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">@lang('Username')
                                <span>{{ $user->username }}</span></li>

                            <li class="list-group-item d-flex justify-content-between align-items-center">@lang('Status')
                                <span
                                    class="badge badge-{{($user->status==1) ? 'success' :'danger'}} success badge-pill">{{($user->status==1) ? trans('Active') : trans('Inactive')}}</span>
                            </li>

                            <li class="list-group-item d-flex justify-content-between align-items-center">@lang('User Type')
                                <span
                                    class="badge badge-{{($user->merchant==1) ? 'primary' :'dark'}}  badge-pill">{{($user->merchant==1) ? trans('Merchant') : trans('User')}}</span>
                            </li>

                            <li class="list-group-item d-flex justify-content-between align-items-center">@lang('Last Login')
                                <span>{{ diffForHumans($user->last_login) }}</span></li>

                            <li class="list-group-item d-flex justify-content-between align-items-center">@lang('IP')
                                <span>{{ $user->last_login_ip }}</span></li>


                        </ul>
                    </div>
                </div>


                <div class="card card-primary">
                    <div class="card-body">
                        <h4 class="card-title">@lang('More Information')</h4>


                        <div class="btn-list ">
                            @if(adminAccessRoute(config('role.user_management.access.edit')))
                                @if($user->merchant == 1)
                            <button class="btn btn-primary btn-sm" type="button" data-toggle="modal"
                                    data-target="#balance">
                                <span class="btn-label"><i class="fas fa-hand-holding-usd"></i></span>
                                @lang('Add/Subtract Fund')
                            </button>
                                @endif
                            @endif
.
                                @if(adminAccessRoute(config('role.login_user.access.view')))
                                <a class="loginAccount btn btn-info btn-sm" href="javascript:void(0)"
                                   data-toggle="modal"
                                   data-target="#signIn"
                                   data-route="{{route('admin.user-loginAccount',$user->id)}}">
                                    <span class="btn-label"><i class="fa fa-sign-in-alt"></i></span> @lang('Login as User')
                                </a>
                                @endif

                                @if(adminAccessRoute(config('role.transaction_log.access.view')))
                            <a href="{{ route('admin.user.transaction',$user->id) }}"
                               class="btn btn-info btn-sm">
                                <span class="btn-label"><i class="fas fa-exchange-alt"></i></span> @lang('Transaction Log')
                            </a>
                                @endif
                                @if(adminAccessRoute(config('role.payment_log.access.view')))
                            <a href="{{ route('admin.user.fundLog',$user->id) }}"
                               class="btn btn-info btn-sm">
                                <span class="btn-label"><i class="fas fa-money-bill-alt"></i></span> @lang('Payment Log')
                            </a>
                                @endif
                                @if(adminAccessRoute(config('role.transfer_log.access.view')))
                            <a href="{{ route('admin.user.transfer',$user->id) }}"
                               class="btn btn-info btn-sm">
                                <span class="btn-label"><i class="fas fa-exchange-alt"></i></span> @lang('Transfer Log')
                            </a>
                                @endif

                            @if(adminAccessRoute(config('role.send_email.access.view')))
                            <a href="{{ route('admin.send-email',$user->id) }}"
                               class="btn btn-info btn-sm">
                                <span class="btn-label"><i class="fas fa-envelope-open"></i></span> @lang('Send Email')
                            </a>
                            @endif
                                @if(adminAccessRoute(config('role.login_log.access.view')))
                            <a href="{{ route('admin.user.loggedIn',$user->id) }}"
                               class="btn btn-info btn-sm">
                                <span class="btn-label"><i class="fas fa-history"></i></span> @lang('Login Logs')
                            </a>
                                @endif
                                @if(adminAccessRoute(config('role.kyc_record.access.view')))
                            <a href="{{ route('admin.user.userKycHistory',$user) }}"
                               class="btn btn-info btn-sm">
                                <span class="btn-label"><i class="fas fa-file-invoice"></i></span> @lang('KYC Records')
                            </a>
                                @endif

                        </div>


                    </div>
                </div>

            </div>

            <div class="col-lg-8">

                <div class="card card-primary">
                    <div class="card-body">
                        <h4 class="card-title">{{ ucfirst($user->username) }} @lang('Information')</h4>
                        <form method="post" action="{{ route('admin.user-update', $user->id) }}"
                              enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group ">
                                        <label>@lang('First Name')</label>
                                        <input class="form-control" type="text" name="firstname"
                                               value="{{ $user->firstname }}"
                                               required>
                                        @error('firstname')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group ">
                                        <label>@lang('Last Name')</label>
                                        <input class="form-control" type="text" name="lastname"
                                               value="{{ $user->lastname }}"
                                               required>
                                        @error('lastname')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group ">
                                        <label>@lang('Username')</label>
                                        <input class="form-control" type="text" name="username"
                                               value="{{ $user->username }}" required>
                                        @error('username')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group ">
                                        <label>@lang('Email')</label>
                                        <input class="form-control" type="email" name="email" value="{{ $user->email }}"
                                               required>
                                        @error('email')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group ">
                                        <label>@lang('Country')</label>
                                        <select name="country" id="country" class="form-control form-control-lg" style="height: 50px !important;">
                                            <option value="" selected disabled>@lang('Select Country')</option>
                                            @foreach($countries as $item)
                                                <option value="{{$item['iso_code']}}" @if($user->country == $item['name']) selected @endif>{{$item['name']}}</option>
                                            @endforeach
                                        </select>
                                        @error('country')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group ">
                                        <label>@lang('Phone Number')</label>
                                        {{-- <input class="form-control" type="text" name="phone" value="{{ $user->phone }}"> --}}
                                        <input type="hidden" class="phone_code" name="phone_code" value="+49">

                                                       <input class="form-control dialcode-set phone" aria-describedby="inputGroup-sizing-lg" d="phone" name="phone"
                                                       placeholder="@lang('Enter Phone Number')" value="{{$user->phone}}"
                                                       required>
                                        @error('phone')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group ">
                                        <label>@lang('Address')</label>
                                        <textarea class="form-control" name="address"
                                                  rows="2">{{ $user->address }}</textarea>
                                        @error('address')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label>@lang('City')</label>
                                        <input class="form-control" type="text" name="city" value="{{ $user->city }}">
                                        @error('city')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label>@lang('Post Code')</label>
                                        <input class="form-control" type="text" name="post_code" value="{{ $user->post_code }}">
                                        @error('post_code')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group ">
                                        <label>@lang('state')</label>
                                        <input class="form-control" type="text" name="state" value="{{ $user->state }}">
                                        @error('state')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-3">

                                    <div class="form-group ">
                                        <label>@lang('Preferred language')</label>

                                        <select name="language_id" id="language_id" class="form-control">
                                            <option value="" disabled>@lang('Select Language')</option>
                                            @foreach($languages as $la)
                                                <option value="{{$la->id}}"
                                                    {{ old('language_id', $user->language_id) == $la->id ? 'selected' : '' }}>@lang($la->name)</option>
                                            @endforeach
                                        </select>

                                        @error('language_id')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>

                                </div>
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label>@lang('Status')</label>
                                            <div class="custom-switch-btn w-md-80">
                                                <input type='hidden' value='1' name='status'>
                                                <input type="checkbox" name="status" class="custom-switch-checkbox"
                                                       id="status" {{ $user->status == '0' ? 'checked' : '' }} >
                                                <label class="custom-switch-checkbox-label" for="status">
                                                    <span class="custom-switch-checkbox-inner"></span>
                                                    <span class="custom-switch-checkbox-switch"></span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label>@lang('Email Verification')</label>
                                            <div class="custom-switch-btn w-md-80">
                                                <input type='hidden' value='1' name='email_verification'>
                                                <input type="checkbox" name="email_verification"
                                                       class="custom-switch-checkbox"
                                                       id="email_verification" {{ $user->email_verification == '0' ? 'checked' : '' }}>
                                                <label class="custom-switch-checkbox-label" for="email_verification">
                                                    <span class="custom-switch-checkbox-inner"></span>
                                                    <span class="custom-switch-checkbox-switch"></span>
                                                </label>
                                            </div>
                                        </div>


                                        <div class="col-md-4">
                                            <label>@lang('SMS Verification')</label>
                                            <div class="custom-switch-btn w-md-80">
                                                <input type='hidden' value='1' name='sms_verification'>
                                                <input type="checkbox" name="sms_verification"
                                                       class="custom-switch-checkbox"
                                                       id="sms_verification" {{ $user->sms_verification == '0' ? 'checked' : '' }}>
                                                <label class="custom-switch-checkbox-label" for="sms_verification">
                                                    <span class="custom-switch-checkbox-inner"></span>
                                                    <span class="custom-switch-checkbox-switch"></span>
                                                </label>
                                            </div>
                                        </div>
                                        @if(config('basic.twofaotp'))
                                        <div class="col-md-4">
                                            <label>@lang('2FA - OTP')</label>
                                            <div class="custom-switch-btn w-md-80">
                                                <input type='hidden' value='0' name='two_fa_verify'>
                                                <input type="checkbox" name="two_fa_verify"
                                                       class="custom-switch-checkbox"
                                                       id="two_fa_verify" {{ $user->two_fa_verify == '1' ? 'checked' : '' }}>
                                                <label class="custom-switch-checkbox-label" for="two_fa_verify">
                                                    <span class="custom-switch-checkbox-inner"></span>
                                                    <span class="custom-switch-checkbox-switch"></span>
                                                </label>
                                            </div>
                                        </div>
                                        @endif
                                        @if(config('basic.twofaauth'))
                                        <div class="col-md-4">
                                            <label>@lang('2FA - Authenticator')</label>
                                            <div class="custom-switch-btn w-md-80">
                                                <input type='hidden' value='0' name='two_fa_auth'>
                                                <input type="checkbox" name="two_fa_auth"
                                                       class="custom-switch-checkbox"
                                                       id="two_fa_auth" {{ $user->two_fa_auth == '1' ? 'checked' : '' }}>
                                                <label class="custom-switch-checkbox-label" for="two_fa_auth">
                                                    <span class="custom-switch-checkbox-inner"></span>
                                                    <span class="custom-switch-checkbox-switch"></span>
                                                </label>
                                            </div>
                                        </div>
                                         @endif
                                        <div class="col-md-4">
                                            <label>@lang('Merchant')</label>
                                            <div class="custom-switch-btn w-md-80">
                                                <input type='hidden' value='0' name='merchant'>
                                                <input type="checkbox" name="merchant"
                                                       class="custom-switch-checkbox"
                                                       id="merchant" {{ $user->merchant == '0' ? 'checked' : '' }}>
                                                <label class="custom-switch-checkbox-label" for="merchant">
                                                    <span class="custom-switch-checkbox-inner"></span>
                                                    <span class="custom-switch-checkbox-switch"></span>
                                                </label>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="submit-btn-wrapper mt-md-3  text-center text-md-left">
                                <button type="submit"
                                        class=" btn btn-rounded btn-primary btn-block">
                                    <span>@lang('Update User')</span></button>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="card card-primary ">
                    <div class="card-body">
                        <h4 class="card-title">@lang('Password Change')</h4>

                        <form method="post" action="{{ route('admin.userPasswordUpdate',$user->id) }}"
                              enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group ">
                                        <label>@lang('New Password')</label>

                                        <div class="input-group mb-3">
                                            <input id="new_password" type="password"
                                                   class="form-control " aria-label="Default"
                                                   aria-describedby="inputGroup-sizing-default"
                                                   name="password" value="{{old('password')}}" placeholder="@lang('New Password')"
                                                   autocomplete="off">
                                            <div class="input-group-append">
                                                    <span class="input-group-text" id="inputGroup-sizing-default">
                                                        <a href="javascript:void(0)"
                                                           class="text-dark clickShowPassword">
                                                            <i class="fa fa-eye-slash"></i>
                                                        </a>
                                                    </span>
                                            </div>
                                        </div>

                                        @error('password')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                    <div class="form-group ">
                                        <label>@lang('Confirm Password')</label>

                                        <div class="input-group mb-3">
                                            <input id="password_confirmation" type="password"
                                                   class="form-control " aria-label="Default"
                                                   aria-describedby="inputGroup-sizing-default"
                                                   name="password_confirmation" value="{{old('password_confirmation')}}" placeholder="@lang('Confirm Password')"
                                                   autocomplete="off">
                                            <div class="input-group-append">
                                                    <span class="input-group-text" id="inputGroup-sizing-default">
                                                        <a href="javascript:void(0)"
                                                           class="text-dark clickShowPassword">
                                                            <i class="fa fa-eye-slash"></i>
                                                        </a>
                                                    </span>
                                            </div>
                                        </div>


                                        @error('password_confirmation')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="submit-btn-wrapper mt-md-3 text-center text-md-left">
                                <button type="submit"
                                        class="btn waves-effect waves-light btn-rounded btn-primary btn-block">
                                    <span>@lang('Update Password')</span></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- The Modal -->
    <div class="modal fade" id="balance">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form method="post" action="{{ route('admin.user-balance-update',$user->id) }}"
                      enctype="multipart/form-data">
                @csrf
                <!-- Modal Header -->
                    <div class="modal-header modal-colored-header bg-primary">
                        <h4 class="modal-title">@lang('Add / Subtract Balance')</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="form-group ">
                            <label>@lang('Amount')</label>
                            <input class="form-control" type="text" name="balance" id="balance">
                        </div>



                        <div class="form-group">
                            <div class="custom-switch-btn w-md-30">
                                <input type='hidden' value='1' name='add_status'>
                                <input type="checkbox" name="add_status" class="custom-switch-checkbox" id="add_status"
                                       value="0">
                                <label class="custom-switch-checkbox-label" for="add_status">
                                    <span class="custom-switch-checkbox-inner"></span>
                                    <span class="custom-switch-checkbox-switch"></span>
                                </label>
                            </div>
                        </div>

                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal"><span>@lang('Close')</span>
                        </button>
                        <button type="submit" class=" btn btn-primary balanceSave"><span>@lang('Submit')</span>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>




    <!-- The Modal -->
    <div class="modal fade" id="signIn">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="" class="loginAccountAction" enctype="multipart/form-data">
                    @csrf
                    <!-- Modal Header -->
                    <div class="modal-header modal-colored-header bg-primary">
                        <h4 class="modal-title">@lang('Sing In Confirmation')</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <p>@lang('Are you sure to sign in this account?')</p>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal"><span>@lang('Close')</span>
                        </button>
                        <button type="submit" class=" btn btn-primary "><span>@lang('Yes')</span>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>

@endsection

@push('js')

    <script>
        "use strict";

        $(document).on('click', '.loginAccount', function () {
            var route = $(this).data('route');
            $('.loginAccountAction').attr('action', route)
        });


        $(document).ready(function () {
            $(document).on('click', '.balanceSave', function () {
                var bala = $('#balance').text();
            });

            $('select').select2({
                selectOnClose: true
            });

            $(document).on('click', '.clickShowPassword', function () {
                var passInput = $(this).closest('.input-group').find('input');
                if (passInput.attr('type') === 'password') {
                    $(this).children().addClass('fa-eye');
                    $(this).children().removeClass('fa-eye-slash');
                    passInput.attr('type', 'text');
                } else {
                    $(this).children().addClass('fa-eye-slash');
                    $(this).children().removeClass('fa-eye');
                    passInput.attr('type', 'password');
                }
            })

        });


    </script>
@endpush
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

    var phoneInputs = document.querySelectorAll(".phone");
    var inputCountry = document.querySelector("#country");
    var phoneCode = "+49";
    var itiInstances = [];

    // Initialize intlTelInput for each phone input
    phoneInputs.forEach(function(input) {
        var iti = window.intlTelInput(input, {
            separateDialCode: true,
            initialCountry: "de",  // Set the default country to "de"
            preferredCountries: ["de"],
            utilsScript: "{{asset($themeTrue.'js/utils.js')}}",
        });

        itiInstances.push(iti);

        // Attach country change event to each input
        input.addEventListener('countrychange', function(e) {
            var selectedCountryData = iti.getSelectedCountryData();
            console.log('Country changed to:', selectedCountryData.name, selectedCountryData.iso2);

            // Call your custom function here
            handleCountryChange(selectedCountryData, input);
        });
    });

    // Custom function to handle country change
    function handleCountryChange(countryData, inputElement) {
        phoneCode = countryData.iso2;
        console.log('New country selected:', countryData.name, countryData.dialCode);
        // Perform additional actions based on the countryData
        $('.phone_code').val(countryData.dialCode);
    }


});


</script>

