@extends($theme.'layouts.user')
@section('title',trans($page_title))
@section('content')

    <style>
        .input-group-lg > .form-control {
            padding: 15px 15px;
            font-size: 1.25rem;
            line-height: 1.5;
            border-radius: 0.3rem;
        }


    </style>
    <section id="add-recipient-form" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
        <div class="container">

            <form action="{{route('user.sendMoney.formData',$sendMoney->invoice)}}" method="post"
                  enctype="multipart/form-data">
                @csrf
                @method('patch')
                <div class="row  flex-column-reverse flex-lg-row">

                    <div class="col-lg-7 ">
                        <div class="add-recipient-form-wrapper">
                            <div class="add-recipient-form error">
                                <div class="content-title row">
                                    <div class="col-md-6">
                                    	 <h5>{{trans('Add Recipient')}}</h5>
                                    </div>
                                    <div class="col-md-6 text-right">
                                    	<a href="javascript:void(0)" class="btn btn-primary open_recipient_form">@lang('Select From My Recipients')</a>
                                    </div>
                                   
                                </div>

                                @if($sendMoney->service_id != 5)
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="first_name">{{trans('First Name')}}</label>
                                            <input type="text" id="recipient_name" name="first_name"
                                                   value="{{old('recipient_name',$sendMoney->first_name)}}">
                                            @error('first_name')
                                            <div class="error-massage-alt text-danger">
                                                <span>{{trans($message)}}</span>
                                            </div>
                                            @enderror
                                        </div>
                                        <div class="form-group col-md-6 ">
                                            <label for="last_name">{{trans('Last Name')}}</label>
                                            <input type="text" id="last_name" name="last_name"
                                                   value="{{old('last_name',$sendMoney->last_name)}}">
                                            @error('last_name')
                                            <div class="error-massage-alt text-danger">
                                                <span>{{trans($message)}}</span>
                                            </div>
                                            @enderror
                                        </div>
                                    </div>
                                @endif


                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="recipient_country">{{trans('Country')}}</label>
                                        <select name="recipient_country" id="recipient_country" class="form-control form-control-lg" style="border-color: var(--brand-color); height: 50px;">
                                            @foreach($countries as $item)
                                                @if($item['name'] == $receive_country['name'])
                                                    <option value="{{$item['iso_code']}}" selected>{{$item['name']}}</option>
                                                @else
                                                <option value="{{$item['iso_code']}}">{{$item['name']}}</option>
                                                @endif
                                            @endforeach
                                        </select>
                                        @error('recipient_country')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="recipient_contact_no">{{trans('Recipient Contact No.')}}</label>
                                        <div class="input-group input-group-lg mb-3">
                                            
                                            <input type="text" class="form-control form-control-lg dialcode-set"
                                                   aria-label="Large" aria-describedby="inputGroup-sizing-lg"
                                                   id="recipient_contact_no" name="recipient_contact_no"
                                                   value="">
    
                                        </div>
                                        <input type="hidden" name="country_code" id="country_code" value="{{old('recipient_contact_no',$sendMoney->recipient_country_code)}}">
                                        @error('recipient_contact_no')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="recipient_email">{{trans('Recipient Email Address')}}</label>
                                    <input type="email" id="recipient_email" name="recipient_email"
                                           value="{{old('recipient_email',$sendMoney->recipient_email)}}">
                                    @error('recipient_email')
                                    <div class="error-massage-alt text-danger">
                                        <span>{{trans($message)}}</span>
                                    </div>
                                    @enderror
                                </div>
                                 
                                
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label for="recipient_address">{{trans('Address')}}</label>
                                        <input type="text" id="recipient_address" name="recipient_address"
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
                                        <input type="text" id="recipient_city" name="recipient_city"
                                               value="{{old('recipient_city',$sendMoney->recipient_city)}}">
                                        @error('recipient_city')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="recipient_pcode">{{trans('Postal Code')}}</label>
                                        <input type="text" id="recipient_pcode" name="recipient_pcode"
                                               value="{{old('recipient_pcode',$sendMoney->recipient_pcode)}}">
                                        @error('recipient_pcode')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    
                                </div>

                                <input type="hidden" name="recipient_id" id="recipient_id" value="{{old('recipient_id',$sendMoney->recipient_id)}}">
                                
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="recipient_state">{{trans('State')}}</label>
                                        <input type="text" id="recipient_state" name="recipient_state"
                                               value="{{old('recipient_state',$sendMoney->recipient_state)}}">
                                        @error('recipient_state')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    
                                </div>

                                @if(optional($sendMoney->provider)->services_form)
                                    <div class="row">
                                        @foreach(optional($sendMoney->provider)->services_form as $k => $v)
                                            @if($v->type == "text")
                                                @if($k == 'AccountNumber' && in_array($sendMoney->receive_curr, array_keys(config('flutterwave'))))

                                                    <div class="form-group col-md-12">
                                                        <label
                                                            for="{{$k}}">{{trans($v->field_level)}} @if($v->validation == 'required')
                                                                <span
                                                                    class="text-danger">*</span>
                                                            @endif </label>
                                                        <div class="input-group input-group-lg mb-3">
                                                            <input type="text" class="form-control form-control-lg"
                                                                   name="{{$k}}" value="{{old($k)}}" id="{{$k}}">
                                                            <div class="input-group-append">
                                                                <button class="btn btn-success checkAccount"
                                                                        data-bank_code="{{optional($sendMoney->provider)->bank_code}}"
                                                                        type="button">
                                                                    <i class="fa fa-check-circle"></i> {{trans('Verify Account')}}
                                                                </button>
                                                            </div>
                                                        </div>
                                                        @error($k)
                                                        <div class="error-massage-alt text-danger">
                                                            <span>{{trans($message)}}</span>
                                                        </div>
                                                        @enderror
                                                    </div>


                                                @else
                                                    <div class="form-group col-md-6">
                                                        <label
                                                            for="{{$k}}">{{trans($v->field_level)}} @if($v->validation == 'required')
                                                                <span
                                                                    class="text-danger">*</span>
                                                            @endif </label>
                                                        <input type="text" name="{{$k}}" value="{{old($k)}}"
                                                               id="{{$k}}">

                                                        @error($k)
                                                        <div class="error-massage-alt ">
                                                            <span>{{trans($message)}}</span>
                                                        </div>
                                                        @enderror
                                                    </div>

                                                @endif

                                            @elseif($v->type == "textarea")
                                                <div class="form-group col-md-12">
                                                    <label
                                                        for="{{$k}}">{{trans($v->field_level)}} @if($v->validation == 'required')
                                                            <span
                                                                class="text-danger">*</span>
                                                        @endif </label>
                                                    <textarea name="{{$k}}" id="{{$k}}" class="form-control" rows="5"
                                                              placeholder="{{trans('Type Here')}}">{{old($k)}}</textarea>
                                                    @error($k)
                                                    <div class="error-massage-alt ">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            @elseif($v->type == "file")
                                                <div class="form-group col-md-12">
                                                    <label>{{trans($v->field_level)}} @if($v->validation == 'required')
                                                            <span class="text-danger">*</span>
                                                        @endif </label>

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
                                                                    <input type="file" name="{{$k}}"
                                                                           value="{{ old($k) }}" accept="image/*"
                                                                           @if($v->validation == "required") required @endif>
                                                                </span>
                                                            <a href="#" class="btn btn-danger fileinput-exists"
                                                               data-dismiss="fileinput"> @lang('Remove')</a>
                                                        </div>

                                                    </div>

                                                    @error($k)
                                                    <div class="error-massage-alt ">
                                                        <span>{{trans($message)}}</span>
                                                    </div>
                                                    @enderror
                                                </div>
                                            @endif

                                        @endforeach
                                    </div>
                                @endif

                                <!-- service info -->
                                <div class="row">
                                
                                    @foreach ($serviceinfo as $f)
                                    @php
                                        $code = session()->get('trans');
                                        $language = \App\Models\Language::where('short_name', $code)->first();
                                        $language_id = $language->id;

                                        $ab = \App\Models\Serviceinfo::where('language_id',$language_id)->where('parent_id',$f->id)->first();
                                    @endphp
                                        @if(isset($f->type) && $f->type==3)
                                        <div class="form-group col-md-6">
                                            <label>@if(isset($ab->name)){{ $ab->name }}@else {{ $f->name }} @endif <span>( {{ $country_serivce->name }} )</span></label>
                                            <div class="input-group input-group-lg mb-3">
                                                <input type="text" serviceinfo="{{ $f->name }}" class="form-control form-control-lg dialcode-set"
                                                    aria-label="Large" aria-describedby="inputGroup-sizing-lg"
                                                    id="recipient_mobile_no" name="serviceinfo[]"
                                                    value="" require>
                                            </div>
                                        </div>
                                        @else
                                        <div class="form-group col-md-6">
                                            <label>@if(isset($ab->name)) {{ $ab->name }} @else {{ $f->name }} @endif <span>( {{ $country_serivce->name }} )</span></label>
                                            <input type="text" serviceinfo="{{ $f->name }}" name="serviceinfo[]"
                                                value="{{old('recipient_state',$sendMoney->recipient_state)}}" require>
                                            @error('recipient_state')
                                            <div class="error-massage-alt text-danger">
                                                <span>{{trans($message)}}</span>
                                            </div>
                                            @enderror
                                        </div>
                                        @endif
                                    @endforeach
                                </div>
                               
                                <div class="form-group">
                                    <div class="reason-for-sending">
                                        <label for="select-reason">{{trans('Source Of Fund')}} <span
                                                class="text-danger">*</span></label>

                                        <select id="select-reason" name="fund_source" class="form-control form-control-lg dialcode-set">
                                            <option selected disabled>{{trans('Select One')}}</option>
                                            @foreach($sourceFunds as $item)
                                                <option
                                                    value="{{$item->title}}" {{ old('fund_source', $sendMoney->fund_source) == $item->title ? 'selected' : '' }}>{{$item->title}}</option>
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
                                        <select name="purpose" id="select-service" class="form-control form-control-lg dialcode-set">
                                            <option selected disabled>{{trans('Select One')}}</option>
                                            @foreach($sendingPurpose as $item)
                                                <option
                                                    value="{{$item->title}}" {{ old('purpose', $sendMoney->purpose) == $item->title ? 'selected' : '' }}>{{$item->title}}</option>
                                            @endforeach
                                        </select>
                                        @error('purpose')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="continue-button large-button">
                                    <button type="submit">{{trans('Continue')}}</button>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-5 ">
                        <div class=" overview mb-4">
                            <div class="overview-list">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="content-title">
                                        <h5>{{optional($sendMoney->service)->name}}</h5>
                                    </div>
                                    <div class="transection-between">
                                        {{trans($sendMoney->send_curr)}} - {{trans($sendMoney->receive_curr)}}
                                    </div>
                                </div>
                                <ul class="overview-inner">
                                    <li class="overview-item">
                                        <span>{{trans('Send Amount')}}</span>
                                        <span>{{getAmount($sendMoney->send_amount)}} {{trans($sendMoney->send_curr)}} </span>
                                    </li>
                                    <li class="overview-item">
                                        <span>{{trans('Fees')}}</span>
                                        <span> {{getAmount($sendMoney->fees)}} {{trans($sendMoney->send_curr)}}</span>
                                    </li>
                                    <li class="overview-item">
                                        <span>{{trans('Exchange rate')}}</span>
                                        <span>{{trans('1')}} {{trans($sendMoney->send_curr)}}  <i
                                                class="fa fa-exchange-alt"></i> {{getAmount($sendMoney->rate,config('basic.fraction_number'))}} {{trans($sendMoney->receive_curr)}} </span>
                                    </li>
                                </ul>

                                @if($sendMoney->promo_code!=NULL)
                                    <div class="overview-item total-pay">
                                        {{ trans('discount') }}
                                        <span>{{getAmount(-$sendMoney->discount,config('basic.fraction_number'))}} {{trans($sendMoney->send_curr)}} </span>
                                    </div>
                                @endif

                                <div class="overview-item total-pay">
                                    <span>{{trans('You pay in total')}}</span>
                                    <span>{{getAmount($sendMoney->send_amount-$sendMoney->discount,config('basic.fraction_number'))}} {{trans($sendMoney->send_curr)}} </span>
                                </div>

                                <div class="overview-item total-pay">
                                    <span>{{trans('Your recipient gets')}}</span>
                                    <span>{{getAmount($sendMoney->recipient_get_amount,config('basic.fraction_number'))}} {{trans($sendMoney->receive_curr)}} </span>
                                </div>


                                <div class="get-promo d-none">
                                    <div class="check-input">
                                        <label for="s1">{{trans('Get a promo code?')}}</label>
                                        <input id="s1" name="isPromo" type="checkbox" class="switch">
                                    </div>
                                    <div class="promo-input ">
                                        <div class="get-promo-form d-flex justify-content-between">
                                            <input type="text" id="promo" name="promo_code"
                                                   placeholder="Enter Promo Code"
                                                   autocomplete="off">
                                            <button class="apply-btn d-none">{{trans('Apply')}}</button>
                                        </div>

                                        @error('promo_code')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans('Invalid promo code')}}</span>
                                        </div>
                                        @enderror

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

            </form>
        </div>
    </section>'
<div id="RecipentmyModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        
        <h4 class="modal-title">@lang('My Recipients')</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
        <table class="table  table-striped table-bordered text-center" id="service-table">
            <thead>
            <tr>
                <th scope="col">@lang('SL')</th>
                <th scope="col">@lang('Name')</th>
                <th scope="col">@lang('Email')</th>
                <th scope="col">@lang('Contact No')</th>
            </tr>
            </thead>
            <tbody class="my_recipients">
            </tbody>
        </table>    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<link rel="stylesheet" href="{{asset($themeTrue.'css/intlTelInput.css')}}">
<script src="{{asset($themeTrue.'js/intlTelInput.js')}}"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.12/js/intlTelInput.min.js"></script>
<script>
    $(document).ready(function () {
        var inputCountry = document.querySelector("#recipient_country");
        var inputPhone = document.querySelector("#recipient_contact_no");
        var inputPhone1 = document.querySelector("#recipient_mobile_no");
        

        var iti = window.intlTelInput(inputPhone, {
            separateDialCode: true,
            preferredCountries: ["de"],
            utilsScript: "{{asset($themeTrue.'js/utils.js')}}",
            // utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.12/js/utils.js,
        });

        if(inputPhone1)
        {
            var iti1 = window.intlTelInput(inputPhone1, {
                separateDialCode: true,
                preferredCountries: ["de"],
                utilsScript: "{{asset($themeTrue.'js/utils.js')}}",
                // utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.12/js/utils.js,
            });
        }
        // Listen for the country change event on the country select element
        $(inputCountry).change(function () {
            var selectedCountry = $(this).val();
            iti.setCountry(selectedCountry); // Set the selected country in the phone input
            $("#country_code").val(iti.getSelectedCountryData().dialCode)
            if(iti1){
                iti1.setCountry(selectedCountry); // Set the selected country in the phone input
            }
        });

        // Initialize the selected country
        var selectedCountry = $(inputCountry).val();
        iti.setCountry(selectedCountry); // Set the selected country in the phone input initially
        $("#country_code").val(iti.getSelectedCountryData().dialCode)
        if(iti1){
            iti1.setCountry(selectedCountry); // Set the selected country in the phone input initially
        }
       
    });
</script>
@endsection


@push('css-lib')
    <link rel="stylesheet" href="{{asset($themeTrue.'css/bootstrap-fileinput.css')}}">
    <link rel="stylesheet" href="{{asset($themeTrue.'css/intlTelInput.css')}}">
@endpush

@push('extra-js')
    <script src="{{asset($themeTrue.'js/bootstrap-fileinput.js')}}"></script>
    <script src="{{asset($themeTrue.'js/intlTelInput.js')}}"></script>
         

@endpush

@push('script')

     <script>
        
        $(document).ready(function () {
            let recid = sessionStorage.getItem("recid");
            if(recid){
                var abc = this;
                $.ajax({
                    url: "{{route('user.ajaxgetRecipient')}}",
                    type: "post",
                    data: {id:recid,single:1},
                    dataType:'json',
                    success: function (res) {
                        if(res){
                            var info = JSON.parse(res.service_info)
                            info.forEach(d=>{
                                var d = $(`input[serviceinfo="${d.name}"]`).val(d.value)
                            })
                            $('#recipient_name').val(res.first_name);
                            $('#last_name').val(res.last_name);
                            $('#recipient_contact_no').val(res.phone);
                            $('#country_code').val(res.country_code);
                            $('#recipient_email').val(res.email);
                            $('#recipient_address').val(res.address);
                            $('#recipient_city').val(res.city);
                            $('#recipient_pcode').val(res.postalcode);
                            $('#recipient_state').val(res.state);
                            $("#recipient_country").val(res.country_code).change();
                            $('#recipient_id').val(res.recipient_id);
                        }
                    }
                });
            }
        })
     </script>

    <script>
        'use strict';
        $(document).ready(function () {
        	localStorage.setItem('country_service','');
      
            $(document).on('click','.select_recipient',function(){
                var recipient_id 	= $(this).attr('data-id');
                var abc = this;
                $.ajax({
                    url: "{{route('user.ajaxgetRecipient')}}",
                    type: "post",
                    data: {id:recipient_id,single:1},
                    dataType:'json',
                    success: function (res) {
                        if(res){
                            var info = JSON.parse(res.service_info)
                            info.forEach(d=>{
                                var d = $(`input[serviceinfo="${d.name}"]`).val(d.value)
                            })
                        }
                    }
                });



                var first_name 		= $(this).attr('data-firstname');
                var last_name 		= $(this).attr('data-lastname');
                var phone 			= $(this).attr('data-phone');
                var country_code 	= $(this).attr('data-countrycode');
                var email 			= $(this).attr('data-email');
                var address 		= $(this).attr('data-address');
                var city 			= $(this).attr('data-city');
                var postalcode 		= $(this).attr('data-postalcode');
                var state 			= $(this).attr('data-state');
                var country 		= $(this).attr('data-country');
               

                $('#recipient_name').val(first_name);
                $('#last_name').val(last_name);
                $('#recipient_contact_no').val(phone);
                $('#country_code').val(country_code);
                $('#recipient_email').val(email);
                $('#recipient_address').val(address);
                $('#recipient_city').val(city);
                $('#recipient_pcode').val(postalcode);
                $('#recipient_state').val(state);
                $("#recipient_country").val(country_code).change();
                $('#recipient_id').val(recipient_id);
                $('#RecipentmyModal').modal('hide');
            })
        
        	
        	
            $('input[name=isPromo]').change(function () {
                $('.promo-input').removeClass('show');
                if (this.checked) {
                    $('.promo-input').addClass('show');
                } else {
                    $('.promo-input').removeClass('show');
                }
            });
        });
    </script>



    <script>
        "use strict";
        $(document).ready(function () {

            $('.checkAccount').on('click', function () {
                var bank_code = $(this).data('bank_code');
                if (bank_code == '') {
                    Notiflix.Notify.Warning("Authority didn't add Bank Code");
                    return 0;
                }
                var account_number = $("input[name=AccountNumber]").val();
                if (6 > account_number.length) {
                    Notiflix.Notify.Warning("Please enter full account number");
                    return 0;
                }

                $.ajax({
                    url: "{{route('ajaxCheckAccount')}}",
                    type: "post",
                    data: {
                        bank_code,
                        account_number,
                    },
                    success: function (res) {

                        if (res.status == 'success') {
                            $("input[name=BeneficiaryName]").val(res.data.account_name);
                            Notiflix.Notify.Success("" + res.message);
                            return 0;
                        }
                        if (res.status == 'error') {
                            $("input[name=BeneficiaryName]").val(``);
                            Notiflix.Notify.Failure("" + res.message);
                        }

                    }
                });
            });


        });
        
        
        $(document).on('click','.open_recipient_form',function(){
			var select_recipient = "{{trans('Select Recipient')}}"
        	$.ajax({
                url: "{{route('user.ajaxgetRecipient')}}",
                type: "post",
                data: {id:1},
                dataType:'json',
                success: function (res) {
                    if(res.success)
                    {
                        var html = '';
                        $.each(res.recipient,function(index,value){
                            html += '<tr><td><a href="javascript:void(0)" class="btn btn-primary select_recipient" data-firstname="'+value.first_name+'" data-lastname="'+value.last_name+'" data-phone="'+value.phone+'" data-countrycode="'+value.country_code+'" data-email="'+value.email+'" data-address="'+value.address+'" data-country="'+value.country+'" data-city="'+value.city+'" data-postalcode="'+value.postal_code+'" data-state="'+value.state+'" data-id="'+value.id+'">'+select_recipient+'</a></td><td>'+value.recipient_name+'</td><td>'+value.email+'</td><td>'+value.country_code+value.phone+'</td></tr>';
                        })
                        $('.my_recipients').html(html);
                        $('#RecipentmyModal').modal('show');
                    }else
                    {
                        Notiflix.Notify.Failure("No Recipient Found");
                    }
                    

                }
            });
        })
        
        
        
    </script>

@endpush

@push('style')
@endpush
