@extends('admin.layouts.app')
@section('title')
    @lang('Basic Controls')
@endsection
@section('content')

    <div class="card card-primary m-0 m-md-4 my-4 m-md-0">
        <div class="card-body">

            <form method="post" action="" novalidate="novalidate" class="needs-validation base-form">
                @csrf
                <div class="row">
                    <div class="form-group  col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">@lang('Site Title')</label>
                        <input type="text" name="site_title"
                               value="{{ old('site_title') ?? $control->site_title ?? 'Site Title' }}"
                               class="form-control ">

                        @error('site_title')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror

                    </div>



                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">@lang('Base Currency')</label>
                        <input type="text" name="currency" value="{{ old('currency') ?? $control->currency ?? 'USD' }}"
                               required="required" class="form-control currency_code">

                        @error('currency')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">@lang('Currency Symbol')</label>
                        <input type="text" name="currency_symbol"
                               value="{{ old('currency_symbol') ?? $control->currency_symbol ?? '$' }}"
                               required="required" class="form-control ">

                        @error('currency_symbol')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">{{trans('Rate')}}</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <div class="input-group-text">
                                    {{trans('1')}} {{ trans('USD') }} =
                                </div>
                            </div>

                            <input type="text" class="form-control"
                                   name="rate"
                                   value="{{old('rate',getAmount($control->rate))}}"
                            >
                            <div class="input-group-append">
                                <div class="input-group-text set-currency">
                                </div>
                            </div>
                        </div>
                        @error('rate')
                        <span class="text-danger">{{ trans($message)  }}</span>
                        @enderror
                    </div>


                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">@lang('TimeZone')</label>
                        <select class="form-control" id="exampleFormControlSelect1" name="time_zone">
                            <option hidden>{{ old('time_zone', $control->time_zone)?? 'Select Time Zone' }}</option>
                            @foreach ($control->time_zone_all as $time_zone_local)
                                <option value="{{ $time_zone_local }}">@lang($time_zone_local)</option>
                            @endforeach
                        </select>

                        @error('time_zone')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">@lang('Fraction number')</label>
                        <input type="text" name="fraction_number"
                               value="{{ old('fraction_number') ?? $control->fraction_number ?? '2' }}"
                               required="required" class="form-control ">
                        @error('fraction_number')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>


                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">@lang('Paginate Per Page')</label>
                        <input type="text" name="paginate" value="{{ old('paginate') ?? $control->paginate ?? '2' }}"
                               required="required" class="form-control ">
                        @error('paginate')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>


                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">{{trans('Session Expired')}}</label>
                        <div class="input-group">
                            <input type="text" class="form-control form-control-lg" value="{{ old('session_expire') ?? $control->session_expire ?? '' }}" name="session_expire">
                            <div class="input-group-append">
                                <span class="input-group-text">
                                    {{trans('Minutes')}}
                                </span>
                            </div>
                        </div>

                        @error('session_expire')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>



                    <div class="form-group col-sm-6 col-md-4 col-lg-3">

                        <label class="text-dark">{{trans('Currency Rate API Key')}}</label>
                        <div class="input-group">
                            <input type="text" class="form-control form-control-lg" value="{{ old('currency_api_key') ?? $control->currency_api_key ?? '' }}" name="currency_api_key">
                            <div class="input-group-append">
                                <span class="input-group-text">
                                   <a href="javascript:void(0)"   data-toggle="modal" data-target="#myModal" title="{{trans('See Instruction')}}"> <i class="fa fa-info-circle"></i></a>
                                </span>
                            </div>
                        </div>

                        @error('currency_api_key')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>


                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">{{trans('Merchant Commission')}} <small> ({{trans('Sending')}})</small></label>
                        <div class="input-group">
                            <input type="text" class="form-control"
                                   name="merchant_commission"
                                   value="{{old('merchant_commission',getAmount($control->merchant_commission))}}">
                            <div class="input-group-append">
                                <div class="input-group-text "> {{trans('%')}}
                                </div>
                            </div>
                        </div>

                        <span class="text-muted">{{trans('Merchant will get amount from sending Charge')}}</span>
                        @error('merchant_commission')
                        <span class="text-danger">{{ trans($message)  }}</span>
                        @enderror
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">{{trans('Merchant Commission')}} <small> ({{trans('Receiving')}})</small></label>
                        <div class="input-group">
                            <input type="text" class="form-control"
                                   name="merchant_profit"
                                   value="{{old('merchant_profit',getAmount($control->merchant_profit))}}">
                            <div class="input-group-append">
                                <div class="input-group-text "> {{trans('%')}}
                                </div>
                            </div>
                        </div>

                        <span class="text-muted">{{trans('Merchant will get amount from receiving Charge')}}</span>
                        @error('merchant_profit')
                        <span class="text-danger">{{ trans($message)  }}</span>
                        @enderror
                    </div>


                    <div class="form-group col-sm-6 col-md-6 col-lg-3">
                        <label class="text-dark">@lang('Google Captcha key')</label>
                        <input type="text" name="google_captcha_key"
                               value="{{ old('google_captcha_key') ?? $control->google_captcha_key ?? '' }}"
                               required="required" class="form-control ">

                        @error('google_captcha_key')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>

                    <div class="form-group col-sm-6 col-md-6 col-lg-3">
                        <label class="text-dark">@lang('Google Captcha Secret key')</label>
                        <input type="text" name="google_captcha_secret_key"
                               value="{{ old('google_captcha_secret_key') ?? $control->google_captcha_secret_key ?? '' }}"
                               required="required" class="form-control ">

                        @error('google_captcha_key')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>

                    <div class="group col-sm-6 col-md-6 col-lg-3">
                        <label class="text-dark">@lang('Reloadly Client Id')</label>
                        <input type="text" name="client_id" value="{{ old('client_id') ?? $control->client_id ?? '' }}"
                               required="required" class="form-control ">
                        @error('client_id')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>

                    <div class="form-group  col-md-6 col-lg-6">
                        <label class="text-dark">@lang('Reloadly Client Secret')</label>
                        <input type="text" name="client_secret" value="{{ old('client_secret') ?? $control->client_secret ?? '' }}"
                               required="required" class="form-control ">
                        @error('client_secret')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>



                    <div class="form-group col-sm-6 col-md-4 col-lg-3 ">
                        <label class="text-dark">@lang('Google Captcha')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='google_captcha'>
                            <input type="checkbox" name="google_captcha" class="custom-switch-checkbox"
                                   id="google_captcha"
                                   value="0" {{($control->google_captcha == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="google_captcha">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>



                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="d-block">@lang('Reloadly Sandbox Mode')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='sandbox'>
                            <input type="checkbox" name="sandbox" class="custom-switch-checkbox"
                                   id="sandbox"
                                   value="0" {{($control->sandbox  == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="sandbox">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3 ">
                        <label class="text-dark">@lang('Strong Password')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='strong_password'>
                            <input type="checkbox" name="strong_password" class="custom-switch-checkbox"
                                   id="strong_password"
                                   value="0" {{($control->strong_password == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="strong_password">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3 ">
                        <label class="text-dark">@lang('Registration')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='registration'>
                            <input type="checkbox" name="registration" class="custom-switch-checkbox"
                                   id="registration"
                                   value="0" {{($control->registration == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="registration">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>




                    <div class="form-group col-sm-6 col-md-4 col-lg-3 ">
                        <label class="text-dark">@lang('SMS Notification')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='sms_notification'>
                            <input type="checkbox" name="sms_notification" class="custom-switch-checkbox"
                                   id="sms_notification"
                                   value="0" {{($control->sms_notification == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="sms_notification">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="d-block">@lang('Email Notification')</label>

                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='email_notification'>
                            <input type="checkbox" name="email_notification" class="custom-switch-checkbox"
                                   id="email_notification"
                                   value="0" {{($control->email_notification == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="email_notification">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="d-block">@lang('SMS Verification')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='sms_verification'>
                            <input type="checkbox" name="sms_verification" class="custom-switch-checkbox"
                                   id="sms_verification"
                                   value="0" {{($control->sms_verification == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="sms_verification">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="d-block">@lang('Email Verification')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='email_verification'>
                            <input type="checkbox" name="email_verification" class="custom-switch-checkbox"
                                   id="email_verification"
                                   value="0" {{($control->email_verification == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="email_verification">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="d-block">@lang('Address Verification')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='address_verification'>
                            <input type="checkbox" name="address_verification" class="custom-switch-checkbox"
                                   id="address_verification"
                                   value="0" {{($control->address_verification == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="address_verification">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="d-block">@lang('Identity Verification')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='identity_verification'>
                            <input type="checkbox" name="identity_verification" class="custom-switch-checkbox"
                                   id="identity_verification"
                                   value="0" {{($control->identity_verification == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="identity_verification">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>


                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="d-block">@lang('Maintenance Mode')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='maintenance'>
                            <input type="checkbox" name="maintenance" class="custom-switch-checkbox"
                                   id="maintenance"
                                   value="0" {{($control->maintenance  == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="maintenance">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>


                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="d-block">@lang('Livechat')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='livechat'>
                            <input type="checkbox" name="livechat" class="custom-switch-checkbox"
                                   id="livechat"
                                   value="0" {{($control->livechat  == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="livechat">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="d-block">@lang('2FA - OTP')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='twofaotp'>
                            <input type="checkbox" name="twofaotp" class="custom-switch-checkbox"
                                   id="twofaotp"
                                   value="0" {{($control->twofaotp  == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="twofaotp">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-sm-6 col-md-4 col-lg-3">
                        <label class="d-block">@lang('2FA - Authenticator')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='twofaauth'>
                            <input type="checkbox" name="twofaauth" class="custom-switch-checkbox"
                                   id="twofaauth"
                                   value="0" {{($control->twofaauth  == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="twofaauth">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group  col-sm-6 col-md-4 col-lg-3">
                        <label class="text-dark">@lang('Twakto Chat API Key')</label>
                        <input type="text" name="twakto"
                               value="{{ old('twakto') ?? $control->twakto ?? '' }}"
                               class="form-control ">

                        @error('twakto')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>




                </div>



                <div class="row">
                    <div class="form-group  col-sm-6 col-md-4 col-lg-4">
                        <label>@lang('Flutterwave  PUBLIC KEY')</label>
                        <input type="text" name="PUBLIC_KEY"
                               value="{{ old('PUBLIC_KEY') ?? $control->PUBLIC_KEY ?? '' }}"
                               class="form-control ">
                        @error('PUBLIC_KEY')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>

                    <div class="form-group  col-sm-6 col-md-4 col-lg-4">
                        <label>@lang('Flutterwave  SECRET KEY')</label>
                        <input type="text" name="SECRET_KEY"
                               value="{{ old('SECRET_KEY') ?? $control->SECRET_KEY ?? '' }}"
                               class="form-control ">
                        @error('SECRET_KEY')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>


                    <div class="form-group  col-sm-6 col-md-4 col-lg-4">
                        <label>@lang('Flutterwave  ENCRYPTION KEY')</label>
                        <input type="text" name="ENCRYPTION_KEY"
                               value="{{ old('ENCRYPTION_KEY') ?? $control->ENCRYPTION_KEY ?? '' }}"
                               class="form-control ">
                        @error('ENCRYPTION_KEY')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>


                </div>
                <hr>
                <h4>  Referral Reward Setting</h4> <br>                
                <div class="row">
                    <div class="form-group col-sm-6 col-md-3 col-lg-3">
                        <label class="d-block">@lang('Referral Reward Status')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='referral_reward_status'>
                            <input type="checkbox" name="referral_reward_status" class="custom-switch-checkbox"
                                   id="referral_reward_status"
                                   value="0" {{($control->referral_reward_status  == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="referral_reward_status">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-sm-6 col-md-3 col-lg-3">
                        <label class="text-dark">@lang('Referral Reward Type')</label>
                        <select class="form-control" id="exampleFormControlSelect2" name="referral_reward_type">
                            <option value="percent" {{$control->referral_reward_type == 'percent' ? 'selected' : ''}}>Percent</option>
                            <option value="fixed" {{$control->referral_reward_type == 'fixed' ? 'selected' : ''}}>Fixed</option>
                        </select>

                        @error('referral_reward_type')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>


                    <div class="form-group  col-sm-6 col-md-3 col-lg-3">
                        <label>@lang('Referral Reward')</label>
                        <input type="text" name="referral_reward"
                               value="{{ old('referral_reward') ?? $control->referral_reward ?? '' }}"
                               class="form-control ">
                        @error('referral_reward')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>
                    <div class="form-group  col-sm-6 col-md-3 col-lg-3">
                        <label>@lang('Referral Coupon Usage Count')</label>
                        <input type="text" name="referral_reward_usage_count"
                               value="{{ old('referral_reward_usage_count') ?? $control->referral_reward_usage_count ?? '' }}"
                               class="form-control ">
                        @error('referral_reward_usage_count')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>


                </div>

                <div class="row">
                    <div class="form-group col-sm-6 col-md-3 col-lg-3">
                        <label class="d-block">@lang('Refree Reward Status')</label>
                        <div class="custom-switch-btn">
                            <input type='hidden' value='1' name='refree_reward_status'>
                            <input type="checkbox" name="refree_reward_status" class="custom-switch-checkbox"
                                   id="refree_reward_status"
                                   value="0" {{($control->refree_reward_status  == 0) ? 'checked' : ''}} >
                            <label class="custom-switch-checkbox-label" for="refree_reward_status">
                                <span class="custom-switch-checkbox-inner"></span>
                                <span class="custom-switch-checkbox-switch"></span>
                            </label>
                        </div>
                    </div>

                    <div class="form-group col-sm-6 col-md-3 col-lg-3">
                        <label class="text-dark">@lang('Refree Reward Type')</label>
                        <select class="form-control" id="exampleFormControlSelect3" name="refree_reward_type">
                            <option value="percent" {{$control->refree_reward_type == 'percent' ? 'selected' : ''}}>Percent</option>
                            <option value="fixed" {{$control->refree_reward_type == 'fixed' ? 'selected' : ''}}>Fixed</option>
                        </select>

                        @error('refree_reward_type')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>


                    <div class="form-group  col-sm-6 col-md-3 col-lg-3">
                        <label>@lang('Refree Reward')</label>
                        <input type="text" name="refree_reward"
                               value="{{ old('refree_reward') ?? $control->refree_reward ?? '' }}"
                               class="form-control ">
                        @error('refree_reward')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>

                    <div class="form-group  col-sm-6 col-md-3 col-lg-3">
                        <label>@lang('Refree Coupon Usage Count')</label>
                        <input type="text" name="refree_reward_usage_count"
                               value="{{ old('refree_reward_usage_count') ?? $control->refree_reward_usage_count ?? '' }}"
                               class="form-control ">
                        @error('refree_reward_usage_count')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>


                </div>

                <div class="row">
                    <div class="form-group  col-sm-12 col-md-6 col-lg-6">
                        <label>@lang('Referral Reward on Min Transaction')</label>
                        <input type="text" name="reward_min_txn"
                               value="{{ old('reward_min_txn') ?? $control->reward_min_txn ?? '' }}"
                               class="form-control ">
                        @error('reward_min_txn')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>
                    <div class="form-group  col-sm-12 col-md-6 col-lg-6">
                        <label>@lang('Refree Reward Limit')</label>
                        <input type="text" name="refree_reward_limit"
                               value="{{ old('refree_reward_limit') ?? $control->refree_reward_limit ?? '' }}"
                               class="form-control ">
                        @error('refree_reward_limit')
                        <span class="text-danger">{{ trans($message) }}</span>
                        @enderror
                    </div>
                </div>


                <button type="submit" class="btn waves-effect waves-light btn-rounded btn-primary btn-block mt-3"><span><i
                            class="fas fa-save pr-2"></i> @lang('Save Changes')</span></button>
            </form>
        </div>
    </div>





    <!-- Modal for Edit button -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Currencylayer rate API')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <p class="">{{trans('Get your rate API key from')}} <a href="https://currencylayer.com/">{{trans('currencylayer')}}</a></p>

                    <p class="text-dark"> {{trans('Set up this Cron job command on your server to get update rate')}}  <br>
                        <code> {{trans('curl -s')}} {{route('cron')}}</code></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script>
        "use strict";
        $(document).ready(function () {
            $('select').select2({
                selectOnClose: true
            });

            setCurrency();
            $(document).on('change', '.currency_code', function (){
                setCurrency();
            });

            function setCurrency() {
                let currency = $('.currency_code').val();
                $('.set-currency').text(currency);
            }
        });
    </script>
@endpush
