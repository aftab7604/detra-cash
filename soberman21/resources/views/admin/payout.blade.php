@extends('admin.layouts.app')
@section('title')
    @lang($page_title)
@endsection
@section('content')
<div class="page-header card card-primary m-0 m-md-4 my-4 m-md-0 p-5 shadow">
    <form action="{{ route('admin.payout.History') }}" method="get">
        <div class="row justify-content-between align-items-center">
            <div class="col-md-4">
                <div class="form-group">
                    <input type="text" name="name" value="{{@request()->name}}" class="form-control"
                            placeholder="@lang('Search by Trx Number or User\'s name')">
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    <select name="status" class="form-control">
                        <option value="">@lang('All Payment')</option>
                        <option value="1" @if(@request()->status == '2') selected @endif>@lang('Complete Payment')</option>
                        <option value="2" @if(@request()->status == '1') selected @endif>@lang('Pending Payment')  </option>
                        <option value="3"@if(@request()->status == '3') selected @endif>@lang('Cancel Payment')</option>
                    </select>
                </div>
            </div>

            <div class="col-md-3">
                <div class="form-group">
                    <input type="date" class="form-control" name="date_time" id="datepicker"/>
                </div>
            </div>

            <div class="col-md-2">
                <div class="form-group">
                    <button type="submit" class="btn waves-effect waves-light btn-primary"><i
                            class="fas fa-search"></i> @lang('Search')</button>
                </div>
            </div>
        </div>
    </form>
</div>
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
                        @forelse($items as $k => $data)
                            <tr>
                                <td data-label="@lang('SL')">{{loopIndex($items) + $k}}</td>
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

                                    <a href="{{route('admin.money-transfer.details',$data)}}"  class="btn btn-primary ml-1 mb-1"
                                       title="{{trans('Details')}}"><i class="fa fa-info-circle"> </i>
                                    </a>


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
                {{ $items->appends($_GET)->links($theme.'partials.pagination') }}
            </div>
        </div>
    </div>




    <!-- Modal for Edit button -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Payout Information')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <form role="form" method="POST" class="actionRoute" action="" enctype="multipart/form-data">
                    @csrf
                    @method('put')
                    <div class="modal-body">
                        <ul class="list-group withdraw-detail">
                        </ul>

                        @if(Request::routeIs('admin.payout-request'))
                            <div class="form-group addForm mt-3">

                            </div>
                        @endif

                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')
                        </button>
                        @if(Request::routeIs('admin.payout-request'))
                            <input type="hidden" class="action_id" name="id">
                            <button type="submit" class="btn btn-primary" name="status"
                                    value="2">@lang('Approve')</button>
                            <button type="submit" class="btn btn-danger" name="status"
                                    value="3">@lang('Reject')</button>
                        @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script>
        "use strict";
        $(document).on("click", '.edit_button', function (e) {
            var id = $(this).data('id');
            $(".action_id").val(id);
            var currencyCode = $(this).data('currency')
            $(".actionRoute").attr('action', $(this).data('route'));
            var details = Object.entries($(this).data('info'));
            var list = [];
            var ImgPath = "{{asset(config('location.withdrawLog.path'))}}";
            details.map(function (item, i) {
                if (item[1].type == 'file') {
                    var singleInfo = `<br><img src="${ImgPath}/${item[1].field_name}" alt="..." class="w-50">`;
                } else {
                    var singleInfo = `<span class="font-weight-bold ml-3">${item[1].fieldValue}</span>  `;
                }
                list[i] = ` <li class="list-group-item"><span class="font-weight-bold text-capitalize"> ${item[0].replace('_', " ")} </span> : ${singleInfo}</li>`
            });


            if ($(this).data('status') != '1') {
                list[details.length + 1] = `<li class="list-group-item"><span class="font-weight-bold">@lang('Admin Feedback')</span> : <span">${$(this).data('feedback')}</span></li>`;
                $('.addForm').html(``)
            } else {
                list[details.length + 1] = ``;
                $('.addForm').html(`
                        <div class="form-group">
                        <label for="feedback">@lang('feedback')</label>
                        <textarea class="form-control" name="feedback"></textarea>
                        </div>
                `);
            }

            $('.withdraw-detail').html(list);
        });


        $(document).ready(function () {
            $('select').select2({
                selectOnClose: true
            });
        });
    </script>
@endpush

