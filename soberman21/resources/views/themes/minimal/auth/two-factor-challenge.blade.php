@extends($theme.'layouts.form')

@section('content')
    <div class="entry-right-inner">
        <form action="{{route('two-factor.login')}}"  method="post">
            @csrf
            <div class="form-group">
                <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <label for="code" class="text-bold">@lang('Enter Code')</label>
                <input type="text" id="code"  name="code" value="{{old('code')}}"/>
                @error('code')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
                @error('error')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
            </div>

        
            @error('resend')
            <p class="text-danger  mt-1">{{ trans($message) }}</p>
            @enderror

            <div class="entry-button">
                <button>@lang('Submit')</button>
            </div>
        </form>
        <hr>
        <form action="{{route('two-factor.login')}}"  method="post">
            @csrf
            <div class="form-group">
                <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <label for="recovery_code" class="text-bold">@lang('Recovery Code')</label>
                <input type="text" id="recovery_code"  name="recovery_code" value="{{old('recovery_code')}}"/>
                @error('recovery_code')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
                @error('error')<span class="text-danger  mt-1">{{ trans($message) }}</span>@enderror
            </div>

        
            @error('resend')
            <p class="text-danger  mt-1">{{ trans($message) }}</p>
            @enderror

            <div class="entry-button">
                <button>@lang('Submit')</button>
            </div>
        </form>
    </div>
@endsection
