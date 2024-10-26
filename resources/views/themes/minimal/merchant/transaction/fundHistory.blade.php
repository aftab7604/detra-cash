@extends($theme.'layouts.merchant')
@section('title',trans('Payment History'))
@section('content')
    <div class="page-header card card-primary m-0 m-md-4 my-4 m-md-0 p-5 shadow">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                 <form action="{{ route('user.fund-history.search') }}" method="get">
                    <div class="row justify-content-between align-items-center mt-3">
                        <div class="col-md-3">
                            <div class="form-group">
                                <input type="text" name="name" value="{{@request()->name}}"
                                       class="form-control "
                                       placeholder="@lang('Type Here')">
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <select name="status" class="form-control ">
                                    <option value="1"
                                            @if(@request()->status == '1') selected @endif>@lang('Complete Payment')</option>
                                    <option value="2"
                                            @if(@request()->status == '2') selected @endif>@lang('Pending Payment')</option>
                                    <option value="3"
                                            @if(@request()->status == '3') selected @endif>@lang('Cancel Payment')</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <input type="date" class="form-control " name="date_time"
                                       id="datepicker"/>
                            </div>
                        </div>


                        <div class="col-md-3">
                            <div class="form-group">
                                <button type="submit" class="btn btn-info  btn-block ">
                                    <i class="fa fa-search"></i> @lang('Search')</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table  table-striped table-bordered text-center" id="service-table">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">@lang('SL')</th>
                        <th scope="col">@lang('Gateway')</th>
                        <th scope="col">@lang('Transaction ID')</th>
                        <th scope="col">@lang('Amount')</th>
                        <th scope="col">@lang('Charge')</th>
                        <th scope="col">@lang('Status')</th>
                        <th scope="col">@lang('Time')</th>
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($funds as $k => $data)
                        <tr>
                            <td data-label="@lang('SL')">{{loopIndex($funds)+ $loop->index}}</td>
                            <td data-label="@lang('Gateway')">@lang(optional($data->gateway)->name)</td>
                            <td data-label="#@lang('Transaction ID')">{{$data->transaction}}</td>
                            <td data-label="@lang('Amount')">
                                <strong>{{getAmount($data->amount,config('basic.fraction_number'))}} @lang($basic->currency)</strong>
                            </td>
                            <td data-label="@lang('Charge')">
                                                <span
                                                    class="text-dark">{{getAmount($data->charge, config('basic.fraction_number'))}} @lang($basic->currency)</span>
                            </td>

                            <td data-label="@lang('Status')">

                                @if($data->status == 1)
                                    <span class="badge badge-success badge-pill">@lang('Complete')</span>
                                @elseif($data->status == 2)
                                    <span class="badge badge-warning badge-pill">@lang('Pending')</span>
                                @elseif($data->status == 3)
                                    <span class="badge badge-danger badge-pill">@lang('Cancel')</span>
                                @endif
                            </td>

                            <td data-label="@lang('Time')">
                                {{ dateTime($data->created_at, 'd M Y h:i A') }}
                            </td>
                        </tr>
                    @empty

                        <tr class="text-center">
                            <td colspan="100%">{{__('No Data Found!')}}</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
            {{ $funds->appends($_GET)->links($theme.'partials.pagination') }}
        </div>
    </div>

@endsection



