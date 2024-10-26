@extends('admin.layouts.app')
{{-- @section('title', trans($page_title)) --}}
@section('title')
@section('content')

<div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
    <div class="card-header">
        <h3>Edit Entry</h3>
    </div>

    <div class="card card-primary shadow">
        <div class="card-body">
         
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
                            <form method="post" action="{{ route('admin.ourFuture.update',$ourFuture->id) }}"
                                    class="needs-validation base-form" novalidate="" enctype="multipart/form-data">
                                    <input type="hidden" name="language_id" value="{{$language->id}}"/>
                                @csrf
                                @method('put')
                                <div class="row">

                                    <div class="form-group col-md-6">
                                        <label>{{trans('Title')}}</label>
                                        <input type="text" class="form-control "
                                                name="title"
                                                value="{{ old('title', $ourFuture->title) }}" required="">
                                        @if ($errors->has('title'))
                                            <span class="invalid-text">
                                                    {{ trans($errors->first('title')) }}
                                                </span>
                                        @endif
                                    </div>

                                </div>


                                <div class="row justify-content-between">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label>@lang('Image')</label>

                                            <div class="image-input ">
                                                <label for="image-upload" id="image-label"><i class="fas fa-upload"></i></label>
                                                <input type="file" name="image" placeholder="@lang('Choose image')" id="image">
                                           
                                                        <img id="image_preview_container" class="preview-image" src="{{getFile(config('location.blog.path').@$ourFuture->image)}}">
                                            </div>
                                        </div>
                                        @error('image')
                                        <span class="text-danger">{{ trans($message) }}</span>
                                        @enderror
                                    </div>
                                    <div class="col-sm-12 col-md-9">
                                        <div class="form-group ">
                                            <label>@lang('Description')</label>
                                            <textarea class="form-control summernote" name="description" id="summernote" rows="15">{{old('description',$ourFuture->description)}}</textarea>
                                            @error('description')
                                            <span class="text-danger">{{ trans($message) }}</span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-rounded btn-primary btn-block mt-3">@lang('Save Changes')</button>
                            </form>
                        @else
                        @php $child_category = \App\Models\OurFeature::where(['parent_id' => $ourFuture->id,'language_id' => $language->id])->first();  @endphp
                            <form method="post" action="{{ route('admin.ourFuture.update',$child_category ? $child_category->id : 0) }}"
                                    class="needs-validation base-form" novalidate="" enctype="multipart/form-data">
                                    <input type="hidden" name="language_id" value="{{$language->id}}"/>
                                    <input type="hidden" name="f_id" value="{{$ourFuture->id}}"/>
                                    <input type="hidden" name="image" value="{{$ourFuture->image}}"/>
                                @csrf
                                @method('put')
                                <div class="row">

                                    <div class="form-group col-md-6">
                                        <label>{{trans('Title')}}</label>
                                        <input type="text" class="form-control "
                                                name="title"
                                                value="{{ old('title', $child_category ? $child_category->title : null) }}" required="">
                                        @if ($errors->has('title'))
                                            <span class="invalid-text">
                                                    {{ trans($errors->first('title')) }}
                                                </span>
                                        @endif
                                    </div>

                                </div>

                                <div class="row justify-content-between">
                                    <div class="col-sm-12 col-md-9">
                                        <div class="form-group ">
                                            <label>@lang('Description')</label>
                                            <textarea class="form-control summernote" name="description" id="summernote" rows="15">{{old('description',$child_category ? $child_category->description : null)}}</textarea>
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

@endsection
