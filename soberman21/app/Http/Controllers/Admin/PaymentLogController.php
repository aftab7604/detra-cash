<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\Notify;
use App\Models\Fund;
use App\Models\Template;
use App\Models\Country;
use App\Models\User;
use Carbon\Carbon;
use Facades\App\Services\BasicService;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Stevebauman\Purify\Facades\Purify;
use App\Exports\UsersExport;
use Maatwebsite\Excel\Facades\Excel;
use PDF;


class PaymentLogController extends Controller
{
    use Notify;

    public function index()
    {
        $page_title = "Payment Logs";

        $funds = Fund::where('status', '!=', 0)->orderBy('id', 'DESC')->with('sendmoney', 'user', 'gateway')->paginate(config('basic.paginate'));
        return view('admin.payment.logs', compact('funds', 'page_title'));
    }
    
    public function reportindex()
    {
        $page_title = "Payment Reports";

        $funds = Fund::where('status', '!=', 0)->orderBy('id', 'DESC')->with('user', 'gateway')->paginate(config('basic.paginate'));
        
        $currency = Country::orderBy('id', 'DESC')->get();
        return view('admin.payment.reportslogs', compact('funds', 'page_title','currency'));
    }
    
    public function searchreport(Request $request)
    {
        
        $user_id = null;
    
        if (!empty($request->username)) {
            $user = User::where('username', $request->username)->first();
            if ($user) {
                $user_id = $user->id;
            }
        }

        $search = $request->all();
        $dateSearch = $request->date_range;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);
        $from_date = '';
        $to_date = '' ;
        if($dateSearch == 'Today')
        {
        	$dt = Carbon::now();
        	$date = $dt->toDateString();
        }else if($dateSearch == 'Yesterday')
        {
        	$dt = Carbon::yesterday();
        	$date = $dt->toDateString();
        	
        }else if($dateSearch == '7 Days')
        {
        	$dt = Carbon::today()->subDays(7);
        	
        	$date = $dt->toDateString();
        	
        }else if($dateSearch == '30 Days')
        {
        	$dt = Carbon::today()->subDays(30);
        	
        	$date = $dt->toDateString();
        	
        }else if($dateSearch == 'Month')
        {
        	$date = Carbon::now()->month();
        	$date = $dt->toDateString();
        	
        	
        }else if($dateSearch == 'Last')
        {
        	$date = Carbon::now()->subMonth()->startOfMonth();
        	
        	
        	
        }else if($dateSearch == 'Custom')
        {
        	$from_date = $request->from_date;
        	$to_date   = $request->to_date;
        	
        	
        }else
        {
        	$date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);
        }
       
       // $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);

        $funds = Fund::when(isset($search['name']), function ($query) use ($search) {

            return $query->where('transaction', 'LIKE', $search['name'])
                ->orWhereHas('user', function ($q) use ($search) {
                    $q->where('email', 'LIKE', "%{$search['name']}%")
                        ->orWhere('username', 'LIKE', "%{$search['name']}%");
                });
        })
            
            ->when($dateSearch == 'Today', function ($query) use ($date) {
                return $query->whereDate("created_at", $date);
            })
            ->when($dateSearch == 'Yesterday', function ($query) use ($date) {
                return $query->whereDate("created_at", $date);
            })
            ->when($dateSearch == '7 Days', function ($query) use ($date) {
                return $query->whereDate("created_at",'>=', $date);
            })
            ->when($dateSearch == '30 Days', function ($query) use ($date) {
                return $query->whereDate("created_at",'>=', $date);
            })
            ->when($dateSearch == 'Month', function ($query) use ($date) {
                return $query->whereDate("created_at", $date);
            })
            ->when($dateSearch == 'Last', function ($query) use ($date) {
                return $query->whereBetween('created_at', 
                                    [Carbon::now()->subMonth()->startOfMonth(), Carbon::now()->subMonth()->endOfMonth()]
                                );
            })
            
            ->when($dateSearch == 'Custom', function ($query) use ($from_date,$to_date) {
                return $query->whereBetween('created_at', 
                                    [$from_date, $to_date]
                                );
            })
            ->when($search['status'] != -1, function ($query) use ($search) {
                return $query->where('status', $search['status']);
            })
            ->when($search['currency'] != -1, function ($query) use ($search) {
				return $query->where('gateway_currency', '=', $search['currency']);
            })
            ->when($user_id, function ($query) use ($user_id) {
                return $query->where('user_id', $user_id);
            })
            ->where('status', '!=', 0)
            ->with('user', 'gateway')
            ->paginate(config('basic.paginate'));
        $funds->appends($search);
        
        $page_title = "Search Payment Report";
        $currency = Country::orderBy('id', 'DESC')->get();
        return view('admin.payment.reportslogs', compact('funds', 'page_title','currency'));
    }
    
    
    public function genratepdfreport(Request $request)
    {
        $user_id = null;
    
        if (!empty($request->username)) {
            $user = User::where('username', $request->username)->first();
            if ($user) {
                $user_id = $user->id;
            }
        }

    	$search = $request->all();
    	
		
        $dateSearch = $request->date_range;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);
        $from_date = '';
        $to_date = '' ;
        if($dateSearch == 'Today')
        {
        	$dt = Carbon::now();
        	$date = $dt->toDateString();
        }else if($dateSearch == 'Yesterday')
        {
        	$dt = Carbon::yesterday();
        	$date = $dt->toDateString();
        	
        }else if($dateSearch == '7 Days')
        {
        	$dt = Carbon::today()->subDays(7);
        	
        	$date = $dt->toDateString();
        	
        }else if($dateSearch == '30 Days')
        {
        	$dt = Carbon::today()->subDays(30);
        	
        	$date = $dt->toDateString();
        	
        }else if($dateSearch == 'Month')
        {
        	$date = Carbon::now()->month();
        	$date = $dt->toDateString();
        	
        	
        }else if($dateSearch == 'Last')
        {
        	$date = Carbon::now()->subMonth()->startOfMonth();
        	
        	
        	
        }else if($dateSearch == 'Custom')
        {
        	$from_date = $request->from_date;
        	$to_date   = $request->to_date;
        	
        	
        }else
        {
        	$date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);
        }
       
       // $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);

        $funds = Fund::when(isset($search['name']), function ($query) use ($search) {

            return $query->where('transaction', 'LIKE', $search['name'])
                ->orWhereHas('user', function ($q) use ($search) {
                    $q->where('email', 'LIKE', "%{$search['name']}%")
                        ->orWhere('username', 'LIKE', "%{$search['name']}%");
                });
        })
            
            ->when($dateSearch == 'Today', function ($query) use ($date) {
                return $query->whereDate("created_at", $date);
            })
            ->when($dateSearch == 'Yesterday', function ($query) use ($date) {
                return $query->whereDate("created_at", $date);
            })
            ->when($dateSearch == '7 Days', function ($query) use ($date) {
                return $query->whereDate("created_at",'>=', $date);
            })
            ->when($dateSearch == '30 Days', function ($query) use ($date) {
                return $query->whereDate("created_at",'>=', $date);
            })
            ->when($dateSearch == 'Month', function ($query) use ($date) {
                return $query->whereDate("created_at", $date);
            })
            ->when($dateSearch == 'Last', function ($query) use ($date) {
                return $query->whereBetween('created_at', 
                                    [Carbon::now()->subMonth()->startOfMonth(), Carbon::now()->subMonth()->endOfMonth()]
                                );
            })
            
            ->when($dateSearch == 'Custom', function ($query) use ($from_date,$to_date) {
                return $query->whereBetween('created_at', 
                                    [$from_date, $to_date]
                                );
            })
            ->when($search['status'] != -1, function ($query) use ($search) {
                return $query->where('status', $search['status']);
            })
            ->when($search['currency'] != -1, function ($query) use ($search) {
				return $query->where('gateway_currency', '=', $search['currency']);
            })
            ->when($user_id, function ($query) use ($user_id) {
                return $query->where('user_id', $user_id);
            })
            ->where('status', '!=', 0)
            ->with('user', 'gateway')
            ->get();
        $data['funds'] = $funds;
         $templateSection = ['contact-us'];
        $contactUs = Template::templateMedia()->whereIn('section_name', $templateSection)->get()->groupBy('section_name');
        $contactUs = $contactUs['contact-us'][0];

        $data['contact'] = [
            'email' => $contactUs->description->email,
            'phone' => $contactUs->description->phone,
            'address' => $contactUs->description->address
        ];
    	$pdf = PDF::loadView('admin.layouts.reportpdf', $data);
        return $pdf->stream('payment_report.pdf');
    }
    
    public function genrateexcelreport(Request $request)
    {
        $user_id = null;
    
        if (!empty($request->username)) {
            $user = User::where('username', $request->username)->first();
            if ($user) {
                $user_id = $user->id;
            }
        }

    	$search = $request->all();
    	
        $dateSearch = $request->date_range;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);
        $from_date = '';
        $to_date = '' ;
        if($dateSearch == 'Today')
        {
        	$dt = Carbon::now();
        	$date = $dt->toDateString();
        }else if($dateSearch == 'Yesterday')
        {
        	$dt = Carbon::yesterday();
        	$date = $dt->toDateString();
        	
        }else if($dateSearch == '7 Days')
        {
        	$dt = Carbon::today()->subDays(7);
        	
        	$date = $dt->toDateString();
        	
        }else if($dateSearch == '30 Days')
        {
        	$dt = Carbon::today()->subDays(30);
        	
        	$date = $dt->toDateString();
        	
        }else if($dateSearch == 'Month')
        {
        	$date = Carbon::now()->month();
        	$date = $dt->toDateString();
        	
        	
        }else if($dateSearch == 'Last')
        {
        	$date = Carbon::now()->subMonth()->startOfMonth();
        	
        	
        	
        }else if($dateSearch == 'Custom')
        {
        	$from_date = $request->from_date;
        	$to_date   = $request->to_date;
        	
        	
        }else
        {
        	$date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);
        }
       
       // $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);

        $funds = Fund::when(isset($search['name']), function ($query) use ($search) {

            return $query->where('transaction', 'LIKE', $search['name'])
                ->orWhereHas('user', function ($q) use ($search) {
                    $q->where('email', 'LIKE', "%{$search['name']}%")
                        ->orWhere('username', 'LIKE', "%{$search['name']}%");
                });
        })
            
            ->when($dateSearch == 'Today', function ($query) use ($date) {
                return $query->whereDate("created_at", $date);
            })
            ->when($dateSearch == 'Yesterday', function ($query) use ($date) {
                return $query->whereDate("created_at", $date);
            })
            ->when($dateSearch == '7 Days', function ($query) use ($date) {
                return $query->whereDate("created_at",'>=', $date);
            })
            ->when($dateSearch == '30 Days', function ($query) use ($date) {
                return $query->whereDate("created_at",'>=', $date);
            })
            ->when($dateSearch == 'Month', function ($query) use ($date) {
                return $query->whereDate("created_at", $date);
            })
            ->when($dateSearch == 'Last', function ($query) use ($date) {
                return $query->whereBetween('created_at', 
                                    [Carbon::now()->subMonth()->startOfMonth(), Carbon::now()->subMonth()->endOfMonth()]
                                );
            })
            
            ->when($dateSearch == 'Custom', function ($query) use ($from_date,$to_date) {
                return $query->whereBetween('created_at', 
                                    [$from_date, $to_date]
                                );
            })
            ->when($search['status'] != -1, function ($query) use ($search) {
                return $query->where('status', $search['status']);
            })
            ->when($search['currency'] != -1, function ($query) use ($search) {
				return $query->where('gateway_currency', '=', $search['currency']);
            })
            ->when($user_id, function ($query) use ($user_id) {
                return $query->where('user_id', $user_id);
            })
            ->where('status', '!=', 0)
            ->with('user', 'gateway')
            ->get();
        //dd($funds);
        $data['funds'] = $funds;
        
        $data_array = [] ;
        foreach($funds as $fund)
        {
        	if($fund->status == 2){
               $status =  'Pending';
			}else if($fund->status == 1){
             	$status =  'Approved';
           	}else if($fund->status == 3){
            	$status =  'Rejected';
            }
        	
        	$data_array[] = array(
        					   	'date' 		=> dateTime($fund->created_at,'d M,Y H:i'),
        					   	'txn_number'=> $fund->transaction,
        					   	'username'	=> optional($fund->user)->username,
        					   	'methos'	=> optional($fund->gateway)->name,
        					   	'amount'	=> getAmount($fund->amount, config('basic.fraction_number')),
        					   	'charge'	=> getAmount($fund->charge,config('basic.fraction_number')),
        					   	'payable'	=> getAmount($fund->final_amount,config('basic.fraction_number')),
        					   	'status'	=> $status,
        					   );
        }
        
        
        return Excel::download(new UsersExport($data_array), 'payment_report.xlsx');
       
    	
    }

    public function pending()
    {
        $page_title = "Payment Pending";

        $funds = Fund::where('status', 2)->orderBy('id', 'DESC')->with('user', 'gateway')->paginate(config('basic.paginate'));
        return view('admin.payment.logs', compact('funds', 'page_title'));
    }

    public function search(Request $request)
    {
        $search = $request->all();

        $dateSearch = $request->date_time;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);

        $funds = Fund::when(isset($search['name']), function ($query) use ($search) {

            return $query->where('transaction', 'LIKE', $search['name'])
                ->orWhereHas('user', function ($q) use ($search) {
                    $q->where('email', 'LIKE', "%{$search['name']}%")
                        ->orWhere('username', 'LIKE', "%{$search['name']}%");
                });
        })
            ->when($date == 1, function ($query) use ($dateSearch) {
                return $query->whereDate("created_at", $dateSearch);
            })
            ->when($search['status'] != -1, function ($query) use ($search) {
                return $query->where('status', $search['status']);
            })
            ->where('status', '!=', 0)
            ->with('user', 'gateway')
            ->paginate(config('basic.paginate'));
        $funds->appends($search);
        $page_title = "Search Payment Logs";
        return view('admin.payment.logs', compact('funds', 'page_title'));
    }

    public function action(Request $request, $id)
    {
     
        $this->validate($request, [
            'id' => 'required',
            'status' => ['required', Rule::in(['1', '3'])],
        ]);
        $data = Fund::where('id', $request->id)->whereIn('status', [2])->with('user', 'gateway', 'sendmoney')->firstOrFail();
        $basic = (object)config('basic');


        $req = Purify::clean($request->all());
        $req = (object)$req;

        if ($request->status == '1') {
            $data->status = 1;
            $data->feedback = $req->feedback;
            $data->update();


            $user = $data->user;
            if ($data->sendmoney) {
                $sendmoney = $data->sendmoney;
                $sendmoney->payment_status = 1;
                $sendmoney->paid_at = Carbon::now();
                $sendmoney->save();
            } else {
                $user->balance += $data->amount;
                $user->save();
            }


            $remarks = getAmount($data->amount) . ' ' . $basic->currency . ' payment amount has been approved';
            BasicService::makeTransaction($user, getAmount($data->amount), getAmount($data->charge), $trx_type = '+', $data->transaction, $remarks);

            $this->sendMailSms($user, 'PAYMENT_APPROVED', [
                'gateway_name' => $data->gateway->name,
                'amount' => getAmount($data->amount),
                'charge' => getAmount($data->charge),
                'currency' => $basic->currency,
                'transaction' => $data->transaction,
                'feedback' => $data->feedback,
            ]);


            $msg = [
                'amount' => getAmount($data->amount),
                'currency' => $basic->currency,
            ];
            $action = [
                "link" => '#',
                "icon" => "fas fa-money-bill-alt text-white"
            ];
            $this->userPushNotification($user, 'PAYMENT_APPROVED', $msg, $action);
            log_admin_activity('Approve payment', 'Approved payment amount ('.$basic->currency.getAmount($data->amount).')');
            session()->flash('success', 'Approve Successfully');
            return back();

        }
        elseif ($request->status == '3') {

            $data->status = 3;
            $data->feedback = $req->feedback;
            $data->update();
            $user = $data->user;

            if ($data->sendmoney) {
                $sendmoney = $data->sendmoney;
                $sendmoney->payment_status = 2;
                $sendmoney->admin_id = auth()->guard('admin')->id();
                $sendmoney->admin_reply = $req->feedback;
                $sendmoney->status = 3;
                $sendmoney->paid_at = Carbon::now();
                $sendmoney->save();
            }



            $this->sendMailSms($user, $type = 'DEPOSIT_REJECTED', [
                'method' => optional($data->gateway)->name,
                'amount' => getAmount($data->amount),
                'charge' => getAmount($data->charge),
                'currency' => $basic->currency,
                'transaction' => $data->transaction,
                'feedback' => $data->feedback
            ]);

            $msg = [
                'amount' => getAmount($data->amount),
                'currency' => $basic->currency,
            ];
            $action = [
                "link" => '#',
                "icon" => "fas fa-money-bill-alt text-white"
            ];
            $this->userPushNotification($user, 'DEPOSIT_REJECTED', $msg, $action);

            session()->flash('success', 'Reject Successfully');
            return back();
        }
    }
}
