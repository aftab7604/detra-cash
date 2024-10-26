@extends('admin.layouts.app')
@section('title', trans($page_title))



@section('content')

    <div id="crudApp">

        <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
            <div class="card-body">
               <a href="{{route('admin.blog.categoryadd')}}" class="btn btn-success btn-sm float-right mb-3"><i class="fa fa-plus-circle"></i> {{trans('Add New')}}</a>
                


                <div class="table-responsive">
                	
                        <table class="table ">
                            <thead class="thead-dark">
                            <tr>
                                <th scope="col">@lang('SL')</th>
                                <th scope="col">@lang('Title')</th>
                                <th scope="col">@lang('Action')</th>
                            </tr>

                            </thead>
                            <tbody id="sortable">

                            @forelse($methods as $key => $method)
                                    <tr >
                                        <td data-label="@lang('SL')">{{ loopIndex($methods) + $key }} </td>
                                        <td data-label="@lang('Name')">{{ $method->title }} </td>
                                        

                                        <td data-label="@lang('Action')">
                                            <a href="{{ route('admin.blog.categoryedit', $method->id) }}"
                                               class="btn btn-primary btn-circle"
                                               data-toggle="tooltip"
                                               data-placement="top"
                                               data-original-title="@lang('Edit')">
                                                <i class="fa fa-edit"></i></a>

                                                <button type="button"
                                                        class="btn btn-sm btn-danger  btn-circle disableBtn"
                                                        data-route="{{ route('admin.blog.categorydel', $method->id) }}"
                                                        data-toggle="modal" data-target="#disableModal" ><i class="fa fa-trash-alt"></i>
                                                </button>
                                        </td>

                                    </tr>

                            @empty
                                <tr>
                                    <td class="text-center" colspan="100%">
                                        @lang('No Data Found')
                                    </td>
                                </tr>
                            @endforelse
                            </tbody>
                        </table>

                        {{ $methods->appends($_GET)->links('partials.pagination') }}
                    


                </div>
            </div>
        </div>

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
