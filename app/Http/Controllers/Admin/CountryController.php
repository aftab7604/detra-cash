<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\Upload;
use App\Models\Continent;
use App\Models\Country;
use App\Models\CountryService;
use App\Models\CountryServiceCharge;
use App\Models\Service;
use App\Models\Serviceinfo;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Models\Language;
use App\Models\CountryLang;
use Illuminate\Support\Facades\Validator;
use Stevebauman\Purify\Facades\Purify;
use Facades\App\Services\ReloadlyService;
use Facades\App\Services\Flutterwave;

class CountryController extends Controller
{
    use Upload;

    public function index()
    {
        $countries = Country::select('id','continent_id','name','image','rate','code','facilities','status')->orderBy('name')->with(['continent:id,name'])->paginate(config('basic.paginate'));
        return view('admin.country.index', compact('countries'));
    }

    public function add()
    {
        $data['page_title'] = "Add Country";
        $data['continents'] = Continent::select('id','name')->where('status', 1)->orderBy('name')->get();
        $data['services'] = Service::select('id','name')->where('status', 1)->orderBy('name')->get();
        return view('admin.country.add', $data);
    }

    public function store(Request $request)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $validate = Validator::make($request->all(), [
            'continent_id' => 'required',
            'name' => 'required',
            'iso_code' => 'required',
            'code' => 'required',
            'minimum_amount' => 'required|numeric',
            'maximum_amount' => 'required|numeric',
            'rate' => 'required',
            'status' => 'required',
            'send_from' => 'required',
            'send_to' => 'required',
            "facilities" => "required|array",
            "facilities.*" => "required|string|distinct",
            "details" => 'nullable'
        ], [
            'continent_id.required' => "Select a continent"
        ]);
        if ($validate->fails()) {
            return back()->withErrors($validate)->withInput();
        }

        $service = Service::select('id', 'name')->whereIn('id', $excp['facilities'])->get()->toArray();

        $data = new Country();

        try {
            if ($request->hasFile('image')) {
                $data->image = $this->uploadImage($request->image, config('location.country.path'), config('location.country.size'));
            }
            $data->name = $excp['name'];
            $data->slug = slug($excp['name']);
            $data->iso_code = $excp['iso_code'];
            $data->code = $excp['code'];
            $data->continent_id = $excp['continent_id'];
            $data->facilities = $service;
            $data->minimum_amount = $excp['minimum_amount'];
            $data->maximum_amount = $excp['maximum_amount'];
            $data->per_transfer = $excp['per_transfer'];
            $data->daily_limit = $excp['daily_limit'];
            $data->monthly_limit = $excp['monthly_limit'];
            $data->number_country_code = $excp['number_country_code'];
            $data->rate = $excp['rate'];
            $data->status = (int) $excp['status'];
            $data->send_from = (int) $excp['send_from'];
            $data->send_to = (int) $excp['send_to'];
            $data->details = $excp['details'];
            $data->save();
            log_admin_activity('New country', 'Added a new country ('.$excp['name'].')');
            session()->flash('success', 'Saved Successfully');
            return back();
        } catch (\Exception $exp) {
            return back()->with('error', $exp)->withInput();
        }

    }

    public function edit(Country $country)
    {
        $data['page_title'] = "Update Country";
        $languages = Language::all();
        $data['languages'] = $languages;
        $data['continents'] = Continent::select('id','name')->where('status', 1)->orderBy('name')->get();
        $data['services'] = Service::select('id','name')->where('status', 1)->where('parent_id',0)->orderBy('name')->get();
        $data['servicesinfo'] = Serviceinfo::with('service')->where('parent_id',null)->where('status', 1)->get();
        $data['country'] = $country;
        return view('admin.country.edit', $data);
    }

    public function update(Request $request, Country $country)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $validate = Validator::make($request->all(), [
            'continent_id' => 'required',
            'name' => 'required',
            'iso_code' => 'required',
            'code' => 'required',
            'number_country_code' => 'required',
            'minimum_amount' => 'required|numeric',
            'maximum_amount' => 'required|numeric',
            'rate' => 'required',
            'status' => 'required',
            'send_from' => 'required',
            'send_to' => 'required',
            "facilities" => "required|array",
            "facilities.*" => "required|string|distinct",
            "details" => 'nullable'
        ], [
            'continent_id.required' => "Select a continent"
        ]);
       
        if ($validate->fails()) {
            return back()->withErrors($validate)->withInput();
        }

        $country->services()->sync($excp['facilities']); //for many to many relation

        $service = Service::select('id', 'name')->whereIn('id', $excp['facilities'])->get()->toArray();
        $serviceinfo=[];
        if(isset($excp['serviceinfo']))
            $serviceinfo = Serviceinfo::select('id', 'name','service_id','type')->whereIn('id', $excp['serviceinfo'])->get()->toArray();

        try {
            if ($request->hasFile('image')) {
                $old = $country->image ?: null;
                $country->image = $this->uploadImage($request->image, config('location.country.path'), config('location.country.size'), $old);
            }
            
            //$get_country_id = Country::where('code',$excp['code'])->first();
            
            
            
            $country_name = $request['name'][1];
            
            $country->name = $country_name;
            $country->slug = slug($country_name);
            $country->iso_code = $excp['iso_code'];
            $country->code = $excp['code'];
            $country->continent_id = $excp['continent_id'];
            $country->facilities  = $service;
            $country->serviceinfo = $serviceinfo;
            $country->rate = $excp['rate'];
            $country->minimum_amount = $excp['minimum_amount'];
            $country->maximum_amount = $excp['maximum_amount'];
            $country->number_country_code = $excp['number_country_code'];
            $country->per_transfer = $excp['per_transfer'];
            $country->daily_limit = $excp['daily_limit'];
            $country->monthly_limit = $excp['monthly_limit'];
            $country->status = (int) $excp['status'];
            $country->send_from = (int) $excp['send_from'];
            $country->send_to = (int) $excp['send_to'];
            $country->details = $excp['details'];
            $country->save();

            $country_id = $country->id;
            
            foreach($request['name'] as $key => $country_lang)
            {
                $country_langd =  CountryLang::where('country_id',$country_id)->where('language_id',$key)->first();
                
                if($country_langd){
                    $country_langd->name 		= $country_lang;
                    $country_langd->save();
                }else{
                    $dataLang = new CountryLang();
            		$dataLang->country_id  = $country_id;
            		$dataLang->name 		= $country_lang;
            		$dataLang->language_id = $key;
            		$dataLang->save();
                }
            }
            log_admin_activity('Update country', 'Updated country details ('.$country_name.')');
            session()->flash('success', 'Update Successfully');
            return back();
        } catch (\Exception $exp) {
            return back()->with('error', $exp)->withInput();
        }
    }


    public function activeMultiple(Request $request)
    {
        if ($request->strIds == null) {
            session()->flash('error', 'You did not select any country.');
            return response()->json(['error' => 1]);
        } else {
            Country::whereIn('id', $request->strIds)->update([
                'status' => 1,
            ]);
            log_admin_activity('Active country', 'Activated country status');
            session()->flash('success', 'Country Status Has Been Active');
            return response()->json(['success' => 1]);
        }
    }

    public function inActiveMultiple(Request $request)
    {
        if ($request->strIds == null) {
            session()->flash('error', 'You did not select any country.');
            return response()->json(['error' => 1]);
        } else {
            Country::whereIn('id', $request->strIds)->update([
                'status' => 0,
            ]);
            log_admin_activity('Deactive country', 'Deactived country status');
            session()->flash('success', 'Country Status Has Been Deactive');
            return response()->json(['success' => 1]);
        }
    }

    public function countryService(Country $country)
    {
        $data['page_title'] = "Service In " . $country->name;
        $data['serviceList'] =  Service::select('id','name')->where('status',1)->get();
        $data['countryServices'] = CountryService::where('country_id', $country->id)->whereIn('service_id',collect($country->facilities)->pluck('id'))->get()->groupBy(['service_id',]);
        $data['country'] = $country;
        return view('admin.country.services', $data);
    }

    public function serviceStore(Request $request, Country $country)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $validate = Validator::make($request->all(), [
            'name' => 'required',
            'service_id' => 'required',
            'status' => 'required',
        ], [
            'service_id.required' => "Select a service category"
        ]);
        if ($validate->fails()) {
            return back()->withErrors($validate)->withInput();
        }
        try {
            $data = new CountryService();
            $data->name =  $excp['name'];
            $data->country_id = $country->id;
            $data->service_id = $excp['service_id'];
            $data->status = (int) $excp['status'];
            $input_form = [];
            if ($request->has('field_name')) {
                for ($a = 0; $a < count($request->field_name); $a++) {
                    $arr = array();
                    $arr['field_name'] = clean( $request->field_name[$a]);
                    $arr['field_level'] = ucwords($request->field_name[$a]);
                    $arr['type'] = $request->type[$a];
                    $arr['field_length'] = $request->field_length[$a];
                    $arr['length_type'] = $request->length_type[$a];
                    $arr['validation'] = $request->validation[$a];
                    $input_form[$arr['field_name']] = $arr;
                }
            }
            $data->services_form = $input_form;
            $data->bank_code = trim(@$excp['bank_code']);
            $data->save();
            log_admin_activity('New country service', 'Added a new country service ('.$data->name.')');
            session()->flash('success', 'Update Successfully');
            return back();
        } catch (\Exception $exp) {
            return back()->with('error', $exp)->withInput();
        }
    }

    public function limit(Request $request, Country $country)
    {
        $data['page_title'] = "Country Limit";
        $languages = Language::all();
        $data['languages'] = $languages;
        $data['continents'] = Continent::select('id','name')->where('status', 1)->orderBy('name')->get();
        $data['services'] = Service::select('id','name')->where('status', 1)->orderBy('name')->get();
        $data['country'] = $country;
        return view('admin.country.limit', $data);
    }

    public function updateLimit(Request $request, Country $country)
    {        
        try {
   
            $country->limit = $request->all();
            $country->save();
            log_admin_activity('Update country transection limit', 'Update country transection limit');

            return ["success" => true];
        } catch (\Exception $exp) {
            return ["success" => false];
        }

    }

    public function serviceUpdate(Request $request, Country $country)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $validate = Validator::make($request->all(), [
            'id' => 'required',
            'name' => 'required',
            'service_id' => 'required',
            'status' => 'required',
        ], [
            'service_id.required' => "Select a service category"
        ]);
        if ($validate->fails()) {
            return back()->withErrors($validate)->withInput();
        }


        try {
            $data = CountryService::find($excp['id']);
            $data->name =  $excp['name'];
            $data->country_id = $country->id;
            $data->service_id = $excp['service_id'];
            $data->status = (int) $excp['status'];
            $input_form = [];
            if ($request->has('field_name')) {
                for ($a = 0; $a < count($request->field_name); $a++) {
                    $arr = array();
                    $arr['field_name'] = clean( $request->field_name[$a]);
                    $arr['field_level'] = ucwords($request->field_name[$a]);
                    $arr['type'] = $request->type[$a];
                    $arr['field_length'] = $request->field_length[$a];
                    $arr['length_type'] = $request->length_type[$a];
                    $arr['validation'] = $request->validation[$a];
                    $input_form[$arr['field_name']] = $arr;
                }
            }
            $data->services_form = $input_form;
            $data->bank_code = trim($excp['bank_code']);
            $data->save();
            log_admin_activity('Update country service', 'Updated country service ('.$data->name.')');
            session()->flash('success', 'Update Successfully');
            return back();
        } catch (\Exception $exp) {
            return back()->with('error', $exp)->withInput();
        }
    }


    public function serviceCharge(Country $country, Service $service)
    {
        $data['page_title'] = 'Charge : '.$service->name.' in  '.$country->name;
        $data['country'] = $country;
        $data['service'] = $service;
        $data['countryServiceCharge'] = CountryServiceCharge::where('country_id',$country->id)->where('service_id',$service->id)->get();
        return view('admin.country.service-charge', $data);
    }

    public function serviceChargeStore(Request $request)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $validate = Validator::make($request->all(), [
            'country_id' => 'required',
            'service_id' => 'required',
            'amount' => 'required',
            'charge' => 'required',
            'type' => 'required'
        ]);
        if ($validate->fails()) {
            return back()->withErrors($validate)->withInput();
        }

        CountryServiceCharge::where('country_id',$excp['country_id'])->where('service_id',$excp['service_id'])->delete();


        for ($a = 0; $a < count($request->type); $a++) {
            $data = new CountryServiceCharge();
            $data->country_id = $excp['country_id'];
            $data->service_id = $excp['service_id'];
            $data->type = $request->type[$a];
            $data->amount = $request->amount[$a];
            $data->charge = $request->charge[$a];
            $data->save();
        }
        log_admin_activity('Update country service charge', 'Updated country service charge');
        
        session()->flash('success', 'Saved Successfully');
        return back();
    }



    public function operatorImport(Request $request, Country $country)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $operators =  ReloadlyService::operatorCountryCode($country->iso_code);
        foreach ($operators as $operator){
            $data = CountryService::firstOrNew([
                'country_id' => $country->id,
                'service_id' => 1,
                'operatorId' =>$operator->operatorId,
            ]);

            $data->name = str_replace(kebab2Title($country->name), '',$operator->name);
            $data->status = 1;
            $data->localMinAmount = $operator->localMinAmount ? : $operator->minAmount;
            $data->localMaxAmount = $operator->localMaxAmount ? : $operator->maxAmount;
            $data->services_form = [];
            $data->save();
        }
        log_admin_activity('Import country services', 'Imported country services ('.$country->name.')');

        session()->flash('success', 'Import Successfully');
        return back();
    }


    public function serviceImport(Country $country, $countryCode)
    {
        $response = Flutterwave::allBanks($countryCode);
        $response = json_decode($response);
		
        if ($response->status == 'success') {
            $banks = $response->data;
            if (!empty($banks)) {
                foreach ($banks as $bank) {
                    $data = CountryService::firstOrNew([
                        'country_id' => $country->id,
                        'service_id' => 3, //bank Deposit
                        'bank_code' => $bank->code,
                        'name' => $bank->name
                    ]);
                    $data->status = 1;
                    $input_form = [];
                    $makeForm = ['Account Number', 'Beneficiary Name'];
                    for ($a = 0; $a < count($makeForm); $a++) {
                        $arr = array();
                        $arr['field_name'] = clean($makeForm[$a]);
                        $arr['field_level'] = ucwords($makeForm[$a]);
                        $arr['type'] = 'text';
                        $arr['field_length'] = '50';
                        $arr['length_type'] = 'max';
                        $arr['validation'] = 'required';
                        $input_form[$arr['field_name']] = $arr;
                    }
                    $data->services_form = $input_form;
                    $data->save();

                }
            }
            session()->flash('success', '' . $response->message);
        } else {
            session()->flash('error', '' . $response->message);
        }
        return back();
    }


}
