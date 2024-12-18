<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\Notify;
use App\Http\Traits\Upload;
use App\Models\Fund;
use App\Models\KYC;
use App\Models\Country;
use App\Models\Language;
use App\Models\Transaction;
use App\Models\User;
use App\Models\UserLogin;
use App\Models\ActionLog;
use App\Rules\FileTypeValidate;
use Carbon\Carbon;
use Facades\App\Services\BasicService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Password;
use Stevebauman\Purify\Facades\Purify;
use Illuminate\Support\Facades\Validator;

class UsersController extends Controller
{
    use Upload, Notify;

    public function merchantCreate()
    {
        return view('admin.users.add-merchant');
    }

    public function merchantStore(Request $request)
    {

        $userData = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'firstname' => 'sometimes|required',
            'lastname' => 'sometimes|required',
            'username' => 'sometimes|required|unique:users,username',
            'email' => 'sometimes|required|email|unique:users,email',
            'phone' => 'sometimes|required',
            'image' => ['nullable', 'image', new FileTypeValidate(['jpeg', 'jpg', 'png'])],
        ];
        if(config('basic.strong_password') == 0){
            $rules['password'] = ['required', 'min:6', 'confirmed'];
        }else{
            $rules['password'] = ["required",'confirmed',
                Password::min(6)->mixedCase()
                    ->letters()
                    ->numbers()
                    ->symbols()
                    ->uncompromised()];
        }
        $message = [
            'firstname.required' => 'First Name is required',
            'lastname.required' => 'Last Name is required',
        ];

        $Validator = Validator::make($userData, $rules, $message);

        if ($Validator->fails()) {
            return back()->withErrors($Validator)->withInput();
        }


        $user = new User();
        $user->firstname = $userData['firstname'];
        $user->lastname = $userData['lastname'];
        $user->username = $userData['username'];
        $user->email = $userData['email'];
        $user->password =  Hash::make($userData['password']);
        $user->phone = $userData['phone'];
        $user->status = ($userData['status'] == 'on') ? 0 : 1;
        $user->email_verification = ($userData['email_verification'] == 'on') ? 0 : 1;
        $user->sms_verification = ($userData['sms_verification'] == 'on') ? 0 : 1;
        $user->merchant = ($userData['merchant'] == 'on') ? 0 : 1;
        $user->save();

        log_admin_activity('New merchant', 'Added a new merchant ('.$user->firstname.' '.$user->lastname.')');
        session()->flash('success', 'Merchant Added Successfully');
        return redirect()->route('admin.user-edit',$user->id);

    }

    public function merchant()
    {
        $users = User::where('merchant',1)->orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.users.merchant-list', compact('users'));
    }


    public function merchantSearch(Request $request)
    {
        $search = $request->all();
        $dateSearch = $request->date_time;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);
        $users = User::where('merchant',1)->when(isset($search['search']), function ($query) use ($search) {
            return $query->where('email', 'LIKE', "%{$search['search']}%")
                ->orWhere('username', 'LIKE', "%{$search['search']}%");
        })
            ->when($date == 1, function ($query) use ($dateSearch) {
                return $query->whereDate("created_at", $dateSearch);
            })
            ->when(isset($search['status']), function ($query) use ($search) {
                return $query->where('status', $search['status']);
            })
            ->paginate(config('basic.paginate'));
        return view('admin.users.merchant-list', compact('users', 'search'));
    }

    public function index()
    {
        $users = User::where('merchant',0)->orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.users.list', compact('users'));
    }


    public function search(Request $request)
    {
        $search = $request->all();
        $dateSearch = $request->date_time;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);
        $users = User::where('merchant',0)->when(isset($search['search']), function ($query) use ($search) {
            return $query->where('email', 'LIKE', "%{$search['search']}%")
                ->orWhere('username', 'LIKE', "%{$search['search']}%");
        })
            ->when($date == 1, function ($query) use ($dateSearch) {
                return $query->whereDate("created_at", $dateSearch);
            })
            ->when(isset($search['status']), function ($query) use ($search) {
                return $query->where('status', $search['status']);
            })
            ->paginate(config('basic.paginate'));
        return view('admin.users.list', compact('users', 'search'));
    }






    public function activeMultiple(Request $request)
    {
        if ($request->strIds == null) {
            session()->flash('error', 'You did not select any user.');
            return response()->json(['error' => 1]);
        } else {
            $user = User::findOrFail($request->strIds);
            User::whereIn('id', $request->strIds)->update([
                'status' => 1,
            ]);
            log_admin_activity('Update user', 'Updated user status as active ('.$user->firstname.' '.$user->lastname.')');
            session()->flash('success', 'User Status Has Been Active');
            return response()->json(['success' => 1]);
        }
    }

    public function inactiveMultiple(Request $request)
    {
        if ($request->strIds == null) {
            session()->flash('error', 'You do not select User.');
            return response()->json(['error' => 1]);
        } else {
            $user = User::findOrFail($request->strIds);
            User::whereIn('id', $request->strIds)->update([
                'status' => 0,
            ]);
            log_admin_activity('Update user', 'Updated user status as deactive ('.$user->firstname.' '.$user->lastname.')');
            session()->flash('success', 'User Status Has Been Deactive');
            return response()->json(['success' => 1]);
        }
    }


    public function userEdit($id)
    {
        $user = User::findOrFail($id);
        $languages = Language::all();
        $countries = Country::where('status', 1)->get();
        return view('admin.users.edit-user', compact('user', 'languages', 'countries'));
    }

    public function userUpdate(Request $request, $id)
    {
        $languages = Language::all()->map(function ($item){
            return $item->id;
        });
        $userData = Purify::clean($request->except('_token', '_method'));
        $country = Country::where('iso_code', $request->country)->first('name');
        $user = User::findOrFail($id);
        $rules = [
            'firstname' => 'sometimes|required',
            'lastname' => 'sometimes|required',
            'username' => 'sometimes|required|unique:users,username,' . $user->id,
            'email' => 'sometimes|required|email|unique:users,email,' . $user->id,
            'phone' => 'sometimes|required',
            'image' => ['nullable', 'image', new FileTypeValidate(['jpeg', 'jpg', 'png'])],
            'language_id' => Rule::in($languages),
        ];
        $message = [
            'firstname.required' => 'First Name is required',
            'lastname.required' => 'Last Name is required',
        ];

        $Validator = Validator::make($userData, $rules, $message);

        if ($Validator->fails()) {
            return back()->withErrors($Validator)->withInput();
        }

        if ($request->hasFile('image')) {
            try {
                $old = $user->image ?: null;
                $user->image = $this->uploadImage($request->image, config('location.user.path'), config('location.user.size'), $old);
            } catch (\Exception $exp) {
                return back()->with('error', 'Image could not be uploaded.');
            }
        }
        $user->firstname = $userData['firstname'];
        $user->lastname = $userData['lastname'];
        $user->username = $userData['username'];
        $user->email = $userData['email'];
        $user->phone = $userData['phone'];
        $user->language_id = $userData['language_id'];
        $user->address = $userData['address'];
        $user->city = $userData['city'];
        $user->post_code = $userData['post_code'];
        if(isset($country->name))
            $user->country = $country->name;

        $user->state = $userData['state'];
        $user->status = ($userData['status'] == 'on') ? 0 : 1;
        $user->email_verification = ($userData['email_verification'] == 'on') ? 0 : 1;
        $user->sms_verification = ($userData['sms_verification'] == 'on') ? 0 : 1;
        $user->two_fa_verify = ($userData['two_fa_verify'] == 'on') ? 1 : 0;
        $user->two_fa_auth = ($userData['two_fa_auth'] == 'on') ? 1 : 0;
        $user->merchant = ($userData['merchant'] == 'on') ? 0 : 1;
        $user->save();
        log_admin_activity('Update user', 'Updated user profile ('.$userData['firstname'].' '.$userData['lastname'].')');
        return back()->with('success', 'Updated Successfully.');
    }

    public function passwordUpdate(Request $request, $id)
    {
        $request->validate([
            'password' => 'required|min:5|same:password_confirmation',
        ]);
        $user = User::findOrFail($id);
        $user->password = bcrypt($request->password);
        $user->save();

        $this->sendMailSms($user, 'PASSWORD_CHANGED', [
            'password' => $request->password
        ]);
        log_admin_activity('Update user', 'Updated user password ('.$user->firstname.' '.$user->lastname.')');
        return back()->with('success', 'Updated Successfully.');
    }


    public function userBalanceUpdate(Request $request, $id)
    {
        $userData = Purify::clean($request->all());
        if ($userData['balance'] == null) {
            return back()->with('error', 'Balance Value Empty!');
        } else {
            $control = (object)config('basic');
            $user = User::findOrFail($id);


            if ($userData['add_status'] == "1") {
                $user->balance += $userData['balance'];
                $user->save();

                $transaction = new Transaction();
                $transaction->user_id = $user->id;
                $transaction->trx_type = '+';
                $transaction->amount = $userData['balance'];
                $transaction->charge = 0;
                $transaction->remarks = 'Add Balance';
                $transaction->trx_id = strRandom();
                $transaction->save();


                $msg = [
                    'amount' => getAmount($userData['balance']),
                    'currency' => $control->currency,
                    'main_balance' => $user->balance,
                    'transaction' => $transaction->trx_id
                ];
                $action = [
                    "link" => '#',
                    "icon" => "las la-money-bill-alt "
                ];

                $this->userPushNotification($user, 'ADD_BALANCE', $msg, $action);


                $this->sendMailSms($user, 'ADD_BALANCE', [
                    'amount' => getAmount($userData['balance']),
                    'currency' => $control->currency,
                    'main_balance' => $user->balance,
                    'transaction' => $transaction->trx_id
                ]);
                log_admin_activity('Update user', 'Added user balance ('.$user->firstname.' '.$user->lastname.')');
                return back()->with('success', 'Balance Add Successfully.');

            } else {

                if ($userData['balance'] > $user->balance) {
                    return back()->with('error', 'Insufficient Balance to deducted.');
                }
                $user->balance -= $userData['balance'];
                $user->save();


                $transaction = new Transaction();
                $transaction->user_id = $user->id;
                $transaction->trx_type = '-';
                $transaction->amount = $userData['balance'];
                $transaction->charge = 0;
                $transaction->remarks = 'Add Balance';
                $transaction->trx_id = strRandom();
                $transaction->save();


                $msg = [
                    'amount' => getAmount($userData['balance']),
                    'currency' => $control->currency,
                    'main_balance' => $user->balance,
                    'transaction' => $transaction->trx_id
                ];
                $action = [
                    "link" => '#',
                    "icon" => "las la-money-bill-alt"
                ];

                $this->userPushNotification($user, 'DEDUCTED_BALANCE', $msg, $action);

                $this->sendMailSms($user, 'DEDUCTED_BALANCE', [
                    'amount' => getAmount($userData['balance']),
                    'currency' => $control->currency,
                    'main_balance' => $user->balance,
                    'transaction' => $transaction->trx_id,
                ]);
                log_admin_activity('Update user', 'Deducted user balance ('.$user->firstname.' '.$user->lastname.')');
                return back()->with('success', 'Balance deducted Successfully.');
            }
        }
    }


    public function emailToUsers()
    {
        return view('admin.users.mail-form');
    }

    public function sendEmailToUsers(Request $request)
    {
        $req = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'subject' => 'sometimes|required',
            'message' => 'sometimes|required'
        ];
        $validator = Validator::make($req, $rules);
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $allUsers = User::where('status', 1)->get();
        foreach ($allUsers as $user) {
            $this->mail($user, null, [], $req['subject'], $req['message']);
        }

        log_admin_activity('Send email', 'Sent email to all users');
        return back()->with('success', 'Mail Send Successfully');
    }


    public function sendEmail($id)
    {
        $user = User::findOrFail($id);
        return view('admin.users.single-mail-form', compact('user'));
    }

    public function sendMailUser(Request $request, $id)
    {
        $req = Purify::clean($request->except('_token', '_method'));
        $rules = [
            'subject' => 'sometimes|required',
            'message' => 'sometimes|required'
        ];
        $validator = Validator::make($req, $rules);
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $user = User::findOrFail($id);
        $this->mail($user, null, [], $req['subject'], $req['message']);
        log_admin_activity('Send email', 'Sent email to user ('.$user->firstname.' '.$user->lastname.')');
        return back()->with('success', 'Mail Send Successfully');
    }


    public function transaction($id)
    {
        $user = User::findOrFail($id);
        $userid = $user->id;
        $transaction = $user->transaction()->paginate(config('basic.paginate'));
        return view('admin.users.transactions', compact('user', 'userid', 'transaction'));
    }

    public function funds($id)
    {
        $user = User::findOrFail($id);
        $userid = $user->id;
        $funds = $user->funds()->paginate(config('basic.paginate'));
        return view('admin.users.fund-log', compact('user', 'userid', 'funds'));
    }
    public function transfer($id)
    {
        $user = User::findOrFail($id);
        $userid = $user->id;
        $page_title = $user->username."'s Transfer Log";
        $sendMoneys = $user->sendMoneys()->paginate(config('basic.paginate'));
        return view('admin.transfer.index', compact('sendMoneys', 'page_title'));
    }


    public function loginAccount(Request $request, $id)
    {
        Auth::guard('web')->loginUsingId($id);
        return redirect()->route('user.home');
    }


    public function loggedIn()
    {
        $logs = UserLogin::orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.users.logged_in', compact('logs'));
    }

    public function ActivityLog()
    {
        $activitylogs = ActionLog::orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.users.action_log', compact('activitylogs'));
    }

    public function singleLoggedIn($id)
    {
        $logs = UserLogin::where('user_id', $id)->orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.users.logged_in', compact('logs'));
    }

    public function kycPendingList()
    {
        $title = "Pending KYC";
        $logs = KYC::orderBy('id', 'DESC')->where('status',0)->with(['user','admin'])->paginate(config('basic.paginate'));
        return view('admin.users.kycList', compact('logs','title'));
    }
    public function kycList()
    {
        $title = "KYC Log";
        $logs = KYC::orderBy('id', 'DESC')->where('status','!=',0)->paginate(config('basic.paginate'));
        return view('admin.users.kycList', compact('logs','title'));
    }

    public function userKycHistory(User $user)
    {
        $title = $user->username." : KYC Log";
        $logs = KYC::orderBy('id', 'DESC')->where('user_id',$user->id)->paginate(config('basic.paginate'));
        return view('admin.users.kycList', compact('logs','title'));
    }


    public function kycAction(Request $request, $id)
    {

        $this->validate($request, [
            'id' => 'required',
            'status' => ['required', Rule::in(['1', '2'])],
        ]);
        $data = KYC::where('id', $request->id)->whereIn('status', [0])->with('user')->firstOrFail();
        $basic = (object) config('basic');

        if ($request->status == '1') {
            $data->status = 1;
            $data->admin_id = auth()->guard('admin')->id();
            $data->update();
            $user = $data->user;
            if($data->kyc_type == 'address-verification'){
                $user->address_verify = 2;
            }else{
                $user->identity_verify = 2;
            }
            $user->save();

            $this->sendMailSms($user, 'KYC_APPROVED',[
                'kyc_type' => kebab2Title($data->kyc_type)
            ]);


            $msg = [
                'kyc_type' => kebab2Title($data->kyc_type)
            ];
            $action = [
                "link" => '#',
                "icon" => "fas fa-file-alt text-white"
            ];
            $this->userPushNotification($user, 'KYC_APPROVED', $msg, $action);
            log_admin_activity('Approve KYC', 'Approved KYC ('.$user->firstname.' '.$user->lastname.')');
            session()->flash('success', 'Approve Successfully');
            return back();

        }
        elseif ($request->status == '2') {
            $data->status = 2;
            $data->admin_id = auth()->guard('admin')->id();
            $data->update();

            $user = $data->user;
            if($data->kyc_type == 'address-verification'){
                $user->address_verify = 3;
            }else{
                $user->identity_verify = 3;
            }
            $user->save();



            $this->sendMailSms($user, 'KYC_REJECTED',[
                'kyc_type' => kebab2Title($data->kyc_type)
            ]);
            $msg = [
                'kyc_type' => kebab2Title($data->kyc_type)
            ];
            $action = [
                "link" => '#',
                "icon" => "fas fa-file-alt text-white"
            ];
            $this->userPushNotification($user, 'KYC_REJECTED', $msg, $action);

            session()->flash('success', 'Reject Successfully');
            return back();
        }
    }

}
