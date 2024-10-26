@extends('admin.layouts.app')
@section('title')
    {{ trans($page_title) }}
@endsection
@section('content')
    <div class="container-fluid">
        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ trans($error) }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <div class="row">
            <div class="col-12">
                <div class="card card-primary shadow">



                    <div class="card-body">

                        <a href="{{route('admin.service')}}" class="btn btn-success btn-sm float-right mb-3"><i class="fa fa-list"></i> {{trans('Service List')}}</a>

						   <form method="post" action="{{route('admin.service.add')}}"
		                              class="needs-validation base-form" novalidate="" enctype="multipart/form-data">
		                               
		                            @csrf
		                            @method('put')
		                            <div class="row">

		                                <div class="form-group col-md-6">
		                                    <label>{{trans('Title')}}</label>
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
		                                    <label>{{trans('Status')}}</label>
		                                    <select name="status" class="form-control ">
				                                <option value="">{{trans('Select Status')}}</option>
				                                <option value="1">{{trans('Active')}}</option>
				                                <option value="0">{{trans('Deactive')}}</option>
				                            </select>
				                            @if ($errors->has('status'))
		                                        <span class="invalid-text">
		                                                {{ trans($errors->first('status')) }}
		                                            </span>
		                                    @endif
		                                </div>

		                                


		                            </div>


		                            <button type="submit" class="btn btn-rounded btn-primary btn-block mt-3">@lang('Save Changes')</button>
		                        </form>     
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('style-lib')
    <link rel="stylesheet" href="{{ asset('assets/admin/css/summernote.min.css')}}">
@endpush
@push('js-lib')
    <script src="{{ asset('assets/admin/js/summernote.min.js')}}"></script>
@endpush

@push('js')
    <script>
        "use strict";

        $(document).ready(function (e) {

            $('#image').change(function () {
                let reader = new FileReader();
                reader.onload = (e) => {
                    $('#image_preview_container').attr('src', e.target.result);
                }
                reader.readAsDataURL(this.files[0]);
            });

            $('.summernote').summernote({
                height: 250,
                callbacks: {
                    onBlurCodeview: function() {
                        let codeviewHtml = $(this).siblings('div.note-editor').find('.note-codable').val();
                        $(this).val(codeviewHtml);
                    }
                }
            });
        });

    </script>
@endpush
