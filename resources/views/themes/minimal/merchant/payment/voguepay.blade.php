@extends($theme.'layouts.merchant')
@section('title')
    {{ 'Pay with '.optional($order->gateway)->name ?? '' }}
@endsection
@section('content')


    <div class="container-fluid">
            <div class="row ">
                <div class="col-md-12">
                    <div class="card shadow secbg text-center">
                        <div class="card-body d-flex flex-wrap text-center align-items-center">
                            <div>
                                <img src="{{getFile(config('location.gateway.path').optional($order->gateway)->image)}}"
                                     class=" img-thumbnail mx-auto d-block mb-3 mb-md-0" alt="..">
                            </div>

                            <div class="text-center">
                                <h4 class="mt-2">@lang('Please Pay') {{getAmount($order->final_amount, config('basic.fraction_number'))}} {{$order->gateway_currency}}</h4>
                                <h4 class="mt-1">@lang('To Get') {{getAmount($order->amount, config('basic.fraction_number'))}}  {{$basic->currency}}</h4>

                                <button type="button"
                                        class="cmn-btn mt-3 btn btn-info"
                                        id="btn-confirm">@lang('Pay with VoguePay')</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    @push('script')
        <script src="//voguepay.com/js/voguepay.js"></script>

        <script>
            closedFunction = function () {
                alert('window closed');
            }
            successFunction = function (transaction_id) {
                let txref = "{{ $data->merchant_ref }}";
                window.location.href = '{{ url('payment/voguepay') }}/' + txref + '/' + transaction_id;
            }
            failedFunction = function (transaction_id) {
                window.location.href = '{{ route('failed') }}';
            }
        </script>


        <script>

            function pay(item, price) {
                //Initiate voguepay inline payment
                Voguepay.init({
                    v_merchant_id: "{{ $data->v_merchant_id}}",
                    total: price,
                    notify_url: "{{ $data->notify_url }}",
                    cur: "{{$data->cur}}",
                    merchant_ref: "{{ $data->merchant_ref }}",
                    memo: "{{$data->memo}}",
                    recurrent: true,
                    frequency: 10,
                    developer_code: '5cff7398d89d1',
                    store_id: "{{ $data->store_id }}",
                    custom: "{{ $data->custom }}",
                    closed: closedFunction,
                    success: successFunction,
                    failed: failedFunction
                });
            }


            $(document).ready(function () {
                "use strict";
                $(document).on('click', '#btn-confirm', function (e) {
                    e.preventDefault();
                    pay('Buy', {{ $data->Buy }});
                });
            });


        </script>
    @endpush

@endsection

