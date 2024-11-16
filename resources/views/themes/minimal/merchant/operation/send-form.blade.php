@extends($theme.'layouts.appm')
@section('title',trans('Send Money'))
@section('content')

@if(isset($templates['calculation'][0]) && $calculation = $templates['calculation'][0])
    <section id="home-banner">
        <div class="overview mx-lg-5">
             
            @if (Session::has("message"))
            <div class="alert {{Session::get('message')['alert']}} alert-dismissible fade show" role="alert">
                <strong>{{Session::get("message")['msg']}}</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>    
            @endif
            
            <div class="row align-items-center" id="basicCalcInfo">
            <div class="col-xl-4 col-lg-4">
                    <br>
                    <form action="{{route('user.calculation.store')}}" id="submitform" method="post">
                        @csrf
                        <div class="transfer-form error">
                        <div class="amount-currency-total-content">
                            <span class="rate">{{trans('Exchange rate')}}</span>
                            <h3 class="exchange_rate">1 @{{sendFrom.code}} = @{{rate}} @{{receiveFrom.code}}</h3>
                        </div>
                        <div class="main-content-section">
                            <div class="you-send">
                                <div class="you-send-inner">
                                    <div class="send-input">
                                        <label for="send-input">{{trans('You Send')}} </label>
                                        <input id="send-input" name="amount" v-model="send_amount" @keyup="getValue"
                                            @keypress="onlyNumber"
                                            placeholder="0.00">
                                    </div>
                                    <div class="choose-currency">
                                        <select id="s-currency" name="sendCountry" class="js-example-templating"
                                                @change="onChangeSend($event)">
                                            <option v-for="item in senderCurrencies" :value="item.id" :selected="item.name === 'GERMANY'"
                                                    :data-image="item.flag" :data-code="item.code">
                                                    @{{ item.name}}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="alert alert-warning" v-if="sendMoneyError" role="alert">
                                    <span>@{{sendMoneyError}} @{{sendFrom.code}}</span>
                                </div>
                            </div>
                            <br>

                            <div class="our-fee">
                                <div class="row justify-content-between my-4">
                                    <div class="col-12 text-center">
                                        <div class="exchange-charge d-flex justify-content-between">
                                            <div class="left-side">
                                                <p><i class="las la-dot-circle"></i>  {{ trans('Fees And Charges') }}</p>
                                            </div>
                                            <div class="right-side">
                                                <p id="fees">+ @{{ parseFloat(charge).toFixed(2) }} @{{ sendFrom.code }}</p>
                                            </div>
                                        </div>
                                        <div class="exchange-charge d-flex justify-content-between">
                                            <div class="left-side">
                                                <p><i class="las la-dot-circle"></i> {{ trans('Amount will convert') }} </p>
                                            </div>
                                            <div class="right-side">
                                                <p id="convert-amount">@{{ parseFloat(send_amount).toFixed(2) }} @{{ sendFrom.code }}</p>
                                            </div>
                                        </div>

                                        <div class="exchange-charge d-flex justify-content-between pb-10" >
                                            <div class="left-side">
                                                <p><i class="las la-dot-circle"></i> {{ trans('discount') }}</p>
                                            </div>
                                            <div class="right-side">
                                                <p id="payable">- @{{ parseFloat(((send_amount)*discount)/100).toFixed(2) }}  @{{ sendFrom.code }}</p>
                                            </div>
                                        </div>

                                        <div class="exchange-charge d-flex justify-content-between pb-10">
                                            <div class="left-side">
                                                <p><i class="las la-dot-circle"></i> {{ trans('Total Payable Amount') }}</p>
                                            </div>
                                            <div class="right-side">
                                                <p id="payable">@{{ parseFloat((send_amount)-((send_amount)*discount)/100).toFixed(2) }} @{{ sendFrom.code }}</p>
                                            </div>
                                        </div>

                                        <input type="text" class="form-control mt-2 mb-2" v-model="cupon" name="cupone" placeholder="{{ trans('Enter Promo Code') }}" autocomplete="off" style="border: 1px solid;">
                                        <div class="d-flex justify-content-between">
                                            <div class="left-side">
                                                <h4 class="text--base remove-coupon">{{ trans('Have a coupon code?') }}</h4>
                                            </div>
                                            <div class="right-side">
                                                <a class="btn btn-success" style="background-color: #5ac8e4;color: #fff;" @click="applycupon"> Apply</a>
                                            </div>
                                        </div>
                                        <p v-if="cupone" v-html="cupone"  class="text-danger text-lg"></p>
                                    </div>
                                </div>
                            </div>

                            <div class="they-get">
                                <div class="they-get-inner">
                                    <div class="get-input">
                                        <label for="get-input">{{trans('Recipient Gets')}}</label>
                                        <input type="text" id="get-input" v-model="get_amount" @keyup="sendValue"
                                            @keypress="onlyNumber">
                                    </div>
                                    <div class="choose-currency">
                                        <select id="g-currency" class="js-example-templating"
                                                @change="onChangeReceive($event)" name="getCountry">
                                            <option v-for="item in receiverCurrencies" :value="item.id" :selected="item.name === 'NIGERIA'"
                                                    :data-image="item.flag" :data-code="item.code">@{{item.name}}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="alert alert-warning" v-if="receiveMoneyError" role="alert">
                                    <span>@{{receiveMoneyError}} @{{receiveFrom.code}}</span>
                                </div>

                                <div class="mt-3">
                                    <div class="select-service" id="send-money-form">
                                        <select name="country_service" id="select-service">
                                            <option>@lang('Select Service')</option>
                                        </select>
                                    </div>
                                </div>

                                <input type="hidden" name="sendReceive" value="send">

                                <div class="select-service payout_network" id="payout_network" style="margin-top: 10px;">
                                    <select name="payout_network" id="select-airtime" class="form-control" style="background:#fff;padding:10px">
                                        <option>@lang('Select One')</option>
                                    </select>
                                    @error('payout_network')
                                    <div class="error-massage-alt">
                                        <span>{{$message}}</span>
                                    </div>
                                    @enderror
                                </div>

                            </div><br>

                            <div class="continue-button large-button" style="margin-top: 20px !important;">
                                <button :disabled="sendMoneyError != '' || receiveMoneyError != ''" @click="goNext">{{trans('Continue')}}</button>
                            </div>
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    @push('script')
    <script>
        new Vue({
            el: "#basicCalcInfo",
            data: {
                senderCurrencies: [],
                receiverCurrencies: [],
                sendFrom: {},
                receiveFrom: {},
                send_amount: '',
                get_amount: '',
                rate: '',
                sendMoneyError: '',
                receiveMoneyError: '',
                serviceId: '',
                charge:'',
                cupon:'',
                cupone:'',
                discount:0

            },
            beforeMount() {
                this.currencyList();
                if (localStorage.getItem('resource') != null) {
                    this.sendFrom = JSON.parse(localStorage.getItem('resource'))
                }
            },
            mounted() {

                let self = this;

                self.serviceId = $('#select-service').val();
                axios.get('{{ route('getCharge') }}',{
                    params: {
                        serviceId: self.serviceId,
                        send_amount: self.send_amount,
                        receiveFrom: self.receiveFrom.id,
                    }
                })
                .then(res => {
                    self.charge = res.data
                })
                .catch(err => {
                });

                $('#s-currency').select2().on("change", function (event, ui) {
                    let id = $(this).val();
                    self.onChangeSend($(this).val());
                });
                $('#g-currency').select2().on("change", function (event, ui) {
                    self.onChangeReceive(this.value);
                });

                $(".js-example-templating").select2({
                    dropdownPosition: 'below',
                    placeholder: "Type a Country",
                    templateSelection: this.formatState,
                    templateResult: function (data) {
                        if (!data.element) {
                            return data.text;
                        }

                        var $element = $(
                            '<span class="flag-info"><img class="flag-icon" src="' + $(data.element).data('image') + '"/> <span class="currency-info">' + data.text + '</span><span class="currency-code">' + data.element.dataset.code + '</span></span>'

                        );
                    return $element;
                    }

                });

                $("#select-service").selectmenu({
                    change: function (event, ui) {
                        localStorage.setItem('country_service', $('#select-service').val());
                        self.serviceId = $('#select-service').val();
                        self.setMoneyValidity(self.send_amount, self.get_amount);
                        self.getCountryService(self.receiveFrom.id, self.serviceId)
                        axios.get('{{ route('getCharge') }}',{
                            params: {
                                serviceId: self.serviceId,
                                send_amount: self.send_amount,
                                receiveFrom: self.receiveFrom.id,
                            }
                        })
                        .then(res => {
                            self.charge = res.data
                        })
                        .catch(err => {
                        });
                    }
                });


            },
            watch: {
                send_amount: function() {
                    this.setMoneyValidity(this.send_amount, this.get_amount);
                },
                get_amount: function() {
                    this.setMoneyValidity(this.send_amount, this.get_amount);
                }
            },
            methods: {
                applycupon(){
                    var self = this
                    console.log(self.cupon)
                    axios.post('{{ route('applycupon') }}',{
                        coupon: this.cupon
                    })
                    .then(res => {
                        console.log(res)
                        if(res.data=='Invalid Coupon'){
                            self.cupone=res.data
                            self.discount=0
                        }else{
                            self.cupone=''
                            self.discount=res.data.reduce_fee
                        }
                    })
                },
                getCountryService(countryId, serviceId){
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
                                $('.select-service.payout_network').removeClass('bd')
                                $('#select-airtime').html(``).selectmenu("refresh");
                                var options = `<option disabled selected>@lang("Select One")</option>`;
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
                },
                checkSenderLimit(amount) {
                    const limit =  this.sendFrom.limit
                    if(!limit) {
                        return null
                    }
                    const service = limit.find(item => item.id == this.serviceId);

                    if(!service) {
                        return null;
                    }

                    if(parseInt(service.daily_limit) < parseInt(amount) && service.daily_limit != 0) {
                        return `{{trans('Sender Daily Limit is Over, Maximum amount')}} ${service.daily_limit}`
                    }

                    if(service.minimum_amount > Math.floor(amount)) {
                        return `{{trans('Minimum send amount')}} ${service.minimum_amount}`
                    }
                },
                checkReceiverLimit(amount) {
                    const limit =  this.receiveFrom.limit
                    if(!limit) {
                        return null
                    }
                    const service = limit.find(item => item.id == this.serviceId)
                    if(!service) {
                        return null;
                    }


                    if(parseInt(service.daily_limit) < Math.floor(amount) && service.daily_limit != 0) {
                        return `{{trans('Daily Limit is Over, Maxium receive amount')}} ${service.daily_limit}`
                    }

                    if(parseInt(service.minimum_amount) > Math.floor(amount)) {
                        return `{{trans('Minimum receive amount')}} ${service.minimum_amount}`
                    }
                },
                setMoneyValidity(sendAmount, receiverAmount) {
                    const senderLimit = this.checkSenderLimit(sendAmount);
                    const receiverLimit = this.checkReceiverLimit(receiverAmount);
                    if(!this.serviceId) {
                        this.serviceId = localStorage.getItem('country_service');
                    }
                    if(senderLimit) {
                        this.sendMoneyError = senderLimit
                    } else {
                        this.sendMoneyError = ''
                    }

                    if(receiverLimit) {
                        this.receiveMoneyError = receiverLimit
                    } else {
                        this.receiveMoneyError = ''
                    }
                },
                getFacilities(facilities) {

                    $('#select-service').html(``).selectmenu("refresh");
                    var options = `<option>@lang("Select Service")</option>`;
                    for (let i = 0; i < facilities.length; i++) {
                        options += `<option value="${facilities[i].id}">${facilities[i].name}</option>`;
                    }
                    $('#select-service').html(options).selectmenu("refresh");
                },
                currencyList() {
                    axios.get('{{ route('currencyList') }}')
                        .then(res => {

                            this.senderCurrencies = res.data.senderCurrencies
                            this.receiverCurrencies = res.data.receiverCurrencies

                            this.getFacilities(this.receiverCurrencies[0].facilities)

                            var per_transfer = this.senderCurrencies[3].per_transfer + ' ' + this.senderCurrencies[3].code;
                            var daily_limit = this.senderCurrencies[3].daily_limit + ' ' + this.senderCurrencies[3].code;
                            var monthly_limit = this.senderCurrencies[3].monthly_limit + ' ' + this.senderCurrencies[3].code;

                            var receive_per_transfer = this.receiverCurrencies[8].per_transfer + ' ' + this.receiverCurrencies[8].code;
                            var receive_daily_limit = this.receiverCurrencies[8].daily_limit + ' ' + this.receiverCurrencies[8].code;
                            var receive_monthly_limit = this.receiverCurrencies[8].monthly_limit + ' ' + this.receiverCurrencies[8].code;

                            if (0 < this.senderCurrencies.length) {
                                this.sendFrom = this.senderCurrencies[3];
                                var minimum_amount = this.senderCurrencies[3].minimum_amount;
                                this.send_amount = parseInt(minimum_amount)
                            }
                            if (0 < this.receiverCurrencies.length) {
                                this.receiveFrom = this.receiverCurrencies[8];
                            }

                            this.getRate()
                            this.getValue()
                        })
                        .catch(err => {
                        });
                },
                onChangeSend(id) {
                    var self = this;
                    var arr = self.senderCurrencies;
                    const result = arr.find((obj, index) => {
                        if (obj.id == id) {
                            return true
                        }
                    });
                    this.sendFrom = result
                    this.getRate();
                    this.getValue();

                },
                onChangeReceive(id) {
                    var self = this;

                    self.serviceId = $('#select-service').val();
                    axios.get('{{ route('getCharge') }}',{
                    params: {
                        serviceId: self.serviceId,
                        send_amount: self.send_amount,
                        receiveFrom: id,
                        }
                    })
                    .then(res => {
                        self.charge = res.data
                    })
                    .catch(err => {
                    });


                    var arr = self.receiverCurrencies;

                    const result = arr.find((obj, index) => {
                        if (obj.id == id) {
                            return true
                        }
                    });
                    this.getFacilities(result.facilities)
                    $('#select-airtime').html('<option disabled selected>@lang("Select Provider")</option>').selectmenu("refresh");
                    this.receiveFrom = result
                    this.getRate();
                    this.getValue();

                },
                onlyNumber($event) {
                    let keyCode = ($event.keyCode ? $event.keyCode : $event.which);
                    if ((keyCode < 48 || keyCode > 57) && keyCode !== 46) { // 46 is dot
                        $event.preventDefault();
                    }
                },
                formatState(state) {

                    if (!state.id) {
                        return state.text;
                    }
                    var image = $(state.element).data('image');
                    var code = $(state.element).data('code');
                    var $state = $('<span style="font-size: 16px; margin-left: 8px;"><img src="' + image + '" style="width: 20px;height: 15px;margin-right: 12px;"> <span class="country-code-name">' + code+ '</span> </span>');
                    return $state;
                },
                getRate() {
                    var setRate = this.receiveFrom.rate / this.sendFrom.rate;
                    this.rate = setRate.toFixed(2);
                    return setRate;
                },
                getValue() {
                    this.get_amount = (this.send_amount * this.getRate()).toFixed(2)
                    Math.abs(this.get_amount)
                },
                sendValue() {
                    this.send_amount = (this.get_amount / this.getRate()).toFixed(2)
                    Math.abs(this.send_amount)
                },
                goNext() {
                    var $url = '{{ route("toCountry", "country:slug") }}';
                    $url = $url.replace('country:slug', this.receiveFrom.slug);
                    localStorage.setItem('amount_selected', this.send_amount);
                    localStorage.setItem('sendFrom', JSON.stringify(this.sendFrom));
                    localStorage.setItem('receiveFrom', JSON.stringify(this.receiveFrom));
                    localStorage.setItem('sendSelectId', this.sendFrom.id);
                    localStorage.setItem('sendSelectFlag', this.sendFrom.flag);
                    localStorage.setItem('sendSelectName', this.sendFrom.name);
                    localStorage.setItem('sendSelectCode', this.sendFrom.code);
                    localStorage.setItem('resource', JSON.stringify(this.sendFrom));
                    window.location.href = $url
                }
            }
        });
    </script>
    @endpush

    @push('style')
        <style>
            .select2-container--default .select2-selection--single .select2-selection__rendered::after {
                content: "\ea99";
                font-family: "IcoFont";
                font-size: 16px;
                color: var(--brand-color-alt);
                position: absolute;
                padding-left: 4%;
            }

            .select2-container .select2-selection--single .select2-selection__rendered {
                overflow: initial;
                padding-right: 10%;
            }

            #home-banner .get-input, #home-banner .send-input {
                width: 60%;
            }
        </style>
    @endpush
@endif

@endsection
