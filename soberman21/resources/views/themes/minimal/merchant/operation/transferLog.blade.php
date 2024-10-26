@extends($theme.'layouts.merchant')
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
                            <th scope="col">@lang('Invoice')</th>
                            <th scope="col">@lang('Recipient')</th>
                            <th scope="col">@lang('Send Amount')</th>
                            <th scope="col">@lang('Send At')</th>
                            <th scope="col">@lang('Receive Amount')</th>
                            <th scope="col">@lang('Receive At')</th>
                            <th scope="col" class="text-center">@lang('Rate')</th>
                            <th scope="col">@lang('Status')</th>
                            <th scope="col">@lang('Action')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse($sendMoneys as $k => $data)
                            <tr>
                                <td data-label="@lang('SL')">{{loopIndex($sendMoneys) + $k}}</td>
                                <td data-label="@lang('Invoice')">{{$data->invoice}}</td>
                                <td data-label="@lang('Recipient')">{{($data->recipient_name) ??'N/A'}}</td>
                                <td data-label="@lang('Send Amount')"
                                    class="font-weight-bold">{{getAmount($data->totalPay, config('basic.fraction_number'))}} @lang($data->send_curr)</td>
                                <td data-label="@lang('Send At')">{{($data->paid_at)? dateTime($data->paid_at) : 'N/A'}}</td>
                                <td data-label="@lang('Receive Amount')"
                                    class="font-weight-bold">{{getAmount($data->recipient_get_amount, config('basic.fraction_number'))}} @lang($data->receive_curr)</td>
                                <td data-label="@lang('Receive At')">{{($data->received_at)? dateTime($data->received_at) : 'N/A'}}</td>
                                <td data-label="@lang('Rate')"
                                    class="font-weight-bold">{{trans('1')}} {{$data->send_curr}} <i
                                        class="fa fa-exchange-alt text-info"></i> {{getAmount($data->rate, config('basic.fraction_number'))}} @lang($data->receive_curr)
                                </td>
                                
                                <td data-label="@lang('Status')">
                                    @if($data->status == 0 && $data->payment_status == 0)
                                        <span
                                            class="badge badge-warning badge-pill">{{trans('Information Need')}}</span>
                                    @elseif($data->status == 2 && $data->payment_status == 0)
                                        <span class="badge badge-info badge-pill">{{trans('Please Pay')}}</span>
                                    @elseif($data->status == 3 || $data->payment_status == 2)
                                        <span class="badge badge-danger badge-pill">{{trans('Cancelled')}}</span>
                                    @elseif($data->status == 1 && $data->payment_status == 1)
                                        <span class="badge badge-success badge-pill">{{trans('Completed')}}</span>
                                    @elseif($data->status == 2 && $data->payment_status == 1)
                                        <span class="badge badge-warning badge-pill">{{trans('Processing')}}</span>
                                    @elseif($data->status == 2 && $data->payment_status == 3)
                                        <span class="badge badge-dark badge-pill">{{trans('Payment Hold')}}</span>
                                    @endif
                                </td>
                                    

                                <td data-label="@lang('Action')">

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
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="100%">@lang('No Data Found')</td>
                            </tr>
                        @endforelse

                        </tbody>
                    </table>
                </div>
                {{ $sendMoneys->appends($_GET)->links($theme.'partials.pagination') }}
            </div>
        </div>
    </div>



    <!-- The Modal -->
    <div class="modal fade" id="deleteTrx">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="" class="deleteTrxAction" enctype="multipart/form-data">
                    @csrf
                    <!-- Modal Header -->
                    <div class="modal-header modal-colored-header bg-primary">
                        <h4 class="modal-title">@lang('Delete Confirmation')</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <p>@lang('Are you sure to delete this?')</p>
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

@push('script')
    <script>
        "use strict";
        $(document).on('click', '.deleteTrx', function () {
            var route = $(this).data('route');
            $('.deleteTrxAction').attr('action', route)
        });
    </script>
@endpush
