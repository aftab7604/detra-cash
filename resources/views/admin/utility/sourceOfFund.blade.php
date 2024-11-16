@extends('admin.layouts.app')
@section('title', trans($page_title))



@section('content')

    <div id="crudApp">

        <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
            <div class="card-body">
                @if(adminAccessRoute(config('role.source_fund.access.add')))
                <a href="{{ route('admin.sourceOfFund.add') }}" 
                   class="btn btn-primary mb-3 float-right">
                    <i  class="fa fa-plus" ></i> {{trans('Add New')}}
                </a>
                
                @endif


                <div class="table-responsive">
                    <table class="categories-show-table table table-hover table-striped table-bordered" >
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">@lang('SL')</th>
                            <th scope="col">@lang('Name')</th>
                            @if(adminAccessRoute(array_merge(config('role.source_fund.access.edit'), config('role.source_fund.access.delete'))))
                            <th scope="col">@lang('Action')</th>
                            @endif
                        </tr>
                        </thead>
                        <tbody>
                           @foreach($items as $key => $sourceOfFunditem)
                       
                        	<tr >
                        		<td data-label="@lang('SL')">{{ $key+1 }}</td>
                        		<td data-label="@lang('Name')">{{ $sourceOfFunditem->title }}</td>
                                @if(adminAccessRoute(array_merge(config('role.source_fund.access.edit'), config('role.source_fund.access.delete'))))
                        		<td data-label="@lang('Action')">
                                    @if(adminAccessRoute(config('role.source_fund.access.edit')))
                                    <a href="{{ route('admin.sourceOfFund.edit',$sourceOfFunditem) }}"
                                        class="btn btn-primary btn-circle"
                                        data-toggle="tooltip"
                                        data-placement="top"
                                        data-original-title="@lang('Edit')">
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    @endif
                                    @if(adminAccessRoute(config('role.source_fund.access.delete')))
                                    <button type="button"
                                            class="btn btn-sm btn-danger  btn-circle disableBtn"
                                            data-route="{{ route('admin.sourceOfFund.delete', $sourceOfFunditem) }}"
                                            data-toggle="modal" data-target="#disableModal" ><i class="fa fa-trash-alt"></i>
                                    </button>
                                    @endif
                        		</td>
                                @endif
                        	</tr>            

                        @endforeach
                        </tbody>
                    </table>


                </div>
            </div>
        </div>


        <div class="modal fade" id="btn_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-plus"></i> {{trans('Add New')}}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">×</span></button>
                    </div>

                    <div class="modal-body">
                        <li v-for="value in hasErrors" v-if="hasErrors" class="text-danger" v-html="value[0]"></li>

                        <div class="form-group">
                            <label for="inputName" class="col-sm-3 control-label"><strong>{{trans('Title')}} :</strong>
                            </label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control form-control-lg "
                                       v-model="newItem.title"
                                       placeholder="{{trans('Enter a title')}}" value="">
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-dismiss="modal">
                            {{trans('Close')}}
                        </button>

                        <button type="submit" class="btn btn-primary" @click.prevent="createItem"
                                id="btn-save" value="add"> {{trans('Save')}}
                        </button>
                    </div>

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
        "use strict";


        $('.disableBtn').on('click', function () {
            // deleteAttr
            var route  = $(this).data('route');
            $('.deleteAttr').attr('action',route)
        });
    </script>
   

@endpush
