@extends($theme.'layouts.merchant')
@section('title',trans($page_title))
@section('content')
    <div class="container-fluid">

        <form action="" method="post">
            @csrf

            <div class="card shadow">
                <div class="card-body">
                    <div class="row  justify-content-center">

                        <div class="col-lg-8">
                            <div class="card shadow-sm">
                                <div class="card-body">
                                    <div class="content-title ">
                                        <h3 class="text-dark">{{trans('Payout Form')}}</h3>
                                    </div>

                                    <div class="form-group">
                                        <label for="invoice_number">{{trans('Invoice Number')}}</label>
                                        <input type="text" id="invoice_number" name="invoice_number" class="form-control" value="{{old('invoice_number')}}" autocomplete="off">
                                        @error('invoice_number')
                                        <div class="error-massage-alt text-danger">
                                            <span>{{trans($message)}}</span>
                                        </div>
                                        @enderror
                                    </div>


                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary w-100">{{trans('Submit')}}</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                </div>
            </div>



        </form>
    </div>

@endsection


@push('css-lib')
@endpush

@push('extra-js')
@endpush

@push('style')
@endpush
