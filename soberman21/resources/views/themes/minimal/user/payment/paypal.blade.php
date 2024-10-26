@extends($theme.'layouts.user')
@section('title')
    {{ 'Pay with '.optional($order->gateway)->name ?? '' }}
@endsection
@section('content')

    <section id="add-recipient-form" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card secbg text-center">
                            @if($order && isset($order->gateway->supported_currency))
                                <div class="row mb-4">
                                    <div class="col-md-12">
                                        <div class="form-group input-box search-currency-dropdown">
                                            <label for="from_wallet " class="mb-2">@lang('Select Bank Currency')</label>
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
                        
                        <div class="card-body d-flex flex-wrap text-center align-items-center">
                            <div>
                                <img
                                    src="{{getFile(config('location.gateway.path').optional($order->gateway)->image)}}"
                                    class="img-thumbnail mx-auto w-75" alt="..">
                            </div>
                            <div>
                            <input type="hidden" value="{{getAmount($order->final_amount, config('basic.fraction_number'))}}" id="sendamount">
                            <input type="hidden" value="{{ $order->gateway_currency }}" id="sendcurrency">
                                <h5 class="my-4 ">@lang('Please Pay') <span id="finalaamounttopay">{{getAmount($order->final_amount, config('basic.fraction_number'))}} {{trans($order->gateway_currency)}} </span> @lang('To Get') {{getAmount($order->sendmoney->recipient_get_amount, config('basic.fraction_number'))}}  {{trans($order->sendmoney->receive_curr)}}</h5>

                                <div id="paypal-button-container" ></div>
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

            const selectedCurrency = event.target.value;
            const amount = getAmount;
            document.getElementById('paypal-button-container').innerHTML = ''; // Clear existing button
            loadPayPalScript(selectedCurrency, () => renderPayPalButton(selectedCurrency,amount));
        })


        $(document).on("change", ".transfer-currency", function () {
            currencyCode = $(this).val();
            $('.dynamic-bank').addClass('d-none');
        })
    </script>

    <script>
        var cid = "{{$data->cleint_id}}";
        // Function to load the PayPal SDK dynamically
        function loadPayPalScript(currency, callback) {
            const script = document.createElement('script');
            script.src = `https://www.paypal.com/sdk/js?client-id=${cid}&currency=${currency}`;
            script.onload = () => callback();
            document.head.appendChild(script);
        }

        // Function to render the PayPal button
        function renderPayPalButton(currency,amount) {
            paypal.Buttons({
                createOrder: function(data, actions) {
                    return actions.order.create({
                        purchase_units: [{
                            amount: {
                                currency_code: currency,
                                value: amount ? amount : $('#sendamount').val() // Replace with the actual amount
                            }
                        }]
                    });
                },
                onApprove: function(data, actions) {
                    return actions.order.capture().then(function(details) {
                        alert('Transaction completed by ' + details.payer.name.given_name);
                    });
                }
            }).render('#paypal-button-container');
        }

        // Initialize with default currency (USD)
        loadPayPalScript('EUR', () => renderPayPalButton('EUR'));

   
    </script>





<!--         
        <script src="https://www.paypal.com/sdk/js?client-id={{$data->cleint_id}}&currency={{$data->currency}}"></script>

        <script>
                
            paypal.Buttons({
                createOrder: function (data, actions) {
                    return actions.order.create({
                        purchase_units: [
                            {
                                description: "{{ $data->description }}",
                                custom_id: "{{ $data->custom_id }}",
                                amount: {
                                    value: $('#sendamount').val(),
                                    currency_code: $('#sendcurrency').val(),
                                    breakdown: {
                                        item_total: {
                                            value: $('#sendamount').val(),
                                            currency_code: $('#sendcurrency').val(),
                                        }
                                    }
                                }
                            }
                        ]
                    });
                },
                onApprove: function (data, actions) {
                    return actions.order.capture().then(function (details) {
                        var trx = "{{ $data->custom_id }}";
                        window.location = '{{ url('payment/paypal')}}/' + trx + '/' + details.id
                    });
                }
            }).render('#paypal-button-container');
        </script> -->
    @endpush
@endsection

