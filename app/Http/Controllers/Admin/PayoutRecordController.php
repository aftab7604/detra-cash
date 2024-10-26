<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\Notify;
use App\Models\Withdrow;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class PayoutRecordController extends Controller
{
    use Notify;
    public function index()
    {
        $page_title = "Payout Logs";
        $records = Withdrow::where('status', '!=', 0)->orderBy('id', 'DESC')->with('user', 'payoutMethod')->paginate(config('basic.paginate'));
        return view('admin.payout.logs', compact('records', 'page_title'));
    }


    public function request()
    {
        $page_title = "Payout Request";
        $records = Withdrow::with(['user'])->where('status', 1)->orderBy('id', 'DESC')->with('user', 'payoutMethod')->paginate(config('basic.paginate'));
        return view('admin.payout.logs', compact('records', 'page_title'));
    }

    public function search(Request $request)
    {
        $search = $request->all();
        $fromDate = Carbon::parse($request->from_date);
        $toDate = Carbon::parse($request->to_date)->addDay();

        $items = Withdrow::with('user', 'payoutMethod')
            ->when(isset($search['name']), function ($query) use ($search) {
                return $query->whereHas('user', function ($q) use ($search) {
                    $q->where('email', 'LIKE', "%{$search['name']}%")
                        ->orWhere('firstname', 'LIKE', "%{$search['name']}%")
                        ->orWhere('lastname', 'LIKE', "%{$search['name']}%")
                        ->orWhere('username', 'LIKE', "%{$search['name']}%");
                });
            })
            ->when(isset($search['trx_id']), function ($query) use ($search) {
                return $query->where('trx_id',  'LIKE', "%{$search['trx_id']}%");
            })
            ->when(isset($search['status']), function ($query) use ($search) {
                return $query->where('status', $search['status']);
            })
            ->when(isset($search['from_date']), function ($q2) use ($fromDate) {
                return $q2->whereDate('created_at', '>=', $fromDate);
            })
            ->when(isset($search['to_date']), function ($q2) use ($fromDate, $toDate) {
                return $q2->whereBetween('created_at', [$fromDate, $toDate]);
            })
            ->where('status', '!=', 0)
            ->paginate(config('basic.paginate'));

        $items->appends($search);

        $page_title = "Search Payout Logs";
        return view('admin.withdraw', compact('items', 'page_title'));
    }

    public function view($id)
    {
        $data['payout'] = Withdrow::findOrFail($id);
        return view('admin.payout.view', $data);
    }


    public function payoutCancel(Request $request, $id)
    {
        $basic = (object)config('basic');
        $data = Withdrow::where('id', $id)->whereIn('status', [1])->with('user', 'payoutMethod')->firstOrFail();

        $data->status = 3;
        $data->feedback = $request->feedback;
        $data->save();


        $user = $data->user;
        $user->balance += ($data->amount+$data->charge);
        $user->save();

        $transaction = new Transaction();
        $transaction->user_id = $user->id;
        $transaction->amount = getAmount($data->amount);
        $transaction->final_balance = $user->balance;
        $transaction->charge = $data->charge;
        $transaction->trx_type = '+';
        $transaction->remarks = getAmount($data->amount) . ' ' . $basic->currency . ' withdraw amount has been refunded';
        $transaction->trx_id = $data->trx_id;
        $transaction->save();


        try {
            $this->sendMailSms($user, $type = 'PAYOUT_REJECTED', [
                'method' => optional($data->payoutMethod)->name,
                'amount' => getAmount($data->amount),
                'charge' => getAmount($data->charge),
                'currency' => $basic->currency,
                'transaction' => $data->trx_id,
                'feedback' => $data->feedback
            ]);


            $msg = [
                'amount' => getAmount($data->amount),
                'currency' => $basic->currency,
            ];
            $action = [
                "link" => route('user.payout.history'),
                "icon" => "fa fa-money-bill-alt "
            ];
            $this->userPushNotification($user, 'PAYOUT_REJECTED', $msg, $action);
        } catch (\Exception $e) {

        }
        log_admin_activity('Update payout', 'Payout was canceled ('.$data->trx_id.')');
        session()->flash('success', 'Reject Successfully');
        return back();
    }


    public function payoutConfirm(Request $request, $id)
    {
        $payout = Withdrow::where('id', $id)->whereIn('status', [1])->with('user', 'payoutMethod')->firstOrFail();
        $basic = (object)config('basic');

        $method = $payout->payoutMethod;

        if ($method != null && $method->is_automatic == 1) {
            $methodObj = 'App\\Services\\Payout\\' . $method->code . '\\Card';
            $data = $methodObj::payouts($payout);
            if (!$data) {
                return back()->with('error', 'Method not available or unknown errors occur');
            }

            if ($data['status'] == 'error') {
                $payout->last_error = $data['data'];
                $payout->save();
                return back()->with('error', $data['data']);
            }
        }

        $payout->status = 2;
        $payout->feedback = $request->feedback;
        $payout->save();

        $this->userSuccessNotify($payout);

        log_admin_activity('Update payout', 'Payout was approved ('.$payout->trx_id.')');
        session()->flash('success', 'Approve Successfully');
        return back();
    }


    public function userSuccessNotify($data)
    {
        $user = $data->user;
        $basic = (object)config('basic');
        try {
            $this->sendMailSms($user, 'PAYOUT_APPROVE', [
                'method' => optional($data->payoutMethod)->name,
                'amount' => getAmount($data->amount),
                'charge' => getAmount($data->charge),
                'currency' => $basic->currency,
                'transaction' => $data->trx_id,
                'feedback' => $data->feedback
            ]);


            $msg = [
                'amount' => getAmount($data->amount),
                'currency' => $basic->currency,
            ];
            $action = [
                "link" => route('user.payout.history'),
                "icon" => "fa fa-money-bill-alt "
            ];

            $this->userPushNotification($user, 'PAYOUT_APPROVE', $msg, $action);
        } catch (\Exception $e) {

        }

        return 0;
    }


    public function payout($code, Request $request)
    {
        $apiResponse = json_decode($request->all());
        if ($code == 'razorpay') {
            $this->razorpayPayoutWebhook($apiResponse);
        }
        if ($code == 'flutterwave') {
            $this->razorpayPayoutWebhook($apiResponse);
        }
        if ($code == 'paystack') {
            $this->paystackPayoutWebhook($apiResponse);
        }
        if ($code == 'paypal') {
            $this->paypalPayoutWebhook($apiResponse);
        }
    }


    public function razorpayPayoutWebhook($apiResponse)
    {
        $basic = (object)config('basic');
        if ($apiResponse) {
            if ($apiResponse->payload) {
                if ($apiResponse->payload->payout) {
                    if ($apiResponse->payload->payout->entity) {
                        $payout = Withdrow::where('response_id', $apiResponse->payload->payout->entity->id)->first();
                        $user = $payout->user;
                        if ($payout) {
                            if ($apiResponse->event == 'payout.processed' || $apiResponse->event == 'payout.updated') {
                                if ($payout->status != 2) {

                                    $payout->status = 2;
                                    $payout->save();

                                    $this->userSuccessNotify($payout);
                                }
                            } elseif ($apiResponse->event == 'payout.rejected' || $apiResponse->event == 'payout.failed') {
                                $payout->status = 4;
                                $payout->last_error = $apiResponse->payload->payout->entity->status_details->description ?? '';
                                $payout->save();

                                $user->balance += $payout->net_amount;
                                $user->save();

                                $transaction = new Transaction();
                                $transaction->user_id = $user->id;
                                $transaction->amount = getAmount($payout->net_amount);
                                $transaction->final_balance = $user->balance;
                                $transaction->charge = $payout->charge;
                                $transaction->trx_type = '+';
                                $transaction->remarks = getAmount($payout->amount) . ' ' . $basic->currency . ' withdraw amount has been refunded';
                                $transaction->trx_id = $payout->trx_id;
                                $transaction->save();

                                $this->userFailNotify($payout, $user);
                            }
                        }
                    }
                }
            }
        }
    }


    public function flutterwavePayoutWebhook($apiResponse)
    {
        $basic = (object)config('basic');
        if ($apiResponse) {
            if ($apiResponse->event == 'transfer.completed') {
                if ($apiResponse->data) {
                    $payout = Withdrow::where('response_id', $apiResponse->data->id)->first();
                    $user = $payout->user;
                    if ($payout) {
                        if ($apiResponse->data->status == 'SUCCESSFUL') {
                            $payout->status = 2;
                            $payout->save();
                            $this->userSuccessNotify($payout);
                        }
                        if ($apiResponse->data->status == 'FAILED') {
                            $payout->status = 4;
                            $payout->last_error = $apiResponse->data->complete_message;
                            $payout->save();

                            $user->balance += $payout->net_amount;
                            $user->save();

                            $transaction = new Transaction();
                            $transaction->user_id = $user->id;
                            $transaction->amount = getAmount($payout->net_amount);
                            $transaction->final_balance = $user->balance;
                            $transaction->charge = $payout->charge;
                            $transaction->trx_type = '+';
                            $transaction->remarks = getAmount($payout->amount) . ' ' . $basic->currency . ' withdraw amount has been refunded';
                            $transaction->trx_id = $payout->trx_id;
                            $transaction->save();

                            $this->userFailNotify($payout, $user);
                        }
                    }
                }
            }
        }
    }


    public function paystackPayoutWebhook($apiResponse)
    {
        $basic = (object)config('basic');
        if ($apiResponse) {
            if ($apiResponse->data) {
                $payout = Withdrow::where('response_id', $apiResponse->data->id)->first();
                $user = $payout->user;
                if ($payout) {
                    if ($apiResponse->event == 'transfer.success') {
                        $payout->status = 2;
                        $payout->save();
                        $this->userSuccessNotify($payout);

                    } elseif ($apiResponse->event == 'transfer.failed') {
                        $payout->status = 4;
                        $payout->last_error = $apiResponse->data->complete_message;
                        $payout->save();
                        $user->balance += $payout->net_amount;
                        $user->save();

                        $transaction = new Transaction();
                        $transaction->user_id = $user->id;
                        $transaction->amount = getAmount($payout->net_amount);
                        $transaction->final_balance = $user->balance;
                        $transaction->charge = $payout->charge;
                        $transaction->trx_type = '+';
                        $transaction->remarks = getAmount($payout->amount) . ' ' . $basic->currency . ' withdraw amount has been refunded';
                        $transaction->trx_id = $payout->trx_id;
                        $transaction->save();

                        $this->userFailNotify($payout, $user);
                    }
                }
            }
        }
    }


    public function paypalPayoutWebhook($apiResponse)
    {
        $basic = (object)config('basic');
        if ($apiResponse) {
            if ($apiResponse->batch_header) {
                $payout = Withdrow::where('response_id', $apiResponse->batch_header->payout_batch_id)->first();
                $user = $payout->user;
                if ($payout) {
                    if ($apiResponse->event_type == 'PAYMENT.PAYOUTSBATCH.SUCCESS' || $apiResponse->event_type == 'PAYMENT.PAYOUTS-ITEM.SUCCEEDED' || $apiResponse->event_type == 'PAYMENT.PAYOUTSBATCH.PROCESSING') {
                        if ($apiResponse->event_type != 'PAYMENT.PAYOUTSBATCH.PROCESSING') {
                            $payout->status = 2;
                            $payout->save();
                            $this->userSuccessNotify($payout);
                        }
                    } else {
                        $payout->status = 4;
                        $payout->last_error = $apiResponse->summary;
                        $payout->save();

                        $user->balance += $payout->net_amount;
                        $user->save();

                        $transaction = new Transaction();
                        $transaction->user_id = $user->id;
                        $transaction->amount = getAmount($payout->net_amount);
                        $transaction->final_balance = $user->balance;
                        $transaction->charge = $payout->charge;
                        $transaction->trx_type = '+';
                        $transaction->remarks = getAmount($payout->amount) . ' ' . $basic->currency . ' withdraw amount has been refunded';
                        $transaction->trx_id = $payout->trx_id;
                        $transaction->save();

                        $this->userFailNotify($payout, $user);
                    }
                }
            }
        }
    }


    public function userFailNotify($payout, $user)
    {
        $user = $payout->user;
        $basic = (object)config('basic');

        try {
            $this->sendMailSms($user, $type = 'PAYOUT_REJECTED', [
                'method' => optional($payout->payoutMethod)->name,
                'amount' => getAmount($payout->amount),
                'charge' => getAmount($payout->charge),
                'currency' => $basic->currency,
                'transaction' => $payout->trx_id,
                'feedback' => $payout->feedback
            ]);


            $msg = [
                'amount' => getAmount($payout->amount),
                'currency' => $basic->currency,
            ];
            $action = [
                "link" => '#',
                "icon" => "fa fa-money-bill-alt "
            ];

            $this->userPushNotification($user, 'PAYOUT_REJECTED', $msg, $action);
        } catch (\Exception $e) {

        }

        return 0;
    }

}
