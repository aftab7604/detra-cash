@extends($theme.'layouts.user')
@section('title')
    {{ 'Pay with '.optional($order->gateway)->name ?? '' }}
@endsection

@section('content')


    <section id="add-recipient-form" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
        <div class="container">
            <div>
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
                                            @if($order->gateway->convert_rate)
                                                @foreach(json_decode($order->gateway->convert_rate) as $key => $rate)
                                                    @if($singleCurrency == $key) data-rate="{{$rate}}" @endif
                                                @endforeach {{old('transfer_name') == $singleCurrency ?'selected':''}}>{{$singleCurrency}}</option>
                                            @endif
                                    @endforeach
                                </select>
                                @error('currency_code')
                                <span class="text-danger">{{$message}}</span>
                                @enderror
                            </div>
                        </div>
                    </div>
                @endif
                <div id="showInfo"></div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-10">

                    <div class="card secbg ">
                        <div class="card-body d-flex flex-wrap text-center align-items-center">
                            <div>
                                <img
                                    src="{{getFile(config('location.gateway.path').optional($order->gateway)->image)}}"
                                    class=" img-thumbnail mx-auto w-75" alt="..">
                            </div>
                            <div>
                            <input type="hidden" value="{{getAmount($order->final_amount, config('basic.fraction_number'))}}" id="sendamount">
                            <input type="hidden" value="{{ $order->gateway_currency }}" id="sendcurrency">
                            <h5 class="my-4 ">@lang('Please Pay') <span id="finalaamounttopay">{{getAmount($order->final_amount, config('basic.fraction_number'))}} {{trans($order->gateway_currency)}} </span> @lang('To Get') {{getAmount($order->sendmoney->recipient_get_amount, config('basic.fraction_number'))}}  {{trans($order->sendmoney->receive_curr)}}</h5>
                                <button type="button" class="btn btn-info btn-lg  mt-2" id="btn-confirm"
                                        onClick="payWithRave()">@lang('Pay Now')</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    @push('script')
        <script src="https://api.ravepay.co/flwv3-pug/getpaidx/api/flwpbf-inline.js"></script>
        <script>
            var btn = document.querySelector("#btn-confirm");
            btn.setAttribute("type", "button");
            const API_publicKey = "{{$data->API_publicKey ?? ''}}";

            function payWithRave() {
                var x = getpaidSetup({
                    PBFPubKey: API_publicKey,
                    customer_email: "{{$data->customer_email ?? 'example@example.com'}}",
                    amount: $('#sendamount').val(),
                    customer_phone: "{{ $data->customer_phone ?? '0123' }}",
                    currency:  $('#sendcurrency').val(),
                    txref: "{{ $data->txref ?? '' }}",
                    onclose: function () {
                    },
                    callback: function (response) {
                        let txref = response.tx.txRef;
                        let status = response.tx.status;
                        window.location = '{{ url('payment/flutterwave') }}/' + txref + '/' + status;
                    }
                });
            }

            var payAmount = $('#sendamount').val();
            var baseCurrency = "EUR"

            $(document).on("change", ".transfer-currency", function () {
                let currencyCode = $(this).val();
                let rate = $(this).find(':selected').data('rate');
                let getAmount = parseFloat(rate) * parseFloat(payAmount);
                console.log(rate)
                console.log(payAmount)
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
        </script>
    @endpush
@endsection
