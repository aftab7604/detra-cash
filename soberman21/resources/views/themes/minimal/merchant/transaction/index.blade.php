@extends($theme.'layouts.merchant')
@section('title', trans('Transaction'))
@section('content')

    <div class="page-header card card-primary m-0 m-md-4 my-4 m-md-0 p-5 shadow">
        <div class="row justify-content-between">
            <div class="col-lg-12">
                <form action="{{route('user.transaction.search')}}" method="get">
                    <div class="row justify-content-between">
                        <div class="col-md-3">
                            <div class="form-group">
                                <input type="text" name="transaction_id"
                                       value="{{@request()->transaction_id}}"
                                       class="form-control "
                                       placeholder="@lang('Search for Transaction ID')">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <input type="text" name="remark" value="{{@request()->remark}}"
                                       class="form-control "
                                       placeholder="@lang('Remark')">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <input type="date" class="form-control " name="datetrx" id="datepicker"/>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <button type="submit" class="btn btn-info  btn-block">
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
                <table class="categories-show-table table table-hover table-striped table-bordered">
                    <thead class="thead-primary">
                    <tr>
                        <th>@lang('SL No.')</th>
                        <th>@lang('Transaction ID')</th>
                        <th>@lang('Amount')</th>
                        <th>@lang('Charge')</th>
                        <th class="column-remark">@lang('Remark')</th>
                        <th>@lang('Time')</th>
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($transactions as $transaction)
                        <tr>
                            <td data-label="@lang('SL No.')">{{loopIndex($transactions) + $loop->index}}</td>
                            <td data-label="@lang('Transaction ID')">@lang($transaction->trx_id)</td>
                            <td data-label="@lang('Amount')">
                                    <span
                                        class="font-weight-bold text-{{($transaction->trx_type == "+") ? 'success': 'danger'}}"> {{trans(config('basic.currency_symbol'))}} {{getAmount($transaction->amount, config('basic.fraction_number'))}}</span>
                            </td>

                            <td data-label="@lang('Charge')">
                                    <span
                                        class="font-weight-bold ">{{trans(config('basic.currency_symbol'))}} {{getAmount($transaction->charge, config('basic.fraction_number'))}} </span>
                            </td>
                            <td data-label="@lang('Remark')"> @lang($transaction->remarks)</td>
                            <td data-label="@lang('Time')">
                                {{ dateTime($transaction->created_at, 'd M Y h:i A') }}
                            </td>
                        </tr>
                    @empty

                        <tr class="text-center">
                            <td colspan="100%">{{trans('No Data Found!')}}</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
            {{ $transactions->appends($_GET)->links($theme.'partials.pagination') }}
        </div>
    </div>

@endsection
