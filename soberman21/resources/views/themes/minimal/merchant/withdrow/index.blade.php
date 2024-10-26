@extends($theme.'layouts.merchant')
@section('title',trans("Withdrow"))
@section('content')

    <div class="page-header card card-primary m-0 m-md-4 my-4 m-md-0 p-5 shadow">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <form action="{{ route('user.withdraw.history.search') }}" method="get">
                    <div class="row justify-content-between align-items-center mt-3">
                        <div class="col-md-3">
                            <div class="form-group">
                                <input
                                    type="text"
                                    name="name"
                                    value="{{@request()->name}}"
                                    class="form-control"
                                    placeholder="@lang('Transaction ID')"
                                />
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <select name="status" class="form-control" id="salutation">
                                    <option value="">@lang('All Payment')</option>
                                    <option value="1"
                                            @if(@request()->status == '1') selected @endif>@lang('Pending Payment')</option>
                                    <option value="2"
                                            @if(@request()->status == '2') selected @endif>@lang('Complete Payment')</option>
                                    <option value="3"
                                            @if(@request()->status == '3') selected @endif>@lang('Cancel Payment')</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <input type="date" class="form-control" name="date_time"
                                       id="datepicker" value="{{ old('from_date',request()->date_time) }}"/>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <button type="submit" class="btn btn-info  btn-block ">
                                    <i class="fa fa-search"></i> @lang('Search')</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table  table-striped table-bordered text-center" id="service-table">
                    <thead class="thead-dark">
                    <tr>
                        <th>@lang('SL')</th>
                        <th scope="col">@lang('Transaction ID')</th>
                        <th scope="col">@lang('Gateway')</th>
                        <th scope="col">@lang('Amount')</th>
                        <th scope="col">@lang('Charge')</th>
                        <th scope="col">@lang('Status')</th>
                        <th scope="col">@lang('Time')</th>
                        <th scope="col">@lang('Details')</th>
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($logs as $index => $item)
                        <tr>
                            <td>{{$index+1}}</td>
                            <td>{{$item->trx_id}}</td>
                            <td>@lang(optional($item->payoutMethod)->name)</td>
                            <td>{{getAmount($item->amount)}} @lang($basic->currency)</td>
                            <td>{{getAmount($item->charge)}} @lang($basic->currency)</td>


                            <td data-label="@lang('Status')">

                                @if($item->status == 1)
                                    <span class="badge badge-warning badge-pill">@lang('Pending')</span>
                                @elseif($item->status == 2)
                                    <span class="badge badge-success badge-pill">@lang('Completed')</span>
                                @elseif($item->status == 3)
                                    <span class="badge badge-danger badge-pill">@lang('Cancel')</span>
                                @endif
                            </td>

                            <td>{{ dateTime($item->created_at, 'd M Y h:i A') }}</td>

                            <td>
                                <button
                                    type="button"
                                    class="btn btn-primary btn-sm infoButton text-white"
                                    data-information="{{$item->remarks}}"
                                    data-feedback="{{$item->feedback}}"
                                    data-trx_id="{{ $item->trx_id }}"
                                    data-toggle="modal"
                                    data-target="#infoModal">
                                    <i class="fa fa-info-circle"></i>
                                </button>
                            </td>
                        </tr>
                    @empty

                        <tr class="text-center">
                            <td colspan="100%">{{__('No Data Found!')}}</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
            {{ $logs->appends($_GET)->links($theme.'partials.pagination') }}
        </div>
    </div>



    <!-- Modal -->
    @push('loadModal')
        <!--  Withdraw info modal -->
        <div class="modal fade" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content ">
                    <div class="modal-header modal-colored-header bg-primary">
                        <h4 class="modal-title" id="infoModalLabel">@lang('Details')</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>

                    <form role="form" method="POST" class="actionRoute" action="" enctype="multipart/form-data">
                        @csrf
                        @method('put')
                        <div class="modal-body">
                            <ul class="list-group withdraw-detail">
                                <li class="list-group-item list-group-item-primary bg-transparent lebelFont">@lang('Transactions')
                                    : <span class="trx"></span>
                                </li>
                                <li class="list-group-item list-group-item-primary bg-transparent lebelFont">@lang('Admin Feedback')
                                    : <span
                                        class="feedback"></span></li>
                            </ul>

                            <div class="payout-detail">

                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    @endpush

@endsection

@push('script')

    <script>
        "use strict";
        $(document).ready(function () {
            $('.infoButton').on('click', function () {
                var infoModal = $('#infoModal');
                infoModal.find('.trx').text($(this).data('trx_id'));
                infoModal.find('.feedback').text($(this).data('feedback'));

                var list = [];
                var information = $(this).data('information');

                var ImgPath = "{{ asset('storage/') }}";
                var result = ``;

                information.forEach(element => {
                    if (element.type == 'file') {
                        result += `<li class="list-group-item bg-transparent customborder lebelFont">
                                        <img src="${ImgPath}/${element.name}" alt="..." class="w-100">
                                    </li>`;
                    } else {
                        result += `<li class="list-group-item bg-transparent customborder lebelFont text-dark"
                                            <span class="font-weight-bold "> ${element.fname} </span> : <span class="font-weight-bold ml-3">${element.name}</span>
                                        </li>`;
                    }
                });

                if (result) {
                    infoModal.find('.payout-detail').html(`<br><h4 class="my-3 golden-text">@lang('Payment Information')</h4>  ${result}`);
                } else {
                    infoModal.find('.payout-detail').html(`${result}`);
                }
                infoModal.modal('show');
            });


            $('.closeModal').on('click', function (e) {
                $("#infoModal").modal("hide");
            });
        });

    </script>
@endpush
