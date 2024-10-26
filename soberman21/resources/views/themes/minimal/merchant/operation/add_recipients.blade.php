@extends($theme.'layouts.merchant')
@section('title',trans($page_title))
@section('content')

    <section id="add-recipient-form" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
    	<div class="container">
    	<form action="{{route('user.recipients.add_recipients')}}" method="post"
                  enctype="multipart/form-data">
                @csrf
                @method('patch')
                <div class="row  flex-column-reverse flex-lg-row">
                	<div class="col-lg-12 ">
                		<div class="add-recipient-form-wrapper">
                            <div class="add-recipient-form error">
                                <div class="content-title">
                                    <h5>{{trans('Add Recipient')}}</h5>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="first_name">{{trans('First Name')}}</label>
                                        <input type="text" id="recipient_name" name="first_name"
                                               value="{{old('recipient_name')}}">
                                        @error('first_name')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col-md-6 ">
                                        <label for="last_name">{{trans('Last Name')}}</label>
                                        <input type="text" id="last_name" name="last_name"
                                               value="{{old('last_name')}}">
                                        @error('last_name')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="row">
                                	<div class="col-12">
                                		<div class="form-group">
		                                    <label for="recipient_contact_no">{{trans('Recipient Contact No.')}}</label>
		                                     
		                                        <input type="text" class="form-control form-control-lg dialcode-set"
		                                               aria-label="Large" aria-describedby="inputGroup-sizing-lg"
		                                               id="recipient_contact_no" name="recipient_contact_no"
		                                               value="{{old('recipient_contact_no')}}">

		                                    

		                                    @error('recipient_contact_no')
		                                    <div class="error-massage-alt text-danger">
		                                        <span>{{trans($message)}}</span>
		                                    </div>
		                                    @enderror
		                                </div>
                                	</div>
                                	<input type="hidden" name="country_code" id="country_code" value="{{old('country_code','+49')}}">
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="recipient_address">{{trans('Address')}}</label>
                                        <input type="text" id="recipient_address" name="recipient_address"
                                               value="{{old('recipient_address')}}">
                                        @error('recipient_address')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    <div class="col-md-6">
                                		<div class="form-group">
		                                    <label for="recipient_email">{{trans('Recipient Email Address')}}</label>
		                                    <input type="email" id="recipient_email" name="recipient_email"
		                                           value="{{old('recipient_email')}}">
		                                    @error('recipient_email')
		                                    <div class="error-massage-alt text-danger">
		                                        <span>{{trans($message)}}</span>
		                                    </div>
		                                    @enderror
		                                </div>
                                	</div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="recipient_city">{{trans('Town/City')}}</label>
                                        <input type="text" id="recipient_city" name="recipient_city"
                                               value="{{old('recipient_city')}}">
                                        @error('recipient_city')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="recipient_pcode">{{trans('Postal Code')}}</label>
                                        <input type="text" id="recipient_pcode" name="recipient_pcode"
                                               value="{{old('recipient_pcode')}}">
                                        @error('recipient_pcode')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="recipient_state">{{trans('State')}}</label>
                                        <input type="text" id="recipient_state" name="recipient_state"
                                               value="{{old('recipient_state')}}">
                                        @error('recipient_state')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="recipient_country">{{trans('Country')}}</label>
                                        <select name="recipient_country" id="recipient_country" class="form-control form-control-lg" style="border-color: var(--brand-color); height: 50px;">
                                            @foreach($countries as $item)
                                                @if($item['name'] == 'GERMANY')
                                                    <option value="{{$item['name']}}" selected>{{$item['name']}}</option>
                                                @else
                                                <option value="{{$item['name']}}">{{$item['name']}}</option>
                                                @endif
                                            @endforeach
                                        </select>
                                        @error('recipient_country')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>
                                    
                                </div>
                                <div class="row">
	                                <div class="col-md-4">
	                                	<div class="form-group">
	                                		<div class="continue-button large-button">
			                                    <button type="submit">{{trans('Submit')}}</button>
			                                </div>
	                                	</div>
	                                </div>
	                                
                                </div>
                            </div>
                        </div>        
                	</div>
                </div>
        </form>        
    	</div>
    </section>

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
        'use strict';
        $(document).ready(function () {
        	
        	var inputphone = document.querySelector("#recipient_contact_no");
    
			var iti = window.intlTelInput(inputphone, {
			   	separateDialCode: true,
			   	preferredCountries : ["de"],
			  utilsScript: "{{asset($themeTrue.'js/utils.js')}}",
			}); 

			inputphone.addEventListener("countrychange", function(e,countryData) {
				var country_code = iti.getSelectedCountryData().dialCode;
				$('#country_code').val('+'+country_code)
			});
		})
</script>        	
@endpush

@push('style')
@endpush