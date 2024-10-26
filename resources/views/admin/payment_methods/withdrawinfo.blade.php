@extends('admin.layouts.app')
@section('title', trans('payment-methods'))



@section('content')
    <!-- Include Notiflix library -->
    <script src="https://cdn.jsdelivr.net/npm/notiflix@2.7.0/dist/notiflix.min.js"></script>
    <div id="crudApp">

        <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
            <div class="card-body">
                
                <div class="table-responsive">
                    <table class="categories-show-table table table-hover table-striped table-bordered" >
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">@lang('SL')</th>
                            <th scope="col">@lang('Name')</th>
                            <th scope="col">@lang('Action')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @if($getGateway)
                            @foreach($getGateway as $key => $serviceitem)
                                <tr >
                                    <td data-label="@lang('SL')">{{ $key+1 }}</td>
                                    <td data-label="@lang('Name')">{{ $serviceitem->name }}</td>
                                    <td data-label="@lang('Action')">
                                        <!-- <a href="javascript:void(0)"
                                            class="btn btn-primary btn-circle editBtn"
                                            data-id="{{ $serviceitem->id }}"
                                            data-name="{{ $serviceitem->name }}"
                                            data-status="{{ $serviceitem->status }}"
                                            data-toggle="modal" 
                                            data-target="#editModal"
                                            data-original-title="@lang('Edit')">
                                            <i class="fa fa-edit"></i>
                                        </a> -->
                                        <a href="javascript:void(0)"
                                            class="btn btn-sm btn-outline-danger deleteBtn"
                                            data-toggle="modal"
                                            data-toggle="modal" data-target="#disableModal"
                                            data-route="{{route('admin.payment.methods.withdrawinfodestroy',$serviceitem)}}">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        @endif
                        </tbody>
                    </table>

                    <div class="card-body">
                        <form method="post" action="{{route('admin.payment.methods.withdrawinfocreate')}}"
                            class="needs-validation base-form" novalidate="" enctype="multipart/form-data">
                            
                            @csrf
                            <div class="row">
                                <input type="hidden" name="mid" value="{{ $method->id }}">
                                <div class="form-group col-md-6">
                                    <label>{{trans('Name')}}</label>
                                    <input type="text" class="form-control "
                                        name="name"
                                        value="{{ old('name') }}" required="">
                                    @if ($errors->has('name'))
                                        <span class="invalid-text">
                                                {{ trans($errors->first('name')) }}
                                            </span>
                                    @endif
                                </div>

                                <div class="form-group col-md-6">
                                    <label>{{trans('Type')}}</label>
                                    <select name="type" class="form-control ">
                                        <option value="">{{trans('Select Type')}}</option>
                                        <option value="text">{{trans('String')}}</option>
                                        <option value="file">{{trans('File')}}</option>
                                    </select>
                                </div>


                            </div>


                            <button type="submit" class="btn btn-rounded btn-primary btn-block mt-3">@lang('Save Changes')</button>
                        </form>     
                    </div>

                </div>
            </div>
        </div>

        <!-- Modal for Edit -->
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel"><i class="fa fa-pencil-alt"></i> {{trans('Edit Form')}}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">×</span></button>
                </div>

                <form id="editForm" method="post">
                    @csrf
                    @method('put')
                    <div class="modal-body">
                        <ul class="list-style-none" v-if="hasErrors">
                            <li v-for="value in hasErrors" class="text-danger" v-html="value[0]"></li>
                        </ul>

                        <div class="form-group">
                            <label for="inputName" class="control-label"><strong>{{trans('Service Name')}} :</strong> </label>
                            <input type="text" class="form-control form-control-lg"
                                placeholder="{{trans('Enter a service')}}" name="name">
                        </div>

                        <div class="form-group col-md-6">
                            <label>{{trans('Type')}}</label>
                            <select name="type" class="form-control ">
                                <option value="">{{trans('Select Type')}}</option>
                                <option value="2">{{trans('String')}}</option>
                                <option value="3">{{trans('File')}}</option>
                            </select>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-dismiss="modal">
                            {{trans('Close')}}
                        </button>

                        <button type="submit" class="btn btn-primary"><i class="fa fa-send"></i> {{trans('Update')}}</button>
                    </div>
                </form>

            </div>
        </div>
        </div>

        
        <!-- Modal for DELETE -->
        <div id="disableModal" class="modal fade" tabindex="-1" role="dialog">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header modal-colored-header bg-primary">
	                    <h5 class="modal-title"><span class="messageShow"></span> @lang('Confirmation')</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <form action="" class="deleteAttr" method="POST">
	                    @csrf
	                    @method('delete')
	                    <div class="modal-body">
	                        <p class="font-weight-bold">@lang('Are you sure to delete this')</p>
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn waves-effect waves-light btn-dark" data-dismiss="modal">@lang('Close')</button>
	                        <button type="submit" class="btn waves-effect waves-light btn-primary">@lang('Yes')</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>

    </div>

@endsection


@push('js')


<script>
    document.addEventListener("DOMContentLoaded", function () {
        "use strict";
    
        $('.deleteBtn').on('click', function () {
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
            $('#editModal form').attr('action', '/admin/serviceinfo/' + id );
        });

        // Check for success message and display it
        @if(session('success_message'))
            Notiflix.Notify.Success("{{ session('success_message') }}");
        @endif
    });
    </script>
    
    

@endpush
