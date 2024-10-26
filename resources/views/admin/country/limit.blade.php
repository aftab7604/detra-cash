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

                    <form>
                        @foreach ($services as $data)

                            <?php 
                                $limitData =  collect($country->limit)->first(fn ($item, int $key) => $item->id == $data->id );
                            ?>

                            <div class="row facilities-data" data-facility='@json($data)' >
                                <div class="col-12">
                                    <h4 class="text-dark">{{ $data->name }}</h4>
                                </div>

                                <div class="form-group col-md-3 col-6">
                                    <label>{{trans('Minimum Amount Send')}}</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control"
                                            name="minimum_amount"
                                            value="{{old('minimum_amount',getAmount($limitData !== null ? $limitData->minimum_amount : 0))}}"
                                        >
                                        <div class="input-group-append">
                                            <div class="input-group-text set-currency">
                                                {{ old('code',$country->code) }}
                                            </div>
                                        </div>
                                    </div>
                                    @error('minimum_amount')
                                    <span class="text-danger">{{ trans($message)  }}</span>
                                    @enderror
                                </div>

                                <div class="form-group col-md-3 col-6">
                                    <label>{{trans('Daily Limit')}}</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control"
                                            name="daily_limit"
                                            value="{{old('daily_limit',getAmount($limitData !== null ? $limitData->daily_limit : 0))}}"
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
                                            value="{{old('monthly_limit',getAmount($limitData !== null ? $limitData->monthly_limit : 0))}}"
                                        >
                                    </div>
                                    @error('monthly_limit')
                                    <span class="text-danger">{{ trans($message)  }}</span>
                                    @enderror
                                </div>

                                <div class="form-group col-md-3 col-6">
                                    <label>{{trans('Yearly Limit')}}</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control"
                                            name="yearly_limit"
                                            value="{{old('yearly_limit',getAmount($limitData !== null ? $limitData->yearly_limit : 0))}}"
                                        >
                                        <div class="input-group-append">
                                            <div class="input-group-text set-currency">
                                                {{ old('code',$country->code) }}
                                            </div>
                                        </div>
                                    </div>
                                    @error('yearly_limit')
                                    <span class="text-danger">{{ trans($message)  }}</span>
                                    @enderror
                                </div>

                            </div>

                        @endforeach

                        <button id="submit_limit_data" class="btn btn-primary btn-block mt-3">@lang('Save Changes')</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection




@push('style-lib')
    <link href="{{ asset('assets/admin/css/bootstrap-iconpicker.min.css') }}" rel="stylesheet" type="text/css">
@endpush


@push('js')
    <script>
        "use strict";
        $(document).ready(function (e) {


            $("#submit_limit_data").click((e) => {
                e.preventDefault();
                const limitData = [];
                const facilities = $(".facilities-data");
                for(const item of facilities) {
                    const object = JSON.parse($(item).attr('data-facility'))
                    const minimumLimit = item.querySelector('[name="minimum_amount"]')
                    const dailyLimit = item.querySelector('[name="daily_limit"]')
                    const monthlyLimit = item.querySelector('[name="monthly_limit"]')
                    const yearlyLimit = item.querySelector('[name="yearly_limit"]')

                    object['minimum_amount'] = $(minimumLimit).val()
                    object['daily_limit'] = $(dailyLimit).val()
                    object['monthly_limit'] = $(monthlyLimit).val()
                    object['yearly_limit'] = $(yearlyLimit).val()

                    limitData.push(object)
                    
                }

                $.post({
                    type: "POST",
                    url: "{{route('admin.country.limit.update',$country)}}",
                    // The key needs to match your method's input parameter (case-sensitive).
                    data: JSON.stringify(limitData),
                    headers:{'X-CSRF-Token': '{{ csrf_token() }}'},
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(data){
                        if(data.success) {
                            location.href = "{{ route('admin.country') }}";
                        }
                    },
                    error: function(errMsg) {
                        alert(errMsg);
                    }
                });
            })


        });
    </script>
@endpush
