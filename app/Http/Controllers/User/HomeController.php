<?php

namespace App\Http\Controllers\User;

use App\Helper\GoogleAuthenticator;
use App\Http\Controllers\Controller;
use App\Http\Traits\Notify;
use App\Http\Traits\Upload;

use App\Models\{Country,
    CountryService,
    Coupon,
    Fund,
    Gateway,
    IdentifyForm,
    KYC,
    Language,
    SendingPurpose,
    SendMoney,
    Recipient,
    SourceFund,
    Template,
    Ticket,
    Transaction,
    Withdrow,
    UserLogin,ContentDetails,OurFeature, Service};
use Facades\App\Services\ReloadlyService;
use Illuminate\Validation\Rules\Password;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Illuminate\Support\Facades\{Auth, DB, Hash};
use Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Stevebauman\Purify\Facades\Purify;
use Facades\App\Services\BasicService;
use Mail;

use hisorange\BrowserDetect\Parser as Browser;
use Illuminate\Support\Arr;

class HomeController extends Controller
{
    use Upload, Notify;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->theme = template();
        $this->middleware(['auth']);
        $this->middleware(function ($request, $next) {
            $this->user = auth()->user();
            if($this->user->merchant == '1'){
                $this->theme .='merchant.';
            }else{
                $this->theme .='user.';
            }
            return $next($request);
        });
    }

    public function calculation(Request $request)
    {


        $this->validate($request, [
            'amount' => 'required|numeric',
            'sendCountry' => 'required|numeric',
            'getCountry' => 'required|numeric',
            'country_service' => 'required|numeric', // serviceId
            'payout_network' => 'required', //
            'sendReceive' => ['required', Rule::in(["send", "receive"])],
        ], [
            'sendCountry.required' => "Sender country is required",
            'getCountry.required' => "Please select a currency to receive",
            'country_service.required' => "Service is required",
            'payout_network.required' => "Provider must be required",
            'amount.required' => "Enter Amount",
        ]);



        $country = Country::select('id', 'name', 'slug', 'code', 'minimum_amount','maximum_amount', 'rate', 'facilities', 'limit', 'image')->whereIn('id', [$request->sendCountry, $request->getCountry])->where('status', 1)->get();
        if ($request->has('sendCountry')) {
            $sendCountry = $country->where('id', $request->sendCountry)->first();
            if (!$sendCountry) {
                session()->flash('error', 'Sender Country Not Found');
                return back()->withInput();
            }

            $limitValidation = moneyLimitValidity($sendCountry, $request->country_service, $request->amount, $this->user->id);

            if($limitValidation != null) {
                $limitData =  getLimitByService($sendCountry->limit, $request->country_service);
                if ($limitValidation == 1) {
                    session()->flash('error', 'Minimum amount ' . getAmount($limitData->minimum_amount, config('basic.fraction_number')) . " " . $sendCountry->code);
                    return back()->withInput();
                }

                if ($limitValidation == 2) {
                    session()->flash('error', 'Maximum amount ' . getAmount($limitData->daily_limit, config('basic.fraction_number')) . " " . $sendCountry->code);
                    return back()->withInput();
                }

                if($limitValidation == 3) {
                    session()->flash('error', 'Monthly Limit Over. Monthly Limit is ' . getAmount($limitData->monthly_limit, config('basic.fraction_number')) . " " . $sendCountry->code);
                    return back()->withInput();
                }
            }

        }

        if ($request->has('getCountry')) {
            $receiveCountry = $country->where('id', $request->getCountry)->first();
            if (!$receiveCountry) {
                session()->flash('error', 'Receiver Country Not Found');
                return back()->withInput();
            }
            if (!$receiveCountry->facilities) {
                session()->flash('error', 'Receiver Country Service Not Available');
                return back()->withInput();
            }

            $receiveCountryFacilities = Service::find($request->country_service);
            if($receiveCountryFacilities->parent_id!=0) $receiveCountryFacilities = Service::find($receiveCountryFacilities->parent_id);

            if (!$receiveCountryFacilities) {
                session()->flash('error', 'Receiver Country Service Not Available');
                return back()->withInput();
            }


            $provider = CountryService::tobase()->where([
                'id' => $request->payout_network,
                'country_id' => $receiveCountry->id,
                'service_id' => $receiveCountryFacilities->id,
                'status' => 1
            ])->first();

            if (!$provider) {
                session()->flash('error', 'Provider must be required');
                return back()->withInput();
            }
        }

        if ($request->promo_code != null) {
            $coupon = Coupon::where('code', trim($request->promo_code))->whereNull('user_id')->first();
            if (!$coupon) {
                session()->flash('error', 'Invalid promo code');
                return back()->withInput();
            }

        }

        $amount = $request->amount;
        $rate = $receiveCountry['rate'] / $sendCountry['rate'];


        $data['rate'] = round($rate, config('basic.fraction_number'));

        $data['send_currency'] = $sendCountry['code'];
        $data['receive_currency'] = $receiveCountry['code'];

        if ($request->sendReceive == "send") {
            $data['send_amount'] = $amount;
            $data['fees'] = round(getCharge($amount, $receiveCountry->id, $receiveCountryFacilities->id), 2);
            $data['total_payable'] = round($amount + $data['fees'], config('basic.fraction_number'));
            $data['recipient_get'] = round($amount * $rate, 2);
        }

        if ($request->sendReceive == "receive") {
            $data['send_amount'] = round($amount / $rate, 2);
            $data['fees'] = round(getCharge($amount, $receiveCountry->id, $receiveCountryFacilities->id) / $rate, 2);
            $data['total_payable'] = round(($amount / $rate) + $data['fees'], config('basic.fraction_number'));
            $data['recipient_get'] = round($amount, 2);
        }

        $invoice = invoice();



        $sendMoney = new  SendMoney();
        $sendMoney->invoice = $invoice;
        $sendMoney->user_id = $this->user->id;
        $sendMoney->send_currency_id = $sendCountry['id'];
        $sendMoney->receive_currency_id = $receiveCountry['id'];
        $sendMoney->service_id = $receiveCountryFacilities->id;
        $sendMoney->country_service_id = $provider->id;
        $sendMoney->send_curr_rate = $sendCountry['rate'];
        $sendMoney->send_curr = $sendCountry['code'];
        $sendMoney->receive_curr = $receiveCountry['code'];
        $sendMoney->rate = $rate;
        $sendMoney->send_amount = $data['send_amount'];
        $sendMoney->fees = $data['fees'];
        $sendMoney->payable_amount = $data['total_payable'];
        $sendMoney->recipient_get_amount = $data['recipient_get'];

        if($this->user->merchant == 0){
            $sendMoney->sender_name = $this->user->fullname;
            $sendMoney->sender_phone = $this->user->phone;
            $sendMoney->sender_email = $this->user->email;
            $sendMoney->sender_address = $this->user->address;
        }

        if(isset($request->recipient_id))
		{
			$Recipient = Recipient::select('*')->where('id', $request->recipient_id)->first();
			$sendMoney->recipient_name 			= $Recipient->first_name.' '.$Recipient->last_name;
            $sendMoney->first_name 				= $Recipient->first_name;
            $sendMoney->last_name 				= $Recipient->last_name;
            $sendMoney->recipient_email 		= $Recipient->email;
            $sendMoney->recipient_contact_no 	= $Recipient->phone;
            $sendMoney->recipient_country_code 	= $Recipient->country_code;
            $sendMoney->recipient_address 		= $Recipient->address;
            $sendMoney->recipient_city 			= $Recipient->city;
            $sendMoney->recipient_pcode 		= $Recipient->postal_code;
            $sendMoney->recipient_state 		= $Recipient->state;
            $sendMoney->recipient_country 		= $Recipient->country;
            $sendMoney->recipient_id 			= $Recipient->id;

		}
        $sendMoney->save();



        if ($request->cupone != null) {
            $coupon = Coupon::where('code', trim($request->cupone))->whereNull('user_id')->first();
            if (!$coupon) {
                session()->flash('error', 'Invalid promo code');
                return back()->withInput();
            }
            if ($sendMoney->promo_code == null) {
                $sendMoney->discount = ($sendMoney->payable_amount * $coupon->reduce_fee) / 100;
                $sendMoney->promo_code = $coupon->code;
                $sendMoney->save();

                $coupon->user_id =  $this->user->id;
                $coupon->used_at = Carbon::now();
                $coupon->update();
            }
        }
        //log_action('Add calculation', '');
        return redirect()->route('user.sendMoney', $sendMoney);
    }

    public function sendUserMoney(SendMoney $sendMoney)
    {
        $templateSection = ['calculation', 'why-chose-us', 'app', 'way-to-send','send-money-video' , 'testimonial','support','faq','family-support','blog','we-accept'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
        $contentSection = ['why-chose-us', 'way-to-send','testimonial','faq','why-chose-us','blog'];
        $data['contentDetails'] = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $data['title'] = 'Home';

        // new blocks by am
        $code = session()->get('trans');
		$language = Language::where('short_name', $code)->first();
		$language_id = $language->id;


        $data['receiveCountry'] = Country::join('country_langs', 'countries.id', '=', 'country_langs.country_id')
            ->select('countries.id','countries.slug','countries.limit','countries.code','countries.minimum_amount','countries.rate','countries.facilities','countries.image', 'countries.per_transfer', 'countries.daily_limit', 'countries.monthly_limit', 'country_langs.name')
            ->where('country_langs.language_id',$language_id)
            ->where('countries.send_to', 1)
            ->where('countries.status', 1)
			->orderby('countries.id','ASC')
            ->get();

        $data['sendFromCountry'] = Country::join('country_langs', 'countries.id', '=', 'country_langs.country_id')
            ->select('countries.id','countries.slug','countries.limit','countries.code','countries.minimum_amount','countries.rate','countries.facilities','countries.image', 'countries.per_transfer', 'countries.daily_limit', 'countries.monthly_limit', 'country_langs.name')
            ->where('country_langs.language_id',$language_id)
            ->where('countries.send_from', 1)
            ->where('countries.status', 1)
			->orderby('countries.id','ASC')
            ->get();


        return view($this->theme. 'operation.send-user-form', $data);
    }

    public function sendUserMoneyrecipient(SendMoney $sendMoney,$id)
    {
        $user = $this->user;
        $data['page_title'] = "SEND MONEY";
        $data['sendMoney'] = $sendMoney;
        $data['senderCurrencies'] = Country::select('id', 'name', 'slug', 'code', 'minimum_amount', 'rate', 'facilities', 'image')->where('send_from', 1)->where('status', 1)->orderBy('name')->get();
        $data['receiverCurrencies'] = Country::select('id', 'name', 'slug', 'code', 'minimum_amount', 'rate', 'facilities', 'image')->where('send_to', 1)->where('status', 1)->orderBy('name')->get();
        return view($this->theme. 'operation.send-user-form', $data);
    }

    public function sendMoney(SendMoney $sendMoney)
    {
        $user = $this->user;
        if ($sendMoney->user_id != $user->id) {
            abort(401);
        }
        if ($sendMoney->status != '0') {
            session()->flash('error', 'You are not eligible to change request.');
            return redirect()->route('user.transfer-log');
        }
		if(session()->get('trans') == 'US')
		{
			$language_id = 1;
		}else
		{
			$code = session()->get('trans');
			$language = Language::where('short_name', $code)->first();
			$language_id = $language->id;
		}

        $data['page_title'] = "RECIPIENT DETAILS";
        $data['sendMoney'] = $sendMoney;
        $data['sourceFunds'] = SourceFund::select('title')->where('language_id',$language_id)->get();
        $data['sendingPurpose'] = SendingPurpose::select('title')->where('language_id',$language_id)->get();

        $country = Country::find($sendMoney->receive_currency_id);
        $array = array();

        if($country->serviceinfo)
        {
            foreach (json_decode($country->serviceinfo) as $f){
                if($f->service_id==$sendMoney->service_id){
                    array_push($array,$f);
                }
            }

        }

        $data['serviceinfo'] = $array;
        $data['countries'] = Country::where('status', 1)->get();
        $data['sender_country'] = Country::where('id', $sendMoney->send_currency_id)->first();
        $data['receive_country'] = Country::where('id', $sendMoney->receive_currency_id)->first();
        $data['country_serivce'] = CountryService::where('id', $sendMoney->country_service_id)->first();
        return view($this->theme . 'operation.recipient-form', $data);
    }

    public function applycupon(Request $request){
        $coupon = Coupon::where('code', trim($request->coupon))->whereNull('user_id')->get();
        if(count($coupon)>0){
            return $coupon[0];
        }else{
            return 'Invalid Coupon';
        }
    }

    public function sendMoneyFormData(SendMoney $sendMoney, Request $request)
    {
        $country = Country::find($sendMoney->receive_currency_id);
        $array = array();

        if($country->serviceinfo)
        {
            foreach (json_decode($country->serviceinfo) as $f){
                if($f->service_id==$sendMoney->service_id){

                    array_push($array,$f);
                }
            }

        }

        $finalarray = array();
        $finalarrayforrecpiant = array();
        for($i=0;$i<count($array);$i++){

            $a = array($array[$i]->name=>$request->serviceinfo[$i]);
            $b = array('name'=>$array[$i]->name,'value'=>$request->serviceinfo[$i]);
            array_push($finalarray,$a);
            array_push($finalarrayforrecpiant,$b);
        }

        $user = $this->user;
        if ($sendMoney->user_id != $user->id) {
            abort(401);
        }

        if ($sendMoney->status != '0') {
            session()->flash('error', 'You are not eligible to change request.');
            return redirect()->route('user.transfer-log');
        }
        $rules = [];
        $rules['first_name'] = ['sometimes','required', 'max:91'];
        $rules['last_name'] = ['sometimes','required', 'max:91'];
        $rules['recipient_contact_no'] = ['required', 'max:20'];
        $rules['recipient_email'] = ['required', 'email', 'max:30'];
        $rules['fund_source'] = ['required', 'max:255'];
        $rules['purpose'] = ['required', 'max:255'];
        $rules['promo_code'] = ['nullable', 'numeric'];
        $inputField = [];
        if (optional($sendMoney->provider)->services_form) {
            foreach ($sendMoney->provider->services_form as $key => $cus) {
                $rules[$key] = [$cus->validation];
                if ($cus->type == 'file') {
                    array_push($rules[$key], trim($cus->validation));
                    array_push($rules[$key], 'max:' . trim($cus->field_length));
                }
                if ($cus->type == 'text') {
                    array_push($rules[$key], trim($cus->validation));
                    if ($cus->length_type == 'max') {
                        array_push($rules[$key], 'max:' . trim($cus->field_length));
                    } elseif ($cus->length_type == 'digits') {
                        array_push($rules[$key], 'digits:' . trim($cus->field_length));
                    }
                }
                if ($cus->type == 'textarea') {
                    array_push($rules[$key], trim($cus->validation));
                    array_push($rules[$key], 'max:' . trim($cus->field_length));
                }
                $inputField[] = $key;
            }
        }


        $this->validate($request, $rules);
        $user = $this->user;


        $req = Purify::clean($request->all());
        $req = (object)$req;
        $country = Country::where('iso_code', $req->recipient_country)->first(['name', 'code']);
        $path = config('location.send_money.path') . date('Y') . '/' . date('m') . '/' . date('d');
        $collection = collect($req);
        $reqField = [];
        if (optional($sendMoney->provider)->services_form) {
            foreach ($collection as $k => $v) {

                foreach (optional($sendMoney->provider)->services_form as $inKey => $inVal) {
                    if ($k != $inKey) {
                        continue;
                    } else {

                        if ($inVal->type == 'file') {
                            if ($request->hasFile($inKey)) {
                                try {
                                    $reqField[$inKey] = [
                                        'field_name' => $this->uploadImage($request[$inKey], $path),
                                        'file_location' => $path,
                                        'type' => $inVal->type,
                                    ];
                                } catch (\Exception $exp) {
                                    session()->flash('error', 'Could not upload your ' . $inKey);
                                    return back()->withInput();
                                }
                            }
                        } else {
                            $reqField[$inKey] = $v;
                            $reqField[$inKey] = [
                                'field_name' => $v,
                                'type' => $inVal->type,
                            ];
                        }
                    }
                }
            }
            $sendMoney['user_information'] = $reqField;
        } else {
            $sendMoney['user_information'] = null;
        }



        $recipient_name = '';
        if(isset($req->BeneficiaryName))
        {
        	$recipient_name = $req->BeneficiaryName;
        }else
        {
        	if($req->first_name != '' && $req->last_name != ''){
	            $recipient_name =$req->first_name.' '.$req->last_name;
	            $sendMoney->first_name=$req->first_name;
	            $sendMoney->last_name=$req->last_name;
	        }
        }


        $sendMoney->recipient_name = $recipient_name;
        $sendMoney->recipient_contact_no = @$req->recipient_contact_no;
        $sendMoney->recipient_email = @$req->recipient_email;
        $sendMoney->recipient_address = @$req->recipient_address;
        $sendMoney->recipient_country_code = @$req->country_code;
        $sendMoney->recipient_city = @$req->recipient_city;
        $sendMoney->recipient_state = @$req->recipient_state;
        $sendMoney->recipient_country = $country->name;
        $sendMoney->recipient_pcode = @$req->recipient_pcode;
        $sendMoney->fund_source = @$req->fund_source;
        $sendMoney->serviceinfo = $finalarray;
        $sendMoney->purpose = @$req->purpose;


        if ($request->promo_code != null) {
            $coupon = Coupon::where('code', trim($request->promo_code))->whereNull('user_id')->first();
            if (!$coupon) {
                session()->flash('error', 'Invalid promo code');
                return back()->withInput();
            }
            if ($sendMoney->promo_code == null) {
                $sendMoney->discount = ($sendMoney->payable_amount * $coupon->reduce_fee) / 100;
                $sendMoney->promo_code = $coupon->code;

                $coupon->user_id = $user->id;
                $coupon->used_at = Carbon::now();
                $coupon->update();
            }
        }


        $sendMoney->payment_type = 'online';
        $sendMoney->status = 2; //Draft
        $sendMoney->save();

        if($req->recipient_id == 0)
		{
			$recipient = new  Recipient();

	        $recipient->user_id 				= $user->id;
	        $recipient->first_name 				= $request->first_name;
	        $recipient->last_name 				= $request->last_name;
	        $recipient->recipient_name 			= $recipient_name;
	        $recipient->country_code 			= $req->recipient_country;
	        $recipient->phone 					= $request->recipient_contact_no;
	        $recipient->email 					= $request->recipient_email;
	        $recipient->address 				= $request->recipient_address;
	        $recipient->city 					= $request->recipient_city;
	        $recipient->postal_code 			= $request->recipient_pcode;
	        $recipient->state 					= $request->recipient_state;
            $recipient->service_info            = json_encode($finalarrayforrecpiant);
	        $recipient->country 				= $country->name;

	        $recipient->save();
		}else{
            $recipient =  Recipient::find($req->recipient_id);
            $service_info= json_decode($recipient->service_info);

            if($service_info){
                foreach ($finalarrayforrecpiant as $key => $value) {
                    foreach ($service_info as $k => $v) {
                        if(isset($value['name']) && isset($v->name) && $value['name']==$v->name)break;
                        else if(isset($value['name']) && isset($v->name)){array_push($service_info,$value);break;};
                    }
                }
            }
            else{
                $service_info=$finalarrayforrecpiant;
            }

            $recipient->service_info            = json_encode($service_info);
            $recipient->save();
        }
        log_action('Send money', "Send ".$sendMoney->payable_amount." to ".$recipient_name);
        session()->put('invoice', $sendMoney->invoice);
        return redirect()->route('user.addFund');
    }

    public function sendMoneyAction(SendMoney $sendMoney, $actionType)
    {
        if (!in_array(strtolower($actionType), ['fillup', 'payment', 'details'])) {
            abort(404);
        }
        $user = $this->user;
        if ($sendMoney->user_id != $user->id) {
            abort(401);
        }
        if ($sendMoney->status == 0 && $sendMoney->payment_status == 0 && $actionType == "fillup") {
            return redirect()->route('user.sendMoney', $sendMoney);
        } else if ($sendMoney->status == 2 && $sendMoney->payment_status == 0 && $actionType == "payment") {
            session()->put('invoice', $sendMoney->invoice);
            return redirect()->route('user.addFund');
        } else if ($sendMoney->status != 0 && $actionType == "details") {
            $templateSection = ['contact-us'];
            $contactUs = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
            $contactUs = $contactUs['contact-us'][0];

            $data['contact'] = [
                'email' => $contactUs->description->email,
                'phone' => $contactUs->description->phone,
                'address' => $contactUs->description->address
            ];

            $status = '';
            if ($sendMoney->status == 0 && $sendMoney->payment_status == 0) {
                $status = 'Information Need';
            } elseif ($sendMoney->status == 2 && $sendMoney->payment_status == 0) {
                $status = 'Sender has not paid send amount';
            } elseif ($sendMoney->status == 3 || $sendMoney->payment_status == 2) {
                $status = 'Cancelled';
            } elseif ($sendMoney->status == 1 && $sendMoney->payment_status == 1) {
                $status = 'Completed';
            } elseif ($sendMoney->status == 2 && $sendMoney->payment_status == 1) {
                $status = 'Processing';
            } elseif ($sendMoney->status == 2 && $sendMoney->payment_status == 3) {
                $status = 'Payment Hold';
            }

            $htm = '';
            if($sendMoney->serviceinfo){
                foreach(json_decode($sendMoney->serviceinfo) as $y){
                    foreach($y as $a => $j){
                        $htm.="<p>" . $a .':'.  $j . '</p>';
                    }
                }
            }

            $data['invoice'] = [
                'Transaction' => $sendMoney->invoice,
                'Status' => $status,
                'TransactionDate' => ($sendMoney->paid_at) ? dateTime($sendMoney->paid_at) : dateTime($sendMoney->created_at),
                'Service' => optional($sendMoney->service)->name,
                'ServiceProvider' => optional($sendMoney->provider)->name,
                'SendAmount' => getAmount($sendMoney->send_amount, config('basic.fraction_number')) . ' ' . $sendMoney->send_curr,
                'Fees' => getAmount($sendMoney->fees, config('basic.fraction_number')) . ' ' . $sendMoney->send_curr,
                'discountYes' => $sendMoney->discount,
                'Discount' => getAmount($sendMoney->discount, config('basic.fraction_number')) . ' ' . $sendMoney->send_curr,
                'TotalSendAmount' => getAmount($sendMoney->totalPay, config('basic.fraction_number')) . ' ' . $sendMoney->send_curr,
                'RecipientAmount' => getAmount($sendMoney->recipient_get_amount, config('basic.fraction_number')) . ' ' . $sendMoney->receive_curr,
                'Rate' => '1 ' . $sendMoney->send_curr . ' = ' . getAmount($sendMoney->rate, config('basic.fraction_number')) . ' ' . $sendMoney->receive_curr,

                'Sender' => [
                    'Name' => $sendMoney->sender_name,
                    'Phone' => '+'. $sendMoney->sendCurrency->number_country_code.$sendMoney->sender_phone,
                    'Address' => $sendMoney->sender_address,
                    'City' => $sendMoney->sender_city,
                    'PostCode' => $sendMoney->sender_post_code,
                    'Country' => $sendMoney->sender_country,
                ],
                'FundingSource' => $sendMoney->fund_source,
                'SendingPurpose' => $sendMoney->purpose,

                'Recipient' => [
                    'Name' => $sendMoney->recipient_name,
                    'Email' => $sendMoney->recipient_email,
                    'Phone' => '+'.$sendMoney->recipient_country_code.$sendMoney->recipient_contact_no,
                    'Address' => $sendMoney->recipient_address,
                    'City' => $sendMoney->recipient_city,
                    'PostalCode' => $sendMoney->recipient_pcode,
                    'State' => $sendMoney->recipient_state,
                    'Country' => $sendMoney->recipient_country,
                    'paymentinfo' =>  $htm,
                ]
            ];
            // return view(template(). 'layouts.invoice', $data);
            $pdf = PDF::loadView(template(). 'layouts.invoice', $data);
            return $pdf->stream('invoice.pdf');
        } else if ($sendMoney->status == '0') {
            session()->flash('error', 'You are not eligible to action this request.');
            return redirect()->route('user.transfer-log');
        }
        abort(404);

    }

    public function transferLog(Request $request)
    {
        $user = $this->user;
        $data['page_title'] = "TRANSFER LOG";
        $data['sendMoneys'] = SendMoney::where('user_id', $user->id)->latest()->paginate(config('basic.paginate'));
        return view($this->theme . 'operation.transferLog', $data);
    }

    public function transferLogSearch(Request $request)
    {
        $user = $this->user;
        $data['page_title'] = "TRANSFER LOG";
        $search = $request->all();
        $dateSearch = $request->datetrx;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);
        $data['sendMoneys'] = SendMoney::where('user_id', $this->user->id)->with('user')
            ->when(@$search['invoice'], function ($query) use ($search) {
                return $query->where('invoice', 'LIKE', "%{$search['invoice']}%");
            })
            ->when(@$search['remark'], function ($query) use ($search) {
                return $query->where('send_amount', 'LIKE', "%{$search['remark']}%")
                    ->orWhere('send_amount', 'LIKE', "%{$search['remark']}%");
            })
            ->when($date == 1, function ($query) use ($dateSearch) {
                 return $query->whereDate("paid_at", $dateSearch)->orWhereDate("received_at", $dateSearch);
            })

            ->paginate(config('basic.paginate'));

        return view($this->theme . 'operation.transferLog',$data);
    }

    public function transferLogDelete(Request $request, $id)
    {
        $sendMoney = SendMoney::withTrashed()->where('user_id',auth()->id())->findOrFail($id);
        if ($sendMoney->payment_status == 0) {
            $sendMoney->forceDelete();
            log_action('Delete transaction', 'Transaction Has Been Removed');
            return back()->with('success', 'Transaction Has Been Removed');
        }
        return back()->with('error', 'Unable to remove Transaction');
    }

    public function recipients()
    {
        $user = $this->user;
        $data['page_title'] = "MY RECIPIENTS";
        $data['logs'] = Recipient::select('*')->where('user_id', $user->id)->distinct()->latest()->paginate(config('basic.paginate'));
        return view($this->theme . 'operation.recipients', $data);
    }

    public function add_recipients()
    {
        $user = $this->user;
        $data['page_title'] = "ADD RECIPIENTS";
        $data['countries'] = Country::where('status', 1)->get();

        return view($this->theme . 'operation.add_recipients', $data);
    }

    public function editrecipients()
    {
        $user 	= $this->user;
        $id 	= $_GET['id'];
        $data['page_title'] = "EDIT RECIPIENTS";
        $data['logs'] = Recipient::where('id', $id)->where('user_id', $user->id)->first();
        if(!empty($data['logs']))
        {
        	$data['countries'] = Country::where('status', 1)->get();
        	return view($this->theme . 'operation.edit_recipients', $data);
        }else
        {
        	return redirect()->route('user.recipients');
        }

    }

    public function ajaxgetRecipient(Request $request)
    {
        if($request->single==1){
            $user = $this->user;
            $recipient = Recipient::find($request->id);
            return $recipient;
        }else{
            $user = $this->user;
            $recipient = Recipient::select('*')->where('user_id', $user->id)->latest()->get();
            if($recipient)
            {
                $response = json_encode(array('success' => true,'message' => 'Added','recipient' => $recipient));
                return $response;
            }else
            {
                $response = json_encode(array('success' => false,'message' => 'There is no Recipient in your list'));
                return $response;
            }
        }
    }



    public function store_recipients(Request $request)
    {
        $user = $this->user;
        $rules = [];
        $rules['first_name'] = ['sometimes','required', 'max:91'];
        $rules['last_name'] = ['sometimes','required', 'max:91'];
        $rules['recipient_contact_no'] = ['required', 'max:20'];
        $rules['recipient_email'] = ['required', 'email', 'max:30'];
        $inputField = [];

        $this->validate($request, $rules);

        $recipient = new  Recipient();

        $recipient->user_id 				= $user->id;
        $recipient->first_name 				= $request->first_name;
        $recipient->last_name 				= $request->last_name;
        $recipient->recipient_name 			= $request->first_name.' '.$request->last_name;
        $recipient->phone 					= $request->recipient_contact_no;
        $recipient->country_code 			= $request->country_code;
        $recipient->email 					= $request->recipient_email;
        $recipient->bank_acc_no 			= $request->bank_acc_no;
        $recipient->address 				= $request->recipient_address;
        $recipient->city 					= $request->recipient_city;
        $recipient->postal_code 			= $request->recipient_pcode;
        $recipient->state 					= $request->recipient_state;
        $recipient->country 				= $request->recipient_country;

        $recipient->save();

        log_action('Add recipient', 'User added a new recipient profile information.');

        return redirect()->route('user.recipients');
    }

    public function updaterecipients(Request $request)
    {
        $user = $this->user;
        $rules = [];
        $rules['first_name'] = ['sometimes','required', 'max:91'];
        $rules['last_name'] = ['sometimes','required', 'max:91'];
        $rules['recipient_contact_no'] = ['required', 'max:20'];
        $rules['recipient_email'] = ['required', 'email', 'max:30'];
        $inputField = [];

        $this->validate($request, $rules);

        $recipient = Recipient::where('id', $request->id)->first();
        $country = Country::where('iso_code', $request->recipient_country)->first();

        $finalarrayforrecpiant = array();
        $arr = json_decode( $recipient->service_info);

        if(isset($request->serviceinfo))
        {
            for($i=0;$i<count($request->serviceinfo);$i++){
                if(isset($arr[$i]) && $request->serviceinfo[$i])
                {
                    $b = array('name'=>$arr[$i]->name,'value'=>$request->serviceinfo[$i]);
                    array_push($finalarrayforrecpiant,$b);
                }
            }
        }


        $recipient->user_id 				= $user->id;
        $recipient->first_name 				= $request->first_name;
        $recipient->last_name 				= $request->last_name;
        $recipient->recipient_name 			= $request->first_name.' '.$request->last_name;
        $recipient->phone 					= $request->recipient_contact_no;
        $recipient->country_code 			= $request->recipient_country;
        $recipient->email 					= $request->recipient_email;
        $recipient->bank_acc_no 			= $request->bank_acc_no;
        $recipient->address 				= $request->recipient_address;
        $recipient->city 					= $request->recipient_city;
        $recipient->postal_code 			= $request->recipient_pcode;
        $recipient->service_info            = json_encode($finalarrayforrecpiant);
        $recipient->state 					= $request->recipient_state;
        $recipient->country 				= $country->name;

        $recipient->save();

        log_action('Edit recipient', 'User updated recipient information.');

        return redirect()->route('user.recipients');
    }


    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user = $this->user;

        if($this->user->merchant){
            $data['sendMoney']  = collect(SendMoney::where('user_id',$user->id)
                ->selectRaw('COUNT(CASE WHEN payment_status = 1 THEN id END) AS total')
                ->selectRaw('SUM(CASE WHEN payment_status = 1 THEN merchant_commission END) AS merchantCommission')
                ->get()->makeHidden(['totalPay', 'totalBaseAmountPay','totalBaseAmountChargePay'])->toArray())->collapse();

            $data['payout']  = collect(SendMoney::where('merchant_id',$user->id)
                ->selectRaw('COUNT(CASE WHEN status = 1 THEN id END) AS total')
                ->selectRaw('SUM(CASE WHEN status = 1 THEN merchant_profit END) AS merchantProfit')
                ->get()->makeHidden(['totalPay', 'totalBaseAmountPay','totalBaseAmountChargePay'])->toArray())->collapse();


            $data['funding'] = collect(Fund::where('user_id',$user->id)->selectRaw('SUM(CASE WHEN status = 1 THEN amount END) AS totalDeposit')->get()->toArray())->collapse();

            $data['transaction'] = Transaction::toBase()->where('user_id',$user->id)->count();
            $data['ticket'] = Ticket::toBase()->where('user_id',$user->id)->count();
            $data['withdrow'] = Withdrow::toBase()->where('user_id',$user->id)->whereIn('status', [1, 2])->sum('amount');

            $lastMonth = CarbonPeriod::create(Carbon::now()->subDays(29), Carbon::now());
            $lastMonthOrders = [];

            foreach ($lastMonth as $date) {
                $lastMonthOrders['days'][] = $date->format("D");
                $lastMonthOrders['orders'][] = DB::table('send_money')->where('user_id',$user->id)->whereDate('created_at', '=', $date)->count();
            }
            $data['lastMonthOrders'] = $lastMonthOrders;

            return view($this->theme . 'dashboard',$data);
        }
        elseif($this->user->merchant=='0'){
            $data['sendMoney']  = collect(SendMoney::where('user_id',$user->id)
                ->selectRaw('COUNT(CASE WHEN payment_status = 1 THEN id END) AS total')
                ->selectRaw('SUM(CASE WHEN payment_status = 1 THEN merchant_commission END) AS merchantCommission')
                ->get()->makeHidden(['totalPay', 'totalBaseAmountPay','totalBaseAmountChargePay'])->toArray())->collapse();

            $data['payout']  = collect(SendMoney::where('merchant_id',$user->id)
                ->selectRaw('COUNT(CASE WHEN status = 1 THEN id END) AS total')
                ->selectRaw('SUM(CASE WHEN status = 1 THEN merchant_profit END) AS merchantProfit')
                ->get()->makeHidden(['totalPay', 'totalBaseAmountPay','totalBaseAmountChargePay'])->toArray())->collapse();


            $data['funding'] = collect(Fund::where('user_id',$user->id)->selectRaw('SUM(CASE WHEN status = 1 THEN amount END) AS totalDeposit')->get()->toArray())->collapse();



            $walletBalance= 1122;
            $totalDeposit= 420;
            $data['transaction'] = Transaction::toBase()->where('user_id',$user->id)->count();
            $data['transactionamount'] = Transaction::toBase()->where('user_id',$user->id)->sum('amount');
            $data['ticket'] = Ticket::toBase()->where('user_id',$user->id)->count();


            $data['transaction'] = Transaction::toBase()->where('user_id',$user->id)->count();
            $data['ticket'] = Ticket::toBase()->where('user_id',$user->id)->count();
            $data['withdrow'] = Withdrow::toBase()->where('user_id',$user->id)->whereIn('status', [1, 2])->sum('amount');

            $lastMonth = CarbonPeriod::create(Carbon::now()->subDays(29), Carbon::now());
            $lastMonthOrders = [];

            foreach ($lastMonth as $date) {
                $lastMonthOrders['days'][] = $date->format("D");
                $lastMonthOrders['orders'][] = DB::table('send_money')->where('user_id',$user->id)->whereDate('created_at', '=', $date)->count();
            }
            $data['lastMonthOrders'] = $lastMonthOrders;

            return view($this->theme . 'dashboard',$data,compact('totalDeposit','walletBalance'));
        }
        else{
            return redirect()->route('user.transfer-log');
        }
    }


    public function transaction()
    {
        $transactions = $this->user->transaction()->orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view($this->theme . 'transaction.index', compact('transactions'));
    }

    public function transactionSearch(Request $request)
    {
        $search = $request->all();
        $dateSearch = $request->datetrx;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);
        $transaction = Transaction::where('user_id', $this->user->id)->with('user')
            ->when(@$search['transaction_id'], function ($query) use ($search) {
                return $query->where('trx_id', 'LIKE', "%{$search['transaction_id']}%");
            })
            ->when(@$search['remark'], function ($query) use ($search) {
                return $query->where('remarks', 'LIKE', "%{$search['remark']}%");
            })
            ->when($date == 1, function ($query) use ($dateSearch) {
                return $query->whereDate("created_at", $dateSearch);
            })
            ->paginate(config('basic.paginate'));
        $transactions = $transaction->appends($search);
        return view($this->theme . 'transaction.index', compact('transactions'));
    }

    public function loginHistory()
    {
        $logs = UserLogin::where('user_id', $this->user->id)->orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view($this->theme . 'transaction.loginLog', compact('logs'));
    }

    public function cratewithdrow()
    {
        $gateways = Gateway::where('withdraw_status', 1)->orderBy('sort_by', 'ASC')->get();
        return view($this->theme . 'withdrow.create', compact('gateways'));
    }

    public function storewithdrow(Request $request)
    {
        $files = $request->file('remarksfile');
        $data = $request->fname;
        $arr = array();
        if($files){
            foreach ($files as $file) {
                $path = Storage::disk('public')->put('uploads', $file);
                array_push($arr,[
                    'name' => $path,
                    'type' => 'file'
                ]);
            }
        }

        if($request->remarks){
            foreach ($request->remarks as $index => $file) {
                array_push($arr,[
                    'fname' => $data[$index],
                    'name' => $file,
                    'type' => 'text'
                ]);
            }
        }


        $amount = (double)$request->amount;
        $charge = (double)$request->charge;
        if($this->user->balance>=$amount+$charge){
            $trx = new Withdrow();
            $trx->user_id=$this->user->id;
            $trx->amount=$amount;
            $trx->currency=$request->currency_code;
            $trx->charge=$charge;
            $trx->remarks=json_encode($arr);
            $trx->gateway_id=$request->gateway_id;
            $trx->trx_type='-';
            $trx->trx_id = strRandom();
            $trx->status=1;
            $trx->save();
            $this->user->balance = $this->user->balance-($amount+$charge);
            $this->user->save();
            log_action('Withdrow Request', "Requested a withdrowal ".$request->currency_code.$amount);
            return redirect()->route('user.cratewithdrow')->with('success',"withdrow Request Place Successfully");
        }else{
            return redirect()->route('user.cratewithdrow')->with('success',"withdrow Request Place Failed insufficient balance");
        }

    }

    public function withdrow()
    {
        $logs = Withdrow::where('user_id', $this->user->id)->where('trx_type','-')->orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view($this->theme . 'withdrow.index', compact('logs'));
    }

    public function withdrowdada(Request $request)
    {
        // return $request->all();
        $validator = validator()->make($request->all(), [
            'gateway' => 'required',
            'amount' => 'required|numeric'
        ]);

        if ($validator->fails()) {
            return response($validator->messages(), 422);
        }
        $basic = (object) config('basic');
        $gate = Gateway::find($request->gateway);
        if (!$gate) {
            return response()->json(['error' => 'Invalid Gateway'], 422);
        }

        $reqAmount = $request->amount;
        if ($gate->min_amount > $reqAmount || $gate->max_amount < $reqAmount) {
            return response()->json(['error' => 'Please Follow Transaction Limit'], 422);
        }


        $charge = getAmount($gate->wfixed_charge + ($reqAmount * $gate->wpercentage_charge / 100));
        $payable = getAmount($reqAmount + $charge);
        $final_amo = getAmount($payable * $gate->convention_rate);
        $user = auth()->user();

        if( 1000 > $gate->id ){
            $method_currency = (checkTo($gate->currencies, $gate->gateway_currency) == 1) ? 'USD' : $gate->gateway_currency;
            $isCrypto = (checkTo($gate->currencies, $gate->gateway_currency) == 1) ? true : false;
        }else{
            $method_currency = $gate->currency;
            $isCrypto = false;
        }

        $data =  [
            'winfo'=> Gateway::with('withdrainfo')->find($request->gateway),
            'gateway_image' => getFile(config('location.gateway.path') . $gate->image),
            'amount' => getAmount($request->amount, config('basic.fraction_number')) . ' ' . $basic->currency,
            'charge' => getAmount($charge,config('basic.fraction_number')) . ' ' . $basic->currency,
            'gateway_currency' => trans($request->gateway_currency),
            'payable' => getAmount($request->amount + $charge, config('basic.fraction_number')) . ' ' . $basic->currency,
            'conversion_rate' => 1 . ' ' . $basic->currency . ' = ' . getAmount($request->rate,2) . ' ' . $method_currency,
            'in' => trans('In') . ' ' . getAmount($request->final_amount, 2),
            'isCrypto' => $isCrypto,
            'conversion_with' => ($isCrypto) ? trans('Conversion with') . " $gate->gateway_currency " . trans('and final value will Show on next step') : null,
            'getwayid' => $gate->id,
        ];

        return view($this->theme . 'withdrow.store', compact('data'));

    }

    public function loginHistoryRemove()
    {
        UserLogin::where('user_id', $this->user->id)->orderBy('id', 'DESC')->delete();
        return back()->with('success', 'Login History Has Been Removed');
    }

    public function logoutAllOtherDevice(Request $request)
    {
        $this->validate($request, [
            'password' => ['required']
        ]);

        $user = $this->user;

            if (Hash::check($request->password, $user->password)) {
                Auth::logoutOtherDevices(request('password'));
                log_action('Logout', 'Logout from all other devices.');
                return back()->with('success',"Logout from all other devices");
            }else{
                return back()->with('error',"Current Password Don't match");
            }


    }


    public function fundHistory()
    {
        $funds = Fund::where('user_id', $this->user->id)->where('status', '!=', 0)->orderBy('id', 'DESC')->with('gateway')->paginate(config('basic.paginate'));
        return view($this->theme . 'transaction.fundHistory', compact('funds'));
    }


    public function fundHistorySearch(Request $request)
    {
        $search = $request->all();

        $dateSearch = $request->date_time;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);

        $funds = Fund::orderBy('id', 'DESC')->where('user_id', $this->user->id)->where('status', '!=', 0)
            ->when(isset($search['name']), function ($query) use ($search) {
                return $query->where('transaction', 'LIKE', $search['name']);
            })
            ->when($date == 1, function ($query) use ($dateSearch) {
                return $query->whereDate("created_at", $dateSearch);
            })
            ->when(isset($search['status']), function ($query) use ($search) {
                return $query->where('status', $search['status']);
            })
            ->with('gateway')
            ->paginate(config('basic.paginate'));
        $funds->appends($search);
        return view($this->theme . 'transaction.fundHistory', compact('funds'));
    }


    public function payNow()
    {
        $invoice = session()->get('invoice');

        if ($invoice == null) {
            abort(403);
        }
        $sendMoney = SendMoney::latest()->where(['invoice' => $invoice,'status'=>2])->with(['sendCurrency:id,name,rate'])->first();

        if (!$sendMoney) {
            return redirect()->route('user.transfer-log')->with('error', 'Invalid Payment Request');
        }

        if ($sendMoney->payment_status == 1) {
            return redirect()->route('user.transfer-log')->with('success', 'Payment has been completed');
        }
        if ($sendMoney->payment_status == 3) {
            return redirect()->route('user.transfer-log')->with('error', 'Payment has been rejected');
        }
        if ($sendMoney->payment_status == 3) {
            return redirect()->route('user.transfer-log')->with('warning', 'Wait for payment approval by admin');
        }

        $data['totalPayment'] = round($sendMoney->totalBaseAmountPay, config('basic.fraction_number'));
        $data['fees'] = round($sendMoney->TotalFees, config('basic.fraction_number'));
        $data['gateways'] = Gateway::where('status', 1)->orderBy('sort_by', 'ASC')->get();


        return view($this->theme . 'addFund', $data);
    }

    public function addFund()
    {
        $data['gateways'] = Gateway::where('status', 1)->orderBy('sort_by', 'ASC')->get();
        return view($this->theme . 'addFundWallet', $data);
    }


    public function profile(Request $request)
    {

        $validator = Validator::make($request->all(), []);
        $data['user'] = $this->user;
        $data['languages'] = Language::all();
        $data['identityFormList'] = IdentifyForm::where('status', 1)->get();
        $data['countries'] = Country::where('status', 1)->get();
        if ($request->has('identity_type')) {
            $validator->errors()->add('identity', '1');
            $data['identity_type'] = $request->identity_type;
            $data['identityForm'] = IdentifyForm::where('slug', trim($request->identity_type))->where('status', 1)->firstOrFail();
            return view($this->theme . 'profile.myprofile', $data)->withErrors($validator);
        }
        return view($this->theme . 'profile.myprofile', $data);
    }

    public function downloadprofile(Request $request)
    {

        $data['user'] = $this->user;
        $data['languages'] = Language::all();
        $data['identityFormList'] = IdentifyForm::where('status', 1)->get();
        $templateSection = ['contact-us'];
        $contactUs = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
        $contactUs = $contactUs['contact-us'][0];

        $data['contact'] = [
            'email' => $contactUs->description->email,
            'phone' => $contactUs->description->phone,
            'address' => $contactUs->description->address
        ];
        $report_name = str_replace(' ','-',$data['user']->firstname.'-'.$data['user']->lastname);

        $pdf = PDF::loadView($this->theme .'profile.downloadprofile', $data);
        return $pdf->stream($report_name.'-User-data.pdf');

    }

    public function updateProfile(Request $request)
    {
        $allowedExtensions = array('jpg', 'png', 'jpeg');
        $image = $request->image;
        $this->validate($request, [
            'image' => [
                'required',
                'max:4096',
                function ($fail) use ($image, $allowedExtensions) {
                    $ext = strtolower($image->extension());
                    if (!in_array($ext, $allowedExtensions)) {
                        return $fail("Only png, jpg, jpeg images are allowed");
                    } else {
                        if (($image->getSize() / 1000000) > 2) {
                            return $fail("Images MAX  2MB ALLOW!");
                        }
                    }
                }
            ]
        ]);
        $user = $this->user;
        if ($request->hasFile('image')) {
            $path = config('location.user.path');
            try {
                $user->image = $this->uploadImage($image, $path);
            } catch (\Exception $exp) {
                return back()->with('error', 'Could not upload your ' . $image)->withInput();
            }
        }
        $user->save();
        log_action('Edit profile', 'User updated their profile information.');
        return redirect()->route('user.profile')->with('success', 'Updated Successfully.');
    }

    public function updateInformation(Request $request)
    {
        $languages = Language::all()->map(function ($item) {
            return $item->id;
        });

        $req = Purify::clean($request->all());
        $user = $this->user;
        $rules = [
            'dob' => 'required',
            'firstname' => 'required',
            'lastname' => 'required',
            'username' => "sometimes|required|alpha_dash|min:4|unique:users,username," . $user->id,
            'address' => 'required',
            'city' => 'sometimes|required',
            'post_code' => 'sometimes|required',
            'state' => 'sometimes|required',
            'country' => 'sometimes|required',
            'language_id' => Rule::in($languages),
        ];
        $message = [
            'firstname.required' => 'First Name field is required',
            'lastname.required' => 'Last Name field is required',
        ];




        $validator = Validator::make($request->all(), $rules, $message);
        if ($validator->fails()) {
            $validator->errors()->add('profile', '1');
            return redirect()->route('user.profile')->withErrors($validator)->withInput();
        }
        $user->language_id = $req['language_id'];
        $user->firstname = $req['firstname'];
        $user->lastname = $req['lastname'];
        $user->username = $req['username'];
        if($request->has('dob')){
            $user->dob = Carbon::parse($request->dob);
        }
        if($request->has('address')){
            $user->address = $req['address'];
        }
        if($request->has('phone')){
            $user->phone = $req['phone'];
        }
        if($request->has('city')){
            $user->city = $req['city'];
        }
        if($request->has('post_code')){
            $user->post_code = $req['post_code'];
        }
        if($request->has('state')){
            $user->state = $req['state'];
        }

        if($request->has('country')){
            $country = Country::where('iso_code' , $request->country)->first('name');
            $user->country = $country->name;
        }
        $user->save();
        log_action('Edit profile', 'User updated their profile information.');
        return redirect()->route('user.profile')->with('success', 'Updated Successfully.');
    }

    public function updatePassword(Request $request)
    {

        $rules['current_password'] = ["required"];

        if (config('basic.strong_password') == 0) {
            $rules['password'] = ["required", "min:6", 'confirmed'];
        } else {
            $rules['password'] = ["required", 'confirmed',
                Password::min(6)->mixedCase()
                    ->letters()
                    ->numbers()
                    ->symbols()
                    ->uncompromised()];
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $validator->errors()->add('password', '1');
            return back()->withErrors($validator)->withInput();
        }
        $user = $this->user;
        try {
            if (Hash::check($request->current_password, $user->password)) {
                $user->password = bcrypt($request->password);
                $user->save();
                log_action("Edit password', 'User's password updated their profile.");
                return redirect()->route('user.profile')->with('success', 'Password Changes successfully.');
            } else {
                throw new \Exception('Current password did not match');
            }
        } catch (\Exception $e) {
            return redirect()->route('user.profile')->with('error', $e->getMessage());
        }
    }

    public function updateTwoFa(Request $request)
    {

        $rules['twofa_password'] = ["required"];
        $rules['twofaStatus'] = ["required"];


        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $validator->errors()->add('fa', '1');
            return back()->withErrors($validator)->withInput();
        }
        $user = $this->user;
        try {
            if (Hash::check($request->twofa_password, $user->password)) {
                $user->two_fa=$request->twofaStatus;
                $user->save();
                log_action('Edit 2FA password', "User's 2FA password updated their profile.");
                return redirect()->route('user.profile')->with('success', 'Update Successfully.');
            } else {
                throw new \Exception('Current password did not match');
            }
        } catch (\Exception $e) {
            return redirect()->route('user.profile')->with('error', $e->getMessage());
        }
    }


    public function verificationSubmit(Request $request)
    {

        $identityFormList = IdentifyForm::where('status', 1)->get();
        $rules['identity_type'] = ["required", Rule::in($identityFormList->pluck('slug')->toArray())];
        $identity_type = $request->identity_type;
        $identityForm = IdentifyForm::where('slug', trim($identity_type))->where('status', 1)->firstOrFail();

        $params = $identityForm->services_form;

        $rules = [];
        $inputField = [];
        $verifyImages = [];

        if ($params != null) {
            foreach ($params as $key => $cus) {
                $rules[$key] = [$cus->validation];
                if ($cus->type == 'file') {
                    array_push($rules[$key], 'image');
                    array_push($rules[$key], 'mimes:jpeg,jpg,png');
                    array_push($rules[$key], 'max:2048');
                    array_push($verifyImages, $key);
                }
                if ($cus->type == 'text') {
                    array_push($rules[$key], 'max:191');
                }
                if ($cus->type == 'textarea') {
                    array_push($rules[$key], 'max:300');
                }
                $inputField[] = $key;
            }
        }

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $validator->errors()->add('identity', '1');

            return back()->withErrors($validator)->withInput();
        }


        $path = config('location.kyc.path').date('Y').'/'.date('m').'/'.date('d');
        $collection = collect($request);

        $reqField = [];
        if ($params != null) {
            foreach ($collection as $k => $v) {
                foreach ($params as $inKey => $inVal) {
                    if ($k != $inKey) {
                        continue;
                    } else {
                        if ($inVal->type == 'file') {
                            if ($request->hasFile($inKey)) {
                                try {
                                    $reqField[$inKey] = [
                                        'field_name' => $this->uploadImage($request[$inKey], $path),
                                        'type' => $inVal->type,
                                    ];
                                } catch (\Exception $exp) {
                                    session()->flash('error', 'Could not upload your ' . $inKey);
                                    return back()->withInput();
                                }
                            }
                        } else {
                            $reqField[$inKey] = $v;
                            $reqField[$inKey] = [
                                'field_name' => $v,
                                'type' => $inVal->type,
                            ];
                        }
                    }
                }
            }
        }

        try {

            DB::beginTransaction();

            $user = $this->user;
            $kyc = new KYC();
            $kyc->user_id = $user->id;
            $kyc->kyc_type = $identityForm->slug;
            $kyc->details = $reqField;
            $kyc->save();

            $user->identity_verify =  1;
            $user->save();

            if(!$kyc){
                DB::rollBack();
                $validator->errors()->add('identity', '1');
                return back()->withErrors($validator)->withInput()->with('error', "Failed to submit request");
            }
            DB::commit();
            log_action('KYC', 'KYC request has been submitted.');
            return redirect()->route('user.profile')->withErrors($validator)->with('success', 'KYC request has been submitted.');

        } catch (\Exception $e) {
            return redirect()->route('user.profile')->withErrors($validator)->with('error', $e->getMessage());
        }
    }
    public function addressVerification(Request $request)
    {

        $rules = [];
        $rules['addressProof'] = ['image','mimes:jpeg,jpg,png', 'max:2048'];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            $validator->errors()->add('addressVerification', '1');
            return back()->withErrors($validator)->withInput();
        }

        $path = config('location.kyc.path').date('Y').'/'.date('m').'/'.date('d');

        $reqField = [];
        try {
            if($request->hasFile('addressProof')){
                $reqField['addressProof'] = [
                    'field_name' => $this->uploadImage($request['addressProof'], $path),
                    'type' => 'file',
                ];
            }else{
                $validator->errors()->add('addressVerification', '1');

                session()->flash('error', 'Please select a ' . 'address Proof');
                return back()->withInput();
            }
        } catch (\Exception $exp) {
            session()->flash('error', 'Could not upload your ' . 'address Proof');
            return redirect()->route('user.profile')->withInput();
        }

        try {

            DB::beginTransaction();
            $user = $this->user;
            $kyc = new KYC();
            $kyc->user_id = $user->id;
            $kyc->kyc_type = 'address-verification';
            $kyc->details = $reqField;
            $kyc->save();
            $user->address_verify =  1;
            $user->save();

            if(!$kyc){
                DB::rollBack();
                $validator->errors()->add('addressVerification', '1');
                return redirect()->route('user.profile')->withErrors($validator)->withInput()->with('error', "Failed to submit request");
            }
            DB::commit();
            log_action('Address verification', "User's address verification");
            return redirect()->route('user.profile')->withErrors($validator)->with('success', 'Your request has been submitted.');

        } catch (\Exception $e) {
            $validator->errors()->add('addressVerification', '1');
            return redirect()->route('user.profile')->with('error', $e->getMessage())->withErrors($validator);
        }
    }


    public function merchantSendMoney()
    {
        $user =  $this->user;
        if($user->merchant == 0){
            abort(404);
        }

        $data['page_title'] = 'Send Money';
        $templateSection = ['calculation', 'why-chose-us', 'app', 'way-to-send','send-money-video' , 'testimonial','support','faq','family-support','blog','we-accept'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
        $contentSection = ['why-chose-us', 'way-to-send','testimonial','faq','why-chose-us','blog'];
        $data['contentDetails'] = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $data['title'] = 'Home';

        // new blocks by am
        $code = session()->get('trans');
		$language = Language::where('short_name', $code)->first();
		$language_id = $language->id;


        $data['receiveCountry'] = Country::join('country_langs', 'countries.id', '=', 'country_langs.country_id')
            ->select('countries.id','countries.slug','countries.limit','countries.code','countries.minimum_amount','countries.rate','countries.facilities','countries.image', 'countries.per_transfer', 'countries.daily_limit', 'countries.monthly_limit', 'country_langs.name')
            ->where('country_langs.language_id',$language_id)
            ->where('countries.send_to', 1)
            ->where('countries.status', 1)
			->orderby('countries.id','ASC')
            ->get();

        $data['sendFromCountry'] = Country::join('country_langs', 'countries.id', '=', 'country_langs.country_id')
            ->select('countries.id','countries.slug','countries.limit','countries.code','countries.minimum_amount','countries.rate','countries.facilities','countries.image', 'countries.per_transfer', 'countries.daily_limit', 'countries.monthly_limit', 'country_langs.name')
            ->where('country_langs.language_id',$language_id)
            ->where('countries.send_from', 1)
            ->where('countries.status', 1)
			->orderby('countries.id','ASC')
            ->get();
        return view($this->theme. 'operation.send-form', $data);
    }


    public function merchantSendMoneyFormData(SendMoney $sendMoney, Request $request)
    {
        $basic = (object) config('basic');
        $user = $this->user;
        if ($sendMoney->user_id != $user->id)abort(401);
        if ($sendMoney->status != '0')return back()->withInput()->with('error', 'You are not eligible to change request.');

        $rules = [];
        $rules['payment_type'] = ["required", Rule::in(['online','fund'])];
        $rules['first_name'] = ['required', 'max:91'];
        $rules['last_name'] = ['required', 'max:91'];
        $rules['sender_phone'] = ['required', 'max:50'];
        $rules['sender_email'] = ['required', 'max:50'];
        $rules['sender_address'] = ['required', 'max:191'];
        $rules['sender_city'] = ['required', 'max:40'];
        $rules['sender_post_code'] = ['required', 'max:20'];
        $rules['sender_country'] = ['required', 'max:20'];

        $rules['addressProof'] = ['required','image', 'mimes:jpeg,jpg,png','max:4096'];
        $rules['identityProof'] = ['required','image', 'mimes:jpeg,jpg,png','max:4096'];
        $rules['identity_type'] = ["required", Rule::in(['Driving License','Passport','National ID'])];

        $rules['recipient_name'] = ['required', 'max:91'];
        $rules['recipient_contact_no'] = ['required', 'max:20'];
        $rules['recipient_email'] = ['required', 'email', 'max:30'];
        $rules['fund_source'] = ['required', 'max:255'];
        $rules['purpose'] = ['required', 'max:255'];
        $rules['promo_code'] = ['nullable', 'numeric'];
        $inputField = [];


        if (optional($sendMoney->provider)->services_form) {
            foreach ($sendMoney->provider->services_form as $key => $cus) {
                $rules[$key] = [$cus->validation];
                if ($cus->type == 'file') {
                    array_push($rules[$key], trim($cus->validation));
                    array_push($rules[$key], 'max:' . trim($cus->field_length));
                }
                if ($cus->type == 'text') {
                    array_push($rules[$key], trim($cus->validation));
                    if ($cus->length_type == 'max') {
                        array_push($rules[$key], 'max:' . trim($cus->field_length));
                    } elseif ($cus->length_type == 'digits') {
                        array_push($rules[$key], 'digits:' . trim($cus->field_length));
                    }
                }
                if ($cus->type == 'textarea') {
                    array_push($rules[$key], trim($cus->validation));
                    array_push($rules[$key], 'max:' . trim($cus->field_length));
                }
                $inputField[] = $key;
            }
        }


        $this->validate($request, $rules,[
            'sender_phone.required' =>'Phone number field is required.',
            'sender_email.required' =>'Email field is required.',
            'sender_address.required' =>'Address field is required.',
            'sender_city.required' =>'City/Town field is required.',
            'sender_post_code.required' =>'Post Code field is required.',
            'sender_country.required' =>'Country field is required.',
        ]);


        if ($request->payment_type == 'fund' && $sendMoney->totalBaseAmountPay > $user->balance) {
            return back()->withInput()->with('error', 'Insufficient Balance.');
        }



        $req = Purify::clean($request->all());
        $req = (object) $req;


        $path = config('location.send_money.path') . date('Y') . '/' . date('m') . '/' . date('d');
        $collection = collect($req);

        DB::beginTransaction();

        $reqField = [];
        if (optional($sendMoney->provider)->services_form) {
            foreach ($collection as $k => $v) {
                foreach (optional($sendMoney->provider)->services_form as $inKey => $inVal) {
                    if ($k != $inKey) {
                        continue;
                    } else {

                        if ($inVal->type == 'file') {
                            if ($request->hasFile($inKey)) {
                                try {
                                    $reqField[$inKey] = [
                                        'field_name' => $this->uploadImage($request[$inKey], $path),
                                        'file_location' => $path,
                                        'type' => $inVal->type,
                                    ];
                                } catch (\Exception $exp) {
                                    session()->flash('error', 'Could not upload your ' . $inKey);
                                    return back()->withInput();
                                }
                            }
                        } else {
                            $reqField[$inKey] = $v;
                            $reqField[$inKey] = [
                                'field_name' => $v,
                                'type' => $inVal->type,
                            ];
                        }
                    }
                }
            }
            $sendMoney['user_information'] = $reqField;
        } else {
            $sendMoney['user_information'] = null;
        }
        $sendMoney->recipient_contact_no 	= $req->recipient_contact_no;
        $sendMoney->recipient_country_code 	= $req->recipient_country_code;
        $sendMoney->recipient_email 		= $req->recipient_email;
        $sendMoney->fund_source 			= $req->fund_source;
        $sendMoney->purpose 				= $req->purpose;
        $sendMoney->recipient_address 		= $req->recipient_address;
        $sendMoney->recipient_city 			= $req->recipient_city;
        $sendMoney->recipient_state 		= $req->recipient_state;
        $sendMoney->recipient_country 		= $req->recipient_country;
        $sendMoney->recipient_pcode 		= $req->recipient_pcode;

        if ($request->promo_code != null) {
            $coupon = Coupon::where('code', trim($request->promo_code))->whereNull('user_id')->first();
            if (!$coupon) {
                session()->flash('error', 'Invalid promo code');
                return back()->withInput();
            }
            if ($sendMoney->promo_code == null) {
                $sendMoney->discount = ($sendMoney->payable_amount * $coupon->reduce_fee) / 100;
                $sendMoney->promo_code = $coupon->code;

                $coupon->user_id = $user->id;
                $coupon->used_at = Carbon::now();
                $coupon->update();
            }
        }

        $sendMoney->sender_name 			= $req->first_name . ' '. $req->last_name;
        $sendMoney->sender_phone 			= $req->sender_phone;
        $sendMoney->sender_country_code 	= $req->sender_country_code;
        $sendMoney->sender_email 			= $req->sender_email;
        $sendMoney->sender_address 			= $req->sender_address;
        $sendMoney->sender_city 			= $req->sender_city;
        $sendMoney->sender_post_code 		= $req->sender_post_code;
        $sendMoney->sender_state 			= $req->sender_state;
        $sendMoney->sender_country 			= $req->sender_country;
        $sendMoney->payment_type 			= $req->payment_type;

        $identityField = [];
        try {
            $sendMoney->sender_identity_type = $req->identity_type;

            if($request->hasFile('identityProof')){
                $identityField['identityProof'] = [
                    'field_name' => $this->uploadImage($request['identityProof'], $path),
                    'file_location' => $path,
                    'type' => 'file',
                ];
                $sendMoney->sender_identity_verification = $identityField;
            }else{
                session()->flash('error', 'Please select a ' . 'identity Proof');
                return back()->withInput();
            }
        } catch (\Exception $exp) {
            session()->flash('error', 'Could not upload your ' . 'identity Proof');
            return back()->withInput();
        }


        $addressField = [];
        try {
            if($request->hasFile('addressProof')){
                $addressField['addressProof'] = [
                    'field_name' => $this->uploadImage($request['addressProof'], $path),
                    'file_location' => $path,
                    'type' => 'file',
                ];
                $sendMoney->sender_address_verification = $addressField;
            }else{
                session()->flash('error', 'Please select a ' . 'address Proof');
                return back()->withInput();
            }
        } catch (\Exception $exp) {
            session()->flash('error', 'Could not upload your ' . 'address Proof');
            return back()->withInput();
        }



        $merchantCom = 0;
        if( 0 < $sendMoney->fees){
            $basicCom = config('basic.merchant_commission');  // percent
            $baseCharge = $sendMoney->fees / $sendMoney->send_curr_rate;
            $merchantCom = ($baseCharge * $basicCom)/100;

            $sendMoney->merchant_commission = $merchantCom;
            $sendMoney->admin_commission  = ($baseCharge-$merchantCom);

            $user->balance=$user->balance+$merchantCom;
            $user->save();

        }else{
            $sendMoney->merchant_commission = 0;
            $sendMoney->admin_commission  = 0;
        }


        $sendMoney->status = 2; //Draft
        $sendMoney->update();

        if($req->recipient_id == '')
		{
			$recipient = new  Recipient();
	        $recipient->user_id 				= $user->id;
	        $recipient->first_name 				= $request->first_name;
	        $recipient->last_name 				= $request->last_name;
	        $recipient->recipient_name 			= $request->recipient_name;
	        $recipient->country_code 			= $request->recipient_country_code;
	        $recipient->phone 					= $request->recipient_contact_no;
	        $recipient->email 					= $request->recipient_email;
	        $recipient->address 				= $request->recipient_address;
	        $recipient->city 					= $request->recipient_city;
	        $recipient->postal_code 			= $request->recipient_pcode;
	        $recipient->state 					= $request->recipient_state;
	        $recipient->country 				= $request->recipient_country;
	        $recipient->save();
		}

        if($request->payment_type == 'online'){
            if(!$sendMoney){
                DB::rollBack();
                return back()->withInput()->with('error', "Failed to submit request");
            }
            DB::commit();
            session()->put('invoice', $sendMoney->invoice);
            return redirect()->route('user.addFund');

        }elseif($request->payment_type == 'fund'){
            $sendMoney->payment_status = 1;
            $sendMoney->paid_at = Carbon::now();
            $sendMoney->save();

            $user->balance -=  $sendMoney->totalBaseAmountPay;
            $user->save();

            $trx_id = strRandom();
            $remarks = "Send money Invoice: ".$sendMoney->invoice;
            BasicService::makeTransaction($user, getAmount($sendMoney->totalBaseAmountPay),  getAmount($sendMoney->totalBaseAmountChargePay), '-', $trx_id, $remarks );

            $remarks = "You got commission from #".$sendMoney->invoice;
            BasicService::makeTransaction($user, getAmount($merchantCom),  0, '+', $trx_id, $remarks );

            if(!$sendMoney){
                DB::rollBack();
                return back()->withInput()->with('error', "Failed to submit request");
            }
            DB::commit();


            ReloadlyService::topupsAsync($sendMoney);

            $msg = [
                'username' => $user->username,
                'amount' => getAmount($sendMoney->totalPay, config('basic.fraction_number')),
                'currency' => $sendMoney->send_curr
            ];
            $action = [
                "link" => route('admin.money-transfer.details', $sendMoney),
                "icon" => "fa fa-money-bill-alt text-white"
            ];
            $this->adminPushNotification('SEND_MONEY_REQUEST', $msg, $action);


            $msg2 = [
                'amount' =>  getAmount($sendMoney->totalPay, config('basic.fraction_number')),
                'currency' => $sendMoney->send_curr,
            ];
            $action2 = [
                "link" => '#',
                "icon" => "fas fa-money-bill-alt text-white"
            ];
            $this->userPushNotification($user, 'MERCHANT_TRANSFER_PROCESSING', $msg2, $action2);


            $this->sendMailSms($user, 'MERCHANT_TRANSFER_PROCESSING', [
                'amount' => getAmount($sendMoney->totalPay,config('basic.fraction_number')),
                'currency' => $sendMoney->send_curr,
                'invoice' => $sendMoney->invoice
            ]);
        }
        log_action('Transaction', "New transaction");
        return redirect()->route('user.transfer-log')->with('success', 'Transaction has been Successful.');
    }

    public function merchantPayout()
    {
        $user =  $this->user;
        if($user->merchant == 0){
            abort(404);
        }
        $data['page_title'] = 'Payout Money';
        return view($this->theme. 'operation.payout', $data);
    }

    public function merchantPayoutRequest(Request $request)
    {
        $this->validate($request, [
            'invoice_number' => 'required|numeric|min:10',
        ]);

        $user =  $this->user;

        $sendMoney = SendMoney::where('invoice', $request->invoice_number)->where('payment_status',1)->first();
        if(!$sendMoney){
            return back()->withInput()->with('error', "Invalid Request");
        }
        if ($sendMoney->user_id == $user->id) {
            session()->flash('error', ' You cannot payout this transaction');
            return back();
        }
        if($sendMoney->status == '1') {
            session()->flash('error', ' This Transaction already Closed');
            return back();
        }
        if($sendMoney->status == '2') {
            return redirect()->route('user.merchant.payout-money.info',$sendMoney);
        }

        abort(404);
    }

    public function payoutRequestInfosent($id)
    {
    	$sendMoney = SendMoney::where('invoice', $id)->first();
    	 $user =  $this->user;

    	 $this->mail2('ahsankk126@gmail.com', 'VERIFICATION_CODE', [
                    'code' => $user->verify_code
                ]);
    }

    public function payoutRequestInfo(SendMoney $sendMoney)
    {

        $user =  $this->user;
        if($user->merchant == 0){
            abort(404);
        }

        if($sendMoney->payment_status != '1'){
            return back()->withInput()->with('error', "Invalid Request");
        }
        if ($sendMoney->user_id == $user->id) {
            session()->flash('error', ' You cannot payout this transaction');
            return back();
        }



        if($sendMoney->status == '1' && ($sendMoney->merchant_id != $user->id)) {
            session()->flash('error', ' This Transaction already Closed');
            return back();
        }

        if($sendMoney->status == '2' || ($sendMoney->status == '1' && $sendMoney->merchant_id == $user->id)) {
            $data['page_title'] = 'Receipt Preview';
            $templateSection = ['contact-us'];
            $contactUs = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
            $contactUs = $contactUs['contact-us'][0];

            $data['contact'] = [
                'email' => $contactUs->description->email,
                'phone' => $contactUs->description->phone,
                'address' => $contactUs->description->address
            ];


            $status = '';
            if ($sendMoney->status == 0 && $sendMoney->payment_status == 0) {
                $status = 'Information Need';
            } elseif ($sendMoney->status == 2 && $sendMoney->payment_status == 0) {
                $status = 'Sender Not Pay Yet';
            } elseif ($sendMoney->status == 3 || $sendMoney->payment_status == 2) {
                $status = 'Cancelled';
            } elseif ($sendMoney->status == 1 && $sendMoney->payment_status == 1) {
                $status = 'Completed';
            } elseif ($sendMoney->status == 2 && $sendMoney->payment_status == 1) {
                $status = 'Processing';
            } elseif ($sendMoney->status == 2 && $sendMoney->payment_status == 3) {
                $status = 'Payment Hold';
            }

            $data['invoice'] = [
                'Transaction' => $sendMoney->invoice,
                'Status' => $status,
                'TransactionDate' => ($sendMoney->paid_at) ? dateTime($sendMoney->paid_at) : dateTime($sendMoney->created_at),
                'Service' => optional($sendMoney->service)->name,
                'ServiceProvider' => optional($sendMoney->provider)->name,
                'SendAmount' => getAmount($sendMoney->send_amount, config('basic.fraction_number')) . ' ' . $sendMoney->send_curr,
                'Fees' => getAmount($sendMoney->fees, config('basic.fraction_number')) . ' ' . $sendMoney->send_curr,
                'discountYes' => $sendMoney->discount,
                'Discount' => getAmount($sendMoney->discount, config('basic.fraction_number')) . ' ' . $sendMoney->send_curr,
                'TotalSendAmount' => getAmount($sendMoney->totalPay, config('basic.fraction_number')) . ' ' . $sendMoney->send_curr,
                'RecipientAmount' => getAmount($sendMoney->recipient_get_amount, config('basic.fraction_number')) . ' ' . $sendMoney->receive_curr,
                'Rate' => '1 ' . $sendMoney->send_curr . ' = ' . getAmount($sendMoney->rate, config('basic.fraction_number')) . ' ' . $sendMoney->receive_curr,

                'Sender' => [
                    'Name' => $sendMoney->sender_name,
                    'Phone' => $sendMoney->sender_phone,
                    'Address' => $sendMoney->sender_address,
                ],
                'FundingSource' => $sendMoney->fund_source,
                'SendingPurpose' => $sendMoney->purpose,

                'Recipient' => [
                    'Name' => $sendMoney->recipient_name,
                    'Email' => $sendMoney->recipient_email,
                    'Phone' => $sendMoney->recipient_contact_no,
                ]
            ];


            $data['sendMoney'] = $sendMoney;

            return view($this->theme. 'operation.payout-info', $data);
        }
        abort(404);
    }

    public function payoutRequestConfirm(Request $request, SendMoney $sendMoney)
    {
        $user =  $this->user;
        if($user->merchant == 0){
            abort(404);
        }
        if($sendMoney->payment_status != '1'){
            return back()->withInput()->with('error', "Invalid Request");
        }
        if ($sendMoney->user_id == $user->id) {
            session()->flash('error', ' You cannot payout this transaction');
            return back();
        }

        if($sendMoney->status == '1') {
            session()->flash('error', ' This Transaction already Closed');
            return back();
        }

        if($sendMoney->status == '2') {

            $merchantCom = 0;
            if( 0 < $sendMoney->fees){
                $basicCom = config('basic.merchant_profit');  // percent
                $baseCharge = $sendMoney->fees / $sendMoney->send_curr_rate;
                $merchantCom = ($baseCharge * $basicCom)/100;
                $sendMoney->admin_commission  = $baseCharge - ($sendMoney->merchant_commission + $merchantCom);
                $sendMoney->merchant_profit = $merchantCom;
                $user->balance=$user->balance+$merchantCom;

            }
            $sendMoney->received_at = Carbon::now();
            $sendMoney->status = 1;
            $sendMoney->merchant_id = $user->id;
            $sendMoney->save();


            $user->balance +=  $sendMoney->totalBaseAmountPay;
            $user->save();



            $trx_id = strRandom();
            $remarks = "Your account has been credited for payout #".$sendMoney->invoice;
            BasicService::makeTransaction($user, getAmount($sendMoney->totalBaseAmountPay),  0, '+', $trx_id, $remarks );



            $user->balance +=  $merchantCom;
            $user->save();


            $remarks2 = "Your account has been credited profit for payout #".$sendMoney->invoice;
            BasicService::makeTransaction($user, getAmount($merchantCom),  0, '+', $trx_id, $remarks2 );




            $this->sendMailSms($user, 'PAYOUT_COMPLETE', [
                'amount' => getAmount($sendMoney->totalPay, config('basic.fraction_number')),
                'currency' => $sendMoney->send_curr,
                'invoice' => $sendMoney->invoice
            ]);

            $msg = [
                'amount' => getAmount($sendMoney->totalPay, config('basic.fraction_number')),
                'currency' => $sendMoney->send_curr
            ];
            $action = [
                "link" => '#',
                "icon" => "fas fa-money-bill-alt text-white"
            ];
            $this->userPushNotification($user, 'PAYOUT_COMPLETE', $msg, $action);
            session()->flash('success', ' Payout  has been Successful');
            log_action('Payout', "New payout");
            return redirect()->route('user.transfer-log');

        }
        abort(404);
    }

    public function payoutHistory()
    {
        $page_title = 'Payout History';
        $sendMoneys = SendMoney::where('merchant_id', $this->user->id)->where('payment_status', 1)->orderBy('received_at', 'DESC')->paginate(config('basic.paginate'));
        return view($this->theme . 'operation.payoutHistory', compact('sendMoneys','page_title'));
    }
}
