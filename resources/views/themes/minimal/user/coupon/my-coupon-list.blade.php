
@extends($theme.'layouts.user')
@section('title',trans($page_title))
@section('content')
    <div class="page-header card card-primary m-0 m-md-4 my-4 m-md-0 p-5 shadow">
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table  table-striped table-bordered text-center" id="service-table">
                        <thead>
                        <tr>
                            <th scope="col">@lang('SL')</th>
                            <th scope="col">@lang('Coupon Code')</th>
                            <th scope="col">@lang('Discount')</th>
                            <th scope="col">@lang('Usage')</th>
                            <th scope="col">@lang('Expiry Date')</th>
                            <th scope="col">@lang('Valid for Next Use')</th>
                            <th scope="col">@lang('Usage History')</th>
                            {{-- <th scope="col">@lang('Action')</th> --}}
                        </tr>
                        </thead>
                        <tbody>
                        @forelse($userCoupons as $k=>$data)
                            <tr>
                                <td data-label="@lang('SL')">{{ 1 + $k}}</td>
                                <td data-label="@lang('Coupon Code')">{{$data->coupon->code}}</td>
                                <td data-label="@lang('Discount')">{{$data->coupon->discount_value}} ({{$data->coupon->discount_type}})</td>
                                <td data-label="@lang('Usage')">{{$data->used_count}} / {{$data->coupon->usage_limit ?? 'Unlimited'}}</td>
                                <td data-label="@lang('Expiry Date')">{{$data->coupon->expiry_date ?? 'No expiry'}}</td>
                                
                                <td data-label="@lang('Valid for Next Use')">
                                    @if($data->is_valid)
                                        <span class="badge badge-info badge-pill">{{trans('Yes')}}</span>
                                    @else
                                        <span class="badge badge-danger badge-pill">{{trans('No')}}</span>
                                    @endif
                                </td>

                                <td data-label="@lang('Usage History')">
                                    @if ($data->usageLogs)
                                    @foreach ($data->usageLogs as $log)
                                    Used on Order #{{$log->order_id}} at {{$log->used_at}} <br>
                                    @endforeach                                        
                                    @else
                                        NA
                                    @endif
                                </td>
                                

                                {{-- <td data-label="@lang('Action')">

                                    <div class="dropdown show dropup">
                                        <a class="dropdown-toggle p-3" href="#" id="dropdownMenuLink" data-toggle="dropdown"
                                           aria-haspopup="true" aria-expanded="false">
                                            <i class="fa fa-ellipsis-v" aria-hidden="true"></i>
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                            @if($data->status == 0 && $data->payment_status == 0)
                                                <a class="dropdown-item" href="{{route('user.sendMoney.action',[$data,'fillup'])}}">
                                                    <i class="fa fa-edit text-warning pr-2"
                                                       aria-hidden="true"></i> {{trans('Fill Up Form')}}
                                                </a>

                                                <a class="dropdown-item deleteTrx" href="javascript:void(0)"
                                                   data-toggle="modal"
                                                   data-target="#deleteTrx"
                                                   data-route="{{route('user.transfer-log.delete',$data->id)}}">
                                                    <i class="fa fa-trash-alt text-danger pr-2"
                                                       aria-hidden="true"></i> @lang('Delete')
                                                </a>


                                            @elseif($data->status == 2 && $data->payment_status == 0)
                                                <a class="dropdown-item" href="{{route('user.sendMoney.action',[$data,'payment'])}}">
                                                    <i class="fa fa-hand-holding-usd text-success pr-2"
                                                       aria-hidden="true"></i> {{trans('Pay Payment')}}
                                                </a>
                                                <a class="dropdown-item" href="{{route('user.sendMoney.action',[$data,'details'])}}">
                                                    <i class="fa fa-info-circle text-primary pr-2"
                                                       aria-hidden="true"></i> {{trans('Details')}}
                                                </a>

                                                <a class="dropdown-item deleteTrx" href="javascript:void(0)"
                                                   data-toggle="modal"
                                                   data-target="#deleteTrx"
                                                   data-route="{{route('user.transfer-log.delete',$data->id)}}">
                                                    <i class="fa fa-trash-alt text-danger pr-2"
                                                       aria-hidden="true"></i> @lang('Delete')
                                                </a>


                                            @elseif($data->status != 0)
                                                <a class="dropdown-item" href="{{route('user.sendMoney.action',[$data,'details'])}}">
                                                    <i class="fa fa-info-circle text-primary pr-2"
                                                       aria-hidden="true"></i> {{trans('Details')}}
                                                </a>

                                            @else
                                                -
                                            @endif


                                        </div>
                                    </div>
                                </td> --}}
                            </tr>
                        @empty
                            <tr>
                                <td colspan="100%">@lang('No Data Found')</td>
                            </tr>
                        @endforelse

                        </tbody>
                    </table>
                </div>
                {{-- {{ $sendMoneys->appends($_GET)->links($theme.'partials.pagination') }} --}}
            </div>
        </div>
    </div>

@endsection