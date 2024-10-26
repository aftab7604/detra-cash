<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Traits\Notify;
use App\Http\Traits\Upload;
use App\Models\Withdrow;
use Facades\App\Services\BasicService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Intervention\Image\Facades\Image;
use Stevebauman\Purify\Facades\Purify;

class PayoutController extends Controller
{
    /*
    * User payout Operation
    */
    use Upload, Notify;

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

    public function payoutMoney()
    {
        $data['title'] = "Withdraw Money";
        $data['gateways'] = PayoutMethod::whereStatus(1)->get();
        return view($this->theme . 'payout.money', $data);
    }

    public function payoutMoneyRequest(Request $request)
    {
        $this->validate($request, [
            'wallet_type' => ['required', Rule::in(['balance'])],
            'gateway' => 'required|integer',
            'amount' => ['required', 'numeric']
        ]);


        $basic = (object)config('basic');
        $method = PayoutMethod::where('id', $request->gateway)->where('status', 1)->firstOrFail();
        $authWallet = $this->user;

        $charge = $method->fixed_charge + ($request->amount * $method->percent_charge / 100);

        $finalAmo = $request->amount + $charge;

        if ($request->amount < $method->minimum_amount) {
            session()->flash('error', 'Minimum payout Amount ' . round($method->minimum_amount, 2) . ' ' . $basic->currency);
            return back();
        }
        if ($request->amount > $method->maximum_amount) {
            session()->flash('error', 'Maximum payout Amount ' . round($method->maximum_amount, 2) . ' ' . $basic->currency);
            return back();
        }

        if (getAmount($finalAmo) > $authWallet[$request->wallet_type]) {
            session()->flash('error', 'Insufficient ' . snake2Title($request->wallet_type) . ' For Withdraw.');
            return back();
        } else {
            $trx = strRandom();
            $withdraw = new Payout();
            $withdraw->user_id = $authWallet->id;
            $withdraw->payout_method_id = $method->id;
            $withdraw->amount = getAmount($request->amount);
            $withdraw->charge = $charge;
            $withdraw->net_amount = $finalAmo;
            $withdraw->trx_id = $trx;
            $withdraw->status = 0;
            $withdraw->balance_type = $request->wallet_type;
            $withdraw->save();
            session()->put('wtrx', $trx);
            session()->put('wallet_type', $request->wallet_type);
            return redirect()->route('user.payout.preview');
        }
    }

    public function payoutPreview()
    {
        $withdraw = Withdrow::latest()->where('trx_id', session()->get('wtrx'))->where('status', 0)->latest()->with('payoutMethod', 'user')->firstOrFail();
        $payoutMethod = $withdraw->payoutMethod;
        $title = "Payout Form";
        $wallet_type = session()->get('wallet_type');


        $layout = 'layouts.merchant';
        $remaining = getAmount(auth()->user()->balance - $withdraw->net_amount);

        if ($payoutMethod->code == 'flutterwave') {
            return view($this->theme . 'payout.gateway.' . $payoutMethod->code, compact('withdraw', 'title', 'remaining', 'layout', 'payoutMethod', 'wallet_type'));
        } elseif ($payoutMethod->code == 'paystack') {
            return view($this->theme . 'payout.gateway.' . $payoutMethod->code, compact('withdraw', 'title', 'remaining', 'layout', 'payoutMethod', 'wallet_type'));
        }
        return view($this->theme . 'payout.preview', compact('withdraw', 'title', 'remaining', 'layout', 'payoutMethod', 'wallet_type'));
    }

    public function payoutRequestSubmit(Request $request)
    {

        $basic = (object)config('basic');
        $withdraw = Withdrow::latest()->where('trx_id', session()->get('wtrx'))->where('status', 0)->with('payoutMethod', 'user')->firstOrFail();
        $rules = [];
        $inputField = [];
        $balence_type = $request->wallet_type ? $request->wallet_type : 'withdraw';

        if (optional($withdraw->payoutMethod)->input_form != null) {
            foreach (optional($withdraw->payoutMethod)->input_form as $key => $cus) {
                $rules[$key] = [$cus->validation];
                if ($cus->type == 'file') {
                    array_push($rules[$key], 'image');
                    array_push($rules[$key], 'mimes:jpeg,jpg,png');
                    array_push($rules[$key], 'max:2048');
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

        if (optional($withdraw->payoutMethod)->is_automatic == 1) {
            $rules['currency_code'] = 'required';
            if (optional($withdraw->payoutMethod)->code == 'paypal') {
                $rules['recipient_type'] = 'required';
            }
        }

        $this->validate($request, $rules);

        $user = $this->user;

        if (getAmount($withdraw->net_amount) > $user->balance) {
            session()->flash('error', 'Insufficient balance For Payout.');
            return redirect()->route('user.payout.money');
        } else {
            $collection = collect($request);
            $reqField = [];
            if (optional($withdraw->payoutMethod)->input_form != null) {
                foreach ($collection as $k => $v) {
                    foreach (optional($withdraw->payoutMethod)->input_form as $inKey => $inVal) {
                        if ($k != $inKey) {
                            continue;
                        } else {
                            if ($inVal->type == 'file') {
                                if ($request->hasFile($inKey)) {
                                    $image = $request->file($inKey);
                                    $filename = time() . uniqid() . '.jpg';
                                    $location = config('location.withdrawLog.path');
                                    $reqField[$inKey] = [
                                        'fieldValue' => $filename,
                                        'type' => $inVal->type,
                                    ];
                                    try {
                                        $this->uploadImage($image, $location, $size = null, $old = null, $thumb = null, $filename);
                                    } catch (\Exception $exp) {
                                        return back()->with('error', 'Image could not be uploaded.');
                                    }

                                }
                            } else {
                                $reqField[$inKey] = $v;
                                $reqField[$inKey] = [
                                    'fieldValue' => $v,
                                    'type' => $inVal->type,
                                ];
                            }
                        }
                    }
                }
                if (optional($withdraw->payoutMethod)->is_automatic == 1) {
                    $reqField['amount'] = [
                        'fieldValue' => $withdraw->amount * convertRate($request->currency_code, $withdraw),
                        'type' => 'text',
                    ];
                }
                if (optional($withdraw->payoutMethod)->code == 'paypal') {
                    $reqField['recipient_type'] = [
                        'fieldValue' => $request->recipient_type,
                        'type' => 'text',
                    ];
                }
                $withdraw['withdraw_information'] = $reqField;
            } else {
                $withdraw['withdraw_information'] = null;
            }

            $withdraw->currency_code = @$request->currency_code;
            $withdraw->status = 1;
            $withdraw->save();

            $user['balance'] -= $withdraw->net_amount;
            $user->save();


            $remarks = 'Withdraw Via ' . optional($withdraw->payoutMethod)->name;
            BasicService::makeTransaction($user, $withdraw->amount, $withdraw->charge, '-', $balence_type, $withdraw->trx_id, $remarks);

            $this->userNotify($user, $withdraw);
            log_action('Payout', "New payout request");
            session()->flash('success', 'Payout request Successfully Submitted. Wait For Confirmation.');

            return redirect()->route('user.payout.money');
        }
    }

    public function userNotify($user, $withdraw)
    {
        $basic = (object)config('basic');

        $this->sendMailSms($user, $type = 'PAYOUT_REQUEST', [
            'method_name' => optional($withdraw->payoutMethod)->name,
            'amount' => getAmount($withdraw->amount),
            'charge' => getAmount($withdraw->charge),
            'currency' => $basic->currency,
            'trx' => $withdraw->trx_id,
        ]);


        $msg = [
            'username' => $user->username,
            'amount' => getAmount($withdraw->amount),
            'currency' => $basic->currency,
        ];

        $action = [
            "link" => route('admin.user.withdrawal', $user->id),
            "icon" => "fa fa-money-bill-alt "
        ];

        $this->adminPushNotification('PAYOUT_REQUEST', $msg, $action);
    }

    public function withdrawHistory(){
        $user = $this->user;
        $data['payoutLog'] = Payout::whereUser_id($user->id)->where('status', '!=', 0)->latest()->with('user', 'payoutMethod')->paginate(config('basic.paginate'));
        $data['title'] = "Withdraw Log";
        return view($this->theme . 'withdrow.index', $data);
    }


    public function withdrawHistorySearch(Request $request){
        $search = $request->all();

        $dateSearch = $request->date_time;
        $date = preg_match("/^[0-9]{2,4}\-[0-9]{1,2}\-[0-9]{1,2}$/", $dateSearch);

        $logs = Withdrow::orderBy('id', 'DESC')->where('user_id', $this->user->id)->where('status', '!=', 0)
            ->when(isset($search['name']), function ($query) use ($search) {
                return $query->where('trx_id', 'LIKE', $search['name']);
            })
            ->when(isset($search['status']), function ($query) use ($search) {
                return $query->where('status', $search['status']);
            })
            ->when($date == 1, function ($query) use ($dateSearch) {
                return $query->whereDate("created_at", $dateSearch);
            })
            ->with('user', 'payoutMethod')->paginate(config('basic.paginate'));
        $logs->appends($search);

        $title = "Payout Log";
        return view($this->theme . 'withdrow.index', compact('title', 'logs'));
    }


    public function paystackPayout(Request $request, $trx_id)
    {
        $payout = Withdrow::where('trx_id', $trx_id)->firstOrFail();
        $payoutMethod = PayoutMethod::find($payout->payout_method_id);
        $user = $this->user;
        $balence_type = $request->wallet_type ? $request->wallet_type : 'withdraw';
        $purifiedData = Purify::clean($request->all());

        if (empty($purifiedData['bank'])) {
            return back()->with('alert', 'Bank field is required')->withInput();
        }

        $rules = [];
        $inputField = [];
        if ($payoutMethod->input_form != null) {
            foreach ($payoutMethod->input_form as $key => $cus) {

                $rules[$key] = [$cus->validation];
                if ($cus->type == 'file') {
                    array_push($rules[$key], 'image');
                    array_push($rules[$key], 'mimes:jpeg,jpg,png');
                    array_push($rules[$key], 'max:2048');
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

        $rules['type'] = 'required';
        $rules['currency'] = 'required';

        $validate = Validator::make($request->all(), $rules);

        if ($validate->fails()) {
            return back()->withErrors($validate)->withInput();
        }

        if (getAmount($payout->net_amount) > $user->balance) {
            session()->flash('error', 'Insufficient balance For Payout.');
            return redirect()->route('user.payout.money');
        }

        $collection = collect($purifiedData);
        $reqField = [];
        if ($payoutMethod->input_form != null) {
            foreach ($collection as $k => $v) {
                foreach ($payoutMethod->input_form as $inKey => $inVal) {
                    if ($k != $inKey) {
                        continue;
                    } else {
                        if ($inVal->type == 'file') {
                            if ($request->file($inKey) && $request->file($inKey)->isValid()) {
                                $extension = $request->$inKey->extension();
                                $fileName = strtolower(strtotime("now") . '.' . $extension);
                                $storedPath = config('location.withdrawLog.path');
                                $imageMake = Image::make($purifiedData[$inKey]);
                                $imageMake->save($storedPath);

                                $reqField[$inKey] = [
                                    'fieldValue' => $fileName,
                                    'type' => $inVal->type,
                                ];
                            }
                        } else {
                            $reqField[$inKey] = $v;
                            $reqField[$inKey] = [
                                'fieldValue' => $v,
                                'type' => $inVal->type,
                            ];
                        }
                    }
                }
            }
            $reqField['type'] = [
                'fieldValue' => $request->type,
                'type' => 'text',
            ];
            $reqField['bank_code'] = [
                'fieldValue' => $request->bank,
                'type' => 'text',
            ];
            $reqField['amount'] = [
                'fieldValue' => $payout->amount * convertRate($request->currency, $payout),
                'type' => 'text',
            ];
            $payout->withdraw_information = $reqField;
        } else {
            $payout->withdraw_information = null;
        }
        $payout->currency_code = $request->currency_code;
        $payout->status = 1;
        $payout->save();

        $user->balance = $user->balance - $payout->net_amount;
        $user->save();

        $remarks = 'Withdraw Via ' . optional($payout->payoutMethod)->name;
        BasicService::makeTransaction($user, $payout->amount, $payout->charge, '-', $balence_type, $payout->trx_id, $remarks);

        $this->userNotify($user, $payout);
        log_action('Withdraw', "New withdraw request");
        return redirect(route('user.payout.money'))->with('success', 'Withdraw request Successfully Submitted. Wait For Confirmation.');
    }

    public function flutterwavePayout(Request $request, $trx_id)
    {
        $payout = Withdrow::where('trx_id', $trx_id)->first();
        $payoutMethod = PayoutMethod::find($payout->payout_method_id);
        $user = $this->user;

        $balence_type = $request->wallet_type ? $request->wallet_type : 'withdraw';

        $purifiedData = Purify::clean($request->all());

        if (empty($purifiedData['transfer_name'])) {
            return back()->with('alert', 'Transfer field is required');
        }
        $validation = config('banks.' . $purifiedData['transfer_name'] . '.validation');

        $rules = [];
        $inputField = [];
        if ($validation != null) {
            foreach ($validation as $key => $cus) {
                $rules[$key] = 'required';
                $inputField[] = $key;
            }
        }

        if (getAmount($payout->net_amount) > $user->balance) {
            session()->flash('error', 'Insufficient balance For Withdraw.');
            return redirect()->route('user.payout.money');
        }

        if ($request->transfer_name == 'NGN BANK' || $request->transfer_name == 'NGN DOM' || $request->transfer_name == 'GHS BANK'
            || $request->transfer_name == 'KES BANK' || $request->transfer_name == 'ZAR BANK' || $request->transfer_name == 'ZAR BANK') {
            $rules['bank'] = 'required';
        }

        $rules['currency_code'] = 'required';

        $validate = Validator::make($request->all(), $rules);

        if ($validate->fails()) {
            return back()->withErrors($validate)->withInput();
        }

        $collection = collect($purifiedData);
        $reqField = [];
        $metaField = [];

        if (config('banks.' . $purifiedData['transfer_name'] . '.input_form') != null) {
            foreach ($collection as $k => $v) {
                foreach (config('banks.' . $purifiedData['transfer_name'] . '.input_form') as $inKey => $inVal) {
                    if ($k != $inKey) {
                        continue;
                    } else {

                        if ($inVal == 'meta') {
                            $metaField[$inKey] = $v;
                            $metaField[$inKey] = [
                                'fieldValue' => $v,
                                'type' => 'text',
                            ];
                        } else {
                            $reqField[$inKey] = $v;
                            $reqField[$inKey] = [
                                'fieldValue' => $v,
                                'type' => 'text',
                            ];
                        }
                    }
                }
            }

            if ($request->transfer_name == 'NGN BANK' || $request->transfer_name == 'NGN DOM' || $request->transfer_name == 'GHS BANK'
                || $request->transfer_name == 'KES BANK' || $request->transfer_name == 'ZAR BANK' || $request->transfer_name == 'ZAR BANK') {

                $reqField['account_bank'] = [
                    'fieldValue' => $request->bank,
                    'type' => 'text',
                ];
            } elseif ($request->transfer_name == 'XAF/XOF MOMO') {
                $reqField['account_bank'] = [
                    'fieldValue' => 'MTN',
                    'type' => 'text',
                ];
            } elseif ($request->transfer_name == 'FRANCOPGONE' || $request->transfer_name == 'mPesa' || $request->transfer_name == 'Rwanda Momo'
                || $request->transfer_name == 'Uganda Momo' || $request->transfer_name == 'Zambia Momo') {
                $reqField['account_bank'] = [
                    'fieldValue' => 'MPS',
                    'type' => 'text',
                ];
            }

            if ($request->transfer_name == 'Barter') {
                $reqField['account_bank'] = [
                    'fieldValue' => 'barter',
                    'type' => 'text',
                ];
            } elseif ($request->transfer_name == 'flutterwave') {
                $reqField['account_bank'] = [
                    'fieldValue' => 'barter',
                    'type' => 'text',
                ];
            }


            $reqField['amount'] = [
                'fieldValue' => $payout->amount * convertRate($request->currency_code, $payout),
                'type' => 'text',
            ];

            $payout->withdraw_information = $reqField;
            $payout->meta_field = $metaField;
        } else {
            $payout->withdraw_information = null;
            $payout->meta_field = null;
        }

        $payout->status = 1;
        $payout->currency_code = $request->currency_code;
        $payout->save();

        $user->balance = $user->balance - $payout->net_amount;
        $user->save();

        $remarks = 'Withdraw Via ' . optional($payout->payoutMethod)->name;
        BasicService::makeTransaction($user, $payout->amount, $payout->charge, '-', $balence_type, $payout->trx_id, $remarks);

        $this->userNotify($user, $payout);
        log_action('Payout', "New payout request");

        return redirect(route('user.payout.money'))->with('success', 'Payout request Successfully Submitted. Wait For Confirmation.');
    }

    public function getBankList(Request $request)
    {
        $currencyCode = $request->currencyCode;
        $methodObj = 'App\\Services\\Payout\\paystack\\Card';
        $data = $methodObj::getBank($currencyCode);
        return $data;
    }

    public function getBankForm(Request $request)
    {
        $bankName = $request->bankName;
        $bankArr = config('banks.' . $bankName);

        if ($bankArr['api'] != null) {

            $methodObj = 'App\\Services\\Payout\\flutterwave\\Card';
            $data = $methodObj::getBank($bankArr['api']);
            $value['bank'] = $data;
        }
        $value['input_form'] = $bankArr['input_form'];
        return $value;
    }
}
