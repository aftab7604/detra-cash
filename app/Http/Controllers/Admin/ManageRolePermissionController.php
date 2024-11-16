<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Country;
use App\Models\Language;
use App\Models\Role;
use App\Models\AdminActivityLog;
use App\Models\AdminLoginLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class ManageRolePermissionController extends Controller
{
    protected $admin;

    public function staff()
    {
        //var_dump(adminAccessRoute(config('role.payout_history.access.view')));
        //die();

        $data['title'] = 'Manage Admin & Permission';
        $data['admins'] = Admin::where('id','!=',auth()->guard('admin')->id())->get();
        $data['admins'] = Admin::with(['role','country'])->get();
        $data['roles'] = Role::orderBy('id', 'ASC')->get();
        $data['countries'] = Country::where('status', 1)->get();
        $data['languages'] = Language::all();
        return view('admin.staff.index', $data);
    }

    public function storeStaff(Request $request)
    {
        $this->validate($request,[
            'first_name' => 'required|max:191',
            'last_name' => 'required|max:191',
            'username' => 'required|alpha_dash|unique:admins,last_name',
            'email' => 'required|email|max:191|unique:admins,email',
            'country_id' => 'required',
            'country_code' => 'required',
            'phone_code' => 'required',
            'phone' => 'required',
            'address' => 'required',
            'city' => 'required',
            'state' => 'required',
            'post_code' => 'required',
            'language_id' => 'required',
            'password' => 'required|min:6',
            'status' => 'required',
            'role' => 'required'
        ]);


        $item = new Admin();
        $item->first_name = $request->first_name;
        $item->last_name = $request->last_name;
        $item->username = $request->username;
        $item->email = $request->email;
        $item->country_id = $request->country_id;
        $item->country_code = $request->country_code;
        $item->dial_code = $request->phone_code;
        $item->phone = $request->phone;
        $item->address = $request->address;
        $item->city = $request->city;
        $item->state = $request->state;
        $item->post_code = $request->post_code;
        $item->language_id = $request->language;
        $item->role_id = $request->role;
        if(isset($request->password)){
            $item->password = Hash::make($request->password);
        }
        //$item->admin_access = (isset($request->access)) ? explode(',',join(',',$request->access)) : [];
        $item->status = $request->status;
        $item->save();
        log_admin_activity('New user', 'Created a new user account ('.$item->username.')');

        session()->flash('success','Added successfully');
        return back();
    }

    public function storeRole(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|max:191'
        ]);

        $item = new Role();
        $item->role = $request->name;
        $item->permissions = (isset($request->access)) ? $request->access : [];
        $item->save();
        log_admin_activity('New role', 'Created a new user role ('.$item->role.')');

        session()->flash('success','Added Successfully');
        return back();
    }


    public function updateStaff(Request $request, $id)
    {

        $this->validate($request,[
            'first_name' => 'required|max:191',
            'last_name' => 'required|alpha_dash|unique:admins,last_name,'.$id,
            'email' => 'required|email|max:191|unique:admins,email,'.$id,
            'country_id' => 'required',
            'country_code' => 'required',
            'phone_code' => 'required',
            'phone' => 'required',
            'address' => 'required',
            'city' => 'required',
            'state' => 'required',
            'post_code' => 'required',
            'language_id' => 'required',
            'password' => 'nullable|min:6',
            'status' => 'required',
            'role' => 'required'
        ]);

        $item = Admin::findOrFail($id);
        $item->first_name = $request->first_name;
        $item->last_name = $request->last_name;
        $item->email = $request->email;
        $item->country_id = $request->country_id;
        $item->country_code = $request->country_code;
        $item->dial_code = $request->phone_code;
        $item->phone = $request->phone;
        $item->address = $request->address;
        $item->city = $request->city;
        $item->state = $request->state;
        $item->post_code = $request->post_code;
        $item->language_id = $request->language_id;
        $item->role_id = $request->role;
        if(isset($request->password)){
            $item->password = Hash::make($request->password);
        }
        //$item->admin_access = (isset($request->access)) ? explode(',',join(',',$request->access)) : [];
        $item->status = $request->status;
        $item->save();
        log_admin_activity('Update user', 'Updated user account ('.$item->username.')');

        session()->flash('success','Updated Successfully');
        return back();
    }

    public function updateRole(Request $request, $id)
    {
        // dd($request->all());
        $this->validate($request,[
            'name' => 'required|max:191'
        ]);
        $item = Role::findOrFail($id);
        $item->role = $request->name;
        //$item->permissions = (isset($request->access)) ? $request->access : [];
        $item->permissions = (isset($request->access)) ? explode(',',join(',',$request->access)) : [];
        $item->save();
        log_admin_activity('Update role', 'Updated user role ('.$item->role.')');

        session()->flash('success','Updated Successfully');
        return back();
    }

    public function ActivityLog()
    {
        $activitylogs = AdminActivityLog::orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.staff.activitylog', compact('activitylogs'));
    }

    public function loggedIn()
    {
        $logs = AdminLoginLog::orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.staff.logged_in', compact('logs'));
    }
}
