@extends($theme.'layouts.merchant')
@section('title')
    {{ 'Pay with '.optional($order->gateway)->name ?? '' }}
@endsection

@section('content')


    <div class="container-fluid">
        <div class="row justify-content-center ">
            <div class="col-md-10">
                <div class="card secbg shadow">
                    <div class="card-body d-flex flex-wrap text-center align-items-center">
                            <div>
                                <img src="{{getFile(config('location.gateway.path').optional($order->gateway)->image)}}" class="img-thumbnail mx-auto w-75" alt="..">
                            </div>
                            <div>
                                <h4 class="mt-2">@lang('Please Pay') {{getAmount($order->final_amount,config('basic.fraction_number'))}} {{$order->gateway_currency}}</h4>
                                <h4 class="mt-1">@lang('To Get') {{getAmount($order->amount,config('basic.fraction_number'))}}  {{$basic->currency}}</h4>
                                <form action="{{$data->url}}" method="{{$data->method}}">
                                    <script src="{{$data->checkout_js}}"
                                            @foreach($data->val as $key=>$value)
                                            data-{{$key}}="{{$value}}"
                                        @endforeach >
                                    </script>
                                    <input type="hidden" custom="{{$data->custom}}" name="hidden">
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>


    @push('script')
        <script>
            $(document).ready(function () {
                $('input[type="submit"]').addClass("btn  btn-info btn-lg btn-custom2 cmn-btn  mt-2");
            })
        </script>
    @endpush
@endsection




