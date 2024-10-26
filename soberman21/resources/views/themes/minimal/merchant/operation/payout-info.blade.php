@extends($theme.'layouts.merchant')
@section('title',trans($page_title))
@section('content')
    <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">
                    <div class="card shadow">
                        <div class="card-body">
                        
                            <div id="full-print-form-layout" class="tr6-form whtr-form">

                                <div class="">
                                    <div class="site-title-left">
                                        <small>{{config('basic.site_title')}}<br></small>
                                    </div>
                                    <div class="site-title-right">
                                        <small><b>{{Request::getHost()}}</b></small>
                                        <br>
                                        
                                        <a href="javascript:void(0)" class="btn btn-primary print-btn">Print</a>
                                         <!--<a href="{{route('user.merchant.payout-money-emailsent',@$invoice['Transaction'])}}" class="btn btn-primary">Send Email</a>-->
                                    </div>

                                </div><!-- end form-header -->

                                <div class="form-inputs pt-0" id="certDeduct">
                                    <div class="page6 ">
                                        <div class="form-sub-header">
                                            <h2 class="sub-title mb-0">{{config('basic.site_title')}}<br><br></h2>
                                            <p class="mt-0 mb-30"><small>{{@$contact['address']}}
                                                    <br>{{trans('Email')}}: {{@$contact['email']}}
                                                    <br>{{trans('Phone')}}: {{@$contact['phone']}}</small></p>
                                        </div>


                                        <h3 class="sub-title mb-0 text-center">{{trans('Payment Receipt')}}<br><br></h3>

                                        <div class="table-responsive">

                                            <table class="table table-bordered table-striped">
                                                <tr>
                                                     <td>{{trans('Transaction')}}</td>
                                                    <td class="font-weight-bold">{{@$invoice['Transaction']}}</td>
                                                </tr>

                                                <tr>
                                                    <td>{{trans('Status')}}</td>
                                                    <td class="font-weight-bold">
                                                        <span class="badge bg-info text-white">{{@$invoice['Status']}}</span>
                                                    </td>
                                                </tr>

                                                <tr>
                                                     <td>{{trans('Transaction Date')}}</td>
                                                    <td>{{@$invoice['TransactionDate']}}</td>
                                                </tr>

                                                <tr>
                                                     <td>{{trans('Service')}}</td>
                                                    <td>{{@$invoice['Service']}}</td>
                                                </tr>

                                                <tr>
                                                     <td>{{trans('Service Provider')}}</td>
                                                    <td>{{@$invoice['ServiceProvider']}}</td>
                                                </tr>

                                                <tr>
                                                     <td>{{trans('Send Amount')}}</td>
                                                    <td>{{@$invoice['SendAmount']}}</td>
                                                </tr>

                                                <tr>
                                                     <td>{{trans('Fees')}}</td>
                                                    <td>{{@$invoice['Fees']}}</td>
                                                </tr>
                                                @if(!empty($invoice['discountYes']))
                                                    <tr>
                                                         <td>{{trans('Discount')}}</td>
                                                        <td>{{@$invoice['Discount']}} </td>
                                                    </tr>
                                                @endif
                                                <tr>
                                                     <td>{{trans('Total Send Amount')}}</td>
                                                    <td class="font-weight-bold">{{@$invoice['TotalSendAmount']}}</td>
                                                </tr>
                                                <tr>
                                                     <td>{{trans('Recipient Amount')}}</td>
                                                    <td class="font-weight-bold">{{@$invoice['RecipientAmount']}}</td>
                                                </tr>

                                                <tr>
                                                     <td>{{trans('Rate')}}</td>
                                                    <td>{{@$invoice['Rate']}}</td>
                                                </tr>
                                                <tr>
                                                    <td  colspan="2"
                                                        class="sender-info">{{trans('Sender Information')}}</td>
                                                </tr>
                                                <tr>
                                                     <td>{{trans('Name')}}</td>
                                                    <td>{{@$invoice['Sender']['Name']}}</td>
                                                </tr>
                                                <tr>
                                                     <td>{{trans('Phone')}}</td>
                                                    <td>{{@$invoice['Sender']['Phone']}}</td>
                                                </tr>
                                                <tr>
                                                     <td>{{trans('Address')}}</td>
                                                    <td>{{@$invoice['Sender']['Address']}}</td>
                                                </tr>

                                                <tr>
                                                     <td>{{trans('Funding Source')}}</td>
                                                    <td>{{@$invoice['FundingSource']}}</td>
                                                </tr>
                                                <tr>
                                                     <td>{{trans('Sending Purpose')}}</td>
                                                    <td>{{@$invoice['SendingPurpose']}}</td>
                                                </tr>
                                                <tr>
                                                    <td  colspan="2"
                                                        class="sender-info">{{trans('Recipient Information')}}</td>
                                                </tr>
                                                <tr>
                                                     <td>{{trans("Family / Friend's Name")}}</td>
                                                    <td>{{@$invoice['Recipient']['Name']}}</td>
                                                </tr>
                                                <tr>
                                                     <td>{{trans('Email')}}</td>
                                                    <td>{{@$invoice['Recipient']['Email']}}</td>
                                                </tr>
                                                <tr>
                                                     <td>{{trans('Phone')}}</td>
                                                    <td>{{@$invoice['Recipient']['Phone']}}</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div><!-- form-inputs -->
                            </div>

                            @if($sendMoney->status == '2')
                            <div class="form-group">
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#btn_add" type="button"><i class="fa fa-check-circle"></i> {{trans('Payout Now')}}</button>
                            </div>
                            @endif

                        </div>
                    </div>
                </div>
            </div>

    </div>


    <div class="modal  fade " id="btn_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content ">
                <form action="{{route('user.merchant.payout-money.payoutRequestConfirm',$sendMoney)}}" method="post">
                    @csrf
                    @method('put')
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel"><i class="fa fa-check-circle"></i> {{trans('Payout Confirmation')}}
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">×</span></button>
                    </div>


                    <div class="modal-body">
                        <p class="font-weight-bold">{{trans('Are you sure to payout this?')}}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-dismiss="modal">
                            {{trans('Close')}}
                        </button>
                        <button type="submit" class="btn btn-primary"> {{trans('Confirm')}}</button>
                    </div>

                </form>

            </div>
        </div>
    </div>

@endsection


@push('css-lib')
@endpush

@push('extra-js')
<script type="text/javascript" src="{{asset('assets/js/printthis.js')}}"></script>
<script type="text/javascript">
	$('.print-btn').click(function(){
		$('#full-print-form-layout').printThis({
		    importCSS: true,
		    loadCSS: "",
		    header: ""
		});
		
	})
</script>

@endpush

@push('style')
    <style>
    @media print
    {
    	.print-btn
    	{
    		display : none
    	}
    }
        #full-print-form-layout {
            display: block;
            overflow: hidden;
            width: 100%;
            margin: 0 auto;
            padding: 0 !important;
            background: #fff;
            margin-top: 50px;
        }

        .subheader-right-copy-type ul li {
            display: block;
            float: left;
            border: 1px dotted #000;
            padding: 10px;
            margin: 0;
        }

        .subheader-right-copy-type ul li:nth-child(2n) {
            border-left: 0;
            border-right: 0;
        }

        .form-details input {
            border: none;
            border-bottom: 2px dotted #000;
        }


        ul.list-box li {
            display: block;
            width: 30px;
            height: 35px;
            border: 1px solid #000;
            font-size: 20px;
            line-height: 33px;
            padding: 2px;
            float: left;
            margin-right: 2px;
        }



        .other-pages {
            page-break-before: always;
        }

        .site-title-left {
            width: 300px;
            float: left;
            text-align: center;
        }

        .site-title-right {
            width: 300px;
            float: right;
            text-align: center;
        }

        .pt-0 {
            padding-top: 0;
        }

        .form-sub-header {
            display: block;
            overflow: hidden;
            margin-top: 50px;
            margin-bottom: 0px;
            width: 100%;
            text-align: center
        }

        .mt-0 {
            margin-top: 0;
        }

        .mb-0 {
            margin-bottom: 0;
        }

        .mb-30 {
            margin-bottom: 30px;
        }

        .font-weight-bold {
            font-weight: bold;
        }

        .text-center {
            text-align: center;
        }

        .sender-info {
            text-align: center;
            color: #21446f;
            font-size: 18px;
        }


        @media print {
            .page-break {
                page-break-before: always;
            }
        }
        @media screen and (max-width: 991px) {
            .table-striped tbody td:nth-of-type(odd) {
                text-align: left;
            }
            .table-striped tbody td:nth-of-type(even) {
                text-align: left;
            }

            table tr {
                clear: both;
            }
            .table td.sender-info{
                width: 100%;
                float: none;
                text-align: center;
            }
            .table td {
                /* max-width: 100%; */
                width: 50%;
                float: left;
            }
        }

    </style>
@endpush
