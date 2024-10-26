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
                        <form method="post" action=""
                              class="needs-validation base-form" novalidate="" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
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
                                    <label>@lang('Category')</label>
                                    <select name="category_id" id="category_id" class="form-control">
                                        <option value="" selected disabled>@lang('Select One')</option>
                                        @foreach($categories as $item)
                                        <option value="{{old('category_id',$item->id)}}"> @lang($item->title)</option>
                                        @endforeach
                                    </select>
                                </div>

                            </div>

                            <div class="row justify-content-between">
                                <div class="col-sm-6 col-md-3">
                                   <div class="form-group">
                                       <label>@lang('Image')</label>

                                       <div class="image-input ">
                                           <label for="image-upload" id="image-label"><i class="fas fa-upload"></i></label>
                                           <input type="file" name="image" placeholder="@lang('Choose image')" id="image">
                                           <img id="image_preview_container" class="preview-image" src="{{ getFile(config('location.blog.path'))}}"
                                                alt="preview image">
                                       </div>
                                   </div>
                                    @error('image')
                                    <span class="text-danger">{{ trans($message) }}</span>
                                    @enderror
                                </div>
                                <div class="col-sm-12 col-md-9">
                                    <div class="form-group ">
                                        <label>@lang('Description')</label>
                                        <textarea class="form-control summernote" name="description" id="summernote" rows="15">{{old('description')}}</textarea>
                                        @error('note')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>@lang('Status')</label>
                                    <div class="custom-switch-btn">
                                        <input type='hidden' value='1' name='status'>
                                        <input type="checkbox" name="status" class="custom-switch-checkbox" id="status" value = "0"
                                               checked>
                                        <label class="custom-switch-checkbox-label" for="status">
                                            <span class="custom-switch-checkbox-inner"></span>
                                            <span class="custom-switch-checkbox-switch"></span>
                                        </label>
                                    </div>
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



            $('select').select2({
                selectOnClose: true
            });
        });



    </script>

@endpush
