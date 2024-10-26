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

                        <a href="{{route('admin.blog.index')}}" class="btn btn-success btn-sm float-right mb-3"><i class="fa fa-list"></i> {{trans('Blog')}}</a>

						<ul class="nav nav-tabs" id="myTab" role="tablist">
                            @foreach($languages as $key => $language)
                                <li class="nav-item">
                                    <a class="nav-link {{ $loop->first ? 'active' : '' }}" data-toggle="tab" href="#lang-tab-{{ $key }}" role="tab" aria-controls="lang-tab-{{ $key }}"
                                       aria-selected="{{ $loop->first ? 'true' : 'false' }}">@lang($language->name)</a>
                                </li>
                            @endforeach
                        </ul>
						<div class="tab-content mt-2" id="myTabContent">
                             @foreach($languages as $key => $language)
                             
                        	<div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="lang-tab-{{ $key }}" role="tabpanel">
                        	  @if($key == 0)
		                        <form method="post" action="{{route('admin.blog.update',$method)}}"
		                              class="needs-validation base-form" novalidate="" enctype="multipart/form-data">
		                               <input type="hidden" name="language_id" value="{{$language->id}}"/>
		                            @csrf
		                            @method('put')
		                            <div class="row">

		                                <div class="form-group col-md-6">
		                                    <label>{{trans('Name')}}</label>
		                                    <input type="text" class="form-control "
		                                           name="name"
		                                           value="{{ old('name', $method->name) }}" required="">
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
		                                            <option value="{{old('category_id',$item->id)}}" @if($item->id == $method->category_id) selected @endif> @lang($item->title)</option>
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
		                                            <img id="image_preview_container" class="preview-image" src="{{ getFile(config('location.blog.path').$method->image)}}"
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
		                                        <textarea class="form-control summernote" name="description" id="summernote" rows="15">{{old('description',$method->description)}}</textarea>
		                                        @error('description')
		                                        <span class="text-danger">{{ trans($message) }}</span>
		                                        @enderror
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="row mt-3 justify-content-between">

		                                <div class="form-group col-lg-3 col-md-6">
		                                    <label>@lang('Status')</label>

		                                    <div class="custom-switch-btn">
		                                        <input type='hidden' value='1' name='status'>
		                                        <input type="checkbox" name="status" class="custom-switch-checkbox" id="status" value = "0"
		                                            {{($method->status == 0)? 'checked' : ''}}>
		                                        <label class="custom-switch-checkbox-label" for="status">
		                                            <span class="custom-switch-checkbox-inner"></span>
		                                            <span class="custom-switch-checkbox-switch"></span>
		                                        </label>
		                                    </div>
		                                </div>

		                            </div>

		                            <button type="submit" class="btn btn-rounded btn-primary btn-block mt-3">@lang('Save Changes')</button>
		                        </form>
		                      @else
		                      @php $child_category = \App\Models\Blog::where(['parent_id' => $method->id,'language_id' => $language->id])->first();  @endphp
		                      <form method="post" action="{{route('admin.blog.update',$method)}}"
		                              class="needs-validation base-form" novalidate="" enctype="multipart/form-data">
		                              <input type="hidden" name="language_id" value="{{$language->id}}"/>
										<input type="hidden" name="request_id" value="{{$child_category ? $child_category->id : ''}}"/>
		                            @csrf
		                            @method('put')
		                            <div class="row">

		                                <div class="form-group col-md-6">
		                                    <label>{{trans('Name')}}</label>
		                                    <input type="text" class="form-control "
		                                           name="name"
		                                           value="{{$child_category ? $child_category->name : ''}}" required="">
		                                    @if ($errors->has('name'))
		                                        <span class="invalid-text">
		                                                {{ trans($errors->first('name')) }}
		                                            </span>
		                                    @endif
		                                </div>
										@php
										if($child_category)
										{										
											$childe_category_id = $child_category->category_id ;
										}else{
										 $childe_category_id = '';
										} 
										
										@endphp
		                                <div class="form-group col-md-6">
		                                    <label>@lang('Category')</label>
		                                    <select name="category_id" id="category_id" class="form-control">
		                                        <option value="" selected disabled>@lang('Select One')</option>
		                                        @foreach($categories_fr as $item)
		                                            <option value="{{old('category_id',$item->id)}}" @if($item->id == $childe_category_id) selected @endif> @lang($item->title)</option>
		                                        @endforeach
		                                    </select>
		                                </div>


		                            </div>


		                            <div class="row justify-content-between">
		                                <input type="hidden" name="image" value="{{$method->image}}" />
		                                <div class="col-sm-12 col-md-9">
		                                    <div class="form-group ">
		                                        <label>@lang('Description')</label>
		                                        <textarea class="form-control summernote" name="description" id="summernote" rows="15">{{$child_category ? $child_category->description : ''}}</textarea>
		                                        @error('description')
		                                        <span class="text-danger">{{ trans($message) }}</span>
		                                        @enderror
		                                    </div>
		                                </div>
		                            </div>
		                            

		                            <button type="submit" class="btn btn-rounded btn-primary btn-block mt-3">@lang('Save Changes')</button>
		                        </form>
		                      @endif  
		                     </div>
		                     @endforeach
		                  </div>      
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
