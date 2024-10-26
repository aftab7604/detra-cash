<?php

namespace App\Http\Controllers;

use DB;
use App\Models\Blog;
use App\Mail\SendMail;
use App\Models\Content;
use App\Models\Country;
use App\Models\Service;
use App\Models\Language;
use App\Models\Template;
use App\Models\Configure;
use App\Models\OurFeature;
use App\Models\Subscriber;
use App\Http\Traits\Notify;
use App\Models\BlogCategory;
use Illuminate\Http\Request;
use App\Models\ContentDetails;
use App\Models\CountryService;
use Illuminate\Validation\Rule;
use Facades\App\Services\BasicCurl;
use Illuminate\Support\Facades\Mail;
use Facades\App\Services\Flutterwave;
use Stevebauman\Purify\Facades\Purify;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Validator;

class FrontendController extends Controller
{
    use Notify;

    public function __construct()
    {
        $this->theme = template();
    }


    public function cron()
    {
        $countries = Country::select('id','code','rate')->where('status',1)->get()->makeHidden('flag');
        $endpoint = 'live';
        $access_key = config('basic.currency_api_key');
        $currencies = join(',',$countries->pluck('code')->toArray()).','.config('basic.currency');

        $source  = "USD";
        $format  = 1;
        $url = 'http://api.currencylayer.com/'.$endpoint.'?access_key='.$access_key.'&currencies='.$currencies.'&source='.$source.'&format='.$format;
        $res = BasicCurl::curlGetRequest($url);
        $res = json_decode($res);

        if($res->success ==  true){
            $getRateCollect = collect($res->quotes)->toArray();
            foreach ($countries as $data){
                $newCode = $source.$data->code;
                if(isset($getRateCollect[$newCode])){
                    $data->rate = @$getRateCollect[$newCode];
                    $data->update();
                }
            }
            $configure = Configure::firstOrNew();
            if(isset($getRateCollect[$source.config('basic.currency')])){
                $baseRate = $getRateCollect[$source.config('basic.currency')];
                config(['basic.rate' => $baseRate]);
                $fp = fopen(base_path() . '/config/basic.php', 'w');
                fwrite($fp, '<?php return ' . var_export(config('basic'), true) . ';');
                fclose($fp);
                $configure->rate = $baseRate;
                $configure->save();
                $output = new \Symfony\Component\Console\Output\BufferedOutput();
                Artisan::call('optimize:clear', array(), $output);
                return $output->fetch();
            }
        }
    }

    public function currencyList()
    {
        $code = session()->get('trans');
		$language = Language::where('short_name', $code)->first();
		$language_id = $language->id;

    	$data['senderCurrencies'] = Country::join('country_langs', 'countries.id', '=', 'country_langs.country_id')
            ->select('countries.id','countries.slug','countries.limit','countries.code','countries.minimum_amount','countries.rate','countries.facilities','countries.image', 'countries.per_transfer', 'countries.daily_limit', 'countries.monthly_limit', 'country_langs.name')
            ->where('country_langs.language_id',$language_id)
            ->where('countries.send_from', 1)
            ->where('countries.status', 1)
			->orderby('countries.id','ASC')
            ->get();

        $data['receiverCurrencies'] = Country::join('country_langs', 'countries.id', '=', 'country_langs.country_id')
            ->select('countries.id','countries.slug','countries.limit','countries.code','countries.minimum_amount','countries.rate','countries.facilities','countries.image', 'countries.per_transfer', 'countries.daily_limit', 'countries.monthly_limit', 'country_langs.name')
            ->where('country_langs.language_id',$language_id)
            ->where('countries.send_to', 1)
            ->where('countries.status', 1)
			->orderby('countries.id','ASC')
            ->get();

        return response($data, 200);
    }
    
    public function serviceList(Request $request)
    {
        $countryId = $request->srceiveid;
        $services = Service::with('childrenServices')->whereHas('countries', function ($query) use ($countryId) {
            $query->where('countries.id', $countryId);
        })->get();
        
        $code = session()->get('trans');
        if($code=='US')return $services;
        else{
            $array=array();
            foreach($services as $s){
                if(isset($s->childrenServices[0]))array_push($array,$s->childrenServices[0]);
            }
            return $array;
        }

    }

    public function toCountry(Country $country)
    {

        $code = session()->get('trans');
		$language = Language::where('short_name', $code)->first();
		$language_id = $language->id;

		$country_new = Country::join('country_langs', 'countries.id', '=', 'country_langs.country_id')
            ->select('countries.id','countries.slug','countries.limit','countries.code','countries.minimum_amount','countries.rate','countries.facilities','countries.image', 'country_langs.name')
            ->where('country_langs.language_id',$language_id)
            ->where('country_langs.country_id',$country->id)
            ->first();

        $data['page_title'] = trans('SEND MONEY TO')."  $country_new->name";
        $data['country'] = $country;

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
        return view($this->theme . 'user.operation.send-form', $data);
    }

    public function ajaxCountryService(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'countryId' => 'required',
            'serviceId' => 'required'
        ]);

        $service=Service::find($request->serviceId);

        $serviceId=$request->serviceId;
        if($service->parent_id!=0){
            $serviceId=$service->parent_id;
        }

        if ($validate->fails()) {
            return response()->json(['errors'=> $validate->messages()], 422);
        }

        if($request->ajax()){
            $countryService = CountryService::select('id','name','operatorId','localMinAmount','localMaxAmount')->where('country_id',$request->countryId)->where('service_id',$serviceId)->where('status',1)->get();

            return response($countryService,200);
        }
        abort(404);
    }

    public function ajaxMoneyCalculation(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'amount' => 'required|numeric',
            'sendCountry' => 'required|numeric',
            'getCountry' => 'required|numeric',
            'serviceId' => 'required|numeric',
            'sendReceive' => ['required', Rule::in(["send","receive"])]
            ],[
                'sendCountry.required' =>"Sender country is required",
                'getCountry.required' =>"Receiver country is required",
                'serviceId.required' =>"Service  is required"
        ]);
        if ($validate->fails()) {
            return response()->json(['errors'=> $validate->errors()]);
        }

        if($request->ajax()){
            $country = Country::select('id','name', 'slug','code','minimum_amount','rate','facilities','image')->whereIn('id',[$request->sendCountry,$request->getCountry])->where('status',1)->get();

            if($request->has('sendCountry')){
                $data['sendCountry'] = $country->where('id',$request->sendCountry)->first();
                if(!$data['sendCountry']){
                    return response()->json(['errors'=> ['sender'=>['Sender Country Not Found']]]);
                }
            }
            if($request->has('getCountry')){
                $data['receiveCountry'] = $country->where('id',$request->getCountry)->first();
                if(!$data['receiveCountry']){
                    return response()->json(['errors'=> ['receiver'=>['Receiver Country Not Found']]]);
                }
                if(!$data['receiveCountry']->facilities){
                    return response()->json(['errors'=> ['receiver_service'=>['Receiver Country Service Not Available']]]);
                }
                $data['receiveCountryFacilities'] = collect($data['receiveCountry']->facilities)->where('id',$request->serviceId)->first();
                if(!$data['receiveCountryFacilities']){
                    return response()->json(['errors'=> ['receiver_service'=>['Receiver Country Service Not Available']]]);
                }
            }

            $amount = $request->amount;
            $rate =  $data['receiveCountry']['rate'] /$data['sendCountry']['rate'];

            $data['rate'] = round($rate,config('basic.fraction_number'));

            $data['send_currency'] = $data['sendCountry']['code'];
            $data['receive_currency'] = $data['receiveCountry']['code'];

            if($request->sendReceive == "send"){
                $data['send_amount'] = $amount;
                $data['fees'] = round(getCharge($amount, $data['receiveCountry']->id,$data['receiveCountryFacilities']->id),2);
                $data['total_payable'] = round($amount + $data['fees'],config('basic.fraction_number'));
                $data['recipient_get'] = round($amount * $rate,2);
            }

            if($request->sendReceive == "receive"){
                $data['send_amount'] = round($amount / $rate,2);
                $data['fees'] = round(getCharge($amount , $data['receiveCountry']->id,$data['receiveCountryFacilities']->id)/$rate,2);
                $data['total_payable'] = round(($amount / $rate) + $data['fees'],config('basic.fraction_number'));
                $data['recipient_get'] = round($amount,2);
            }
            return response($data,200);
        }
        abort(404);
    }

    public function getCharge(Request $request){
        $fee = round(getCharge($request->send_amount, $request->receiveFrom,$request->serviceId),2);
        return $fee;
    }

    public function index()
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

        $featureimage = OurFeature::skip(10)->take(1)->get();

        return view($this->theme . 'home', $data,compact('featureimage'));
    }


    public function about()
    {
        $templateSection = ['about-us', 'services', 'mission-and-vision', 'send-money-video','why-chose-us' , 'we-accept'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
        $contentSection = [ 'services', 'why-chose-us'];
        $data['contentDetails'] = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $data['title'] = 'About Us';

        return view($this->theme . 'about', $data);
    }

    public function howItWork()
    {
        $templateSection = ['way-to-send', 'send-money-video', 'why-chose-us','family-support','we-accept'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
        $contentSection = ['way-to-send','why-chose-us'];
        $data['contentDetails'] = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $data['title'] = 'How it work';
        return view($this->theme . 'howItWork', $data);
    }

    public function help()
    {
        $templateSection = ['app'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
        $contentSection = ['help'];
        $data['contentDetails'] = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $data['title'] = 'Help';
        return view($this->theme . 'help', $data);
    }
    public function contact()
    {
        $templateSection = ['contact-us','we-accept'];
        $templates = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
        $title = 'Contact Us';
        $contact = @$templates['contact-us'][0]->description;

        $contactImage = $templates['contact-us'][0]->templateMedia()->image;

        return view($this->theme . 'contact', compact('title', 'contact','contactImage','templates'));
    }

    public function contactSend(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|max:50',
            'email' => 'required|email|max:91',
            'subject' => 'required|max:100',
            'message' => 'required|max:1000',
        ]);
        $requestData = Purify::clean($request->except('_token', '_method'));

        $basic = (object) config('basic');
        $basicEmail = $basic->sender_email;

        $name = $requestData['name'];
        $email_from = $requestData['email'];
        $requestMessage = $requestData['message'];
        $subject = $requestData['subject'];

        $email_body = json_decode($basic->email_description);

        $message = str_replace("[[name]]", 'Sir', $email_body);
        $message = str_replace("[[message]]", $requestMessage, $message);

        Mail::to($basicEmail)->send(new SendMail($email_from, $subject, $message, $name));

        return back()->with('success', 'Mail has been sent');
    }

    public function blog()
    {
        $data['title'] = "Blog";

        $templateSection = ['blog','family-support'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');

		if(session()->get('trans') == 'US')
		{
			$language_id = 1;
		}else
		{
			$code = session()->get('trans');
			$language = Language::where('short_name', $code)->first();
			$language_id = $language->id;
		}
        $contentSection = ['blog'];
        $data['contentDetails'] = Blog::where('status',1)->where('language_id',$language_id)->latest()->get();

        return view($this->theme . 'blog', $data);
    }

    public function blogCategory($slug = null, $id){

        $category = BlogCategory::where('status',1)->where('id',$id)->firstOrFail();
        $data['title'] = $category->title;
        $templateSection = ['blog','family-support'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');


        $contentSection = ['blog'];
        $data['contentDetails'] = Blog::where('status',1)->where('category_id',$category->id)->latest()->get();

        return view($this->theme . 'blog', $data);
    }
    public function blogDetails($slug = null, $id)
    {
        $getData = Blog::where('status',1)->where('id',$id)->firstOrFail();


        $contentSection = [$getData->name];


        $singleItem['title'] = @$getData->name;
        $singleItem['description'] = @$getData->description;
        $singleItem['date'] = dateTime(@$getData->created_at, 'd M, Y h:i A');
        $singleItem['image'] = getFile(config('location.blog.path') . @$getData->image);



        $contentSectionPopular = ['blog'];
        $popularContentDetails = Blog::where('status',1)->where('id','!=',$id)->latest()->limit(4)->get();

		if(session()->get('trans') == 'US')
		{
			$language_id = 1;
		}else
		{
			$code = session()->get('trans');
			$language = Language::where('short_name', $code)->first();
			$language_id = $language->id;
		}

        $blogCategory = BlogCategory::where('language_id',$language_id)->withCount('blogs')->get();

        return view($this->theme . 'blogDetails', compact('singleItem', 'popularContentDetails','blogCategory'));
    }


    public function faq()
    {

        $templateSection = ['faq','family-support'];
        $data['templates'] = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');

        $contentSection = ['faq'];
        $data['contentDetails'] = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $data['increment'] = 1;
        return view($this->theme . 'faq', $data);
    }


    public function getLink($getLink = null, $id = null)
    {


    	$getData = Content::findOrFail($id);

        $contentSection = [$getData->name];
        $contentDetail = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->where('content_id', $getData->id)
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $title = @$contentDetail[$getData->name][0]->description->title;
        $description = @$contentDetail[$getData->name][0]->description->description;
        return view($this->theme . 'getLink', compact('contentDetail', 'title', 'description'));
    }

	 public function privacy(){
		 $getData = Content::findOrFail(81);

        $contentSection = [$getData->name];
        $contentDetail = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->where('content_id', $getData->id)
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $title = @$contentDetail[$getData->name][0]->description->title;
        $description = @$contentDetail[$getData->name][0]->description->description;
        return view($this->theme . 'getLink', compact('contentDetail', 'title', 'description'));
		 //return redirect()->route('getLink',81);
	 }


	 public function termsandconditions(){
		 $getData = Content::findOrFail(82);

        $contentSection = [$getData->name];
        $contentDetail = ContentDetails::select('id', 'content_id', 'description', 'created_at')
            ->where('content_id', $getData->id)
            ->whereHas('content', function ($query) use ($contentSection) {
                return $query->whereIn('name', $contentSection);
            })
            ->with(['content:id,name',
                'content.contentMedia' => function ($q) {
                    $q->select(['content_id', 'description']);
                }])
            ->get()->groupBy('content.name');

        $title = @$contentDetail[$getData->name][0]->description->title;
        $description = @$contentDetail[$getData->name][0]->description->description;
        return view($this->theme . 'getLink', compact('contentDetail', 'title', 'description'));
		 //return redirect()->route('getLink',81);
	 }




    public function subscribe(Request $request)
    {
        $rules = [
            'subscribe_email' => 'required|email|max:255|unique:subscribers,email'
        ];
        $validator = Validator::make($request->all(), $rules,[
            'subscribe_email.required' => 'The email field is required.'
        ]);
        if ($validator->fails()) {
            return redirect(url()->previous() . '#footer')->withErrors($validator);
        }

        $data = new Subscriber();
        $data->email = $request->subscribe_email;
        $data->save();
        return redirect()->back()->with('success', 'Subscribe successfully');
    }

    public function language($code)
    {
        $language = Language::where('short_name', $code)->first();
        if (!$language) $code = 'US';
        session()->put('trans', $code);
        session()->put('rtl', $language ? $language->rtl : 0);
        return redirect()->back();
    }

    public function ajaxCheckAccount(Request $request)
    {
        $validator = validator()->make($request->all(), [
            'bank_code' => 'required',
            'account_number' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()]);
        }
        $postParam['account_bank'] = $request->bank_code;
        $postParam['account_number'] = $request->account_number;
        $response = Flutterwave::AccountVerification($postParam);
        $response = json_decode($response);
        return $response;
    }

    public function loadMore(Request $request)
    {
        $code = session()->get('trans');
		$language = Language::where('short_name', $code)->first();
		$language_id = $language->id;
        $countries = Country::join('country_langs', 'countries.id', '=', 'country_langs.country_id')
            ->select('countries.id','countries.slug','countries.code','countries.minimum_amount','countries.rate','countries.facilities','countries.image', 'country_langs.name')
            ->where('country_langs.language_id',$language_id)
            ->where('countries.send_to', 1)
            ->where('countries.status', 1)
            ->orderby('countries.id','ASC')
            ->paginate(6);
        $data = '';
        if ($request->ajax()) {
            foreach ($countries as $country) {
                $data.=' <li><a href="'.route('toCountry', [@$country]).'">'.trans('SEND MONEY TO') . ' '.$country->name.'</a></li>';
			}
            return $data;
        }
    }

    public function seeMoreCountry()
    {
        $code = session()->get('trans');
		$language = Language::where('short_name', $code)->first();
		$language_id = $language->id;
        $data['title'] = "Countries";
        $data['countries'] = Country::
            join('country_langs', 'countries.id', '=', 'country_langs.country_id')
            ->select('countries.id','countries.slug','countries.code','countries.minimum_amount','countries.rate','countries.facilities','countries.image', 'country_langs.name')
            ->where('country_langs.language_id',$language_id)
            ->where('countries.send_to', 1)
            ->where('countries.status', 1)
            ->orderby('countries.name','ASC')
            ->get();
        return view($this->theme.'moreCountry',$data);
    }

    public function getcountryrate($id)
    {
        $code = session()->get('trans');
		$language = Language::where('short_name', $code)->first();
		$language_id = $language->id;
        $data['title'] = "Countries";
        $data['countries'] = Country::
            join('country_langs', 'countries.id', '=', 'country_langs.country_id')
            ->select('countries.id','countries.slug','countries.code','countries.minimum_amount','countries.rate','countries.facilities','countries.image', 'country_langs.name')
            ->where('country_langs.language_id',$language_id)
            ->where('countries.send_to', 1)
            ->where('countries.status', 1)
            ->orderby('countries.name','ASC')
            ->get();
        $data['single'] = Country::find($id);
        return $data;
    }
}
