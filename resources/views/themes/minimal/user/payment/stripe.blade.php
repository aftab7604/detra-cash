@extends($theme.'layouts.user')
@section('title')
    {{ 'Pay with '.optional($order->gateway)->name ?? '' }}
@endsection


@section('content')

    <script src="https://js.stripe.com/v3/"></script>
    <style>
        .StripeElement {
            box-sizing: border-box;
            height: 40px;
            padding: 10px 12px;
            border: 1px solid transparent;
            border-radius: 4px;
            background-color: white;
            box-shadow: 0 1px 3px 0 #e6ebf1;
            -webkit-transition: box-shadow 150ms ease;
            transition: box-shadow 150ms ease;
        }

        .StripeElement--focus {
            box-shadow: 0 1px 3px 0 #cfd7df;
        }

        .StripeElement--invalid {
            border-color: #fa755a;
        }

        .StripeElement--webkit-autofill {
            background-color: #fefde5 !important;
        }

        .btn-info {
            color: #fff;
            background-color: #1fd3c6!important;
            border-color: #1fd3c6!important;
        }
    </style>


    <section id="add-recipient-form" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
        <div class="container">
            <div class="row justify-content-center ">
                <div class="col-md-10">
                    <div class="card secbg ">
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

                        <div class="card-body d-flex flex-wrap text-center align-items-center">
                            <div>
                                <img src="{{getFile(config('location.gateway.path').optional($order->gateway)->image)}}" class=" img-thumbnail mx-auto w-75" alt="..">
                            </div>

                            <div>
                                <input type="hidden" value="{{getAmount($order->final_amount, config('basic.fraction_number'))}}" id="sendamount">
                                <input type="hidden" value="{{ $order->gateway_currency }}" id="sendcurrency">

                                <h5 class="my-4 ">@lang('Please Pay') <span id="finalaamounttopay">{{getAmount($order->final_amount, config('basic.fraction_number'))}} {{trans($order->gateway_currency)}} </span> @lang('To Get') {{getAmount($order->sendmoney->recipient_get_amount, config('basic.fraction_number'))}}  {{trans($order->sendmoney->receive_curr)}}</h5>
                               
                                <form action="{{$data->url}}" method="{{$data->method}}" id="ssfrom">
                                    <script
                                        src="{{$data->src}}"
                                        class="stripe-button"
                                        @foreach($data->val as $key=> $value)
                                        data-{{$key}}="{{$value}}"
                                        @endforeach>
                                    </script>
                                </form>

                                <form method="{{$data->method}}" id="ssfroma"  class="d-none">
                                    <script class="stripe-button">
                                    </script>
                                </form>
                                
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


            $.ajax({
                url: '/stripeajax',
                method: 'get',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: { amount: getAmount, currency: currencyCode },
                success: function(response) {
                    $('#ssfroma').attr('action',response.url)
                    // $('.stripe-button').attr('data-key',response.key)
                    // $('.stripe-button').attr('data-name',response.name)
                    // $('.stripe-button').attr('data-description',response.description)
                    // $('.stripe-button').attr('data-amount',response.amount)
                    // $('.stripe-button').attr('data-currency',response.currency)
                    // $('.stripe-button').attr('src',response.src)
                    $('#ssfroma').removeClass('d-none')
                    $('#ssfrom').addClass('d-none')

                    var script = document.createElement('script');
                    script.src = response.src;
                    script.className = 'stripe-button';
                    script.setAttribute('data-key', response.key);
                    script.setAttribute('data-name', response.name);
                    script.setAttribute('data-description', response.description);
                    script.setAttribute('data-amount', response.amount);
                    script.setAttribute('data-currency', response.currency);
                    $('#ssfroma').html(script)

                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + error);
                }
            });

        })


        $(document).on("change", ".transfer-currency", function () {
            currencyCode = $(this).val();
            $('.dynamic-bank').addClass('d-none');
        })
    </script>

    <script>
        "use strict";
        $(document).ready(function () {
            $('button[type="submit"]').removeClass("stripe-button-el").addClass("btn  btn-info btn-lg mt-2").find('span').css('min-height', 'initial');
        })
    </script>
    @endpush

@endsection




