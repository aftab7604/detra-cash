@extends($theme.'layouts.merchant')
@section('title')
    {{ 'Pay with '.optional($order->gateway)->name ?? '' }}
@endsection


@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card shadow secbg">
                <div class="card-body text-center">
                    <h3 class="card-title">@lang('Payment Preview')</h3>
                    <h4> @lang('PLEASE SEND EXACTLY') <span
                            class="text-success"> {{ getAmount($data->amount) }}</span> {{$data->gateway_currency}}
                    </h4>
                    <h5>@lang('TO') <span class="text-success"> {{ $data->sendto }}</span></h5>
                    <img src="{{$data->img}}" alt="..">
                    <h4 class="text-success font-weight-bold">@lang('SCAN TO SEND')</h4>
                </div>
            </div>

        </div>

    </div>
</div>


@endsection

