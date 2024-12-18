@extends('admin.layouts.app')
@section('title')
    {{ trans($page_title) }}
@endsection
@section('content')
    <div class="container-fluid">
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ trans($error) }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <div class="row">
            <div class="col-12">
                <div class="card card-primary shadow">
                    <div class="card-body">
                        <form method="post" action="{{ route('admin.update.payment.methods', $method->id) }}"
                              class="needs-validation base-form" novalidate="" enctype="multipart/form-data">
                            @csrf
                            @method('put')
                            <div class="mt-0 section-title">
                                {{trans('Edit')}} {{ strtoupper($method->name) }}
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-6">
                                    <label>{{trans('Name')}}</label>
                                    <input type="text" class="form-control "
                                           name="name"
                                           value="{{ old('name', $method->name ?? '') }}" disabled required="">
                                    @if ($errors->has('name'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('name')) }}
                                            </span>
                                    @endif
                                </div>
                                <div class="form-group col-md-6 col-6">
                                    <label>{{trans('Currency')}}</label>
                                    <select class="form-control  selectpicker currency-change"
                                            data-live-search="true" name="currency"
                                            required="">
                                        <option disabled selected>@lang("Select Currency")</option>
                                        @foreach($method->currencies as $key => $currency)
                                            @foreach($currency as $curKey => $singleCurrency)
                                                <option
                                                    value="{{ $curKey }}" {{ old('currency', $method->currency) == $curKey ? 'selected' : '' }} data-fiat="{{ $key }}">{{ $curKey }}</option>
                                            @endforeach
                                        @endforeach
                                    </select>

                                    @if ($errors->has('currency'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('currency')) }}
                                            </span>
                                    @endif
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-6">
                                    <label>{{trans('Currency Symbol')}}</label>
                                    <input type="text" class="form-control "
                                           name="currency_symbol"
                                           value="{{ old('currency_symbol', $method->symbol ?? '') }}" required="required">

                                    @if ($errors->has('currency_symbol'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('currency_symbol')) }}
                                            </span>
                                    @endif
                                </div>
                                <div class="form-group col-md-6 col-6">
                                    <label>{{trans('Convention Rate')}}</label>
                                    <div class="input-group ">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                1 {{ $basic->currency ? : 'USD' }} =
                                            </div>
                                        </div>
                                        <input type="text" class="form-control "
                                               name="convention_rate"
                                               value="{{ old('convention_rate', getAmount($method->convention_rate) ?? '') }}"
                                               required>
                                        <div class="input-group-append">
                                            <div class="input-group-text set-currency">

                                            </div>
                                        </div>
                                    </div>

                                    @if ($errors->has('convention_rate'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('currency_symbol')) }}
                                            </span>
                                    @endif
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-6">
                                    <label>{{trans('Minimum Deposit Amount')}}</label>
                                    <div class="input-group ">
                                        <input type="text" class="form-control "
                                               name="minimum_deposit_amount"
                                               value="{{ old('minimum_deposit_amount', round($method->min_amount, 2) ?? '') }}"
                                               required="">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                {{ $basic->currency ?? trans('USD') }}
                                            </div>
                                        </div>
                                    </div>

                                    @if ($errors->has('minimum_deposit_amount'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('minimum_deposit_amount')) }}
                                            </span>
                                    @endif
                                </div>
                                <div class="form-group col-md-6 col-6">
                                    <label>{{trans('Maximum Deposit Amount')}}</label>
                                    <div class="input-group ">
                                        <input type="text" class="form-control "
                                               name="maximum_deposit_amount"
                                               value="{{ old('maximum_deposit_amount', round($method->max_amount, 2) ?? '') }}"
                                               required="">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                {{ $basic->currency ?? trans('USD') }}
                                            </div>
                                        </div>
                                    </div>

                                    @if ($errors->has('maximum_deposit_amount'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('maximum_deposit_amount')) }}
                                            </span>
                                    @endif
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-6">
                                    <label>{{trans('Percentage Charge')}}</label>
                                    <div class="input-group ">
                                        <input type="text" class="form-control "
                                               name="percentage_charge"
                                               value="{{ old('percentage_charge', $method->percentage_charge ?? '') }}"
                                               required="">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                {{trans('%')}}
                                            </div>
                                        </div>
                                    </div>

                                    @if ($errors->has('percentage_charge'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('percentage_charge')) }}
                                            </span>
                                    @endif
                                </div>
                                <div class="form-group col-md-6 col-6">
                                    <label>@lang('Fixed Charge')</label>
                                    <div class="input-group ">
                                        <input type="text" class="form-control "
                                               name="fixed_charge"
                                               value="{{ old('fixed_charge', round($method->fixed_charge, 2) ?? '') }}"
                                               required="">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                {{ $basic->currency ?? trans('USD') }}
                                            </div>
                                        </div>
                                    </div>

                                    @if ($errors->has('fixed_charge'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('fixed_charge')) }}
                                            </span>
                                    @endif
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-6">
                                    <label>{{trans('Withdraw Percentage Charge')}}</label>
                                    <div class="input-group ">
                                        <input type="text" class="form-control "
                                               name="wpercentage_charge"
                                               value="{{ old('wpercentage_charge', $method->wpercentage_charge ?? '') }}"
                                               required="">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                {{trans('%')}}
                                            </div>
                                        </div>
                                    </div>

                                    @if ($errors->has('percentage_charge'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('percentage_charge')) }}
                                            </span>
                                    @endif
                                </div>
                                <div class="form-group col-md-6 col-6">
                                    <label>@lang('Withdraw Fixed Charge')</label>
                                    <div class="input-group ">
                                        <input type="text" class="form-control "
                                               name="wfixed_charge"
                                               value="{{ old('wfixed_charge', round($method->wfixed_charge, 2) ?? '') }}"
                                               required="">
                                        <div class="input-group-append">
                                            <div class="input-group-text">
                                                {{ $basic->currency ?? trans('USD') }}
                                            </div>
                                        </div>
                                    </div>

                                    @if ($errors->has('fixed_charge'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('fixed_charge')) }}
                                            </span>
                                    @endif
                                </div>
                            </div>
                            <div class="row">
                                @foreach ($method->parameters as $key => $parameter)
                                    <div class="form-group  col-md-6 col-6">
                                        <label for="{{ $key }}">{{ strtoupper(str_replace('_',' ', $key)) }}</label>
                                        <input type="text" name="{{ $key }}" value="{{ old($key, $parameter) }}"
                                               class="form-control " id="{{ $key }}">

                                        @if ($errors->has($key))
                                            <span class="invalid-text">
                                                {{ trans($errors->first($key)) }}
                                            </span>
                                        @endif
                                    </div>
                                @endforeach
                            </div>


                            @if($method->extra_parameters)
                                <div class="row">
                                    @foreach($method->extra_parameters as $key => $param)
                                        <div class="form-group  col-md-6 col-6">
                                            <label>{{ strtoupper(str_replace('_',' ', $key)) }}</label>
                                            <div class="input-group">
                                                <input type="text" name="{{ $key }}"
                                                       value="{{ old($key, route($param, $method->code )) }}"
                                                       class="form-control" disabled>
                                                <div class="input-group-append">
                                                    <button type="button" class="btn btn-info copy-btn">
                                                        <i class="fas fa-copy"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            @endif
                            <div class="row justify-content-between">

                                <div class="col-sm-6 col-md-3">
                                    <div class="image-input ">
                                        <label for="image-upload" id="image-label"><i class="fas fa-upload"></i></label>
                                        <input type="file" name="image" placeholder="@lang('Choose image')" id="image">
                                        <img id="image_preview_container" class="preview-image" src="{{ getFile(config('location.gateway.path').$method->image)}}"
                                             alt="preview image">
                                    </div>
                                    @error('image')
                                    <span class="text-danger">{{ trans($message) }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row mt-3">

                                <div class="form-group col-lg-3 col-md-6">
                                    <label>@lang('Status')</label>

                                    <div class="custom-switch-btn">
                                        <input type='hidden' value='1' name='status'>
                                        <input type="checkbox" name="status" class="custom-switch-checkbox" id="status" value = "0"
                                               {{($method->status == 0)? 'checked' : ''}} >
                                        <label class="custom-switch-checkbox-label" for="status">
                                            <span class="custom-switch-checkbox-inner"></span>
                                            <span class="custom-switch-checkbox-switch"></span>
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group col-lg-3 col-md-6">
                                    <label>@lang('withdraw_status')</label>

                                    <div class="custom-switch-btn">
                                        <input type='hidden' value='1' name='withdraw_status'>
                                        <input type="checkbox" name="withdraw_status" class="custom-switch-checkbox" id="withdraw_status" value = "0"
                                            {{($method->withdraw_status == 0)? 'checked' : ''}} >
                                        <label class="custom-switch-checkbox-label" for="withdraw_status">
                                            <span class="custom-switch-checkbox-inner"></span>
                                            <span class="custom-switch-checkbox-switch"></span>
                                        </label>
                                    </div>

                                </div>

                                <div class="form-group col-lg-3 col-md-6">
                                    <a href="{{ route('admin.payment.methods.withdrawinfo', $method->id) }}" class="btn btn-success">Add Withdraw Info</a>
                                </div>

                                <div class="form-group col-lg-3 col-md-6">
                                    <a href="{{ route('admin.payment.methods.currency', $method->id) }}" class="btn btn-success">Add Currency</a>
                                </div>
                            </div>

                            <div class="rot mt-3">
                                @if($method->currency_lists)
                                    <div
                                        class="col-md-6">
                                        <div class="form-group">
                                            <label for="currency">@lang('Supported Currency')</label>
                                            <select
                                                class="form-select form-control @error('supported_currency') is-invalid @enderror"
                                                name="supported_currency[]" multiple="multiple"
                                                id="selectSupportedCurrency"
                                                required>
                                                @foreach(json_decode($method->currency_lists) as $key => $currency)
                                                {{ $currency }}
                                                    <option value="{{$key}}" 
                                                            @if($method->supported_currency)
                                                                @foreach(json_decode($method->supported_currency) as $sup)
                                                                    @if($sup == $currency)
                                                                        selected
                                                                    @endif
                                                                @endforeach>
                                                            @endif
                                                            {{ $currency }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            <div class="invalid-feedback">
                                                @error('supported_currency') @lang($message) @enderror
                                            </div>
                                        </div>
                                    </div>
                                @endif
                            </div>

                            @if($method->supported_currency)
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <div class="card card-primary shadow params-color">
                                            <div
                                                class="card-header text-dark font-weight-bold"> @lang('Conversion Rate')</div>
                                            <div class="card-body">
                                                <div class="row">
                                                    @foreach(json_decode($method->supported_currency) as $key => $currency)
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <div class="input-group-append">
																			<span
                                                                                class="form-control">@lang('1 '){{config('basic.currency')}} =</span>
                                                                    </div>
                                                                    
                                                                    <input type="text"
                                                                           name="rate[{{$key}}]"
                                                                           step="0.001"
                                                                           class="form-control"
                                                                           @if($method->convert_rate)
                                                                           @foreach (json_decode($method->convert_rate) as $key1 => $rate )
                                                                               @php
                                                                                   if($key == $key1){
                                                                                       $rate = $rate;
                                                                                       break;
                                                                                   }else{
                                                                                       $rate =1;
                                                                                   }
                                                                               @endphp
                                                                           @endforeach
                                                                           @endif
                                                                           @if(isset($rate))
                                                                            value="{{$rate}}"
                                                                           @endif
                                                                           >
                                                                  
                                                                    <div class="input-group-prepend">
																				<span
                                                                                    class="form-control">{{$currency}}</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endif

                            <button type="submit" class="btn btn-rounded btn-primary btn-block mt-3">@lang('Save Changes')</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('js')
    <script>
        "use strict";

        $(document).ready(function () {
            setCurrency();
            $(document).on('change', '.currency-change', function (){
                setCurrency();
            });

            function setCurrency() {
                let currency = $('.currency-change').val();
                let fiatYn = $('.currency-change option:selected').attr('data-fiat');
                if(fiatYn == 0){
                    $('.set-currency').text(currency);
                }else{
                    $('.set-currency').text('USD');
                }
            }

            $(document).on('click', '.copy-btn', function () {
                var _this = $(this)[0];
                var copyText = $(this).parents('.input-group-append').siblings('input');
                $(copyText).prop('disabled', false);
                copyText.select();
                document.execCommand("copy");
                $(copyText).prop('disabled', true);
                $(this).text('Coppied');
                setTimeout(function () {
                    $(_this).text('');
                    $(_this).html('<i class="fas fa-copy"></i>');
                }, 500)
            });
        })


    </script>
    <script>
        $(document).ready(function (e) {
            "use strict";

            $('#image').change(function(){
                let reader = new FileReader();
                reader.onload = (e) => {
                    $('#image_preview_container').attr('src', e.target.result);
                }
                reader.readAsDataURL(this.files[0]);
            });


            $('select').select2({
                selectOnClose: true
            });

        });
    </script>
@endpush
