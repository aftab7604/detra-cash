@extends('admin.layouts.app')

@section('title')
    @lang('profile')
@endsection


@section('content')
<style>
    .iti{
        display: block !important;
    }
</style>

<div class="container-fluid">

    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title mb-3"><i class="icon-user"></i> @lang('Profile Setting')</h4>
                    <form action="" method="post" class="form-body file-upload" enctype="multipart/form-data">
                        @csrf
                        @method('put')
                        <div class="form-row justify-content-between">
                            <div class="col-md-6 col-lg-6 col-xl-4">
                                <div class="image-input ">
                                    <label for="image-upload" id="image-label"><i class="fas fa-upload"></i></label>
                                    <input type="file" name="image" placeholder="@lang('Choose image')" id="image">
                                    <img id="image_preview_container" class="preview-image" src="{{ getFile(config('location.admin.path').$admin->image) }}"
                                         alt="preview image">
                                </div>
                                @error('image')
                                <span class="text-danger">{{ trans($message) }}</span>
                                @enderror
                            </div>

                            <div class="col-md-6 col-lg-6 col-xl-8">

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>@lang('Name') <span class="text-danger">*</span></label>
                                            <input type="text" name="name" class="form-control form-control-lg" value="{{$admin->name}}" placeholder="@lang('Enter Name')">

                                            @error('name')
                                            <span class="text-danger">{{ trans($message) }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>@lang('Username') <span class="text-danger">*</span></label>
                                            <input type="text" name="username" class="form-control" value="{{$admin->username}}" placeholder="@lang('Enter Username')">

                                            @error('username')
                                            <span class="text-danger">{{ trans($message) }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>@lang('Email Address') <span class="text-danger">*</span></label>
                                            <input type="text" name="email" class="form-control" value="{{$admin->email}}" placeholder="@lang('Enter Email Address')">


                                            @error('email')
                                            <span class="text-danger">{{ trans($message) }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>@lang('Phone Number') <span class="text-danger">*</span></label>
                                            <input type="hidden" class="phone_code" name="phone_code" value="+49">
                                            {{-- <input type="text" name="phone" class="form-control phone" value="{{$admin->phone}}" placeholder="@lang('Enter Phone Number')"> --}}
                                            <input class="form-control dialcode-set phone" aria-describedby="inputGroup-sizing-lg" name="phone"  
                                            placeholder="@lang('Enter Phone Number')" value="{{$admin->phone}}"
                                            required>
                                            @error('phone')
                                            <span class="text-danger">{{ trans($message) }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label>@lang('Address') <span class="text-muted text-sm">({{trans('optional')}})</span></label>
                                            <textarea name="address" class="form-control" rows="3" placeholder="@lang('Your Address')">{{$admin->address}}</textarea>

                                            @error('address')
                                            <span class="text-danger">{{ trans($message) }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="text-right">
                                            <button type="submit" class="btn btn-rounded btn-primary btn-block mt-3">{{trans('Submit')}}</button>
                                        </div>
                                    </div>
                                </div>


                            </div>



                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>







@endsection

@push('js')

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