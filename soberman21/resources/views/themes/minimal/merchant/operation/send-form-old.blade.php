@extends($theme.'layouts.appuser')
@section('title',trans($page_title))

@push('style')
    <link rel="stylesheet" href="{{asset($themeTrue.'css/flags/calculation.css')}}">
@endpush

@section('content')
    <div class="page-header card card-primary m-0 m-md-4 my-4 m-md-0 p-5 shadow">
        <div class="card-body">

            <form action="{{route('user.calculation.store')}}" method="post">
                @csrf

                <input type="hidden" name="sendCountry" value="">
                <input type="hidden" name="getCountry" value="">

                <div class="row ">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label class="text-dark">{{trans('Send Country')}}</label>
                            <select class="vodiapicker">
                                <option value="" class="test" data-thumbnail="" disabled
                                        selected>{{'Select One'}}</option>
                                @foreach($senderCurrencies as $data)
                                    <option value="{{$data->id}}" data-thumbnail="{{$data->flag}}"
                                            data-code="{{$data['code']}}"
                                            data-name="{{$data['name']}}"
                                            data-rate="{{$data['rate']}}"
                                            data-minimum_amount="{{$data['minimum_amount']}}"
                                            data-resource="{{$data}}"
                                    >{{$data->name}}</option>
                                @endforeach
                            </select>
                            <div class="lang-select">
                                <button class="btn-select" value=""></button>
                                <div class="b">
                                    <ul id="a"></ul>
                                </div>
                            </div>

                            @error('sendCountry')
                            <div class="text-danger">
                                <span>{{$message}}</span>
                            </div>
                            @enderror
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="form-group">
                            <label class="text-dark">{{trans('Receive Country')}}</label>
                            <select class="vodiapicker2">
                                <option value="" class="test" data-thumbnail="" disabled
                                        selected>{{'Select One'}}</option>
                                @foreach($receiverCurrencies as $data)
                                    <option value="{{$data->id}}" data-thumbnail="{{$data->flag}}"
                                            data-code="{{$data['code']}}"
                                            data-name="{{$data['name']}}"
                                            data-rate="{{$data['rate']}}"
                                            data-minimum_amount="{{$data['minimum_amount']}}"
                                            data-resource="{{$data}}"
                                    >{{$data->name}}</option>
                                @endforeach
                            </select>
                            <div class="lang-select2">
                                <button class="btn-select2" value=""></button>
                                <div class="b2">
                                    <ul id="a2"></ul>
                                </div>
                            </div>

                            @error('getCountry')
                            <div class="text-danger">
                                <span>{{$message}}</span>
                            </div>
                            @enderror
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="form-group">
                            <label class="text-dark">{{trans('Select Service')}}</label>
                            <select name="country_service" id="select-service" class="form-control">
                            </select>
                            @error('country_service')
                            <div class="text-danger">
                                <span>{{$message}}</span>
                            </div>
                            @enderror
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="form-group select-service payout_network">
                            <label class="text-dark">{{trans('Payout network')}}</label>
                            <select name="payout_network" id="select-airtime" class="form-control">
                            </select>
                            @error('payout_network')
                            <div class="text-danger">
                                <span>{{$message}}</span>
                            </div>
                            @enderror
                        </div>
                    </div>
                </div>


                <div class="row bd show1 amount-type">

                    <div class="col-lg-3">
                        <div class="form-group">
                            <select name="sendReceive" id="trnasection" class="form-control">
                                <option value="send">{{trans('SEND')}}</option>
                                <option value="receive">{{trans('RECEIVE')}}</option>
                            </select>
                            @error('sendReceive')
                            <div class="text-danger">
                                <span>{{$message}}</span>
                            </div>
                            @enderror
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="form-group">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" name="amount" id="amount" onkeypress="return onlyNumber;"
                               placeholder="Amount">
                                <div class="input-group-append">
                                    <span class="input-group-text" id="trnasectionType">USD</span>
                                </div>
                            </div>

                            <code class="get-limit-transfer"></code>

                            @error('amount')
                            <div class="text-danger">
                                <span>{{$message}}</span>
                            </div>
                            @enderror
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="exchange-rate">
                            <p class="get-exchange-rate"></p>
                        </div>
                    </div>
                </div>


                <div class="row mt-4 get-calculation">
                    <div class="col-md-8">
                        <div class="p-4 border shadow rounded mt-4">
                            <div class="row mb-3">
                                <div class="col-md-12 ">
                                    <div class="bd show1 overview mb-2 payment-info">
                                        <img id="loading" src="{{asset('assets/admin/images/loading.gif')}}" alt="..."
                                             class="w-25 mx-auto"/>
                                    </div>
                                    <div class="continue-button large-button mt-2">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </form>

        </div>
    </div>

@endsection


@push('script')

    <script>
        'use strict';

        var $receiveFrom = {}, $sendFrom = {}, $rate = 0, $selectedService;
        var $sendSelectCode = '';
        var $amountBox = false;


        $(document).ready(function () {

            $('.show1.amount-type').addClass('bd')
            let $sendSelectCode = localStorage.getItem('sendSelectCode');
            $('#exchange').html(`<option value="${$sendSelectCode}" selected>${$sendSelectCode}</option>`);
            $('.select-service.payout_network').addClass('bd')
            $('.continue-button.large-button').html(``)
            $('#select-airtime').html(``);

            $('.get-calculation').addClass('d-none');
            $('.get-calculation').removeClass('d-block');


            // send Currency
            var langArray = [];
            $(".vodiapicker option").each(function () {
                var img = $(this).attr("data-thumbnail");
                var resource = $(this).attr("data-resource");
                var name = $(this).attr("data-name");
                var rate = $(this).attr("data-rate");
                var code = $(this).attr("data-code");
                var text = this.innerText;
                var value = $(this).val();
                var item = "<li><img src='" + img + "' alt='' value='" + value + "' data-resource='" + resource + "'  data-name='" + name + "' data-rate='" + rate + "' data-code='" + code + "' /><span>" + text + "</span></li>";
                langArray.push(item);
            });
            $("#a").html(langArray);

            //Set the button value to the first el of the array
            $(".btn-select").html(langArray[0]);
            $(".btn-select").attr("value", "");

            //change button stuff on click
            $("#a li").on('click', function (e) {
                e.preventDefault();
                var value = $(this).find("img").attr("value");
                if (value.length == 0) {
                    Notiflix.Notify.Failure(`Please select a country`);
                } else {
                    var img = $(this).find("img").attr("src");
                    var text = this.innerText;
                    let name = $(this).find('img').attr('data-name');
                    let rate = $(this).find('img').attr('data-rate');
                    let code = $(this).find('img').attr('data-code');
                    let resource = $(this).find('img').attr('data-resource');
                    var item = '<li><img src="' + img + '" alt="" value="' + value + '" data-resource="' + resource + '"  data-name="' + name + '" data-rate="' + rate + '" data-code="' + code + '" /><span>' + text + "</span></li>";
                    $(".btn-select").html(item);
                    $(".btn-select").attr("value", value);
                    $(".b").toggle();
                    let id = value;
                    let flag = img;
                    $sendFrom = JSON.parse(resource);
                    localStorage.setItem('sendFrom', resource);
                    $('#trnasectionType').text(code)

                    $('#amount').val('');
                    $('.get-calculation').addClass('d-none');
                    $('.get-calculation').removeClass('d-block');
                }

            });

            $(".btn-select").on('click', function (e) {
                e.preventDefault();
                $(".b").toggle();
            });

            //check local storage for the lang
            var sessionLang = localStorage.getItem("sendFrom");
            if (sessionLang) {
                var assole = JSON.parse(sessionLang);
                var langIndex = 0;
                for (let obj in langArray) {
                    var li = htmlToElement(langArray[obj]);
                    let value = $(li).find('img').attr("value");
                    if (assole.id == value) {
                        langIndex = obj
                        $sendFrom = assole
                        $('#trnasectionType').text(assole.code)
                    }
                }
                $(".btn-select").html(langArray[langIndex]);
                $(".btn-select").attr("value", assole.id);
            } else {
                $(".btn-select").html(langArray[0]);
                $('.btn-select').attr('value', '');
            }



            // receive currency
            var langArray2 = [];
            $(".vodiapicker2 option").each(function () {
                var img = $(this).attr("data-thumbnail");
                var resource = $(this).attr("data-resource");
                var name = $(this).attr("data-name");
                var rate = $(this).attr("data-rate");
                var code = $(this).attr("data-code");
                var text = this.innerText;
                var value = $(this).val();
                var item = "<li><img src='" + img + "' alt='' value='" + value + "' data-resource='" + resource + "'  data-name='" + name + "' data-rate='" + rate + "' data-code='" + code + "' /><span>" + text + "</span></li>";
                langArray2.push(item);
            });
            $("#a2").html(langArray2);


            //Set the button value to the first el of the array

            $(".btn-select2").html(langArray2[0]);
            $(".btn-select2").attr("value", "");

            //change button stuff on click
            $("#a2 li").on('click', function (e) {
                e.preventDefault();
                var value = $(this).find("img").attr("value");
                if (value.length == 0) {
                    Notiflix.Notify.Failure(`Please select a country`);
                } else {
                    var img = $(this).find("img").attr("src");
                    var text = this.innerText;
                    let name = $(this).find('img').attr('data-name');
                    let rate = $(this).find('img').attr('data-rate');
                    let code = $(this).find('img').attr('data-code');
                    let resource = $(this).find('img').attr('data-resource');
                    var item = '<li><img src="' + img + '" alt="" value="' + value + '" data-resource="' + resource + '"  data-name="' + name + '" data-rate="' + rate + '" data-code="' + code + '" /><span>' + text + "</span></li>";
                    $(".btn-select2").html(item);
                    $(".btn-select2").attr("value", value);
                    $(".b2").toggle();
                    let id = value;
                    let flag = img;
                    $receiveFrom = JSON.parse(resource);
                    localStorage.setItem('receiveFrom', resource);
                    $('.receiver-flag').attr('src', $receiveFrom.flag)
                    getFacilities($receiveFrom.facilities);
                    // getRate();

                    $('.select-service.payout_network').addClass('bd')
                    $('#select-airtime').html(``);

                    $('#amount').val('');
                    $('.get-calculation').addClass('d-none');
                    $('.get-calculation').removeClass('d-block');
                }
            });

            $(".btn-select2").on('click', function (e) {
                e.preventDefault();
                $(".b2").toggle();
            });


            //check local storage for the lang
            var sessionLang2 = localStorage.getItem("receiveFrom");
            if (sessionLang2) {
                var assole = JSON.parse(sessionLang2);

                var langIndex = 0;
                for (let obj in langArray2) {
                    var li = htmlToElement(langArray2[obj]);
                    let value = $(li).find('img').attr("value");
                    if (assole.id == value) {
                        langIndex = obj
                        $receiveFrom = assole
                    }
                }

                $(".btn-select2").html(langArray2[langIndex]);
                $(".btn-select2").attr("value", assole.id);
                getFacilities(assole.facilities);
            } else {
                $(".btn-select2").html(langArray2[0]);
                $('.btn-select2').attr('value', '');
            }


            $('#select-service').on("change", function (){
                let id = $(this).val();
                $selectedService =  $(this).find('option:selected').text();
                getCountryService($receiveFrom.id, id)

                $("#amount").val('')
                $('.continue-button.large-button').html(``)
                $('.select-service.payout_network').addClass('bd')
                $('#select-airtime').html(``);
                $('.get-calculation').addClass('d-none');
                $('.get-calculation').removeClass('d-block');
            });

            $('#select-airtime').on("change", function (){
                let id = $(this).val();
                let serve = $(this).find('option:selected').data();
                if(serve.operator_id == null){
                    $('.get-limit-transfer').html(``)
                }else{
                    $('.get-limit-transfer').html(`{{trans('Limit')}} : ${serve.min} - ${serve.max} ${$receiveFrom.code}`)
                }
            });



            $("select[name='sendReceive']").on('change', function (){
                $('.show1.overview').addClass('bd');
                $("#amount").val('')
                $('.get-calculation').addClass('d-none');
                $('.get-calculation').removeClass('d-block');

                let val = $(this).val();
                if (val == 'send') {
                    $('#trnasectionType').text(`${$sendSelectCode}`);
                } else {
                    $('#trnasectionType').text(`${$receiveFrom.code}`);
                }
            });



            $(document).on('change', "#amount", function () {
                var amount = $(this).val();
                $('.get-calculation').addClass('d-none');
                $('.get-calculation').removeClass('d-block');

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


        });




        /**
         * @param {String} HTML representing a single element
         * @return {Element}
         */
        function htmlToElement(html) {
            var template = document.createElement('template');
            html = html.trim(); // Never return a text node of whitespace as the result
            template.innerHTML = html;
            return template.content.firstChild;
        }


        function onlyNumber(evt) {
            evt = (evt) ? evt : window.event;
            let charCode = (evt.which) ? evt.which : evt.keyCode;
            if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
                evt.preventDefault();
            } else {
                return true;
            }
        }

        function getFacilities(facilities) {
            $amountBox = false;
            $('.show1.amount-type').addClass('bd')
            $('#select-service').html(``);
            var options = `<option disabled selected>@lang("Select Service")</option>`;
            for (let i = 0; i < facilities.length; i++) {
                options += `<option value="${facilities[i].id}">${facilities[i].name}</option>`;
            }
            $('#select-service').html(options);
        }

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
                        $('#select-airtime').html(``);
                        var options = `<option disabled selected>@lang("Select Provider")</option>`;
                        for (let i = 0; i < response.length; i++) {
                            options += `<option value="${response[i].id}"
                                       data-operator_id="${response[i].operatorId}"
                                       data-min="${response[i].localMinAmount}"
                                       data-max="${response[i].localMaxAmount}"
                                >${response[i].name}</option>`;
                        }
                        $('#select-airtime').html(options);
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
            $('.get-exchange-rate').html(`Exchange Rate: 1 ${$sendFrom.code} = ${$rate} ${$receiveFrom.code}`)
        }

        function ajaxMoneyCalculation(amount, sendCountry, getCountry, serviceId, sendReceive) {
            $('#loading').show();
            $('.get-calculation').addClass('d-none');
            $('.get-calculation').removeClass('d-block');

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
                    $("input[name=getCountry]").val(getCountry)
                    if (res.errors) {
                        for (let item in res.errors) {
                            Notiflix.Notify.Failure(`${res.errors[item][0]}`);
                        }
                    }
                    var $result = `<ul class="list-style-none">
                                <li class="my-3">
                                    <span><i class="icon-check mr-2 text-info"></i> {{trans('Send amount')}}
                                    <span class="font-weight-medium text-dark">${res.send_currency} ${res.send_amount}</span></span>
                                </li>
                                <li class="my-3">
                                    <span><i class="icon-check mr-2 text-info"></i> {{trans('Fees')}}
                                    <span class="font-weight-medium text-dark">${res.send_currency} ${res.fees}</span></span>
                                </li>
                                <li class="my-3">
                                    <span><i class="icon-check mr-2 text-info"></i> {{trans('You pay in total')}}
                                    <span class="font-weight-medium text-dark">${res.send_currency} ${res.total_payable}</span></span>
                                </li>
                                <li class="my-3">
                                    <span><i class="icon-check mr-2 text-info"></i> {{trans('Your recipient gets')}}
                                    <span class="font-weight-medium text-dark">${res.receive_currency} ${res.recipient_get}</span></span>
                                </li>
                            </ul>`;

                    $('.show1.overview').html($result)

                    $('.get-calculation').removeClass('d-none');
                    $('.get-calculation').addClass('d-block');

                    $('.continue-button.large-button').html(`<button type="submit" class="btn btn-primary w-100">{{trans('CONTINUE')}}</button>`)
                },
                complete: function () {
                    $('#loading').hide();
                },
            });
        }

    </script>
@endpush




