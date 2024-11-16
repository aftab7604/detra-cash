<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\Notify;
use App\Models\FlutterTransaction;
use App\Models\SendMoney;
use App\Models\Withdrow;
use App\Models\TopUpLog;
use App\Models\User;
use App\Models\Configure;
use App\Models\ReferralReward;
use App\Models\Country;
use Carbon\Carbon;
use Facades\App\Services\ReloadlyService;
use Facades\App\Services\Flutterwave;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Stevebauman\Purify\Facades\Purify;
use Facades\App\Services\BasicService;

class TransferLogController extends Controller
{
    use Notify;
    public function index()
    {
        $page_title = "Money Transfer";
        $status=10;
        $sendMoneys = SendMoney::orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.transfer.index', compact('sendMoneys', 'page_title','status'));
    }

    public function rechargePending()
    {
        $page_title = "Recharge Pending";
        $sendMoneys = SendMoney::whereIn('payment_status', [1,3])->where(['status'=> 2,'service_id'=>1])->orderBy('paid_at', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.transfer.index', compact('sendMoneys', 'page_title'));
    }

    public function status($status)
    {
        $page_title = "Transfer";
        // if($status==10)
        $sendMoneys = SendMoney::where('status', $status)->orderBy('received_at', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.transfer.index', compact('sendMoneys', 'page_title','status'));
    }

    public function complete()
    {
        $page_title = "Complete Transfer";
        $sendMoneys = SendMoney::where(['payment_status'=> 1, 'status'=> 1])->orderBy('received_at', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.transfer.index', compact('sendMoneys', 'page_title'));
    }

    public function pending()
    {
        $page_title = "Pending Transfer";
        $sendMoneys = SendMoney::whereIn('payment_status', [1,3])->where(['status'=> 2])->orderBy('paid_at', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.transfer.index', compact('sendMoneys', 'page_title'));
    }

    public function cancelled()
    {
        $page_title = "Cancelled Transfer";
        $sendMoneys = SendMoney::where(['status'=> 3])->orderBy('id', 'DESC')->paginate(config('basic.paginate'));
        return view('admin.transfer.index', compact('sendMoneys', 'page_title'));
    }

    public function search(Request $request)
    {
        $search = $request->all();


        $dateSearch = $request->date_time;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);

        $sendMoneys = SendMoney::whereHas('sendCurrency')->whereHas('getCurrency')->whereHas('user')
            ->when(isset($search['name']), function ($query) use ($search) {
                return $query->where('invoice', 'LIKE', $search['name'])
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
            ->where('payment_status', '!=', 0)
            ->with('user:id,username')
            ->paginate(config('basic.paginate'));
        $sendMoneys->appends($search);


        $page_title = "Search Transfer";
        return view('admin.transfer.index', compact('sendMoneys', 'page_title'));
    }

    public function details(SendMoney $sendMoney)
    {
        $page_title = "Transfer #".$sendMoney->invoice;
        $topUpLogs = TopUpLog::toBase()->where('send_money_id', $sendMoney->id)->latest()->get();
        if($sendMoney->service_id == 1){
            $reloadlyAccount = ReloadlyService::accountBalance();
        }else{
            $reloadlyAccount = [];
        }

        $flutterwaveService = collect(config('flutterwave'))->filter(function ($value) {
            return !empty($value);
        });
        $exactServices = ($flutterwaveService->toArray()[$sendMoney->receive_curr]) ?? [];

        return view('admin.transfer.details', compact('sendMoney','topUpLogs', 'page_title','reloadlyAccount','flutterwaveService', 'exactServices'));
    }

    public function updatestatus(SendMoney $sendMoney,Request $request) {
        $sendMoney->status=$request->status;
        $sendMoney->save();
        log_admin_activity('Update trnsfer status', 'Updated trnsfer status ('.$sendMoney->invoice.')');
        return redirect()->back();
    }

    public function withdraw (Request $request) {
        $query = Withdrow::where('trx_type', '-');

        if ($request->has('name') && $request->name !== null) {
            $query->where('trx_id', '=', $request->name );
        }

        if ($request->has('status') && $request->status !== null) {
            $query->where('status', $request->status);
        }

        if ($request->has('date_time') && $request->date_time !== null) {
            $query->whereDate('created_at', $request->date_time);
        }

        $items = $query->orderBy('id', 'DESC')->paginate(config('basic.paginate'));

        $page_title  = "withdraw";
        return view('admin.withdraw', compact('items','page_title'));
    }

    public function payout (Request $request) {
        $page_title = 'Payout History';

        $query = SendMoney::whereNotNull('merchant_id')->where('payment_status', 1);

        if ($request->has('name') && $request->name !== null) {
            $query->where('invoice', '=', $request->name );
        }

        if ($request->has('status') && $request->status !== null) {
            $query->where('status', $request->status);
        }

        if ($request->has('date_time') && $request->date_time !== null) {
            $query->whereDate('created_at', $request->date_time);
        }
        
        $items = $query->orderBy('id', 'DESC')->paginate(config('basic.paginate'));

        return view('admin.payout', compact('items','page_title'));
    }

    public function view($id) {
        $page_title = 'Payout Views';
        $payout  = Withdrow::with('user')->find($id);
        return view('admin.withdrowHistory', compact('payout','page_title'));
    }

    public function withdrawupdate(Request $request,$id) {
        $withdrow=Withdrow::find($id);

        if($request->status=='cancel' && $withdrow->status=="pending"){
            $user = User::find($withdrow->user_id);
            $user->balance  = $user->balance + $withdrow->amount;
            $user->save();
        }
        $withdrow->status=$request->status;
        $withdrow->save();
        log_admin_activity('Update payout', 'Payout was updated ('.$withdrow->trx_id.')');
        return back()->with('success', 'Update Successfully');
    }

    public function download($file)
    {
        $full_path = join(explode('|',decrypt($file)));
        $title = last(explode('|',decrypt($file)));
        $ext = pathinfo($title, PATHINFO_EXTENSION);
        $mimetype='';
        if (file_exists($full_path)) {
            $mimetype = mime_content_type($full_path);
        }
        header('Content-Disposition: attachment; filename="' . $title . '.' . $ext . '";');
        header("Content-Type: " . $mimetype);
        return readfile($full_path);
    }

    public function action(SendMoney $sendMoney, Request $request)
    {
        $this->validate($request, [
            'status' => 'required',
            'admin_reply' => 'required',
        ]);

        $req = Purify::clean($request->all());
        $req = (object)$req;

        if($sendMoney->status != 2){
            session()->flash('error', 'Not eligible to action this');
            return back()->withInput();
        }
        if($sendMoney->payment_status == 0){
            session()->flash('error', 'this user not yet payment');
            return back()->withInput();
        }

        if($sendMoney->payment_status == 3){
            session()->flash('error', 'Please take a action for this payment request');
            return back()->withInput();
        }

        
        $user = $sendMoney->user;
        if($req->status == 1){
            $txnExist = SendMoney::where(["user_id"=>$user->id,'status'=>1])->first();
            if(!$txnExist){
                $reward_redeemed = ReferralReward::where("user_id",$user->id)->first();
                if(!$reward_redeemed){
                    $send_amount = $sendMoney->send_amount;
                    $send_currency = Country::find($sendMoney->send_currency_id);
                    if($send_currency->code != 'EUR'){ // covert other currency into euro
                     
                    }
    
                    $reward = 0;
                    $Rreward = 0;
    
                    $conf = Configure::find(1);
                    if($send_amount >= $conf->reward_min_txn ){

                        if($conf->referral_reward_status = 1){
                            $usr = User::find($user->id);
                            $reward = $conf->referral_reward;
                            if($conf->referral_reward_type == 'percent'){
                                $reward = (($send_amount / 100) * $reward);
                            }
        
                            $trx_id = strRandom();
                            $remarks = "You got commission from #".$sendMoney->invoice;
                            BasicService::makeTransaction($user, getAmount($reward),  0, '+', $trx_id, $remarks );
        
                            $usr->balance +=  $reward;
                            $usr->save();
        
                        }
        
                        if($conf->refree_reward_status = 1){
                            $usr = User::where("id",$user->id)->with('referral')->first();
                            if($user->referral){
                                $Rreward = $conf->refree_reward;
                                if($conf->refree_reward_type == 'percent'){
                                    $Rreward = (($send_amount / 100) * $Rreward);
                                }
            
                                $trx_id = strRandom();
                                $remarks = "You got commission from #".$sendMoney->invoice;
                                BasicService::makeTransaction($usr->referral, getAmount($Rreward),  0, '+', $trx_id, $remarks );
            
                                $bal = $usr->referral->balance + $Rreward;
                                User::where("id",$usr->referral->id)->update([
                                    'balance'=>$bal
                                ]);
                            }
                            
                        }
        
                        //creating record as redeemed referal
                        ReferralReward::create([
                            "user_id"=>$user->id,
                            'referral_amount'=>$reward,
                            'refree_amount'=>$Rreward
                        ]);

                    }
                    

                  
                }
            }
            
                
            //complete
            $sendMoney->admin_id = auth()->guard('admin')->id();
            $sendMoney->admin_reply = $req->admin_reply;
            $sendMoney->status = $req->status;
            $sendMoney->received_at = Carbon::now();
            $sendMoney->save();

            $this->sendMailSms($user, 'MONEY_TRANSFER_COMPLETE', [
                'amount' => getAmount($sendMoney->totalPay, config('basic.fraction_number')),
                'currency' => $sendMoney->send_curr,
                'invoice' => $sendMoney->invoice,
                'admin_reply' => $sendMoney->admin_reply,
            ]);
            $msg = [
                'amount' => getAmount($sendMoney->totalPay, config('basic.fraction_number')),
                'currency' => $sendMoney->send_curr
            ];

            $action = [
                "link" => '#',
                "icon" => "fas fa-money-bill-alt text-white"
            ];

            $this->userPushNotification($user, 'MONEY_TRANSFER_COMPLETE', $msg, $action);
            log_admin_activity('Update trnsfer status', 'Transfer was completed ('.$sendMoney->invoice.')');
            session()->flash('success', 'Your transfer has been completed');
        }
        if($req->status == 3){
            //Cancelled
            $sendMoney->admin_id = auth()->guard('admin')->id();
            $sendMoney->admin_reply = $req->admin_reply;
            $sendMoney->status = $req->status;
            $sendMoney->save();


            $this->sendMailSms($user, 'MONEY_TRANSFER_REJECTED', [
                'amount' => getAmount($sendMoney->totalPay, config('basic.fraction_number')),
                'currency' => $sendMoney->send_curr,
                'invoice' => $sendMoney->invoice,
                'admin_reply' => $sendMoney->admin_reply,
            ]);


            $msg = [
                'amount' => getAmount($sendMoney->totalPay, config('basic.fraction_number')),
                'currency' => $sendMoney->send_curr
            ];
            $action = [
                "link" => '#',
                "icon" => "fas fa-money-bill-alt text-white"
            ];
            $this->userPushNotification($user, 'MONEY_TRANSFER_REJECTED', $msg, $action);
            session()->flash('success', 'This transfer has been rejected');
        }

        return back();
    }


    /*
     * Reloadly
     */

    public function rechargeRequest(SendMoney $sendMoney, Request $request)
    {

        $req = Purify::clean($request->all());
        $req = (object)$req;

        if ($sendMoney->status != 2) {
            session()->flash('error', 'Not eligible to action this');
            return back()->withInput();
        }
        if ($sendMoney->payment_status == 0) {
            session()->flash('error', 'this user not yet payment');
            return back()->withInput();
        }

        if ($sendMoney->payment_status == 3) {
            session()->flash('error', 'Please take a action for this payment request');
            return back()->withInput();
        }
        ReloadlyService::topupsAsync($sendMoney);

        return back()->withInput();
    }

    /*
     * Fluttwerwave
     */

    public function flutterAction(SendMoney $sendMoney, Request $request)
    {
        if ($sendMoney->status != 2) {
            session()->flash('error', 'Not eligible to action this');
            return back()->withInput();
        }
        if ($sendMoney->payment_status == 0) {
            session()->flash('error', 'this user not yet payment');
            return back()->withInput();
        }
        if ($sendMoney->payment_status == 3) {
            session()->flash('error', 'Please take a action for this payment request');
            return back()->withInput();
        }

        $req = $request->except('_token', '_method', 'transfers', 'debit_ng_account', 'ussd','mobile_money_ghana','mobile_money_zambia', 'mobile_money_uganda','mobile_money_rwanda','debit_uk_account','mpesa');

        if ($request->transfers == '1') {

            $params = array_keys(config('flutterwave.' . $sendMoney->receive_curr . '.transfers'));
            $rules = [];
            if ($params != null) {
                foreach ($params as $key) {
                    $rules[$key] = 'required|max:191';
                }
            }
            $validator = validator()->make($request->all(), $rules);
            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $req["reference"] = $sendMoney->invoice . "-" . code(4);
            $req["callback_url"] = route('payoutTransIpn');
            $response = Flutterwave::Payouts($req);
            $response = json_decode($response);
            if ($response->status == 'error') {
                return back()->with('error', $response->message);
            }
            $sendMoney->flutter_status = $response->status;
            $sendMoney->flutter_response = $response->message;
            $sendMoney->save();
            $this->extracted($sendMoney, $response);
        }
        if ($request->debit_ng_account == '1') {

            $params = array_keys(config('flutterwave.' . $sendMoney->receive_curr . '.debit_ng_account'));
            $rules = [];
            if ($params != null) {
                foreach ($params as $key) {
                    $rules[$key] = 'required|max:191';
                }
            }
            $validator = validator()->make($request->all(), $rules);
            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }
            $req["tx_ref"] = $sendMoney->invoice . "-" . code(4);

            $response = Flutterwave::accountPayments($req);
            $response = json_decode($response);
            if ($response->status == 'error') {
                return back()->with('error', $response->message);
            }
            $sendMoney->flutter_status = $response->status;
            $sendMoney->flutter_response = $response->message;
            $sendMoney->save();
            $this->extracted($sendMoney, $response);
        }
        if ($request->ussd == '1') {
            $params = array_keys(config('flutterwave.' . $sendMoney->receive_curr . '.ussd'));
            $rules = [];
            if ($params != null) {
                foreach ($params as $key) {
                    $rules[$key] = 'required|max:191';
                }
            }
            $validator = validator()->make($request->all(), $rules);
            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }


            $req["tx_ref"] = $sendMoney->invoice . "-" . code(4);

            $response = Flutterwave::PaymentUSSD($req);
            $response = json_decode($response);
            if ($response->status == 'error') {
                return back()->with('error', $response->message);
            }

            $sendMoney->flutter_status = $response->status;
            $sendMoney->flutter_response = $response->message;
            $sendMoney->save();
            $this->extracted($sendMoney, $response);
        }

        if ($request->debit_uk_account == '1') {
            $params = array_keys(config('flutterwave.' . $sendMoney->receive_curr . '.debit_uk_account'));
            $rules = [];
            if ($params != null) {
                foreach ($params as $key) {
                    $rules[$key] = 'required|max:191';
                }
            }
            $validator = validator()->make($request->all(), $rules);
            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $req["tx_ref"] = $sendMoney->invoice . "-" . code(4);
            $response = Flutterwave::UK_AccountPayments($req);
            $response = json_decode($response);
            if ($response->status == 'error') {
                return back()->with('error', $response->message);
            }
            $sendMoney->flutter_status = $response->status;
            $sendMoney->flutter_response = $response->message;
            $sendMoney->save();
            $this->extracted($sendMoney, $response);
        }


        if ($request->mpesa == '1') {
            $params = array_keys(config('flutterwave.' . $sendMoney->receive_curr . '.mpesa'));
            $rules = [];
            if ($params != null) {
                foreach ($params as $key) {
                    $rules[$key] = 'required|max:191';
                }
            }
            $validator = validator()->make($request->all(), $rules);
            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $req["tx_ref"] = $sendMoney->invoice . "-" . code(4);
            $response = Flutterwave::mpesa($req);
            $response = json_decode($response);
            if ($response->status == 'error') {
                return back()->with('error', $response->message);
            }


            $sendMoney->flutter_status = $response->status;
            $sendMoney->flutter_response = $response->message;
            $sendMoney->save();
            $this->extracted($sendMoney, $response);
        }

        if ($request->mobile_money_ghana == '1') {
            $params = array_keys(config('flutterwave.' . $sendMoney->receive_curr . '.mobile_money_ghana'));
            $rules = [];
            if ($params != null) {
                foreach ($params as $key) {
                    $rules[$key] = 'required|max:191';
                }
            }
            $validator = validator()->make($request->all(), $rules);
            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $tx_ref = $sendMoney->invoice . "-" . code(4);

            $req["network"] = 'MTN';
            $req["tx_ref"] = $tx_ref;
            $req["redirect_url"] = route('mobileMoneyVerify');

            $response = Flutterwave::GhanaMobileMoney($req);

            $response = json_decode($response);
            if ($response->status == 'error') {
                return back()->with('error', $response->message);
            }

            $flutterTrans = new FlutterTransaction();
            $flutterTrans->send_money_id = $sendMoney->id;
            $flutterTrans->reference =$tx_ref;
            $flutterTrans->status = $response->status;
            $flutterTrans->message =$response->message;
            $flutterTrans->save();
            $makeUrl = @$response->meta->authorization->redirect;

            return redirect($makeUrl);
        }
        if ($request->mobile_money_zambia == '1') {
            $params = array_keys(config('flutterwave.' . $sendMoney->receive_curr . '.mobile_money_zambia'));
            $rules = [];
            if ($params != null) {
                foreach ($params as $key) {
                    $rules[$key] = 'required|max:191';
                }
            }
            $validator = validator()->make($request->all(), $rules);
            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $tx_ref = $sendMoney->invoice . "-" . code(4);

            $req["network"] = 'MTN';
            $req["tx_ref"] = $tx_ref;
            $req["redirect_url"] = route('mobileMoneyVerify');
            $response = Flutterwave::GhanaMobileMoney($req);
            $response = json_decode($response);
            if ($response->status == 'error') {
                return back()->with('error', $response->message);
            }


            $flutterTrans = new FlutterTransaction();
            $flutterTrans->send_money_id = $sendMoney->id;
            $flutterTrans->reference =$tx_ref;
            $flutterTrans->status = $response->status;
            $flutterTrans->message =$response->message;
            $flutterTrans->save();


            $makeUrl = @$response->meta->authorization->redirect;
            return redirect($makeUrl);
        }
        if ($request->mobile_money_uganda == '1') {
            $params = array_keys(config('flutterwave.' . $sendMoney->receive_curr . '.mobile_money_uganda'));
            $rules = [];
            if ($params != null) {
                foreach ($params as $key) {
                    $rules[$key] = 'required|max:191';
                }
            }
            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $tx_ref = $sendMoney->invoice . "-" . code(4);

            $req["network"] = 'MTN';
            $req["tx_ref"] = $tx_ref;
            $req["redirect_url"] = route('mobileMoneyVerify');

            $response = Flutterwave::UgandaMobileMoney($req);
            $response = json_decode($response);
            if ($response->status == 'error') {
                return back()->with('error', $response->message);
            }

            $flutterTrans = new FlutterTransaction();
            $flutterTrans->send_money_id = $sendMoney->id;
            $flutterTrans->reference =$tx_ref;
            $flutterTrans->status = $response->status;
            $flutterTrans->message =$response->message;
            $flutterTrans->save();

            $makeUrl = @$response->meta->authorization->redirect;
            return redirect($makeUrl);
        }
        if ($request->mobile_money_rwanda == '1') {
            $params = array_keys(config('flutterwave.' . $sendMoney->receive_curr . '.mobile_money_rwanda'));
            $rules = [];
            if ($params != null) {
                foreach ($params as $key) {
                    $rules[$key] = 'required|max:191';
                }
            }
            $validator = validator()->make($request->all(), $rules);
            if ($validator->fails()) {
                return back()->withErrors($validator)->withInput();
            }

            $tx_ref = $sendMoney->invoice . "-" . code(4);

            $req["network"] = 'MTN';
            $req["tx_ref"] = $tx_ref;
            $req["redirect_url"] = route('mobileMoneyVerify');

            $response = Flutterwave::rwandaMobileMoney($req);
            $response = json_decode($response);
            if ($response->status == 'error') {
                return back()->with('error', $response->message);
            }

            $flutterTrans = new FlutterTransaction();
            $flutterTrans->send_money_id = $sendMoney->id;
            $flutterTrans->reference =$tx_ref;
            $flutterTrans->status = $response->status;
            $flutterTrans->message =$response->message;
            $flutterTrans->save();

            $makeUrl = @$response->meta->authorization->redirect;
            return redirect($makeUrl);
        }
        return back();
    }

    public function flutterVerifyTrx($id)
    {
        $flutterTrx = FlutterTransaction::where('data_id', $id)->with('send_money')->firstOrFail();


        if ($flutterTrx->verified_at == null) {
            $response = Flutterwave::verifyTransaction($id);
            $response = json_decode($response);
            if ($response->status == 'error') {
                return back()->with('error',$response->message);
            }

            if ($response->status == 'success') {
                if ($flutterTrx) {
                    $flutterTrx->status = $response->status;
                    $flutterTrx->message = $response->message;
                    $flutterTrx->details = $response->data;
                    $flutterTrx->verified_at = Carbon::now();
                    $flutterTrx->save();
                }
            }
            $sendMoney = $flutterTrx->send_money;
            $sendMoney->flutter_status = $response->status;
            $sendMoney->flutter_response = $response->message;
            $sendMoney->save();
        }
        return back();
    }

    public function flutterVerifyAcc(SendMoney $sendMoney, Request $request)
    {
        $rules['account_bank'] = 'required|max:191';
        $rules['account_number'] = 'required|max:191';

        $validator = validator()->make($request->all(), $rules);
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $params = $request->only(['account_bank','account_number']);
        $response = Flutterwave::AccountVerification($params);
        session()->flash('validAccount', $response);
        return back();
    }
    /**
     * @param SendMoney $sendMoney
     * @param $response
     */
    public function extracted(SendMoney $sendMoney, $response): void
    {
        $flutterTrans = new FlutterTransaction();
        $flutterTrans->send_money_id = $sendMoney->id;
        $flutterTrans->status = $sendMoney->flutter_status;
        $flutterTrans->message = $sendMoney->flutter_response;
        $flutterTrans->data_id = @$response->data->id;
        $flutterTrans->details = @$response->data;
        $flutterTrans->save();
    }
}
