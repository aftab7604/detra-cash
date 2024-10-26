 <!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <title>{{config('basic.site_title')}}</title>

    <link rel="shortcut icon" href="{{getFile(config('location.logoIcon.path').'favicon.png') }}" type="image/x-icon">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta property="og:title" content="">
    <meta property="og:type" content="">
    <meta property="og:url" content="">
    <meta property="og:image" content="">

    <meta name="theme-color" content="#fafafa">
    <style type="text/css">
        body {
            font-size: 14px;
            line-height: 1.3;
            background: #fff;
            font-family:  'Montserrat', sans-serif !important;
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
        table{
            width:100%;
            border-collapse:collapse;
            text-align:center;
            border:1px solid #535353;
            font-size:12px;
        }
        th{background:#EEE;width:auto; text-align:center; padding:5px 0;border:1px solid #535353;}
        td{width:auto; text-align:center; padding:5px 0;border:1px solid #535353;}
        tr:nth-child(even) {background: #EEE;}
        .other-pages {
            page-break-before: always;
        }

        .site-title-left{
            width: 300px;float: left;text-align: center;
        }
        .site-title-right{
            width: 300px;float: right;text-align: center;
        }
        .pt-0{
            padding-top: 0;
        }
        .form-sub-header{
            display: block;overflow: hidden;margin-top: 50px;margin-bottom:0px;width: 100%;text-align: center
        }
        .mt-0{
            margin-top: 0;
        }
        .mb-0{
            margin-bottom: 0;
        }
        .mb-30{
            margin-bottom: 30px;
        }

        .font-weight-bold{
            font-weight: bold;
        }
        .text-center{
            text-align: center;
        }
        .sender-info{
            text-align: center;color: #21446f; font-size: 18px;
        }
        .w-100{
            width: 100%;
        }
        .w-50{
            width: 50%;
        }
        .valign-top{
            valign:top;
        }
        @media print {
            .page-break {
                page-break-before: always;
            }
        }
    </style>
</head>

<body>

<!-- Add your site or application content here -->
<section id="full-print-form-layout" class="tr6-form whtr-form" >

    <div class="">
        <div class="site-title-left">
            <small>{{config('basic.site_title')}}<br></small>
        </div>
        <div class="site-title-right">
            <small><b>{{Request::getHost()}}</b></small>
        </div>

    </div><!-- end form-header -->
     <div class="form-inputs pt-0" id="certDeduct">
        <div class="page6 ">
            <div class="form-sub-header">
                <h2 class="sub-title mb-0">{{config('basic.site_title')}}<br><br></h2>
                <p class="mt-0 mb-30" ><small>{{@$contact['address']}}
                        <br>{{trans('Email')}}: {{@$contact['email']}}
                        <br>{{trans('Phone')}}: {{@$contact['phone']}}</small></p>
            </div>
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

                       
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($funds as $key => $fund)
                        <tr>
                            <td data-label="@lang('Date')"> {{ dateTime($fund->created_at,'d M,Y H:i') }}</td>
                            <td data-label="@lang('Trx Number')"
                                class="font-weight-bold text-uppercase">{{ $fund->transaction }}</td>
                            <td data-label="@lang('Username')">{{ optional($fund->user)->username }}
                            </td>
                            <td data-label="@lang('Method')">{{ optional($fund->gateway)->name }}</td>
                            <td data-label="@lang('Amount')"
                                class="font-weight-bold">{{ getAmount($fund->amount, config('basic.fraction_number')) }} {{ $basic->currency }}</td>
                            <td data-label="@lang('Charge')"
                                class="text-danger">{{ getAmount($fund->charge,config('basic.fraction_number'))}} {{ $basic->currency }}</td>
                            <td data-label="@lang('Payable')"
                                class="font-weight-bold">{{ getAmount($fund->final_amount,config('basic.fraction_number')) }} {{$fund->gateway_currency}}</td>


                            <td data-label="@lang('Status')">
                                @if($fund->status == 2)
                                    <span class="badge badge-warning badge-pill">@lang('Pending')</span>
                                @elseif($fund->status == 1)
                                    <span class="badge badge-success badge-pill">@lang('Approved')</span>
                                @elseif($fund->status == 3)
                                    <span class="badge badge-danger badge-pill">@lang('Rejected')</span>
                                @endif
                            </td>
                            
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
                </div>
                
                  </div>
    </div><!-- form-inputs -->
</section>
