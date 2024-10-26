@extends('admin.layouts.app')
@section('title', trans($page_title))
@section('content')
    <div class="page-header card card-primary m-0 m-md-4 my-4 m-md-0 p-5 shadow">
        <form action="{{ route('admin.withdraw-history') }}" method="get">
            <div class="row justify-content-between align-items-center">
                <div class="col-md-4">
                    <div class="form-group">
                        <input type="text" name="name" value="{{@request()->name}}" class="form-control"
                               placeholder="@lang('Search by Trx Number or User\'s name')">
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <select name="status" class="form-control">
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
                        <input type="date" class="form-control" name="date_time" id="datepicker"/>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="form-group">
                        <button type="submit" class="btn waves-effect waves-light btn-primary"><i
                                class="fas fa-search"></i> @lang('Search')</button>
                    </div>
                </div>
            </div>
        </form>
    </div>


    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">

            <div class="table-responsive">
                <table class="categories-show-table table table-hover table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">@lang('Date')</th>
                        <th scope="col">@lang('Trx Number')</th>
                        <th scope="col">@lang('User')</th>
                        <th scope="col">@lang('Method')</th>
                        <th scope="col">@lang('Amount')</th>
                        <th scope="col">@lang('Charge')</th>
                        <th scope="col">@lang('Net Amount')</th>
                        <th scope="col">@lang('Status')</th>
                        <th scope="col">@lang('More')</th>
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($items as $key => $item)
                        <tr>
                            <td data-label="@lang('Date')"> {{ dateTime($item->created_at,'d M,Y H:i') }}</td>
                            <td data-label="@lang('Trx Number')"
                                class="font-weight-bold text-uppercase">{{ $item->trx_id }}</td>
                            <td data-label="@lang('User')">
                                <a href="{{route('admin.user-edit',[$item->user_id])}}" target="_blank">
                                    <div class="d-flex no-block align-items-center">
                                        <div class="mr-3"><img
                                                src="{{getFile(config('location.user.path').optional($item->user)->image) }}"
                                                alt="user" class="rounded-circle" width="45" height="45">
                                        </div>
                                        <div class="">
                                            <h5 class="text-dark mb-0 font-16 font-weight-medium">
                                                @lang(optional($item->user)->firstname) @lang(optional($item->user)->lastname)
                                            </h5>
                                            <span class="text-muted font-14"><span>@</span>@lang(optional($item->user)->username)</span>
                                        </div>
                                    </div>
                                </a>
                            </td>
                            <td data-label="@lang('Method')">
                                {{ optional($item->payoutMethod)->name }}
                                @if(optional($item->payoutMethod)->is_automatic == 1)
                                    <sup class="text-dark font-weight-bold">@lang('Automatic')</sup>
                                @endif
                            </td>
                            <td data-label="@lang('Amount')"
                                class="font-weight-bold">{{ getAmount($item->amount ) }} {{ $basic->currency }}</td>
                            <td data-label="@lang('Charge')"
                                class="text-success">{{ getAmount($item->charge)}} {{ $basic->currency }}</td>
                            <td data-label="@lang('Net Amount')"
                                class="font-weight-bold">{{ getAmount($item->amount+$item->charge) }} {{$basic->currency}}</td>

                            <td data-label="@lang('Status')">
                                @if($item->status == 2)
                                    <span class="badge badge-pill badge-success">@lang('Approved')</span>
                                @elseif($item->status == 1)
                                    <span class="badge badge-pill badge-warning">@lang('Pending')</span>
                                @elseif($item->status == 3)
                                    <span class="badge badge-pill badge-danger">@lang('Rejected')</span>
                                @elseif($item->status == 4)
                                    <span class="badge badge-pill badge-danger">@lang('Fail')</span>
                                @endif
                            </td>

                            <td data-label="@lang('More')">
                                <a href="{{route('admin.payout-view',$item->id)}}"
                                   class="btn btn-primary btn-icon edit_button"><i class="fa fa-eye"></i></a>
                            </td>

                        </tr>
                    @empty
                        <tr>
                            <td colspan="100%" class="text-cyan">
                                <p class="text-dark text-center">@lang('No Data Found')</p>
                            </td>
                        </tr>

                    @endforelse
                    </tbody>
                </table>
                {{ $items->appends($_GET)->links('partials.pagination') }}
            </div>
        </div>
    </div>




    <!-- Modal for Edit button -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Payout Information')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <form role="form" method="POST" class="actionRoute" action="" enctype="multipart/form-data">
                    @csrf
                    @method('put')
                    <div class="modal-body">
                        <ul class="list-group withdraw-detail">
                        </ul>

                        @if(Request::routeIs('admin.payout-request'))
                            <div class="form-group addForm mt-3">

                            </div>
                        @endif

                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')
                        </button>
                        @if(Request::routeIs('admin.payout-request'))
                            <input type="hidden" class="action_id" name="id">
                            <button type="submit" class="btn btn-primary" name="status"
                                    value="2">@lang('Approve')</button>
                            <button type="submit" class="btn btn-danger" name="status"
                                    value="3">@lang('Reject')</button>
                        @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection


@push('js')


<script>
    document.addEventListener("DOMContentLoaded", function () {
        "use strict";
    
        $('.disableBtn').on('click', function () {
            var route = $(this).data('route');
            $('.deleteAttr').attr('action', route);
        });
    

        // Handle the "Edit" button click
        $('.editBtn').on('click', function () {
            var id = $(this).data('id');
            var name = $(this).data('name');
            var status = $(this).data('status');

            // Populate the modal fields with the retrieved values
            $('#editModal input[name="name"]').val(name);
            $('#editModal select[name="status"]').val(status);
            $('#editModal form').attr('action', '/admin/withdraw/' + id + '/update');
        });

        // Check for success message and display it
        @if(session('success_message'))
            Notiflix.Notify.Success("{{ session('success_message') }}");
        @endif
    });
    </script>
    
    

@endpush
