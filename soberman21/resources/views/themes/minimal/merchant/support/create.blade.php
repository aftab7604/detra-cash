@extends($theme.'layouts.merchant')
@section('title',trans($page_title))

@section('content')

<div class="container-fluid">
    <div class="row ">
        <div class="col-sm-12">
            <div class="card shadow">
                <div class="card-body">
                    <form action="{{route('user.ticket.store')}}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group ">
                            <label>@lang('Subject')</label>
                            <input class="form-control " type="text" name="subject"
                                   value="{{old('subject')}}" placeholder="@lang('Enter Subject')">
                            @error('subject')
                            <span class="error text-danger">@lang($message) </span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label>@lang('Message')</label>
                            <textarea class="form-control  ticket-box" name="message" rows="5"
                                      id="textarea1"
                                      placeholder="@lang('Enter Message')">{{old('message')}}</textarea>
                            @error('message')
                            <span class="error text-danger">@lang($message) </span>
                            @enderror
                        </div>


                        <div class="form-group">
                            <input type="file" name="attachments[]"
                                   class="form-control "
                                   multiple
                                   placeholder="@lang('Upload File')">

                            @error('attachments')
                            <span class="text-danger">{{trans($message)}}</span>
                            @enderror
                        </div>

                        <div class="form-group mt-3">
                            <button type="submit" class="btn btn-info w-100">@lang('Submit')</button>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

@endsection
