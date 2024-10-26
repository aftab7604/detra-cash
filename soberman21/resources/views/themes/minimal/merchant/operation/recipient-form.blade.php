@extends($theme.'layouts.merchant')
@section('title',trans($page_title))
@section('content')
    <div class="container-fluid">

            <form action="{{route('user.merchant.sendMoney.formData',$sendMoney)}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="row  flex-column-reverse flex-lg-row">

                    <div class="col-lg-12">
                        <div class=" card shadow">
                            <div class="card-body">

                                <h4 class="card-title text-success">{{trans('Your Balance')}} : {{number_format(auth()->user()->balance, config('basic.fraction_number'))}} {{config('basic.currency')}}</h4>
                                <hr>

                                <div class="p-4 border shadow-sm rounded">
                                    <div class="row justify-content-between">
                                        <div class="col-md-5 border-right">

                                            <h4 class="card-title">{{trans('Send From')}}</h4>
                                            <ul class="list-style-none border-bottom">
                                                <li class="my-3 justify-content-between d-flex">
                                                    <span>{{trans('Send Amount')}}</span>
                                                    <span>{{getAmount($sendMoney->send_amount)}} {{trans($sendMoney->send_curr)}} </span>
                                                </li>

                                                <li class="my-3 justify-content-between d-flex">
                                                    <span>{{trans('Fees')}}</span>
                                                    <span> {{getAmount($sendMoney->fees)}} {{trans($sendMoney->send_curr)}}</span>
                                                </li>
                                                <li class="my-3 justify-content-between d-flex text-dark">
                                                    <span>{{trans('You pay in total')}}</span>
                                                    <span>{{getAmount($sendMoney->send_amount,config('basic.fraction_number'))}} {{trans($sendMoney->send_curr)}} </span>
                                                </li>


                                            </ul>

                                        </div>

                                        <div class="col-md-5">
                                            <h4 class="card-title">{{trans('Receive From')}}</h4>
                                            <ul class="list-style-none border-bottom">

                                                <li class="my-3 justify-content-between d-flex">
                                                    <span>{{trans('Exchange rate')}}</span>
                                                    <span>{{trans('1')}} {{trans($sendMoney->send_curr)}}  <i class="fa fa-exchange-alt"></i> {{getAmount($sendMoney->rate,config('basic.fraction_number'))}} {{trans($sendMoney->receive_curr)}} </span>
                                                </li>

                                                <li class="my-3 justify-content-between d-flex text-dark">
                                                    <span>{{trans('Your recipient get')}}</span>
                                                    <span>{{getAmount($sendMoney->recipient_get_amount,config('basic.fraction_number'))}} {{trans($sendMoney->receive_curr)}} </span>
                                                </li>

                                                <li class="my-3 justify-content-between d-flex text-info font-weight-bold">
                                                    <span>{{trans('Merchant Will Pay')}} </span>
                                                    <span>{{getAmount($sendMoney->totalBaseAmountPay,config('basic.fraction_number'))}} {{config('basic.currency')}} </span>
                                                </li>

                                            </ul>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="card shadow">
                    <div class="card-body">
                        <div class="row  justify-content-between">

                            <div class="col-lg-6">
                                <div class="card shadow-sm">
                                    <div class="card-body">
                                        <div class="content-title ">
                                            <h3 class="text-dark">{{trans('Sender Information')}}</h3>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="first_name">{{trans('First Name')}}</label>
                                                    <input type="text" id="first_name" name="first_name" class="form-control" value="{{old('first_name',@explode('.', $sendMoney->sender_name)[0])}}">
                                                    @error('first_name')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="last_name">{{trans('Last Name')}}</label>
                                                    <input type="text" id="last_name" name="last_name" class="form-control" value="{{old('last_name',@explode('.', $sendMoney->sender_name)[1])}}">
                                                    @error('last_name')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>



                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="sender_phone">{{trans('Phone Number')}}</label>
                                                    <input type="text" id="sender_phone" name="sender_phone" class="form-control" value="{{old('sender_phone', $sendMoney->sender_country_code.$sendMoney->sender_phone)}}">
                                                    @error('sender_phone')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <input type="hidden" name="sender_country_code" id="sender_country_code" value="{{old('sender_country_code', $sendMoney->sender_country_code)}}">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="sender_email">{{trans('Email Address')}}</label>
                                                    <input type="email" id="sender_email" name="sender_email" class="form-control" value="{{old('sender_email', $sendMoney->sender_email)}}">
                                                    @error('sender_email')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="sender_address">{{trans('Sender Address')}}</label>
                                                    <input type="text" id="sender_address" name="sender_address" class="form-control" value="{{old('sender_address', $sendMoney->sender_address)}}">
                                                    @error('sender_address')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>



                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="sender_city">{{trans('Town / City')}}</label>
                                                    <input type="text" id="sender_city" name="sender_city" class="form-control" value="{{old('sender_city', $sendMoney->sender_city)}}">
                                                    @error('sender_city')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="sender_city">{{trans('Post Code')}}</label>
                                                    <input type="text" id="sender_post_code" name="sender_post_code" class="form-control" value="{{old('sender_post_code', $sendMoney->sender_post_code)}}">
                                                    @error('sender_post_code')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="sender_city">{{trans('State')}}</label>
                                                    <input type="text" id="sender_state" name="sender_state" class="form-control" value="{{old('sender_state', $sendMoney->sender_state)}}">
                                                    @error('sender_state')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="sender_country">{{trans('Country')}}</label>
                                                    <input type="text" id="sender_country" name="sender_country" class="form-control" value="{{old('sender_country', $sendMoney->sender_country)}}">
                                                    @error('sender_country')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>@lang('Identity Type')</label>
                                                    <select name="identity_type" id="identity_type"
                                                            class="form-control" >
                                                        <option value="" selected disabled>@lang('Select Type')</option>
                                                            <option value="Driving License" {{ old('identity_type') == 'Driving License' ? 'selected' : '' }}>@lang('Driving License')</option>
                                                            <option value="Passport" {{ old('identity_type') == 'Passport' ? 'selected' : '' }}>@lang('Passport')</option>
                                                            <option value="National ID" {{ old('identity_type') == 'National ID' ? 'selected' : '' }}>@lang('National ID')</option>
                                                    </select>
                                                    @error('identity_type')
                                                    <span class="error text-danger">@lang($message) </span>
                                                    @enderror
                                                </div>


                                                <div class="form-group">
                                                    <label for="identityProof">{{trans('Identity Proof')}}</label>
                                                    <input type="file" class="form-control" name="identityProof" value="{{old('identityProof')}}">
                                                    @error('identityProof')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>

                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="addressProof">{{trans('Address Proof')}}</label>
                                                    <input type="file" class="form-control" name="addressProof" value="{{old('addressProof')}}">
                                                    @error('addressProof')
                                                    <div class="error-massage-alt text-danger">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6 ">
                               <div class="card shadow-sm">
                                   <div class="card-body">
                                       <div class="content-title ">
                                           <h3 class="text-dark">{{trans('Recipient Information')}}</h3>
                                       </div>
                                       @if(optional($sendMoney->provider)->services_form)
                                           @foreach(optional($sendMoney->provider)->services_form as $k => $v)
                                               @if($v->type == "text")
                                                   <div class="form-group">
                                                       <label
                                                           for="{{$k}}">{{trans($v->field_level)}} @if($v->validation == 'required')
                                                               <span
                                                                   class="text-danger">*</span>  @endif </label>
                                                       <input type="text" class="form-control" name="{{$k}}" value="{{old($k)}}" id="{{$k}}">

                                                       @error($k)
                                                       <div class="text-danger">
                                                           <span>{{trans($message)}}</span>
                                                       </div>
                                                       @enderror

                                                   </div>

                                               @elseif($v->type == "textarea")
                                                   <div class="form-group">
                                                       <label
                                                           for="{{$k}}">{{trans($v->field_level)}} @if($v->validation == 'required')
                                                               <span
                                                                   class="text-danger">*</span>  @endif </label>
                                                       <textarea name="{{$k}}" id="{{$k}}" class="form-control" rows="5"
                                                                 placeholder="{{trans('Type Here')}}">{{old($k)}}</textarea>
                                                       @error($k)
                                                       <div class="text-danger ">
                                                           <span>{{trans($message)}}</span>
                                                       </div>
                                                       @enderror
                                                   </div>
                                               @elseif($v->type == "file")
                                                   <div class="form-group">
                                                       <label>{{trans($v->field_level)}} @if($v->validation == 'required')
                                                               <span class="text-danger">*</span>  @endif </label>

                                                       <div class="fileinput fileinput-new " data-provides="fileinput">
                                                           <div class="fileinput-new thumbnail "
                                                                data-trigger="fileinput">
                                                               <img class="w-150px "
                                                                    src="{{ getFile(config('location.default')) }}"
                                                                    alt="...">
                                                           </div>
                                                           <div
                                                               class="fileinput-preview fileinput-exists thumbnail wh-200-150 "></div>

                                                           <div class="img-input-div">
                                                                        <span class="btn btn-success btn-file">
                                                                            <span
                                                                                class="fileinput-new "> @lang('Select') {{$v->field_level}}</span>
                                                                            <span
                                                                                class="fileinput-exists"> @lang('Change')</span>
                                                                            <input type="file" name="{{$k}}" value="{{ old($k) }}" accept="image/*"
                                                                                   @if($v->validation == "required") required @endif>
                                                                        </span>
                                                               <a href="#" class="btn btn-danger fileinput-exists"
                                                                  data-dismiss="fileinput"> @lang('Remove')</a>
                                                           </div>

                                                       </div>

                                                       @error($k)
                                                       <div class="text-danger ">
                                                           <span>{{trans($message)}}</span>
                                                       </div>
                                                       @enderror
                                                   </div>
                                               @endif

                                           @endforeach
                                       @endif
                                       
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="first_name">{{trans('First Name')}}</label>
                                            <input type="text" class="form-control" id="recipient_name" name="recipient_name"
                                                   value="{{old('recipient_name',$sendMoney->recipient_name)}}">
                                            @error('first_name')
                                            <div class="error-massage-alt text-danger">
                                                <span>{{trans($message)}}</span>
                                            </div>
                                            @enderror
                                        </div>
                                        <div class="form-group col-md-6 ">
                                            <label for="last_name">{{trans('Last Name')}}</label>
                                            <input type="text" class="form-control" id="last_name" name="last_name"
                                                   value="{{old('last_name',$sendMoney->last_name)}}">
                                            @error('last_name')
                                            <div class="error-massage-alt text-danger">
                                                <span>{{trans($message)}}</span>
                                            </div>
                                            @enderror
                                        </div>
                                    </div>


                                       @php
                                           $myCollection = collect(config('country'))->map(function($row) {
                                               return collect($row);
                                           });
                                           $countries = $myCollection->sortBy('code');
                                       @endphp


                                       <div class="form-group">
                                           <label for="recipient_contact_no">{{trans('Recipient Contact No.')}}</label>
                                           <div class="input-group  mb-3">
                                               
                                               <input type="text" class="form-control dialcode-set" aria-label="Large" aria-describedby="inputGroup-sizing-lg" id="recipient_contact_no" name="recipient_contact_no" value="{{old('recipient_contact_no',$sendMoney->recipient_country_code.$sendMoney->recipient_contact_no)}}">
                                           </div>

                                           @error('recipient_contact_no')
                                           <div class="error-massage-alt text-danger">
                                               <span>{{trans($message)}}</span>
                                           </div>
                                           @enderror
                                       </div>
									   <input type="hidden" name="recipient_country_code" id="recipient_country_code" value="{{old('recipient_country_code', $sendMoney->recipient_country_code)}}">

                                       <div class="form-group">
                                           <label for="recipient_email">{{trans('Recipient Email Address')}}</label>
                                           <input type="email" id="recipient_email" name="recipient_email" class="form-control" value="{{old('recipient_email', $sendMoney->recipient_email)}}">
                                           @error('recipient_email')
                                           <div class="error-massage-alt text-danger">
                                               <span>{{trans($message)}}</span>
                                           </div>
                                           @enderror
                                       </div>
                                       <div class="row">
                                    <div class="form-group col-md-12">
                                        <label for="recipient_address">{{trans('Address')}}</label>
                                        <input type="text" id="recipient_address" class="form-control" name="recipient_address"
                                               value="{{old('recipient_address',$sendMoney->recipient_address)}}">
                                        @error('recipient_address')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="recipient_city">{{trans('Town/City')}}</label>
                                        <input type="text" id="recipient_city" class="form-control" name="recipient_city"
                                               value="{{old('recipient_city',$sendMoney->recipient_city)}}">
                                        @error('recipient_city')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="recipient_pcode">{{trans('Postal Code')}}</label>
                                        <input type="text" id="recipient_pcode" class="form-control" name="recipient_pcode"
                                               value="{{old('recipient_pcode',$sendMoney->recipient_pcode)}}">
                                        @error('recipient_pcode')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    
                                </div>
                                <input type="hidden" name="recipient_id" value="{{old('recipient_id',$sendMoney->recipient_id)}}">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="recipient_state">{{trans('State')}}</label>
                                        <input type="text" id="recipient_state" class="form-control" name="recipient_state"
                                               value="{{old('recipient_state',$sendMoney->recipient_state)}}">
                                        @error('recipient_state')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="recipient_country">{{trans('Country')}}</label>
                                        <input type="text" id="recipient_country" class="form-control" name="recipient_country"
                                               value="{{old('recipient_country',$sendMoney->recipient_country)}}">
                                        @error('recipient_country')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    
                                </div>
                                       <div class="form-group">
                                           <div class="reason-for-snding">
                                               <label for="select-reason">{{trans('Source Of Fund')}} <span
                                                       class="text-danger">*</span></label>

                                               <select id="select-reason" name="fund_source" class="form-control">
                                                   <option selected disabled>{{trans('Select One')}}</option>
                                                   @foreach($sourceFunds as $item)
                                                       <option value="{{$item->title}}" {{ old('fund_source', $sendMoney->fund_source) == $item->title ? 'selected' : '' }}>{{$item->title}}</option>
                                                   @endforeach
                                               </select>

                                               @error('fund_source')
                                               <div class="error-massage-alt text-danger">
                                                   <span>{{trans($message)}}</span>
                                               </div>
                                               @enderror
                                           </div>
                                       </div>
                                       <div class="form-group">
                                           <div class="select-bank">
                                               <label for="select-service">{{trans('Sending Purpose')}} <span
                                                       class="text-danger">*</span></label>
                                               <select name="purpose" id="select-service" class="form-control">
                                                   <option selected disabled>{{trans('Select One')}}</option>
                                                   @foreach($sendingPurpose as $item)
                                                       <option value="{{$item->title}}" {{ old('purpose', $sendMoney->purpose) == $item->title ? 'selected' : '' }}>{{$item->title}}</option>
                                                   @endforeach
                                               </select>
                                               @error('purpose')
                                               <div class="error-massage-alt text-danger">
                                                   <span>{{trans($message)}}</span>
                                               </div>
                                               @enderror
                                           </div>
                                       </div>
                                   </div>
                               </div>
                            </div>
                            

                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif


                            <div class="col-md-12">
                                <div class="card-body">
                                    <h4 class="card-title">{{trans('Select Payment Method')}}</h4>
                                    <div class="form-check form-check-inline">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="customControlValidation2" name="payment_type" value="fund">
                                            <label class="custom-control-label" for="customControlValidation2">{{trans(' Account Funds')}}</label>
                                        </div>
                                    </div>

                                    <div class="form-check form-check-inline">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" class="custom-control-input" id="customControlValidation3" name="payment_type"  value="online">
                                            <label class="custom-control-label" for="customControlValidation3">{{trans('Online Payment')}}</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary w-100">{{trans('Submit')}}</button>
                            </div>

                        </div>


                    </div>
                </div>



            </form>
        </div>

@endsection


@push('css-lib')
    <link rel="stylesheet" href="{{asset($themeTrue.'css/bootstrap-fileinput.css')}}" />
    <link rel="stylesheet" href="{{asset($themeTrue.'css/intlTelInput.css')}}" />
    <style type="text/css">
    	.iti--allow-dropdown {
    width: 100% !important;
}
    </style>
@endpush

@push('extra-js')
    <script src="{{asset($themeTrue.'js/bootstrap-fileinput.js')}}"></script>
    <script src="{{asset($themeTrue.'js/intlTelInput.js')}}"></script>
@endpush

@push('script')
    <script>
        "use strict";
        $(document).ready(function () {
            /*setDialCode();
            $(document).on('change', '.dialCode-change', function () {
                setDialCode();
            });

            function setDialCode() {
                let currency = $('.dialCode-change').val();
                $('.dialcode-set').val(currency);
            }*/
        });
        
var inputphone = document.querySelector("#recipient_contact_no");
var inputphone2 = document.querySelector("#sender_phone");
    
   var iti = window.intlTelInput(inputphone, {
   	separateDialCode: true,
   		preferredCountries : ["de"],
  utilsScript: "{{asset($themeTrue.'js/utils.js')}}",
}); 

inputphone2.addEventListener("countrychange", function(e,countryData) {
	var country_code = iti.getSelectedCountryData().dialCode;
	$('#sender_country_code').val('+'+country_code)
  //var SelectedCountry = $(this).intlTelInput("getSelectedCountryData");
    //            console.log(SelectedCountry );
  // do something with iti.getSelectedCountryData()
});

var iti2 = window.intlTelInput(inputphone2, {
   	separateDialCode: true,
   		preferredCountries : ["de"],
  utilsScript: "{{asset($themeTrue.'js/utils.js')}}",
});

inputphone.addEventListener("countrychange", function(e,countryData) {
	var country_code = iti.getSelectedCountryData().dialCode;
	$('#recipient_country_code').val('+'+country_code)
  //var SelectedCountry = $(this).intlTelInput("getSelectedCountryData");
    //            console.log(SelectedCountry );
  // do something with iti.getSelectedCountryData()
});
    </script>

@endpush
