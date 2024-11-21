@extends('admin.layouts.app')
@section('title',trans($page_title))
@section('content')

    <div class="container-fluid">
        @if(isset($reloadlyAccount) && !empty($reloadlyAccount))
        <div class="row">
            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <div class="card shadow border-right">
                    <div class="card-body">
                        <div class="d-flex d-lg-flex d-md-block align-items-center">
                            <div>
                                <div class="d-inline-flex align-items-center">
                                    <h5 class="text-dark mb-1 font-weight-medium">{{number_format($reloadlyAccount->balance)}} {{@$reloadlyAccount->currencyCode}}</h5>
                                </div>
                                <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate"> @lang('Your Reloadly Wallet')</h6>
                            </div>
                            <div class="ml-auto mt-md-3 mt-lg-0">
                                <span class="opacity-7 text-muted"><i class="fa fa-mobile-alt fa-2x"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endif

        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            @if(isset($exactServices['ussd']))
                                @php
                                    $exactServices['ussd']["account_bank"]['value']  = (optional(@$sendMoney->provider)->bank_code)??'';
                                    $exactServices['ussd']["amount"]['value'] = round($sendMoney->recipient_get_amount,0);
                                    $exactServices['ussd']["currency"]['value'] = @$sendMoney->receive_curr;
                                    $exactServices['ussd']["email"]['value'] = @$sendMoney->recipient_email;
                                    $exactServices['ussd']["phone_number"]['value'] = clean(@$sendMoney->recipient_contact_no);
                                    $exactServices['ussd']["fullname"]['value'] = @$sendMoney->user_information->BeneficiaryName->field_name ??$sendMoney->recipient_name;
                                @endphp
                            @endif

                            @if(isset($exactServices['debit_ng_account']))
                                @php
                                    $exactServices['debit_ng_account']["amount"]['value'] = round($sendMoney->recipient_get_amount,0);
                                    $exactServices['debit_ng_account']["account_bank"]['value']  = (optional(@$sendMoney->provider)->bank_code)??'';
                                    $exactServices['debit_ng_account']["account_number"]['value'] = @$sendMoney->user_information->AccountNumber->field_name;
                                    $exactServices['debit_ng_account']["currency"]['value'] = @$sendMoney->receive_curr;
                                    $exactServices['debit_ng_account']["email"]['value'] = @$sendMoney->recipient_email;
                                    $exactServices['debit_ng_account']["phone_number"]['value'] = clean(@$sendMoney->recipient_contact_no);
                                    $exactServices['debit_ng_account']["fullname"]['value'] = @$sendMoney->user_information->BeneficiaryName->field_name ??$sendMoney->recipient_name;
                                @endphp
                            @endif


                            @php
                                $banks = [];
                            @endphp

                            @if(isset($exactServices['transfers']))
                                @php
                                    $exactServices['transfers']["account_bank"]['value']  = (optional(@$sendMoney->provider)->bank_code)??'';
                                    $exactServices['transfers']["account_number"]['value'] = @$sendMoney->user_information->AccountNumber->field_name;
                                    $exactServices['transfers']["amount"]['value'] = round($sendMoney->recipient_get_amount,0);
                                    $exactServices['transfers']["narration"]['value'] = @$sendMoney->user_information->BeneficiaryName->field_name ??$sendMoney->recipient_name;
                                    $exactServices['transfers']["currency"]['value'] = @$sendMoney->receive_curr;
                                    $exactServices['transfers']["debit_currency"]['value'] = @$sendMoney->receive_curr;
                                    $exactServices['transfers']["phone_number"]['value'] = clean(@$sendMoney->recipient_contact_no);

                                    $banks['account_number'] = @$sendMoney->user_information->AccountNumber->field_name;
                                    $banks['account_bank'] =  (optional(@$sendMoney->provider)->bank_code)??'';
                                @endphp

                            @endif

                            @if(isset($exactServices['mobile_money_ghana']))
                                @php
                                    $exactServices['mobile_money_ghana']["amount"]['value'] = round($sendMoney->recipient_get_amount,0);
                                    $exactServices['mobile_money_ghana']["currency"]['value'] = @$sendMoney->receive_curr;
                                    $exactServices['mobile_money_ghana']["voucher"]['value'] = @$sendMoney->invoice;
                                    $exactServices['mobile_money_ghana']["email"]['value'] = @$sendMoney->recipient_email;
                                    $exactServices['mobile_money_ghana']["phone_number"]['value'] = clean(@$sendMoney->recipient_contact_no);
                                    $exactServices['mobile_money_ghana']["fullname"]['value'] = @$sendMoney->user_information->BeneficiaryName->field_name ??$sendMoney->recipient_name;
                                @endphp
                            @endif
                            @if(isset($exactServices['mobile_money_zambia']))
                                @php
                                    $exactServices['mobile_money_zambia']["amount"]['value'] = round($sendMoney->recipient_get_amount,0);
                                    $exactServices['mobile_money_zambia']["currency"]['value'] = @$sendMoney->receive_curr;
                                    $exactServices['mobile_money_zambia']["email"]['value'] = @$sendMoney->recipient_email;
                                    $exactServices['mobile_money_zambia']["phone_number"]['value'] = clean(@$sendMoney->recipient_contact_no);
                                @endphp
                            @endif


                            @if(isset($exactServices['mobile_money_uganda']))
                                @php
                                    $exactServices['mobile_money_uganda']["amount"]['value'] = round($sendMoney->recipient_get_amount,0);
                                    $exactServices['mobile_money_uganda']["currency"]['value'] = @$sendMoney->receive_curr;
                                    $exactServices['mobile_money_uganda']["email"]['value'] = @$sendMoney->recipient_email;
                                    $exactServices['mobile_money_uganda']["phone_number"]['value'] = clean(@$sendMoney->recipient_contact_no);
                                @endphp
                            @endif

                            @if(isset($exactServices['mobile_money_rwanda']))
                                @php
                                    $exactServices['mobile_money_rwanda']["amount"]['value'] = round($sendMoney->recipient_get_amount,0);
                                    $exactServices['mobile_money_rwanda']["currency"]['value'] = @$sendMoney->receive_curr;
                                    $exactServices['mobile_money_rwanda']["email"]['value'] = @$sendMoney->recipient_email;
                                    $exactServices['mobile_money_rwanda']["phone_number"]['value'] = clean(@$sendMoney->recipient_contact_no);
                                    $exactServices['mobile_money_rwanda']["fullname"]['value'] = @$sendMoney->user_information->BeneficiaryName->field_name ??$sendMoney->recipient_name;
                                @endphp
                            @endif

                            @if(isset($exactServices['debit_uk_account']))
                                @php
                                    $exactServices['debit_uk_account']["account_bank"]['value']  = (optional(@$sendMoney->provider)->bank_code)??'';
                                    $exactServices['debit_uk_account']["account_number"]['value'] = @$sendMoney->user_information->AccountNumber->field_name ??'';
                                    $exactServices['debit_uk_account']["amount"]['value'] = round($sendMoney->recipient_get_amount,0);
                                    $exactServices['debit_uk_account']["currency"]['value'] = @$sendMoney->receive_curr;
                                    $exactServices['debit_uk_account']["email"]['value'] = @$sendMoney->recipient_email;
                                    $exactServices['debit_uk_account']["phone_number"]['value'] = clean(@$sendMoney->recipient_contact_no);
                                    $exactServices['debit_uk_account']["fullname"]['value'] = @$sendMoney->user_information->BeneficiaryName->field_name ??$sendMoney->recipient_name;
                                @endphp
                            @endif


                            @if(isset($exactServices['mpesa']))
                                @php
                                    $exactServices['mpesa']["amount"]['value'] = round($sendMoney->recipient_get_amount,0);
                                    $exactServices['mpesa']["currency"]['value'] = @$sendMoney->receive_curr;
                                    $exactServices['mpesa']["email"]['value'] = @$sendMoney->recipient_email;
                                    $exactServices['mpesa']["phone_number"]['value'] = clean(@$sendMoney->recipient_contact_no);
                                    $exactServices['mpesa']["fullname"]['value'] = @$sendMoney->user_information->BeneficiaryName->field_name ??$sendMoney->recipient_name;
                                @endphp
                            @endif
                        </div>


                        <div class="d-flex justify-content-between">

                            <h4 class="card-title">{{trans('Transaction Information')}}
                            </h4>
                            @if(adminAccessRoute(config('role.remittance_history_pending_recharge.access.edit')))
                                <div class="">
                                    @if(isset($exactServices))
                                        @foreach($exactServices as $key => $serves)
                                            <button name="{{$key}}"
                                                    @foreach($serves as $form_name => $attr)
                                                    data-{{$form_name}}="{{json_encode($attr)}}"
                                                    @endforeach
                                                    data-toggle="modal" data-target="#flutterModal"
                                                    class="btn btn-dark btn-sm mb-2 attemptBtn"><i
                                                    class="fa fa-hand-holding"></i>
                                                {{strtoupper(str_replace('_',' ',$key))}}</button>

                                        @endforeach
                                    @endif

                                    @if($sendMoney->status == 2 && $sendMoney->payment_status == 1)
                                        @if($sendMoney->status == 2 && $sendMoney->payment_status == 1  && $sendMoney->service_id == '1')
                                            <button data-toggle="modal" data-target="#recharge"
                                                    class="btn btn-success btn-sm mb-2"><i
                                                    class="fa fa-mobile-alt"></i> {{trans('Recharge Now')}}</button>
                                        @endif
                                        <button data-toggle="modal" data-target="#myModal"
                                                class="btn btn-primary btn-sm  mb-2"><i
                                                class="fa fa-check-circle"></i> {{trans('Action')}}</button>
                                    @elseif($sendMoney->status == 2 && $sendMoney->payment_status == 3)
                                        @if($sendMoney->status == 2 && $sendMoney->payment_status == 3  && $sendMoney->service_id == '1')
                                        <button data-toggle="modal" data-target="#recharge"
                                                class="btn btn-success btn-sm mb-2"><i
                                                class="fa fa-mobile-alt"></i> {{trans('Recharge Now')}}</button>
                                        @endif
                                        <button data-toggle="modal" data-target="#myModal"
                                                class="btn btn-primary btn-sm  mb-2"><i
                                                class="fa fa-check-circle"></i> {{trans('Action')}}</button>
                                    @endif


                                        @if(!empty($banks))
                                            <button
                                                data-account_number="account_number"
                                                data-account_bank="account_bank"
                                                data-toggle="modal" data-target="#verifyModal"
                                                class="btn btn-success btn-sm  mb-2"><i
                                                    class="fa fa-sync-alt"></i> {{trans('Verify Account')}}</button>
                                        @endif
                                </div>
                            @endif

                        </div>

                        <hr>

                        <div class="p-4 border shadow-sm rounded">
                            @if(session()->get('validAccount'))
                                @php
                                    $validAccount= json_decode(session()->get('validAccount'));
                                @endphp
                                <div class="alert alert-{{$validAccount->status == 'error' ? 'danger':'success'}}" role="alert">
                                    <h4 class="alert-heading"><strong>{{snake2Title($validAccount->status)}}</strong>
                                        : {{$validAccount->message}}</h4>
                                    @if($validAccount->data)
                                        @foreach($validAccount->data as $key => $val)
                                            <p><strong>{{snake2Title($key)}}</strong> : {{$val}} </p>
                                            <hr>
                                        @endforeach
                                    @endif
                                </div>
                            @endif


                                @include('admin.transfer.flutterwaveLog')


                            <div class="row">
                                <div class="col-md-4 border-right">
                                    <ul class="list-style-none">
                                        <li class="my-2 border-bottom pb-3">
                                                <span class="font-weight-medium text-dark"><i
                                                        class="icon-info mr-2 text--site"></i> {{trans('Transaction')}}: <small
                                                        class="float-right">{{dateTime($sendMoney->created_at)}}</small></span>

                                        </li>
                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text--site"></i> {{trans('Invoice')}} : <span
                                                        class="font-weight-medium text-dark">{{$sendMoney->invoice}}</a></span></span>
                                        </li>

                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text--site"></i> {{trans('Service')}} : <span
                                                        class="font-weight-medium text-dark">{{optional($sendMoney->service)->name}}</a></span></span>
                                        </li>

                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text--site"></i> {{trans('Service Provider')}} : <span
                                                        class="font-weight-medium text-dark">{{optional($sendMoney->provider)->name}}  {{(optional($sendMoney->provider)->bank_code) ? '('. optional($sendMoney->provider)->bank_code .')' : '-'}} </a></span></span>
                                        </li>



                                        <li class="my-3">
                                            <span><i class="icon-check mr-2 text--site"></i> {{trans('Send Amount')}} : <span>{{getAmount($sendMoney->send_amount, config('basic.fraction_number'))}} @lang($sendMoney->send_curr)</span></span>
                                        </li>
                                        <li class="my-3">
                                                <span><i
                                                        class="icon-check mr-2 text--site"></i> {{trans('Fees')}} : <span>{{getAmount($sendMoney->fees, config('basic.fraction_number'))}} @lang($sendMoney->send_curr)</span></span>
                                        </li>
                                        <li class="my-3">
                                                <span class="font-weight-bold text-dark"><i
                                                        class="icon-check mr-2 text--site"></i> {{trans('Total')}} : <span
                                                        class="font-weight-medium text-info">{{getAmount($sendMoney->payable_amount, config('basic.fraction_number'))}} @lang($sendMoney->send_curr)</span></span>
                                        </li>
                                        @if( 0 <$sendMoney->discount)
                                            <li class="my-3">
                                                    <span><i class="icon-check mr-2 text--site"></i> {{trans('Discount')}} : <span
                                                            class="font-weight-bold text-danger">- {{getAmount($sendMoney->discount, config('basic.fraction_number'))}} @lang($sendMoney->send_curr)</span> @if($sendMoney->promo_code)
                                                            <small class="pl-2 text-dark">{{trans('Promo Code')}} ({{$sendMoney->promo_code}})</small>@endif </span>
                                            </li>
                                        @endif

                                        <li class="my-3">
                                                <span class="font-weight-bold text-dark"><i
                                                        class="icon-check mr-2 text--site"></i> {{trans('Payable')}} : <span
                                                        class="font-weight-medium text-primary">{{getAmount($sendMoney->totalPay, config('basic.fraction_number'))}} @lang($sendMoney->send_curr)</span></span>
                                        </li>


                                        <li class="my-3">
                                                <span class="font-weight-medium text-dark"><i
                                                        class="icon-check mr-2 text--site"></i> {{trans('Receive Amount')}} : <span
                                                        class="font-weight-medium text-success">{{getAmount($sendMoney->recipient_get_amount, config('basic.fraction_number'))}} @lang($sendMoney->receive_curr)</span></span>
                                        </li>


                                        <li class="my-3">
                                            <span><i class="icon-check mr-2 text--site"></i> {{trans('Rate')}} : <span
                                                    class="font-weight-bold">{{trans('1')}} {{$sendMoney->send_curr}} <i
                                                        class="fa fa-exchange-alt text-info px-2"></i> {{getAmount($sendMoney->rate, config('basic.fraction_number'))}} @lang($sendMoney->receive_curr)</span></span>
                                        </li>

                                        <li class="my-3">
                                            <span><i class="icon-check mr-2 text--site"></i> {{trans('Status')}} :

                                                @if($sendMoney->status == 0 && $sendMoney->payment_status == 0)
                                                    <span
                                                        class="badge badge-warning badge-pill">{{trans('Information Need')}}</span>
                                                @elseif($sendMoney->status == 2 && $sendMoney->payment_status == 0)
                                                    <span
                                                        class="badge badge-info badge-pill">{{trans('Not yet pay')}}</span>
                                                @elseif($sendMoney->status == 3 || $sendMoney->payment_status == 2)
                                                    <span
                                                        class="badge badge-danger badge-pill">{{trans('Cancelled')}}</span>
                                                @elseif($sendMoney->status == 1 && $sendMoney->payment_status == 1)
                                                    <span
                                                        class="badge badge-success badge-pill">{{trans('Completed')}}</span>
                                                @elseif($sendMoney->status == 2 && $sendMoney->payment_status == 1)
                                                    <span
                                                        class="badge badge-warning badge-pill">{{trans('Awaiting')}}</span>
                                                @elseif($sendMoney->status == 2 && $sendMoney->payment_status == 3)
                                                    <span
                                                        class="badge badge-dark badge-pill">{{trans('Sent a payment request')}}</span>
                                            @endif
                                        </li>

                                        <li class="my-3">
                                            <span><i class="icon-check mr-2 text--site"></i> {{trans('Payment Status')}} :
                                                @if($sendMoney->payment_status == 1)
                                                    <span
                                                        class="badge badge-success badge-pill ">{{trans('Completed')}}</span>
                                                @elseif($sendMoney->payment_status == 2)
                                                    <span
                                                        class="badge badge-danger badge-pill">{{trans('Cancelled')}}</span>
                                                @elseif($sendMoney->payment_status == 3)
                                                    <span
                                                        class="badge badge-warning badge-pill">{{trans('Payment Pending')}}</span>
                                                @endif</span>
                                        </li>


                                        @if($sendMoney->paid_at)
                                            <li class="my-3">
                                                <span><i class="icon-check mr-2 text--site"></i> {{trans('Paid At')}} : <span
                                                        class="font-weight-bold">{{dateTime($sendMoney->paid_at)}}</span></span>
                                            </li>
                                        @endif
                                        @if($sendMoney->received_at)
                                            <li class="my-3">
                                                <span><i class="icon-check mr-2 text--site"></i> {{trans('Receive At')}} : <span
                                                        class="font-weight-bold">{{dateTime($sendMoney->received_at)}}</span></span>
                                            </li>
                                        @endif
                                    </ul>
                                </div>


                                <div class="col-md-4 border-right">
                                    <ul class="list-style-none ">
                                        <li class="my-2 border-bottom pb-3">
                                                <span class="font-weight-medium text-dark"><i
                                                        class="fa fa-hand-holding-usd mr-2 text-warning"></i> {{trans('Sender Payment Via')}}</span>
                                        </li>

                                        <li class="my-3 ">
                                            <span><i class="icon-check mr-2 text-warning"></i> {{trans('Payment Trx ID')}} : <span
                                                    class="font-weight-medium">{{optional($sendMoney->payment)->transaction}}</span></span>
                                        </li>
                                        <li class="my-3">
                                            <span><i class="icon-check mr-2 text-warning"></i> {{trans('Payment Method')}} : <span
                                                    class="font-weight-medium text-dark">{{optional(optional($sendMoney->payment)->gateway)->name}}</span></span>
                                        </li>
                                        <li class="my-3">
                                            <span><i
                                                    class="icon-check mr-2 text-warning"></i> {{trans('Amount')}} : <span
                                                    class="font-weight-medium text-dark">{{getAmount(optional($sendMoney->payment)->amount, config('basic.fraction_number'))}} {{ $basic->currency }}</span></span>
                                        </li>
                                        <li class="my-3">
                                            <span><i
                                                    class="icon-check mr-2 text-warning"></i> {{trans('Charge')}} : <span
                                                    class="font-weight-medium text-danger">{{getAmount(optional($sendMoney->payment)->charge, config('basic.fraction_number'))}} {{ $basic->currency }}</span></span>
                                        </li>

                                        <li class="my-3">
                                            <span><i
                                                    class="icon-check mr-2 text-warning"></i> {{trans('Payable')}} : <span
                                                    class="font-weight-medium text-primary">{{getAmount(optional($sendMoney->payment)->final_amount, config('basic.fraction_number'))}} {{ $basic->currency }}</span></span>
                                        </li>
                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text-warning"></i> {{trans('Payment Status')}} :
                                                 @if(optional($sendMoney->payment)->status == 2)
                                                        <span class="badge badge-warning">@lang('Pending')</span>
                                                    @elseif(optional($sendMoney->payment)->status == 1)
                                                        <span class="badge badge-success">@lang('Approved')</span>
                                                    @elseif(optional($sendMoney->payment)->status == 3)
                                                        <span class="badge badge-danger">@lang('Rejected')</span>
                                                    @endif
                                            </span>
                                        </li>
                                        <li class="my-3">
                                            <span><i class="icon-check mr-2 text-warning"></i> {{trans('Payment Date')}} : <span
                                                    class="font-weight-medium">{{dateTime(optional($sendMoney->payment)->created_at)}}</span></span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-4 ">
                                    <ul class="list-style-none border-bottom">
                                        <li class="my-2 border-bottom pb-3">
                                                <span class="font-weight-medium text-dark"><i
                                                        class="icon-user mr-2 text-primary"></i> {{trans('Sender')}}:</span>
                                        </li>
                                        <li class="my-3">
                                                <span><i
                                                        class="icon-check mr-2 text-primary"></i> {{trans('Creator')}} : <span
                                                        class="font-weight-bold"><a
                                                            href="{{route('admin.user-edit',$sendMoney->user_id)}}"
                                                            target="_blank"
                                                            class="text-primary d-inline-block">{{$sendMoney->sender_name}}</a></span></span>
                                        </li>
                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text-primary"></i> {{trans('Email')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->sender_email}}</span></span>
                                        </li>

                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text-primary"></i> {{trans('Phone')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->sender_phone}}</span></span>
                                        </li>

                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text-primary"></i> {{trans('Address')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->sender_address}}</span></span>
                                        </li>
                                        @if($sendMoney->sender_city)
                                            <li class="my-3">
                                                <span><i
                                                        class="icon-check mr-2 text-primary"></i> {{trans('City')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->sender_city}}</span></span>
                                            </li>
                                        @endif

                                        @if($sendMoney->sender_post_code)
                                            <li class="my-3">
                                                <span><i class="icon-check mr-2 text-primary"></i> {{trans('Post Code')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->sender_post_code}}</span></span>
                                            </li>
                                        @endif

                                        @if($sendMoney->sender_state)
                                            <li class="my-3">
                                                <span><i class="icon-check mr-2 text-primary"></i> {{trans('State')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->sender_state}}</span></span>
                                            </li>
                                        @endif
                                        @if($sendMoney->sender_country)
                                            <li class="my-3">
                                                <span><i class="icon-check mr-2 text-primary"></i> {{trans('Country')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->sender_country}}</span></span>
                                            </li>
                                        @endif

                                    </ul>
                                    <ul class="list-style-none mt-4">
                                        <li class="my-2 border-bottom pb-3">
                                                <span class="font-weight-medium text-dark"><i
                                                        class="icon-user mr-2 text-success"></i> {{trans('Recipient')}}:</span>
                                        </li>
                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text-success"></i> {{trans("Family / Friend's  Name")}} : <span
                                                        class="font-weight-bold">{{$sendMoney->recipient_name}}</span></span>
                                        </li>

                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text-success"></i> {{trans('Email')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->recipient_email}}</span></span>
                                        </li>
                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text-success"></i> {{trans('Phone')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->recipient_contact_no}}</span></span>
                                        </li>
                                    </ul>
                                </div>


                            </div>
                        </div>


                        @if($sendMoney->sender_address_verification || $sendMoney->sender_address_verification)
                            <div class="p-4 border shadow-sm rounded mt-4">
                                <h4 class="card-title"><i
                                        class="icon-info mr-2 text-primary"></i>{{trans('Sender Identity & Address Information')}}
                                </h4>
                                <hr>
                                <div class="row mb-3">
                                    <div class="col-md-4 ">
                                        <div class="row">
                                            @if($sendMoney->sender_identity_verification != null)
                                                @foreach($sendMoney->sender_identity_verification as $k => $v)
                                                    @if($v->type == 'file')
                                                        <div class="col-md-12 ">
                                                            <div class=" p-4 border shadow rounded mt-4">
                                                             <span
                                                                 class="text-capitalize">{{--camelToWord($k)--}} {{$sendMoney->sender_identity_type}} : <a
                                                                     href="{{route('admin.money-transfer.download',[encrypt($v->file_location."/|".$v->field_name)])}}"
                                                                     class="btn btn-primary btn-sm float-right mb-2"><i
                                                                         class="fa fa-download"></i></a><br>
                                                                 <span class="font-weight-medium text-dark">
                                                                <img
                                                                    src="{{getFile($v->file_location.'/'.$v->field_name)}} "
                                                                    class="w-100" alt="">
                                                    </span></span>
                                                            </div>
                                                        </div>
                                                    @endif
                                                @endforeach
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-md-4 ">
                                        <div class="row">
                                            @if($sendMoney->sender_address_verification != null)
                                                @foreach($sendMoney->sender_address_verification as $k => $v)
                                                    @if($v->type == 'file')
                                                        <div class="col-md-12 ">
                                                            <div class=" p-4 border shadow rounded mt-4">
                                                             <span class="text-capitalize">{{camelToWord($k)}} : <a
                                                                     href="{{route('admin.money-transfer.download',[encrypt($v->file_location."/|".$v->field_name)])}}"
                                                                     class="btn btn-primary btn-sm float-right mb-2"><i
                                                                         class="fa fa-download"></i></a><br>
                                                                 <span class="font-weight-medium text-dark">
                                                                <img
                                                                    src="{{getFile($v->file_location.'/'.$v->field_name)}} "
                                                                    class="w-100" alt="">
                                                    </span></span>
                                                            </div>
                                                        </div>
                                                    @endif
                                                @endforeach
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endif


                        <div class="p-4 border shadow-sm rounded mt-4">
                            <h4 class="card-title"><i
                                    class="icon-info mr-2 text-primary"></i>{{optional($sendMoney->provider)->name}} {{trans('Information')}}
                            </h4>
                            <hr>

                            <div class="row mb-3">
                                @if(0 < count($topUpLogs))
                                <div class="col-md-12 ">
                                    <div class="table-responsive">
                                        <table class="categories-show-table table table-hover table-striped table-bordered">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th scope="col">@lang('Custom Identifier')</th>
                                                <th scope="col">@lang('Status')</th>
                                                <th scope="col" class="w-30">@lang('Response')</th>
                                                <th scope="col">@lang('Date')</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($topUpLogs as $k => $data)
                                                <tr>
                                                    <td data-label="@lang('Custom Identifier')"
                                                        class="font-weight-bold text-uppercase">{{$data->customIdentifier}}</td>
                                                    <td data-label="@lang('Status')">
                                                        @if($data->status == 1)
                                                            <span class="badge badge-success badge-pill">{{trans('Success')}}</span>
                                                        @else
                                                            <span class="badge badge-danger badge-pill">{{trans('Failed')}}</span>
                                                        @endif
                                                    </td>
                                                    <td data-label="@lang('Response')">
                                                        @if(isset(json_decode($data->topup_response)->message))
                                                            <code>{{json_decode($data->topup_response)->message}}</code>
                                                        @endif
                                                    </td>
                                                    <td data-label="@lang('Date')">{{dateTime($data->created_at)}}</td>
                                                </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                @endif

                                <div class="col-md-5 ">
                                    <ul class="list-style-none">
                                        @if($sendMoney->user_information != null)
                                            @foreach($sendMoney->user_information as $k => $v)
                                                @if($v->type != 'file')
                                                    <li class="my-3">
                                                <span><i
                                                        class="icon-check mr-2 text-info"></i> {{camelToWord($k)}} : <span
                                                        class="font-weight-medium text-dark">{{$v->field_name}}</span></span>
                                                    </li>
                                                @endif
                                            @endforeach
                                        @endif
                                    </ul>
                                </div>


                                <div class="col-md-7 ">
                                    <div class="row">
                                        @if($sendMoney->user_information != null)
                                            @foreach($sendMoney->user_information as $k => $v)
                                                @if($v->type == 'file')
                                                    <div class="col-md-6 ">
                                                        <div class=" p-4 border shadow rounded mt-4">
                                                             <span>{{camelToWord($k)}} : <a
                                                                     href="{{route('admin.money-transfer.download',[encrypt($v->file_location."/|".$v->field_name)])}}"
                                                                     class="btn btn-primary btn-sm float-right mb-2"><i
                                                                         class="fa fa-download"></i></a><br>
                                                                 <span class="font-weight-medium text-dark">
                                                                <img
                                                                    src="{{getFile($v->file_location.'/'.$v->field_name)}} "
                                                                    class="w-100" alt="">
                                                    </span></span>
                                                        </div>
                                                    </div>
                                                @endif
                                            @endforeach
                                        @endif
                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="p-4 border shadow-sm rounded mt-4">


                            <div class="row">
                                <div class="col-md-7 border-right">
                                    <ul class="list-style-none">
                                        <li class="my-2 border-bottom pb-3">
                                                <span class="font-weight-bold text-dark"><i
                                                        class="icon-handbag mr-2 text-info"></i> {{trans('Source & Purpose')}}:</span>
                                        </li>
                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text-info"></i> {{trans('Funding Source')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->fund_source}}</span></span>
                                        </li>
                                        <li class="my-3">
                                                <span><i
                                                        class="icon-check mr-2 text-info"></i> {{trans('Purpose')}} : <span
                                                        class="font-weight-bold">{{$sendMoney->purpose}}</span></span>
                                        </li>
                                    </ul>
                                </div>


                                <div class="col-md-5">
                                    <ul class="list-style-none">
                                        <li class="my-2 border-bottom pb-3">
                                                <span class="font-weight-medium text-dark"><i
                                                        class="icon-user-following mr-2 text-success"></i> {{trans('Admin Role')}}:</span>
                                        </li>
                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text-success"></i> {{trans('Attempt by')}} : <span
                                                        class="font-weight-bold">{{optional($sendMoney->admin)->name}}</span></span>
                                        </li>
                                        <li class="my-3">
                                                <span><i class="icon-check mr-2 text-success"></i> {{trans('Admin Response')}} : <span
                                                        class="font-weight-medium text-dark">{{$sendMoney->admin_reply}}</span></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>





    <!-- Modal for Edit button -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Confirmation')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <form role="form" method="POST" action="{{route('admin.money-transfer.action',$sendMoney)}}"
                      enctype="multipart/form-data">
                    @csrf
                    @method('put')
                    <div class="modal-body">
                        <p class="font-weight-medium">{{trans('Are you sure to change this?')}}</p>
                        <div class="form-group mt-3">
                            <label>{{trans('Message')}}</label>
                            <textarea name="admin_reply" id="admin_reply" class="form-control"
                                      rows="2">{{old('admin_reply')}}</textarea>
                            @error('admin_reply')
                            <span class="text-danger">{{$message}}</span>
                            @enderror
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-primary" name="status"
                                value="1">@lang('Complete')</button>
                        <button type="submit" class="btn btn-danger" name="status"
                                value="3">@lang('Reject')</button>
                    </div>
                </form>


            </div>
        </div>
    </div>


    <!-- Modal for Edit button -->
    <div class="modal fade" id="recharge" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Confirmation')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <form role="form" method="POST" action="{{route('admin.money-transfer.rechargeRequest',$sendMoney)}}"
                      enctype="multipart/form-data">
                    @csrf
                    @method('put')
                    <div class="modal-body">
                        <p class="font-weight-medium">{{trans('Are you confirm to recharge via reloadly?')}}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-primary">@lang('Confirm')</button>
                    </div>
                </form>


            </div>
        </div>
    </div>



    <!-- Modal for verifyModal button -->
    <div class="modal fade" id="verifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Confirmation')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <form role="form" method="POST" action="{{route('admin.money-transfer.flutterVerifyAcc',$sendMoney)}}"
                      enctype="multipart/form-data">
                    @csrf
                    @method('put')
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Bank Account Code</label>
                            <input type="text" name="account_bank" value="{{old('account_bank',@$banks['account_bank'])}}" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Account Number</label>
                            <input type="text" name="account_number" value="{{old('account_number',@$banks['account_number'])}}"
                                   class="form-control">
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-success"><i class="fa fa-check-circle"></i> @lang('Check')
                        </button>
                    </div>
                </form>


            </div>
        </div>
    </div>

    <div class="modal fade" id="flutterModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Confirmation')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <form role="form" method="POST" action="{{route('admin.money-transfer.flutterAction',$sendMoney)}}"
                      enctype="multipart/form-data">
                    @csrf
                    @method('put')
                    <div class="modal-body form-builder">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-primary actionBtnName" name=""
                                value="1">@lang('Submit')</button>
                    </div>
                </form>


            </div>
        </div>
    </div>

@endsection
@push('js')
    @if ($errors->any())
        <script>
            "use strict";
            @foreach ($errors->all() as $error)
            Notiflix.Notify.Failure("{{ $error }}");
            @endforeach
        </script>
    @endif


    <script>
        $(document).ready(function () {
            $('.attemptBtn').on('click', function () {
                var btnName = $(this).attr('name');
                $('.actionBtnName').attr('name', btnName)

                var object = $(this).data();
                delete (object.target);
                delete (object.toggle);
                $('.form-builder').html('');

                for (const property in object) {
                    $('.form-builder').append(`<div class="form-group mt-3">
                            <label class="text-capitalize">${object[property].label}</label>
                            <input type="text" name="${property}" value="${object[property].value}" placeholder="${object[property].label}" class="form-control" required>
                   </div>`)
                }
            });
        });
    </script>
@endpush
