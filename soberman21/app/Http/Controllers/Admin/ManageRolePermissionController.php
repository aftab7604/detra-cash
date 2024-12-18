<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
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
        $data['admins'] = Admin::with('role')->get();
        $data['roles'] = Role::orderBy('id', 'ASC')->get();
        return view('admin.staff.index', $data);
    }

    public function storeStaff(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|max:191',
            'username' => 'required|alpha_dash|unique:admins,username',
            'email' => 'required|email|max:191|unique:admins,email',
            'password' => 'required|min:6',
            'status' => 'required',
            'role' => 'required'
        ]);

        $item = new Admin();
        $item->name = $request->name;
        $item->username = $request->username;
        $item->email = $request->email;
        $item->phone = $request->phone;
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
            'name' => 'required|max:191',
            'username' => 'required|alpha_dash|unique:admins,username,'.$id,
            'email' => 'required|email|max:191|unique:admins,email,'.$id,
            'password' => 'nullable|min:6',
            'status' => 'required',
            'role' => 'required'
        ]);

        $item = Admin::findOrFail($id);
        $item->name = $request->name;
        $item->username = $request->username;
        $item->email = $request->email;
        $item->phone = $request->phone;
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
