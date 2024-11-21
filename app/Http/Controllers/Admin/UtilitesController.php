<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Continent;
use App\Models\SendingPurpose;
use App\Models\Service;
use App\Models\Language;
use App\Models\SourceFund;
use App\Rules\FileTypeValidate;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Stevebauman\Purify\Facades\Purify;

class UtilitesController extends Controller
{


    public function service()
    {
        $data['page_title'] = 'Service List';
        $data['items'] = Service::where('language_id',1)->orderBy('name')->get();

        return view('admin.country.serviceList', $data);
    }

    public function getService()
    {
        $data['page_title'] = 'Add Service';
        return view('admin.country.addserviceList', $data);
    }

    public function storeService(Request $request)
    {
    	$rules = [
            'name' => 'required',
            'status' => 'required'
        ];
		$this->validate($request, $rules);

		$data = new Service();
		$data->name 		= $request->name;
		$data->status 		= $request->status;
        $data->language_id	= 1;
        $data->parent_id	= 0;
        $res = $data->save();
        log_admin_activity('New service', 'Added a new service ('.$request->name.')');
        if (!$res) {throw new \Exception('Unexpected error! Please try again.');}
	    return back()->with('success', 'Data has been Added.');
    }

    public function editService($id,request $request)
    {
        $data['page_title'] = 'Edit Service';
        $data['method'] = Service::findOrFail($id);
        $languages = Language::all();
        $data['languages'] = $languages;
        return view('admin.country.editserviceList', $data);
    }

    public function updateService(Request $request,$id)
    {
        $rules = [
            'name' => 'required',
        ];
		$this->validate($request, $rules);
        try {
	            $child_category = Service::where(['parent_id' => $id,'language_id' => $request->language_id])->first();

	            if($child_category)
		        {
		        	$data = Service::findOrFail($request->request_id);

	        		$data->name = $request->name;
		            $res = $data->save();
                    log_admin_activity('New service', 'Added a new service ('.$request->name.')');
		        }else
		        {

		        	if($request->language_id == 1)
		        	{
		        		$data = Service::findOrFail($id);
		        		$data->name = $request->name;
			            $res = $data->update();
                        log_admin_activity('Update service', 'Updated service ('.$request->name.')');
		        	}else
		        	{
		        		$data = new Service();
		        		$data->name 		= $request->name;
			            $data->language_id	= $request->language_id;
			            $data->parent_id	= $request->id;
			            $res = $data->save();
                        log_admin_activity('New service', 'Added a new service ('.$request->name.')');
		        	}
		        }

	        if (!$res) {
	                throw new \Exception('Unexpected error! Please try again.');
	            }
	        return back()->with('success', 'Data has been updated.');
		}catch (\Exception $exception) {
            return back()->with('error', $exception->getMessage());
        }
    }

    public function destroyService($id)
    {
        $data = Service::findOrFail($id);

        $result = Service::destroy($id);
	   	if (!$result) {
	                throw new \Exception('Unexpected error! Please try again.');
	            }
        log_admin_activity('Delete service', 'Deleted service ('.$data->name.')');
	    return back()->with('success', 'Data has been deleted.');
    }




    public function continent()
    {
        $items = Continent::orderBy('name')->get();
//        dd($items);
        $data['page_title'] = 'Continent List';
        return view('admin.country.continent', $data);
    }
    public function getContinent()
    {
        $items = Continent::orderBy('name')->get();
        return $items;
    }

    public function storeContinent(Request $request)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'name' => 'required',
            'status' => 'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->messages()], 422);
        }
        $result = new Continent();
        $result->name = $excp['name'];
        $result->status = (int)$excp['status'];
        $result->save();
        if ($result) {
            log_admin_activity('New continent list', 'Added a new continent list ('.$excp['name'].')');
            return [
                'status' => 'success',
                'message' => 'Saved Successfully',
                'data' => $result
            ];
        } else {
            return [
                'status' => 'error',
                'message' => 'failed!!!',
                'data' => []
            ];
        }
    }

    public function updateContinent(Request $request)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'id' => 'required|numeric',
            'name' => 'required',
            'status' => 'required'
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->messages()], 422);
        }

        $result = Continent::findOrFail($request['id']);
        $result->name = $excp['name'];
        $result->status = (int)$excp['status'];
        $result->save();

        if ($result) {
            log_admin_activity('Update continent list', 'Updated continent list ('.$excp['name'].')');
            return [
                'status' => 'success',
                'message' => 'Update Successfully',
                'data' => $result
            ];
        } else {
            return [
                'status' => 'error',
                'message' => 'Updating Failed',
                'data' => []
            ];
        }
    }

    public function destroyContinent(Request $request)
    {
        $excp = Purify::clean($request->except('_token', '_method'));
        $rules = ['id' => 'required'];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->messages()], 422);
        }
        $result = Continent::destroy($excp['id']);
        if ($result) {
//            log_admin_activity('Delete continent list', 'Deleted continent list ('.$excp['name'].')');
            return [
                'status' => 'success',
                'message' => 'Delete Successfully',
                'data' => []
            ];
        } else {
            return [
                'status' => 'error',
                'message' => 'Failed!!',
                'data' => []
            ];
        }
    }


    public function purpose()
    {
        $data['page_title'] = 'Purpose List';
        $data['items'] = SendingPurpose::where('language_id',1)->orderBy('id', 'desc')->get();

        return view('admin.utility.purpose', $data);
    }

    public function getPurpose()
    {
        $items = SendingPurpose::where('language_id',1)->orderBy('id', 'desc')->get();
        return $items;
    }

    public function editPurpose($id,request $request)
    {


    		$data['page_title'] = 'Edit Purpose';
	    	$data['method'] = SendingPurpose::findOrFail($id);
	    	$languages = Language::all();
	        $data['languages'] = $languages;

	        return view('admin.utility.editpurpose', $data);


    }

    public function addPurpose()
    {


    		$data['page_title'] = 'Add Purpose';


	        return view('admin.utility.addpurpose',$data);


    }


    public function storePurpose(Request $request)
    {
    	$rules = [
            'title' => 'required',
        ];
		$this->validate($request, $rules);

		$data = new SendingPurpose();
		$data->title 		= $request->title;
        $data->language_id	= 1;
        $data->parent_id	= 0;
        $res = $data->save();
        if (!$res) {
	                throw new \Exception('Unexpected error! Please try again.');
	            }
        log_admin_activity('New Purpose', 'Added a new purpose ('.$request->title.')');
	    return back()->with('success', 'Data has been Added.');

    }

    public function updatepurpose(Request $request,$id)
    {

        $rules = [
            'title' => 'required',
        ];
		$this->validate($request, $rules);

        try {
	        $child_category = SendingPurpose::where(['parent_id' => $id,'language_id' => $request->language_id])->first();

	        if($child_category)
		        {
		        	$data = SendingPurpose::findOrFail($request->request_id);

	        		$data->title = $request->title;
		            $res = $data->save();
		        }else
		        {

		        	if($request->language_id == 1)
		        	{


		        		$data = SendingPurpose::findOrFail($id);

		        		$data->title = $request->title;
			            $res = $data->update();
		        	}else
		        	{
		        		$data = new SendingPurpose();
		        		$data->title 		= $request->title;
			            $data->language_id	= $request->language_id;
			            $data->parent_id	= $request->id;
			            $res = $data->save();
		        	}

		        }

	       // $result = SendingPurpose::findOrFail($request['id'])->update($in);
	        if (!$res) {
	                throw new \Exception('Unexpected error! Please try again.');
	            }
            log_admin_activity('Update Purpose', 'Updated purpose ('.$request->title.')');
	        return back()->with('success', 'Data has been updated.');
		}catch (\Exception $exception) {
            return back()->with('error', $exception->getMessage());
        }
    }

    public function destroyPurpose(Request $request,$id)
    {
        $data = SendingPurpose::findOrFail($id);
        $result = SendingPurpose::destroy($id);
        if (!$result) {
	            throw new \Exception('Unexpected error! Please try again.');
	        }
        log_admin_activity('Delete Purpose', 'Deleted purpose ('.$data->title.')');
	    return back()->with('success', 'Data has been Deleted.');

    }


    public function sourceOfFund()
    {
        $data['page_title'] = 'Source Of Fund';
        $data['items'] = SourceFund::where('language_id',1)->orderBy('id', 'desc')->get();
        return view('admin.utility.sourceOfFund', $data);
    }

    public function editSF($id)
    {
        $data['page_title'] = 'Edit Source Of Fund';
        $data['method'] = SourceFund::findOrFail($id);
    	$languages = Language::all();
        $data['languages'] = $languages;
        return view('admin.utility.editsourceOfFund', $data);
    }


    public function addSF()
    {
        $data['page_title'] = 'Add Source Of Fund';
        return view('admin.utility.addsourceOfFund', $data);
    }

    public function getSF()
    {
        $items = SourceFund::orderBy('id', 'desc')->get();
        return $items;
    }

    public function storeSF(Request $request)
    {
    	$rules = [
            'title' => 'required',
        ];
		$this->validate($request, $rules);

		$data = new SourceFund();
		$data->title 		= $request->title;
        $data->language_id	= 1;
        $data->parent_id	= 0;
        $res = $data->save();
        if (!$res) {
	        throw new \Exception('Unexpected error! Please try again.');
	    }
        log_admin_activity('New Source Of Fund', 'Added source of fund ('.$request->title.')');
	    return back()->with('success', 'Data has been Added.');

    }

    public function updateSF(Request $request,$id)
    {

        $rules = [
            'title' => 'required',
        ];
		$this->validate($request, $rules);

        try {
	        $child_category = SourceFund::where(['parent_id' => $id,'language_id' => $request->language_id])->first();

	        if($child_category)
		        {
		        	$data = SourceFund::findOrFail($request->request_id);

	        		$data->title = $request->title;
		            $res = $data->save();
		        }else
		        {

		        	if($request->language_id == 1)
		        	{


		        		$data = SourceFund::findOrFail($id);

		        		$data->title = $request->title;
			            $res = $data->update();
		        	}else
		        	{
		        		$data = new SourceFund();
		        		$data->title 		= $request->title;
			            $data->language_id	= $request->language_id;
			            $data->parent_id	= $request->id;
			            $res = $data->save();
		        	}

		        }

	       // $result = SendingPurpose::findOrFail($request['id'])->update($in);
	        if (!$res) {
	                throw new \Exception('Unexpected error! Please try again.');
	            }
            log_admin_activity('Update Source Of Fund', 'Updated source of fund ('.$request->title.')');
	        return back()->with('success', 'Data has been updated.');
		}catch (\Exception $exception) {
            return back()->with('error', $exception->getMessage());
        }
    }



    public function destroySF(Request $request,$id)
    {
        $data = SourceFund::findOrFail($id);
        $result = SourceFund::destroy($id);
        if (!$result) {
	            throw new \Exception('Unexpected error! Please try again.');
	        }
        log_admin_activity('Delete Source Of Fund', 'Deleted source of fund ('.$data->title.')');
	    return back()->with('success', 'Data has been Deleted.');
    }

}
