@extends('admin.layouts.app')
@section('title',trans($page_title))
@section('content')



    <div class="row">
        <div class="col-12">
            <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
                <div class="card-body">
                    <div class="media mb-4 justify-content-end">
                        <a href="{{route('admin.country')}}" class="btn btn-sm  btn-primary mr-2">
                            <span><i class="fas fa-eye"></i> @lang('Country List')</span>
                        </a>
                        <a href="{{ route('admin.country.service',$country) }}" class="btn btn-sm  btn-dark mr-2">
                            <span><i class="fa fa-life-ring"></i> @lang('Service')</span>
                        </a>
                    </div>

                    <form method="post" action="{{route('admin.country.update',$country)}}"
                          enctype="multipart/form-data">
                        @method('patch')
                        @csrf
                        <div class="row">
                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Continent')}}</label>
                                <select class="form-control  selectpicker currency-change"
                                        data-live-search="true" name="continent_id"
                                        required="">
                                    <option disabled selected>@lang("Select Continent")</option>
                                    @foreach($continents as $item)
                                        <option
                                            value="{{ $item->id }}" {{ old('continent_id',$country->continent_id) == $item->id ? 'selected' : '' }} >{{ $item->name }}</option>
                                    @endforeach
                                </select>


                                @error('continent_id')
                                <span class="text-danger d-block mt-3">{{ trans($message)  }}</span>
                                @enderror
                            </div>
							 @foreach($languages as $key => $language)
							@php $check_language = \App\Models\CountryLang::where(['language_id' => $language->id,'country_id'=> $country->id])->first();  @endphp
							
                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Country Name')}} {{$language->name}}</label>
                                <input type="text" class="form-control"
                                       name="name[{{$language->id}}]"
                                       value="{{ old('name',!empty($check_language) ? $check_language->name : $country->name) }}" >

                                @error('name')
                                <span class="text-danger">{{ trans($message)  }}</span>
                                @enderror
                            </div>
                            @endforeach


                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Country Code')}}</label>
                                <select class="form-control  selectpicker"
                                        data-live-search="true" name="iso_code"
                                        required="">
                                    <option disabled selected>@lang("Select ISO Code")</option>
                                    @foreach(config('country') as $item)
                                        <option
                                            value="{{$item['code']}}" {{ old('iso_code', $country->iso_code) == $item['code'] ? 'selected' : '' }} >{{ $item['name'] .'/'. $item['code'] }}</option>
                                    @endforeach
                                </select>
                                @error('continent_id')
                                <span class="text-danger d-block mt-3">{{ trans($message)  }}</span>
                                @enderror
                            </div>

                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Currency Code')}}</label>
                                <input type="text" class="form-control currency_code"
                                       name="code"
                                       value="{{ old('code',$country->code) }}" >

                                @error('code')
                                <span class="text-danger">{{ trans($message)  }}</span>
                                @enderror
                            </div>

                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Rate')}}</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                           {{trans('1')}} {{ trans('USD') }} =
                                        </div>
                                    </div>

                                    <input type="text" class="form-control"
                                           name="rate"
                                           value="{{old('rate',getAmount($country->rate))}}"
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


                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Minimum Amount Send')}}</label>
                                <div class="input-group">
                                    <input type="text" class="form-control"
                                           name="minimum_amount"
                                           value="{{old('minimum_amount',getAmount($country->minimum_amount))}}"
                                    >
                                    <div class="input-group-append">
                                        <div class="input-group-text set-currency">
                                        </div>
                                    </div>
                                </div>
                                @error('minimum_amount')
                                <span class="text-danger">{{ trans($message)  }}</span>
                                @enderror
                            </div>

                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Maximum Amount Send')}}</label>
                                <div class="input-group">
                                    <input type="text" class="form-control"
                                           name="maximum_amount"
                                           value="{{old('maximum_amount',getAmount($country->maximum_amount))}}"
                                    >
                                    <div class="input-group-append">
                                        <div class="input-group-text set-currency">
                                        </div>
                                    </div>
                                </div>
                                @error('maximum_amount')
                                <span class="text-danger">{{ trans($message)  }}</span>
                                @enderror
                            </div>

                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Per Transfer')}}</label>
                                <div class="input-group">
                                    <input type="text" class="form-control"
                                           name="per_transfer"
                                           value="{{old('per_transfer',getAmount($country->per_transfer))}}"
                                    >
                                </div>
                                @error('per_transfer')
                                <span class="text-danger">{{ trans($message)  }}</span>
                                @enderror
                            </div>

                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Daily Limit')}}</label>
                                <div class="input-group">
                                    <input type="text" class="form-control"
                                           name="daily_limit"
                                           value="{{old('daily_limit',getAmount($country->daily_limit))}}"
                                    >
                                </div>
                                @error('daily_limit')
                                <span class="text-danger">{{ trans($message)  }}</span>
                                @enderror
                            </div>

                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Monthly Limit')}}</label>
                                <div class="input-group">
                                    <input type="text" class="form-control"
                                           name="monthly_limit"
                                           value="{{old('monthly_limit',getAmount($country->monthly_limit))}}"
                                    >
                                </div>
                                @error('monthly_limit')
                                <span class="text-danger">{{ trans($message)  }}</span>
                                @enderror
                            </div>

                            <div class="form-group col-md-3 col-6">
                                <label>{{trans('Country Nubmer Code ')}}</label>
                                <div class="input-group">
                                    <input type="text" class="form-control"
                                           name="number_country_code"
                                           value="{{old('number_country_code',getAmount($country->number_country_code))}}"
                                    >
                                </div>
                                @error('monthly_limit')
                                <span class="text-danger">{{ trans($message)  }}</span>
                                @enderror
                            </div>


                            <div class="col-md-3 col-6">
                                <div class="form-group ">
                                    <label>@lang('Status')</label>
                                    <div class="custom-switch-btn">
                                        <input type='hidden' value='1' name='status'>
                                        <input type="checkbox" name="status" class="custom-switch-checkbox" id="status"
                                               value="0"  {{($country->status == 0) ? 'checked' : ''}}>
                                        <label class="custom-switch-checkbox-label" for="status">
                                            <span class="custom-switch-checkbox-inner"></span>
                                            <span class="custom-switch-checkbox-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-6">
                                <div class="form-group ">
                                    <label>@lang('Send From')</label>
                                    <div class="custom-switch-btn">
                                        <input type='hidden' value='1' name='send_from'>
                                        <input type="checkbox" name="send_from" class="custom-switch-checkbox" id="send_from"
                                               value="0" {{($country->send_from == 0) ? 'checked' : ''}}>
                                        <label class="custom-switch-checkbox-label" for="send_from">
                                            <span class="custom-switch-checkbox-inner"></span>
                                            <span class="custom-switch-checkbox-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-6">
                                <div class="form-group ">
                                    <label>@lang('Send To')</label>
                                    <div class="custom-switch-btn">
                                        <input type='hidden' value='1' name='send_to'>
                                        <input type="checkbox" name="send_to" class="custom-switch-checkbox" id="send_to"
                                               value="0" {{($country->send_to == 0) ? 'checked' : ''}}>
                                        <label class="custom-switch-checkbox-label" for="send_to">
                                            <span class="custom-switch-checkbox-inner"></span>
                                            <span class="custom-switch-checkbox-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-6 col-6">
                                <label>{{trans('Services')}}</label>

                                <select class="form-control form-control-lg  selectpicker service-change"
                                        data-live-search="true" name="facilities[]"
                                        required="" multiple="multiple">
                                    @foreach($services as $item)
                                        <option
                                            value="{{ $item->id }}" {{ (old('facilities') == $item->id || collect($country->facilities)->contains('id',$item->id) == true) ? 'selected' : '' }} >{{ $item->name }}</option>
                                    @endforeach
                                </select>

                                @error('facilities')
                                <span class="text-danger d-block mt-3">{{ trans($message)  }}</span>
                                @enderror
                            </div>
                            
                            <div class="form-group col-md-6 col-6">
                                <label>{{trans('Services Info')}}</label>

                                <select class="form-control form-control-lg  selectpicker service-change"
                                        data-live-search="true" name="serviceinfo[]"
                                       multiple="multiple">
                                    @foreach($servicesinfo as $item)
                                        <option value="{{ $item->id }}" {{ (old('serviceinfo') == $item->id || collect(json_decode($country->serviceinfo))->contains('id',$item->id) == true) ? 'selected' : '' }} >{{ $item->name }} ( {{ $item->service->name }} )</option>
                                    @endforeach
                                </select>

                                @error('serviceinfo')
                                <span class="text-danger d-block mt-3">{{ trans($message)  }}</span>
                                @enderror
                            </div>

                        </div>

                        <div class="row justify-content-between">
                            <div class="col-sm-6 col-md-3">
                                <div class="image-input ">
                                    <label for="image-upload" id="image-label"><i class="fas fa-upload"></i></label>
                                    <input type="file" name="image" placeholder="@lang('Choose image')" id="image">
                                    <img id="image_preview_container" class="preview-image"
                                         src="{{ getFile(config('location.country.path').$country->image)}}"
                                         alt="preview image">
                                </div>
                                @error('image')
                                <span class="text-danger">{{ trans($message) }}</span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mt-3">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="details">@lang('Details')</label>
                                    <textarea class="form-control  summernote @error('details') is-invalid @enderror"
                                              name="details">{{ old('details',$country->details) }}</textarea>


                                    @error('details')
                                    <span class="text-danger">{{ trans($message) }}</span>
                                    @enderror
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn  btn-primary btn-block mt-3">@lang('Save Changes')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection




@push('style-lib')
    <link rel="stylesheet" href="{{ asset('assets/admin/css/summernote.min.css')}}">

    <link href="{{ asset('assets/admin/css/bootstrap-iconpicker.min.css') }}" rel="stylesheet" type="text/css">
@endpush

@push('js-lib')
    <script src="{{ asset('assets/admin/js/summernote.min.js')}}"></script>
@endpush

@push('js')
    <script>
        "use strict";
        $(document).ready(function (e) {

            setCurrency();
            $(document).on('change', '.currency_code', function (){
                setCurrency();
            });

            $(document).on('change', '.service-change', function (d){
                var data = $(".service-change option:selected").text();
            });

            function setCurrency() {
                let currency = $('.currency_code').val();
                $('.set-currency').text(currency);
            }

            $('#image').change(function () {
                let reader = new FileReader();
                reader.onload = (e) => {
                    $('#image_preview_container').attr('src', e.target.result);
                }
                reader.readAsDataURL(this.files[0]);
            });

            $('.currency-change').select2({
                selectOnClose: true
            });
            $('select[name=iso_code]').select2({
                selectOnClose: true
            });

            $('.service-change').select2({
                selectOnClose: true
            });


            $('.summernote').summernote({
                focus: true,
                callbacks: {
                    onBlurCodeview: function() {
                        let codeviewHtml = $(this).siblings('div.note-editor').find('.note-codable').val();
                        $(this).val(codeviewHtml);
                    }
                }
            });

        });
    </script>
@endpush
