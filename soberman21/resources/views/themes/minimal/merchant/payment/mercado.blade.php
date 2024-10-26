@extends($theme.'layouts.merchant')
@section('title')
    {{ 'Pay with '.optional($order->gateway)->name ?? '' }}
@endsection
@section('content')
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-10">
                    <div class="card shadow secbg text-center">
                        <div class="card-body d-flex flex-wrap text-center align-items-center">

                            <div>
                                <img
                                    src="{{getFile(config('location.gateway.path').optional($order->gateway)->image)}}"
                                    class=" img-thumbnail mx-auto d-block mb-3 mb-md-0" alt="..">
                            </div>

                            <div>
                                <h4 class="mt-2 ">@lang('Please Pay') {{getAmount($order->final_amount,config('basic.fraction_number'))}} {{trans($order->gateway_currency)}}</h4>
                                <h4 class="mt-1 ">@lang('To Get') {{getAmount($order->amount,config('basic.fraction_number'))}}  {{trans($basic->currency)}}</h4>

                                <form
                                    action="{{ route('ipn', [optional($order->gateway)->code ?? 'mercadopago', $order->transaction]) }}"
                                    method="POST">
                                    <script
                                        src="https://www.mercadopago.com.co/integrations/v1/web-payment-checkout.js"
                                        data-preference-id="{{ $data->preference }}">
                                    </script>
                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
@endsection
