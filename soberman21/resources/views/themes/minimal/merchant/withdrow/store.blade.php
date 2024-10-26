@extends($theme.'layouts.merchant')
@section('title',trans('Payment Method'))
@section('content')
 <!-- main -->
 <div class="container-fluid">
        <div class="main row">
            <div class="col-md-3">
                
                <div class="card card-type-1 text-center bgGateway">
                    <ul class="list-group">
                        <li class="list-group-item border-0 d-flex justify-content-between align-items-start">
                            <img src="{{ $data['gateway_image'] }}" class="card-img-top w-50" alt="Wire Transfer">
                        </li>
                        <li class="list-group-item border-0 d-flex justify-content-between align-items-start">Request Amount :
                            <span class="float-right greenColorText">{{  $data['amount'] }} </span>
                            <input type="hidden" value="{{ $data['amount'] }}" id="sendamount">
                        </li>

                        <li class="list-group-item border-0 d-flex justify-content-between align-items-start">Charge Amount :
                            <span class="float-right text-danger">{{  $data['charge'] }} </span>
                        </li>

                        <li class="list-group-item border-0 d-flex justify-content-between align-items-start">Total Payable :
                            <span class="float-right text-danger">{{  $data['payable'] }} </span>
                        </li>

                        <li class="list-group-item border-0 d-flex justify-content-between align-items-start">Available Balance :
                            <span class="float-right greenColorText"> {{   sprintf('%0.2f', Auth::user()->balance) }} EUR</span>
                        </li>
                        <div id="showInfo">

                        </div>
                    </ul>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card card-type-1 bgGateway">
                    <div class="text-center">
                        <h3 class="card-title py-2">Additional Information To Withdraw Confirm</h3>
                    </div>

                    <div class="card-body">
                        <form action="{{ route('user.storewithdrow')  }}" method="post" enctype="multipart/form-data" class="form preview-form">
                            @csrf
                                      
                            @if($data['winfo'] && isset($data['winfo']->supported_currency))
                                <div class="row mb-4">
                                    <div class="col-md-12">
                                        <div class="form-group input-box search-currency-dropdown">
                                            <label for="from_wallet">@lang('Select Bank Currency')</label>
                                            <select id="from_wallet" name="currency_code"
                                                    class="form-control form-control-sm transfer-currency"
                                                    required>
                                                <option value="" disabled=""
                                                        selected="">@lang('Select Currency')</option>
                                                @foreach(json_decode($data['winfo']->supported_currency) as $singleCurrency)
                                                    <option
                                                        value="{{$singleCurrency}}"
                                                        @foreach(json_decode($data['winfo']->convert_rate) as $key => $rate)
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

                            <input type="hidden" name="amount" value="{{ $data['amount'] }}">                               
                            <input type="hidden" name="charge" value="{{ $data['charge'] }}">                               
                            <input type="hidden" name="gateway_id" value="{{ $data['winfo']->id }}">                               
                            <div class="row g-4">
                                @foreach($data['winfo']->withdrainfo as $data)
                                    <div class="input-box col-md-12">
                                        <p style="font-size:18px;">{{ $data->name }}<span class="text-danger"> *</p></label>
                                        @if($data->type=='file')
                                            <input type="{{ $data->type }}" name="remarksfile[]"  class="form-control form-control-lg mb-2"  multiple required="" placeholder="{{ $data->name }}">
                                        @else
                                            <input type="hidden" name="fname[]" class="mb-2" value="{{ $data->name }}"  multiple>
                                            <input type="{{ $data->type }}" name="remarks[]" class="form-control form-control-lg mb-2" required="" placeholder="{{ $data->name }}">
                                        @endif
                                    </div>
                                @endforeach
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary w-100 mt-3">
                                        <span>Confirm Now</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <style>
        .form-control {
            width: 100%;
    border-radius: 4px;
    border: 1px solid #cccccc;
    outline: initial;
    background: var(--natural-color);
    font-size: 15px;
    font-family: "Open-r";
    color: var(--text-color);
    padding: 15px 15px;
    position: relative;
}
    </style>
@endsection


@push('script')
    <script type="text/javascript">
          var payAmount = $('#sendamount').val();
         var baseCurrency = "EUR"

        $(document).on("change", ".transfer-currency", function () {
            let currencyCode = $(this).val();
            let rate = $(this).find(':selected').data('rate');
            console.log(payAmount)
            let getAmount = parseFloat(rate) * parseFloat(payAmount);
            var output = null;
            $('#showInfo').html('');
            output = `<p>@lang('Exchange rate:') <span
                         class="text-danger">1 ${baseCurrency} = ${rate} ${currencyCode}</span></p>
                      <p>@lang('You will get:') <span
                         class="text-danger">${getAmount} ${currencyCode}</span></p>`

            $('#showInfo').html(output);
        })


        $(document).on("change", ".transfer-currency", function () {
            currencyCode = $(this).val();
            $('.dynamic-bank').addClass('d-none');
        })

   </script>
@endpush




