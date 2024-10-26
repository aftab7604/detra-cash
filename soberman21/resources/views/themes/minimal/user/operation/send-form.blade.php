@extends($theme.'layouts.app')
@section('title',trans($page_title))
@section('content')

    <section id="send-money-form" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-7">
                    <div class="content">
                        @lang($country->details)
                    </div>
                </div>
                <div class="col-lg-5">
                    <form action="{{route('user.calculation.store')}}" id="submitform" method="post">
                        @csrf
						
                        <input type="hidden" name="sendCountry" value="">
                        <div class="transfer-form-wrapper error">
                            <div class="transfer-form">
                            <div class="form-heading d-flex justify-content-between">
                                    <span>{{trans('Send from')}}:</span>
                                    <span><img src="{{$receiveCountry->first()->flag}}" alt=""
                                               class="float-right sender-flag"></span>
                                </div>
                            <div class="currency">
                                    <select id="send-money-currency" class="form-control  "
                                            data-live-search="true" name="getCountry">
                                        <option disabled selected>@lang("Select Country")</option>
                                        @foreach($sendFromCountry as $data)
                                            <option value="{{$data->id}}"
                                                    data-code="{{$data['code']}}"
                                                    data-name="{{$data['name']}}"
                                                    data-rate="{{$data['rate']}}"
                                                    data-minimum_amount="{{$data['minimum_amount']}}"
                                                    data-resource="{{$data}}">{{$data->name}}</option>
                                        @endforeach
                                    </select>

                                    @error('getCountry')
                                    <div class="error-massage-alt">
                                        <span>{{$message}}</span>
                                    </div>
                                    @enderror
                                </div>
                                <div class="alert alert-warning d-none" id="sender-alert" role="alert"></div>                                  
                                <div class="form-heading d-flex justify-content-between">
                                    <span>{{trans('Send To')}}:</span>
                                    <span><img src="{{$receiveCountry->first()->flag}}" alt=""
                                               class="float-right receiver-flag"></span>
                                </div>
                                <div class="currency">
                                    <select id="recieve-money-currency" class="form-control  "
                                            data-live-search="true" name="getCountry">
                                        <option disabled selected>@lang("Select Country")</option>
                                        @foreach($receiveCountry as $data)
                                            <option value="{{$data->id}}"
                                                    data-code="{{$data['code']}}"
                                                    data-name="{{$data['name']}}"
                                                    data-rate="{{$data['rate']}}"
                                                    data-minimum_amount="{{$data['minimum_amount']}}"
                                                    data-resource="{{$data}}">{{$data->name}}</option>
                                        @endforeach
                                    </select>

                                    @error('getCountry')
                                    <div class="error-massage-alt">
                                        <span>{{$message}}</span>
                                    </div>
                                    @enderror
                                </div>
                                <div class="alert alert-warning d-none" id="receiver-alert" role="alert"></div>        
                                                          
                                <div class="select-service">
                                    <select name="country_service" id="select-service">
                                    </select>
                                    @error('country_service')
                                    <div class="error-massage-alt">
                                        <span>{{$message}}</span>
                                    </div>
                                    @enderror
                                </div>

                                <div class="select-service payout_network ">
                                    <select name="payout_network" id="select-airtime">
                                    </select>
                                    @error('payout_network')
                                    <div class="error-massage-alt">
                                        <span>{{$message}}</span>
                                    </div>
                                    @enderror
                                </div>


                                <div class="bd show1 amount-type ">
                                    <div class="row">
                                        <div class="col-4">
                                            <select name="sendReceive" id="trnasection">
                                                <option value="send">{{trans('SEND')}}</option>
                                                <option value="receive">{{trans('RECEIVE')}}</option>
                                            </select>

                                            @error('sendReceive')
                                            <div class="error-massage-alt">
                                                <span>{{$message}}</span>
                                            </div>
                                            @enderror
                                        </div>
                                        <div class="col-4">
                                            <select id="exchange">
                                                <option value="1"></option>
                                            </select>
                                        </div>
                                        <div class="col-4">
                                            <input type="text" name="amount" id="amount" @keypress="onlyNumber"
                                                   placeholder="Amount">

                                            @error('amount')
                                            <div class="error-massage-alt">
                                                <span>{{$message}}</span>
                                            </div>
                                            @enderror
                                        </div>


                                    </div>

                            
                                </div>

                            </div>
                            <div class="exchange-rate">
                                <span class="get-exchange-rate"></span>
                            </div>
                            <div class="exchange-rate">
                            <div class="bd show1 overview mb-2 payment-info">
                                <img id="loading" src="{{asset('assets/admin/images/loading.gif')}}" alt="..."
                                     class="w-25 mx-auto"/>
                            </div>
                            <div id="continue-button" class="continue-button large-button mt-2">

                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </section>
@endsection


@push('script')
    <script>

        new Vue({
            el: "#recieve-money-currency",
            data: {},
            methods: {
                onlyNumber($event) {
                    let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                    if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                        $event.preventDefault();
                    }
                },
            }
        });

    </script>
    <script>
        'use strict';
        var $receiveFrom = {}, $sendFrom = {}, $rate = 0, $selectedService ,$receiveFrom2 = {}, serviceId = null;
        var $sendSelectCode = '';
        var $amountBox = false;

        // send_amount
        $(document).ready(function (e) {

            function checkSenderLimit(amount) {
                const limit =  $sendFrom.limit
                if(!limit) {
                    return null
                }
                const service = limit.find(item => item.id == serviceId);

                if(!service) {
                    return null;
                }

                if(parseInt(service.daily_limit) < parseInt(amount) && service.daily_limit != 0) {
                    return `@lang('Sender Daily Limit is Over, Maximum amount') ${service.daily_limit}`
                }

                if(service.minimum_amount > Math.floor(amount)) {
                    return `@lang('Minimum send amount') ${service.minimum_amount}`
                }
            }

            function checkReceiverLimit(amount) {
                const limit =  $receiveFrom.limit
                if(!limit) {
                    return null
                }
                const service = limit.find(item => item.id == serviceId)

                if(!service) {
                    return null;
                }

                if(service.daily_limit < Math.floor(amount) && service.daily_limit != 0) {
                    return `@lang('Daily Limit is Over, Maxium receive amount') ${service.daily_limit}`
                }

                if(service.minimum_amount > Math.floor(amount)) {
                    return `@lang('Minimum receive amount') ${service.minimum_amount}`
                }
            }

            function setMoneyValidity(sendAmount, receiverAmount) {
                const senderLimit = checkSenderLimit(sendAmount);
                const receiverLimit = checkReceiverLimit(receiverAmount);
                if(!serviceId) {
                    serviceId = localStorage.getItem('country_service');
                }
                const submitButton = $("#continue-button");
                if(submitButton) {
                    if(senderLimit || receiverLimit) {
                        submitButton.css("pointer-events", "none");
                    } else {
                        submitButton.css("pointer-events", "auto");
                    }
                }

                if(senderLimit) {
                    $("#sender-alert").removeClass("d-none");
                    $("#sender-alert").text(senderLimit)
                } else {
                    $("#sender-alert").addClass("d-none");
                    $("#sender-alert").text('')
                }

                if(receiverLimit) {
                    $("#receiver-alert").removeClass("d-none");
                    $("#receiver-alert").text(receiverLimit)
                } else {
                    $("#receiver-alert").addClass("d-none");
                    $("#receiver-alert").text('')
                }
            }
        	
            $('.show1.amount-type').addClass('bd')
            let $sendSelectCode = localStorage.getItem('sendSelectCode');
           
            $('#exchange').html(`<option value="${$sendSelectCode}" selected>${$sendSelectCode}</option>`).selectmenu("refresh");
            $('.select-service.payout_network').addClass('bd')
            $('.continue-button.large-button').html(``)
            $('#select-airtime').html(``).selectmenu("refresh");
             localStorage.setItem('receiveFrom', '');
			

            if (localStorage.getItem('receiveFrom')) {
                $receiveFrom = JSON.parse(localStorage.getItem('receiveFrom'));
                $('#recieve-money-currency').val($receiveFrom.id).selectmenu("refresh");
                $('.receiver-flag').attr('src', $receiveFrom.flag)
                $sendFrom = JSON.parse(localStorage.getItem('resource'));
                
                getRate();
            } else {
                $receiveFrom = @json($country);
                
                $('#recieve-money-currency').val($receiveFrom.id).selectmenu("refresh");
                $('.receiver-flag').attr('src', $receiveFrom.flag)
                $sendFrom = @json($sendFromCountry[0]);
                $sendSelectCode = $sendFrom.code;
                $('#exchange').html(`<option value="${$sendSelectCode}" selected>${$sendFrom.code}</option>`).selectmenu("refresh");
                getRate();
            }
           
            if (localStorage.getItem('sendFrom')) {
                $sendFrom = JSON.parse(localStorage.getItem('sendFrom'));
                $('#send-money-currency').val($sendFrom.id).selectmenu("refresh");
                $('.sender-flag').attr('src', $sendFrom.flag)
                $sendSelectCode = $sendFrom.code;
                $('#exchange').html(`<option value="${$sendSelectCode}" selected>${$sendFrom.code}</option>`).selectmenu("refresh");
                getRate();
            } else {
                $sendFrom = @json($country);
                
                $('#send-money-currency').val($sendFrom.id).selectmenu("refresh");
                $('.sender-flag').attr('src', $sendFrom.flag)
                $sendFrom = @json($sendFromCountry[0]);
                $sendSelectCode = $sendFrom.code;
                $('#exchange').html(`<option value="${$sendSelectCode}" selected>${$sendFrom.code}</option>`).selectmenu("refresh");
                getRate();
            }


            getFacilities($receiveFrom.facilities)

            $("#recieve-money-currency").selectmenu({
                change: function (event, ui) {
                    let id 			= $(this).val();
                    let flag 		= $(ui.item.element).data('flag');
                    let resource 	= $(ui.item.element).data('resource');
                    let name 		= $(ui.item.element).data('name').toLowerCase();
                    $receiveFrom 	= resource;
                    var get_url 	= "{{config('app.url')}}";
                    
                    var newUrl = get_url+'/to/'+name;
		            if (window.history != 'undefined' && window.history.pushState != 'undefined') {
		            window.history.pushState({ path: newUrl }, '', newUrl);
		            }
                   // $(window.location)[0].replace("https://www.google.it");
                    localStorage.setItem('receiveFrom', JSON.stringify(resource));
                    $('.receiver-flag').attr('src', $receiveFrom.flag)
                    getFacilities($receiveFrom.facilities);
                    getRate();
                    $('.select-service.payout_network').addClass('bd')
                    $('#select-airtime').html(``).selectmenu("refresh");

                }
            });
            
             $("#send-money-currency").selectmenu({
                change: function (event, ui) {
                    let id 			= $(this).val();
                    let flag 		= $(ui.item.element).data('flag');
                    let resource 	= $(ui.item.element).data('resource');
                    let name 		= $(ui.item.element).data('name').toLowerCase();
                    $sendFrom 		= resource;
                    $sendSelectCode = $(ui.item.element).data('code');
                	$('#exchange').html(`<option value="${$sendSelectCode}" selected>${$sendFrom.code}</option>`).selectmenu("refresh");
                   // $(window.location)[0].replace("https://www.google.it");
                    localStorage.setItem('sendFrom', JSON.stringify(resource));
                    $('.sender-flag').attr('src', $sendFrom.flag)
                   // getFacilities($sendFrom.facilities);
                    
                    getRate();
                    //$('.select-service.payout_network').addClass('bd')
                   // $('#select-airtime').html(``).selectmenu("refresh");

                }
            });

            function getFacilities(facilities) {
                $amountBox = false;
                $('.show1.amount-type').addClass('bd')
                $('#select-service').html(``).selectmenu("refresh");
                var options = `<option disabled selected>@lang("Select Service")</option>`;
                for (let i = 0; i < facilities.length; i++) {
                    options += `<option value="${facilities[i].id}">${facilities[i].name}</option>`;
                }
                $('#select-service').html(options).selectmenu("refresh");
            }

            // Get payout_network
            $("#select-service").selectmenu({
                change: function (event, ui) {
                    let id = $(this).val();
                    serviceId = id;
                    $selectedService = $(ui.item.element).text();
                    $('.continue-button.large-button').html(``)
                    $('.select-service.payout_network').addClass('bd')
                    $('#select-airtime').html(``).selectmenu("refresh");
                    getCountryService($receiveFrom.id, id)
                }
            });



            $("select[name='sendReceive']").selectmenu({
                change: function (event, ui) {
                    $('.show1.overview').addClass('bd');
                    $("#amount").val('')
                    let val = $(this).val();
                    if (val == 'send') {
                        $('#exchange').html(`<option value="${$sendSelectCode}" selected>${$sendSelectCode}</option>`).selectmenu("refresh");
                    } else {
                        $('#exchange').html(`<option value="${$receiveFrom.code}" selected>${$receiveFrom.code}</option>`).selectmenu("refresh");
                    }
                }
            });


            function getCountryService(countryId, serviceId) {
                $amountBox = false;
                $('.show1.overview').addClass('bd');
                $.ajax({
                    url: "{{route('ajaxCountryService')}}",
                    type: "post",
                    data: {
                        countryId,
                        serviceId,
                    },
                    success: function (response) {
                        if (response.length == 0) {
                            Notiflix.Notify.Failure(`${$selectedService}  service provider not available`);
                            return 0;
                        } else {
                            $amountBox = true;
                            $('.continue-button.large-button').html(``)
                            $('.select-service.payout_network').removeClass('bd')
                            $('#select-airtime').html(``).selectmenu("refresh");
                            var options = `<option disabled selected>@lang("Select Provider")</option>`;
                            for (let i = 0; i < response.length; i++) {
                                options += `<option value="${response[i].id}"
                                       data-operator_id="${response[i].operatorId}"
                                       data-min="${response[i].localMinAmount}"
                                       data-max="${response[i].localMaxAmount}"
                                    >${response[i].name} </option>`;
                            }
                            $('#select-airtime').html(options).selectmenu("refresh");

                            if ($amountBox == true) {
                                $('.show1.amount-type').removeClass('bd')
                            } else {
                                $('.show1.amount-type').addClass('bd')
                            }
                        }
                    }
                });
            }



            function getRate() {
                var setRate = $receiveFrom.rate / $sendFrom.rate;
                $rate = setRate.toFixed(2);
                $('.get-exchange-rate').html(`{{trans('Exchange rate')}}: 1 ${$sendFrom.code} = ${$rate} ${$receiveFrom.code}`)
            }


            $(document).on('change', "#amount", function () {
                var amount = $(this).val();
                if ($('select[name=payout_network]').val() == null) {
                    Notiflix.Notify.Warning(`Please select a service provider`);
                    $('.show1.overview').addClass('bd');
                    return 0;
                }

                if ($(this).val().length == 0) {
                    $('.show1.overview').addClass('bd');
                } else {
                    $('.show1.overview').removeClass('bd');
                    let sendCountry = $sendFrom.id;
                    let getCountry = $receiveFrom.id;
                    let serviceId = $('select[name=country_service]').val();
                    let sendReceive = $('select[name=sendReceive]').val();
                    ajaxMoneyCalculation(amount, sendCountry, getCountry, serviceId, sendReceive);
                }
            })


            $("select[name='payout_network']").selectmenu({
                change: function (event, ui) {
                    let id = $(this).val();

                    let serve = $(ui.item.element).data();

                    $('.show1.overview').addClass('bd');
                    if (id.length == 0) {
                        $('.show1.overview').addClass('bd');
                    } else {
                        $('.show1.overview').removeClass('bd');
                        let sendCountry = $sendFrom.id;
                        let getCountry = $receiveFrom.id;
                        let serviceId = $('select[name=country_service]').val();
                        let sendReceive = $('select[name=sendReceive]').val();

                        let amount = parseFloat(localStorage.getItem('amount_selected'));
                        if(amount){
                            $('#amount').val(amount)
                            ajaxMoneyCalculation(amount, sendCountry, getCountry, serviceId, sendReceive);
                        }

                    }
                }
            });




            function ajaxMoneyCalculation(amount, sendCountry, getCountry, serviceId, sendReceive) {
                $('#loading').show();
                $.ajax({
                    url: "{{route('ajaxMoneyCalculation')}}",
                    type: "post",
                    data: {
                        amount,
                        sendCountry,
                        getCountry,
                        serviceId,
                        sendReceive,
                    },
                    success: function (res) {
                        $('.continue-button.large-button').html(``)
                        $("input[name=sendCountry]").val(sendCountry)
                        if (res.errors) {
                            for (let item in res.errors) {
                                Notiflix.Notify.Failure(`${res.errors[item][0]}`);
                            }
                        }
                        setMoneyValidity(amount, res.recipient_get);
                        var $result = `<ul class="overview-list">
                                <li class="overview-item">
                                    <span>{{trans('Send amount')}}</span>
                                    <span>${res.send_currency} ${res.send_amount}</span>
                                </li>
                                <li class="overview-item">
                                    <span>{{trans('Fees')}}</span>
                                    <span>${res.send_currency} ${res.fees}</span>
                                </li>
                                <li class="overview-item">
                                    <span>{{trans('You pay in total')}}</span>
                                    <span>${res.send_currency} ${res.total_payable}</span>
                                </li>
                                <li class="overview-item">
                                    <span>{{trans('Your recipient gets')}}</span>
                                    <span>${res.receive_currency} ${res.recipient_get}</span>
                                </li>
                            </ul>`;

                        $('.show1.overview').html($result)
                        $('.continue-button.large-button').html(`<button type="submit">{{trans('CONTINUE')}}</button>`)
                    },
                    complete: function () {
                        $('#loading').hide();
                    },
                });
            }
        });
        
        $('#submitform').submit(function(e){
        	//e.preventDefault();
        	var country_service = $('#select-service option:selected').val()
        	var select_airtime = $('#select-airtime option:selected').val()
        	var amount_selected = $('#amount').val()
        	
        	var send_moeny_from = $('#send-money-currency option:selected').attr('data-resource');
        	var reciver_moeny_from = $('#recieve-money-currency option:selected').attr('data-resource');
        	localStorage.setItem('country_service',country_service)
        	localStorage.setItem('send_moeny_from',send_moeny_from)
        	localStorage.setItem('reciver_moeny_from',reciver_moeny_from)
        	localStorage.setItem('select_airtime',select_airtime)
        	localStorage.setItem('amount_selected',amount_selected)
        })
        
        $(document).ready(function(){
        	
        	
        	if(localStorage.getItem('country_service') > 0)
        	{
        			let serviceId = localStorage.getItem('country_service');
        			//var countryId = $receiveFrom.id
        			var countryId = $receiveFrom.id
        			var select_airtime = localStorage.getItem('select_airtime')
        			var amount_selected = localStorage.getItem('amount_selected')
        			
                    //$selectedService = $(ui.item.element).text();
                    $('.continue-button.large-button').html(``)
                    $('.select-service.payout_network').addClass('bd')
                    $('#select-airtime').html(``).selectmenu("refresh");
                    $('#select-service option[value='+serviceId+']').attr('selected','selected');
                    
                    $('#select-service').selectmenu("refresh");
                    
                    //getCountryService($receiveFrom.id, id)
                    $amountBox = false;
	                $('.show1.overview').addClass('bd');
	                $.ajax({
	                    url: "{{route('ajaxCountryService')}}",
	                    type: "post",
	                    data: {
	                       countryId,
	                       serviceId,
	                    },
	                    success: function (response) {
	                        if (response.length == 0) {
	                            Notiflix.Notify.Failure(`${$selectedService}  service provider not available`);
	                            return 0;
	                        } else {
	                            $amountBox = true;
	                            $('.continue-button.large-button').html(``)
	                            $('.select-service.payout_network').removeClass('bd')
	                            $('#select-airtime').html(``).selectmenu("refresh");
	                            var options = `<option disabled selected>@lang("Select Provider")</option>`;
	                            for (let i = 0; i < response.length; i++) {
	                                options += `<option value="${response[i].id}"
	                                       data-operator_id="${response[i].operatorId}"
	                                       data-min="${response[i].localMinAmount}"
	                                       data-max="${response[i].localMaxAmount}"
	                                    >${response[i].name} </option>`;
	                            }
	                            $('#select-airtime').html(options).selectmenu("refresh");
	                            
	                            $('#select-airtime option[value='+select_airtime+']').attr('selected','selected');
                    			$('#select-airtime').selectmenu("refresh");
                    			$('#amount').val(amount_selected);

	                            if ($amountBox == true) {
	                                $('.show1.amount-type').removeClass('bd')
	                            } else {
	                                $('.show1.amount-type').addClass('bd')
	                            }
	                            $('.show1.overview').removeClass('bd');
	                            let sendCountry = $sendFrom.id;
			                    let getCountry = $receiveFrom.id;
			                    let serviceId = $('select[name=country_service]').val();
			                    let sendReceive = $('select[name=sendReceive]').val();
			                    let amount      = amount_selected;
			                    $.ajax({
					                    url: "{{route('ajaxMoneyCalculation')}}",
					                    type: "post",
					                    data: {
					                        amount,
					                        sendCountry,
					                        getCountry,
					                        serviceId,
					                        sendReceive,
					                    },
					                    success: function (res) {
					                        $('.continue-button.large-button').html(``)
					                        $("input[name=sendCountry]").val(sendCountry)
					                        if (res.errors) {
					                            for (let item in res.errors) {
					                                Notiflix.Notify.Failure(`${res.errors[item][0]}`);
					                            }
					                        }
					                        var $result = `<ul class="overview-list">
					                                <li class="overview-item">
					                                    <span>{{trans('Send amount')}}</span>
					                                    <span>${res.send_currency} ${res.send_amount}</span>
					                                </li>
					                                <li class="overview-item">
					                                    <span>{{trans('Fees')}}</span>
					                                    <span>${res.send_currency} ${res.fees}</span>
					                                </li>
					                                <li class="overview-item">
					                                    <span>{{trans('You pay in total')}}</span>
					                                    <span>${res.send_currency} ${res.total_payable}</span>
					                                </li>
					                                <li class="overview-item">
					                                    <span>{{trans('Your recipient gets')}}</span>
					                                    <span>${res.receive_currency} ${res.recipient_get}</span>
					                                </li>
					                            </ul>`;

					                        $('.show1.overview').html($result)
					                        $('.continue-button.large-button').html(`<button type="submit">{{trans('CONTINUE')}}</button>`)
					                    },
					                    complete: function () {
					                        $('#loading').hide();
					                    },
					                });
					                
					                
			                   // ajaxMoneyCalculation(amount_selected, sendCountry, countryId, serviceId, sendReceive);
	                            
	                            
	                             //getRate();
	                        }
	                    }
	                });
        	}
        	
        })

    </script>

@endpush
@push('style')
@endpush
