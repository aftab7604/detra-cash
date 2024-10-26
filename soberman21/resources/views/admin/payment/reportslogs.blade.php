@extends('admin.layouts.app')
@section('title',trans($page_title))
@section('content')
    <div class="page-header card card-primary m-0 m-md-4 my-4 m-md-0 p-5 shadow">
        <form action="{{ route('admin.payment.searchreport') }}" method="get">
            <div class="row justify-content-between ">
                <div class="col-md-6 col-lg-2">
                    <div class="form-group">
                        <select name="date_range" class="form-control date_range_selection">
                            <option value="-1" @if(@request()->date_range == '-1') selected @endif>@lang('Select Date Range')</option>
                            <option value="Today" @if(@request()->date_range == 'Today') selected @endif>@lang('Today')</option>
                            <option value="Yesterday" @if(@request()->date_range == 'Yesterday') selected @endif>@lang('Yesterday')</option>
                            <option value="7 Days" @if(@request()->date_range == '7 Days') selected @endif>@lang('Last 7 Days')</option>
                            <option value="30 Days" @if(@request()->date_range == '30 Days') selected @endif>@lang('Last 30 Days')</option>
                            <option value="Month" @if(@request()->date_range == 'Month') selected @endif>@lang('This Month')</option>
                            <option value="Last" @if(@request()->date_range == 'Last') selected @endif>@lang('Last Month')</option>
                            <option value="Custom" @if(@request()->date_range == 'Custom') selected @endif>@lang('Custom range')</option>
                        </select>
                        
                    </div>
                </div>
                

                <div class="col-md-6 col-lg-2">
                    <div class="form-group">
                        <select name="currency" class="form-control">
                            <option value="-1"
                                    @if(@request()->status == '-1') selected @endif>@lang('All Currency')</option>
                             @foreach($currency as $key => $curs)        
                            <option value="{{$curs->code}}"
                                    @if(@request()->currency == $curs->code) selected @endif>{{$curs->code}}</option>
                            @endforeach;
                            
                        </select>
                    </div>
                </div>
                <div class="col-md-6 col-lg-2">
                    <div class="form-group">
                        <select name="status" class="form-control">
                            <option value="-1"
                                    @if(@request()->status == '-1') selected @endif>@lang('All Payment')</option>
                            <option value="1"
                                    @if(@request()->status == '1') selected @endif>@lang('Complete Payment')</option>
                            <option value="2"
                                    @if(@request()->status == '2') selected @endif>@lang('Pending Payment')</option>
                            <option value="3"
                                    @if(@request()->status == '3') selected @endif>@lang('Cancel Payment')</option>
                        </select>
                    </div>
                </div>
                <style>
                    .form-control::placeholder {
                        color: #4F5467;
                    }
                </style>
                <div class="col-md-6 col-lg-2">
                    <div class="form-group">
                        <input type="text" class="form-control" name="username" placeholder="username">
                    </div>
                </div>
				<div class="col-md-6 col-lg-2">
                    <div class="form-group">
                        <button type="submit" class="btn btn-block btn-primary"><i
                                class="fas fa-search"></i> @lang('Search')</button>
                    </div>
                </div>
               @php 
               $query_string = $_SERVER['QUERY_STRING'] ?? '';
               @endphp
               @if($query_string != '')
                <div class="col-md-6 col-lg-3">
                    <div class="form-group">
                        <a href="{{ route('admin.payment.genratepdfreport') }}?{{$query_string}}" class="btn btn-block btn-primary" target="_blank"><i
                                class="fas fa-search"></i> @lang('Download PDF')</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="form-group">
                        <a href="{{ route('admin.payment.genrateexcelreport') }}?{{$query_string}}" class="btn btn-block btn-primary" target="_blank"><i
                                class="fas fa-search"></i> @lang('Download CSV')</a>
                    </div>
                </div>
                @endif
                <div class="display_date_section" @if(@request()->date_range != 'Custom') style="display: none" @endif>
                	<div class="col-md-12">
	            		<div class="input-group input-daterange">
						     <input type="date" class="form-control" value="{{@request()->from_date ? @request()->from_date : ''}}" name="from_date" id="datepicker"/>
						    <span class="input-group-addon">to</span>
						     <input type="date" class="form-control" value="{{@request()->to_date ? @request()->to_date : ''}}" name="to_date" id="datepicker"/>
						</div>
	            	</div>
                </div>
            	
            
                


                
            </div>
        </form>

    </div>


    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">

            <div class="table-responsive">
                <table class="categories-show-table table table-hover table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">@lang('Date')</th>
                        <th scope="col">@lang('Trx Number')</th>
                        <th scope="col">@lang('Username')</th>
                        <th scope="col">@lang('Method')</th>
                        <th scope="col">@lang('Amount')</th>
                        <th scope="col">@lang('Charge')</th>
                        <th scope="col">@lang('Payable')</th>
                        <th scope="col">@lang('Status')</th>

                        @if(adminAccessRoute(config('role.payment_log_report.access.edit')))
                        <th scope="col">@lang('Action')</th>
                        @endif
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($funds as $key => $fund)
                        <tr>
                            <td data-label="@lang('Date')"> {{ dateTime($fund->created_at,'d M,Y H:i') }}</td>
                            <td data-label="@lang('Trx Number')"
                                class="font-weight-bold text-uppercase">{{ $fund->transaction }}</td>
                            <td data-label="@lang('Username')"><a
                                    href="{{route('admin.user-edit', $fund->user_id)}}"
                                    target="_blank">{{ optional($fund->user)->username }}</a>
                            </td>
                            <td data-label="@lang('Method')">{{ optional($fund->gateway)->name }}</td>
                            <td data-label="@lang('Amount')"
                                class="font-weight-bold">{{ getAmount($fund->amount, config('basic.fraction_number')) }} {{ $basic->currency }}</td>
                            <td data-label="@lang('Charge')"
                                class="text-danger">{{ getAmount($fund->charge,config('basic.fraction_number'))}} {{ $basic->currency }}</td>
                            <td data-label="@lang('Payable')"
                                class="font-weight-bold">{{ getAmount($fund->final_amount,config('basic.fraction_number')) }} {{($fund->gateway_currency=="EURO"?"EUR":$fund->gateway_currency)}}</td>


                            <td data-label="@lang('Status')">
                                @if($fund->status == 2)
                                    <span class="badge badge-warning badge-pill">@lang('Pending')</span>
                                @elseif($fund->status == 1)
                                    <span class="badge badge-success badge-pill">@lang('Approved')</span>
                                @elseif($fund->status == 3)
                                    <span class="badge badge-danger badge-pill">@lang('Rejected')</span>
                                @endif
                            </td>
                            @if(adminAccessRoute(config('role.payment_log_report.access.edit')))
                            <td data-label="@lang('Action')">
                                @php
                                    if($fund->detail){
                                            $details =[];
                                              foreach($fund->detail as $k => $v){
                                                    if($v->type == "file"){
                                                        $details[kebab2Title($k)] = [
                                                            'type' => $v->type,
                                                            'field_name' => getFile(config('location.deposit.path').date('Y',strtotime($fund->created_at)).'/'.date('m',strtotime($fund->created_at)).'/'.date('d',strtotime($fund->created_at)) .'/'.$v->field_name)
                                                            ];
                                                    }else{
                                                        $details[kebab2Title($k)] =[
                                                            'type' => $v->type,
                                                            'field_name' => $v->field_name
                                                        ];
                                                    }
                                              }
                                        }else{
                                            $details = null;
                                        }
                                @endphp

                                @if($fund->gateway_id > 999)
                                <button
                                    class="edit_button   btn  {{($fund->status == 2) ?  'btn-primary' : 'btn-success'}} text-white  btn-sm "
                                    data-toggle="modal" data-target="#myModal"
                                    data-title="{{($fund->status == 2) ?  trans('Edit') : trans('Details')}}"

                                    data-id="{{ $fund->id }}"
                                    data-feedback="{{ $fund->feedback }}"
                                    data-info="{{json_encode($details)}}"
                                    data-amount="{{ getAmount($fund->amount)}} {{ $basic->currency }}"
                                    data-username="{{ optional($fund->user)->username }}"
                                    data-route="{{route('admin.payment.action',$fund->id)}}"
                                    data-status="{{$fund->status}}">

                                    @if(($fund->status == 2))
                                        <i class="fa fa-pencil-alt"></i>
                                    @else
                                        <i class="fa fa-eye"></i>
                                    @endif

                                </button>
                                @else
                                    -
                                @endif
                            </td>
                            @endif
                        </tr>
                    @empty
                        <tr>
                            <td colspan="100%">
                                <p class="text-dark">@lang('No Data Found')</p>
                            </td>
                        </tr>

                    @endforelse
                    </tbody>
                </table>
                {{ $funds->appends($_GET)->links('partials.pagination') }}
            </div>
        </div>
    </div>



    <!-- Modal for Edit button -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Deposit Information')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <form role="form" method="POST" class="actionRoute" action="" enctype="multipart/form-data">
                    @csrf
                    @method('put')
                    <div class="modal-body">
                        <ul class="list-group withdraw-detail">
                        </ul>

                        <div class="get-feedback">

                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                        @if(Request::routeIs('admin.payment.pending'))
                            <input type="hidden" class="action_id" name="id">
                            <button type="submit" class="btn btn-primary" name="status"
                                    value="1">@lang('Approve')</button>
                            <button type="submit" class="btn btn-danger" name="status"
                                    value="3">@lang('Reject')</button>
                        @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
    <style type="text/css">
    .input-group-addon
    {
    	font-size: 20px;
	    font-weight: bold;
	    line-height: 35px;
	    margin-left: 20px;
	    margin-right: 20px;
	    text-transform: uppercase;

    }
    </style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/css/bootstrap-datepicker.min.css" />
@endsection

@push('js')
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.14.1/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.1/js/bootstrap-datepicker.min.js"></script>
    <script>

        $(document).ready(function () {

            "use strict";
            $(document).on("click", '.edit_button', function (e) {
                var id = $(this).data('id');
                var feedback = $(this).data('feedback');

                $(".action_id").val(id);
                $(".actionRoute").attr('action', $(this).data('route'));
                var details = Object.entries($(this).data('info'));
                var list = [];
                details.map(function (item, i) {
                    if (item[1].type == 'file') {
                        var singleInfo = `<br><img src="${item[1].field_name}" alt="..." class="w-100">`;
                    } else {
                        var singleInfo = `<span class="font-weight-bold ml-3">${item[1].field_name}</span>  `;
                    }
                    list[i] = ` <li class="list-group-item"><span class="font-weight-bold "> ${item[0].replace('_', " ")} </span> : ${singleInfo}</li>`
                });
                $('.withdraw-detail').html(list);

                if (feedback == '') {
                    var $res = `<div class="form-group"><br>
                                <label class="font-weight-bold">{{trans('Send You Feedback')}}</label>
                                <textarea name="feedback" class="form-control" row="3" required>{{old('feedback')}}</textarea>
                            </div>`
                } else {
                    var $res = `<h5>{{trans('Feedback')}}</h5>
                    <p>${feedback}</p>`
                }

                $('.get-feedback').html($res)
            });
        });
        
        $('.date_range_selection').change(function(){
        	var value = $(this).val();
        	if(value == 'Custom')
        	{
        		$('.display_date_section').show();
        	}else
        	{
        		$('.display_date_section').hide();
        	}
        	
        })
        
    </script>
@endpush
