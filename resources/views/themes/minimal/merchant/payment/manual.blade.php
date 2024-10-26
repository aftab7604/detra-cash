@extends($theme.'layouts.merchant')
@section('title')
    {{ 'Pay with '.optional($order->gateway)->name ?? '' }}
@endsection


@section('content')

    <div class="page-header card card-primary m-0 m-md-4 my-4 m-md-0 p-5 shadow">
           <div class="card-body">
               <form action="" method="post" enctype="multipart/form-data" >
                   @csrf
                   <div class="row justify-content-between align-items-center">

                       <div class="col-lg-12">
                                 <div class="content-title text-center ">
                                       <h5>{{trans('Please follow the instruction below')}}</h5>
                                       <p class="mt-2 ">{{trans('You have requested to deposit')}}  <b class="text--base">{{getAmount($order->amount,config('basic.fraction_number'))}}
                                               {{$basic->currency}}</b> , {{trans('Please pay')}}
                                           <b class="text--base">{{getAmount($order->final_amount,config('basic.fraction_number'))}} {{$order->gateway_currency}}</b>  {{trans('for successful payment')}}
                                       </p>

                                     <p>
                                         <?php echo optional($order->gateway)->note;?>
                                     </p>
                                   </div>
                                   @if(optional($order->gateway)->parameters)
                                       @foreach($order->gateway->parameters as $k => $v)
                                           @if($v->type == "text")
                                               <div class="form-group">
                                                   <label
                                                       for="{{$k}}">{{trans($v->field_level)}} @if($v->validation == 'required')
                                                           <span
                                                               class="text-danger">*</span>  @endif </label>

                                                   <input type="text" name="{{$k}}" class="form-control" value="{{old($k)}}" id="{{$k}}">

                                                   @error($k)
                                                   <div class="error-massage-alt text-danger">
                                                       <span>{{trans($message)}}</span>
                                                   </div>
                                                   @enderror

                                               </div>
                                           @elseif($v->type == "textarea")
                                               <div class="form-group">
                                                   <label
                                                       for="{{$k}}">{{trans($v->field_level)}} @if($v->validation == 'required')
                                                           <span
                                                               class="text-danger">*</span>  @endif </label>
                                                   <textarea name="{{$k}}" id="{{$k}}" class="form-control" rows="5"
                                                             placeholder="{{trans('Type Here')}}">{{old($k)}}</textarea>
                                                   @error($k)
                                                   <div class="error-massage-alt  text-danger">
                                                       <span>{{trans($message)}}</span>
                                                   </div>
                                                   @enderror
                                               </div>
                                           @elseif($v->type == "file")
                                               <div class="form-group">
                                                   <label>{{trans($v->field_level)}} @if($v->validation == 'required')
                                                           <span class="text-danger">*</span>  @endif </label>
                                                   <br>

                                                   <div class="fileinput fileinput-new " data-provides="fileinput">
                                                       <div class="fileinput-new thumbnail "
                                                            data-trigger="fileinput">
                                                           <img class="w-150px "
                                                                src="{{ getFile(config('location.default')) }}"
                                                                alt="...">
                                                       </div>
                                                       <div
                                                           class="fileinput-preview fileinput-exists thumbnail wh-200-150 "></div>

                                                       <div class="img-input-div">
                                                                <span class="btn btn-success btn-file">
                                                                    <span
                                                                        class="fileinput-new "> @lang('Select') {{$v->field_level}}</span>
                                                                    <span
                                                                        class="fileinput-exists"> @lang('Change')</span>
                                                                    <input type="file" name="{{$k}}" value="{{ old($k) }}" accept="image/*"
                                                                           @if($v->validation == "required") required @endif>
                                                                </span>
                                                           <a href="#" class="btn btn-danger fileinput-exists"
                                                              data-dismiss="fileinput"> @lang('Remove')</a>
                                                       </div>

                                                   </div>

                                                   @error($k)
                                                   <div class="error-massage-alt  text-danger">
                                                       <span>{{trans($message)}}</span>
                                                   </div>
                                                   @enderror
                                               </div>
                                           @endif
                                       @endforeach
                                   @endif
                                   <button type="submit" class="btn btn-primary w-100">{{trans('Confirm Now')}}</button>


                       </div>

                   </div>

               </form>
           </div>
    </div>

@endsection

@push('css-lib')
    <link rel="stylesheet" href="{{asset($themeTrue.'css/bootstrap-fileinput.css')}}">
@endpush

@push('extra-js')
    <script src="{{asset($themeTrue.'js/bootstrap-fileinput.js')}}"></script>
@endpush





