@extends($theme.'layouts.merchant')
@section('title',trans('Payment Method'))
@section('content')
    <div class="container-fluid">
        <div class="row justify-content-center">
            @foreach($gateways as $key => $gateway)
                <div class="col-xl-2 col-lg-3 col-md-4  col-sm-6 col-6">
                    <div class="card shadow gateway text-center mb-3 overview-list ">
                        <div class="card-body p-4">

                            <img src="{{ getFile(config('location.gateway.path').$gateway->image)}}"
                                 alt="{{$gateway->name}}" class="gateway w-100">

                            <button type="button"
                                    data-id="{{$gateway->id}}"
                                    data-name="{{$gateway->name}}"
                                    data-currency="{{$gateway->currency}}"
                                    data-gateway="{{$gateway->code}}"
                                    data-min_amount="{{getAmount($gateway->min_amount, $basic->fraction_number)}}"
                                    data-max_amount="{{getAmount($gateway->max_amount,$basic->fraction_number)}}"
                                    data-percent_charge="{{getAmount($gateway->percentage_charge,$basic->fraction_number)}}"
                                    data-fix_charge="{{getAmount($gateway->fixed_charge, $basic->fraction_number)}}"
                                    class="btn btn-primary w-100 addFund lh-25 mt-2"
                                    data-backdrop='static' data-keyboard='false'
                                    data-toggle="modal"
                                    data-target="#addFundModal">@lang('Withdrow Now')</button>
                        </div>


                    </div>

                </div>
            @endforeach
        </div>
    </div>





    @push('loadModal')
    <form action="{{route('user.withdrowdada')}}" method="post">
        @csrf
        <div id="addFundModal" class="modal  fade addFundModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-keyboard="false"
             data-backdrop="static">
            <div class="modal-dialog" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title method-name"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="white-text">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body ">
                        <div class="payment-form ">
                            <p class="text-danger depositLimit"></p>
                            <p class="text-danger depositCharge"></p>
                            <input type="hidden" class="gateway" name="gateway" value="">

                            <div class="form-group">
                                <label>Select Wallet</label>
                                <div class="input-group">
                                    <select name="wallet_type" class="form-control">
                                        <option value="balance" class="text-dark">Deposit Balance - {{ Auth::user()->balance }} EUR</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>@lang('Amount')</label>
                                <div class="input-group">
                                    <input type="text" class="amount form-control form-control-lg" name="amount" value="{{old('amount')}}">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-dark text-white show-currency"></span>
                                    </div>
                                </div>
                                <pre class="text-danger errors text-start ps-5"></pre>
                            </div>
                        </div>
                        <div class="payment-info text-center ">
                            <img id="loading" src="{{asset('assets/admin/images/loading.gif')}}" alt="..."
                                 class="w-25"/>
                        </div>
                    </div>
                    <div class="modal-footer border-top-0">
                        <div class="continue-button large-button w-100">
                            <button type="submit" class="btn btn-primary checkCalc w-100 lh-35">@lang('Next')<i
                                    class="la la-arrow-right"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    @endpush


@endsection




@push('script')

    <script>
        $('#loading').hide();
        "use strict";
        var id, minAmount, maxAmount, baseSymbol, fixCharge, percentCharge, currency, amount, gateway;
        $('.addFund').on('click', function () {
            id = $(this).data('id');
            gateway = $(this).data('gateway');
            minAmount = $(this).data('min_amount');
            maxAmount = $(this).data('max_amount');
            baseSymbol = "{{config('basic.currency_symbol')}}";
            fixCharge = $(this).data('fix_charge');
            percentCharge = $(this).data('percent_charge');
            currency = $(this).data('currency');
            $('.depositLimit').text(`@lang('Transaction Limit') : ${minAmount} - ${maxAmount}  ${baseSymbol}`);

            var depositCharge = `@lang('Charge') : ${fixCharge} ${baseSymbol}  ${(0 < percentCharge) ? ' + ' + percentCharge + ' % ' : ''}`;
            $('.depositCharge').text(depositCharge);

            $('.method-name').text(`@lang('Payment By') ${$(this).data('name')} - ${currency}`);
            $('.show-currency').text("{{config('basic.currency')}}");
            $('.gateway').val(id);

            // amount
        });

        $('.close').on('click', function (e) {
            $('#loading').hide();
            $('.payment-form').removeClass('d-none');
            $('.checkCalc').closest('.modal-footer').removeClass('d-none');
            $('.payment-info').html(``)
            $('.amount').val(``);
            $("#addFundModal").modal("hide");
        });

    </script>
@endpush

