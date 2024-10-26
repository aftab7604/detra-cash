<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Serviceinfo;
use App\Models\Language;
use App\Models\Service;
class ServiceinfoController extends Controller
{
    
    public function index()
    {
        $data['page_title'] = 'Service info';
        $data['items'] = Serviceinfo::with('service')->where('language_id',1)->orderBy('name')->get();
        return view('admin.serviceinfo.index', $data);
    }

    public function create()
    {
        $data['page_title'] = 'Service info';
        $data['items'] = Service::where('language_id',1)->orderBy('name')->get();
        return view('admin.serviceinfo.create', $data);
    }

    public function store(Request $request)
    {
        $rules = [
            'name' => 'required',
            'service_id' => 'required',
            'status' => 'required',
            'type' => 'required',
        ];
		$this->validate($request, $rules);
		
		$data = new Serviceinfo();
		$data->name 		= $request->name;
		$data->status 		= $request->status;
		$data->service_id 		= $request->service_id;
		$data->type 		= $request->type;
        $data->language_id	= 1;
        $res = $data->save();
        log_admin_activity('New service info', 'Added a new service info ('.$request->name.')');
        if (!$res) {throw new \Exception('Unexpected error! Please try again.');}
	    return back()->with('success', 'Data has been Added.');
    }

    public function edit($id)
    {
        $data['page_title'] = "Update Serviceinfo";
        $languages = Language::all();
        $data['languages'] = $languages;
        $data['method'] = Serviceinfo::find($id);
        return view('admin.serviceinfo.edit', $data);
    }

    public function update(Request $request,$id)
    {
        $rules = [
            'name' => 'required',
        ];
		$this->validate($request, $rules);
        try {
	            $child_category = Serviceinfo::where(['parent_id' => $id,'language_id' => $request->language_id])->first();
             
	            if($child_category)
		        {
		        	$data = Serviceinfo::findOrFail($request->request_id);
		        
	        		$data->name = $request->name;
		            $res = $data->save();
                    log_admin_activity('New service info', 'Added a new service info ('.$request->name.')');
		        }else
		        {
		        	
		        	if($request->language_id == 1)
		        	{
		        		$data = Serviceinfo::findOrFail($id);
		        		$data->name = $request->name;
			            $res = $data->update();
                        log_admin_activity('Update service info', 'Updated service info ('.$request->name.')');
		        	}else
		        	{
		        		$data = new Serviceinfo();
		        		$data->name 		= $request->name;
		        		$data->service_id 		= $request->service_id;
			            $data->language_id	= $request->language_id;
			            $data->parent_id	= $id;
			            $res = $data->save();
                        log_admin_activity('New service info', 'Added a new service info ('.$request->name.')');
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

    public function destroy ($id)
    {
        $data = Serviceinfo::findOrFail($id);
        $result = Serviceinfo::destroy($id);
	   	if (!$result) {
	                throw new \Exception('Unexpected error! Please try again.');
	            }
        log_admin_activity('Delete service info', 'Deleted service info ('.$data->name.')');
	    return back()->with('success', 'Data has been deleted.');
    }

}
