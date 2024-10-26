@extends($theme.'layouts.user')
@section('title')
    {{ 'Pay with '.optional($order->gateway)->name ?? '' }}
@endsection

@section('content')
    @push('style')
        <link href="{{ asset('assets/admin/css/card-js.min.css') }}" rel="stylesheet" type="text/css"/>
        <style>
            .card-js .icon {
                top: 5px;
            }
            .card-js input,
            .card-js input:hover,
            .card-js input:focus,
            .card-js input,
            .card-js select{
                color: #000;
                background-color: #f8f8f8;
            }
            .card-js .form-control{
                border: 1px solid #fff;
            }
            .card-js .card-number-wrapper, .card-js .cvc-wrapper, .card-js .expiry-wrapper, .card-js .name-wrapper{
                box-shadow: none;
            }
        </style>
    @endpush



    <section id="add-recipient-form" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="card secbg">
                        <div class="card-body ">
                        @if($order && isset($order->gateway->supported_currency))
                                <div class="row mb-4">
                                    <div class="col-md-12 text-center">
                                        <div class="form-group input-box search-currency-dropdown">
                                            <label for="from_wallet" class="mb-3">@lang('Select Bank Currency')</label>
                                            <select  id="currency-selector" name="currency_code"
                                                    class="form-control form-control-lg transfer-currency"
                                                    required>
                                                <option value="" disabled=""
                                                        selected="">@lang('Select Currency')</option>
                                                @foreach(json_decode($order->gateway->supported_currency) as $singleCurrency)
                                                    <option
                                                        value="{{$singleCurrency}}"
                                                        @foreach(json_decode($order->gateway->convert_rate) as $key => $rate)
                                                            @if($singleCurrency == $key) data-rate="{{$rate}}" @endif
                                                        @endforeach {{old('transfer_name') == $singleCurrency ?'selected':''}}>{{$singleCurrency}}</option>
                                                @endforeach
                                            </select>
                                            @error('currency_code')
                                            <span class="text-danger">{{$message}}</span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            @endif
                            <div id="showInfo" class="text-center"></div>
                            <input type="hidden" value="{{getAmount($order->final_amount, config('basic.fraction_number'))}}" id="sendamount">
                                <input type="hidden" value="{{ $order->gateway_currency }}" id="sendcurrency">

                                <h5 class="my-4 text-center">@lang('Please Pay') <span id="finalaamounttopay">{{getAmount($order->final_amount, config('basic.fraction_number'))}} {{trans($order->gateway_currency)}} </span> @lang('To Get') {{getAmount($order->sendmoney->recipient_get_amount, config('basic.fraction_number'))}}  {{trans($order->sendmoney->receive_curr)}}</h5>
                            <div class="row justify-content-center align-items-center">
                                <div class="col-md-3">
                                        <img  src="{{getFile(config('location.gateway.path').optional($order->gateway)->image)}}"
                                            class=" img-thumbnail mx-auto d-block mb-3 mb-md-0" alt="..">
                                </div>

                                <div class="col-md-9">
                                    <h4 class="text-center mb-3">@lang('Your Card Information')</h4>
                                    <form class="form-horizontal" action="{{ route('ipn', [optional($order->gateway)->code ?? '', $order->transaction]) }}" method="post">
                                        <div class="card-js form-group--payment-card">

                                            <input class="card-number form-control mb-3"
                                                   name="card_number"
                                                   placeholder="@lang('Card Number')"
                                                   autocomplete="off"
                                                   required>

                                            <input class="name form-control mb-3"
                                                   id="the-card-name-id"
                                                   name="card_name"
                                                   placeholder="@lang('Name On Your Card')"
                                                   autocomplete="off"
                                                   required>
                                            <input class="expiry form-control mb-3"
                                                   autocomplete="off"
                                                   required>
                                            <input class="expiry-month" name="expiry_month">
                                            <input class="expiry-year" name="expiry_year">
                                            <input class="cvc form-control mb-3"
                                                   name="card_cvc"
                                                   autocomplete="off"
                                                   required>
                                        </div>

                                        <button type="submit" class="btn btn-info btn-lg w-100">@lang('Submit')</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    @push('script')

    <script type="text/javascript">
        var payAmount = $('#sendamount').val();
        console.log(payAmount)
        var baseCurrency = "EUR"

        $(document).on("change", ".transfer-currency", function () {
            let currencyCode = $(this).val();
            let rate = $(this).find(':selected').data('rate');
            let getAmount = parseFloat(rate) * parseFloat(payAmount);
            var output = null;
            $('#showInfo').html('');
            output = `<p>@lang('Exchange rate:') <span
                        class="text-danger">1 ${baseCurrency} = ${rate} ${currencyCode}</span></p>
                    `

            $('#showInfo').html(output);
            $('#finalaamounttopay').html(`<span class="text-danger">${getAmount} ${currencyCode}</span>`)
            $('#sendamount').val(getAmount)
            $('#sendcurrency').val(currencyCode)
        })


        $(document).on("change", ".transfer-currency", function () {
            currencyCode = $(this).val();
            $('.dynamic-bank').addClass('d-none');
        })
    </script>
        <script src="{{ asset('assets/admin/js/card-js.min.js') }}"></script>
    @endpush

@endsection
