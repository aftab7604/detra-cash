<?php

namespace App\Services;

use App\Http\Traits\Notify;
use App\Models\Transaction;
use Carbon\Carbon;
use Facades\App\Services\ReloadlyService;
use Illuminate\Support\Facades\Log;
use Image;

class BasicService
{
    use Notify;

    public function validateImage(object $getImage, string $path)
    {
        if ($getImage->getClientOriginalExtension() == 'jpg' or $getImage->getClientOriginalName() == 'jpeg' or $getImage->getClientOriginalName() == 'png') {
            $image = uniqid() . '.' . $getImage->getClientOriginalExtension();
        } else {
            $image = uniqid() . '.jpg';
        }
        Image::make($getImage->getRealPath())->resize(300, 250)->save($path . $image);
        return $image;
    }

    public function validateDate(string $date)
    {
        if (preg_match("/^[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2,4}$/", $date)) {
            return true;
        } else {
            return false;
        }
    }

    public function validateKeyword(string $search, string $keyword)
    {
        return preg_match('~' . preg_quote($search, '~') . '~i', $keyword);
    }

    public function cryptoQR($wallet, $amount, $crypto = null)
    {

        $varb = $wallet . "?amount=" . $amount;
        return "https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl=$varb&choe=UTF-8";
    }

    public function preparePaymentUpgradation($order)
    {
        $basic = (object) config('basic');
        $gateway = $order->gateway;


        if ($order->status == 0) {
            $order['status'] = 1;
            $order->update();

            $user = $order->user;

            if($order->sendmoney){
                $sendmoney = $order->sendmoney;
                $sendmoney->payment_status = 1;
                $sendmoney->paid_at = Carbon::now();
                $sendmoney->save();

                ReloadlyService::topupsAsync($sendmoney);

                $msg = [
                    'username' => optional($order->user)->username,
                    'amount' => getAmount($sendmoney->totalPay, config('basic.fraction_number')),
                    'currency' => $sendmoney->send_curr
                ];
                $action = [
                    "link" => route('admin.money-transfer.details', $sendmoney),
                    "icon" => "fa fa-money-bill-alt text-white"
                ];
                $this->adminPushNotification('SEND_MONEY_REQUEST', $msg, $action);

            }else{
                $user->balance += $order->amount;
                $user->save();
            }

            $this->makeTransaction($user, getAmount($order->amount), getAmount($order->charge), $trx_type = '+',  $order->transaction, $remarks = 'Payment  Via ' . $gateway->name);


            $msg = [
                'username' => $user->username,
                'amount' => getAmount($order->amount),
                'currency' => $basic->currency,
                'gateway' => $gateway->name
            ];
            $action = [
                "link" => route('admin.user.fundLog', $user->id),
                "icon" => "fas fa-money-bill-alt"
            ];
            $this->adminPushNotification('ADMIN_PAYMENT_COMPLETE', $msg, $action);

            $this->sendMailSms($user, 'PAYMENT_COMPLETE', [
                'gateway_name' => $gateway->name,
                'amount' => getAmount($order->amount,config('basic.fraction_number')),
                'charge' => getAmount($order->charge, config('basic.fraction_number')),
                'currency' => $basic->currency,
                'transaction' => $order->transaction
            ]);


            $msg2 = [
                'gateway_name' => $gateway->name,
                'amount' => getAmount($order->amount, config('basic.fraction_number')),
                'charge' => getAmount($order->charge, config('basic.fraction_number')),
                'currency' => $basic->currency,
                'transaction' => $order->transaction
            ];
            $action2 = [
                "link" => '#',
                "icon" => "fas fa-money-bill-alt"
            ];
            $this->userPushNotification($user, 'PAYMENT_COMPLETE', $msg2, $action2);

            session()->forget('amount');
        }
    }




    /**
     * @param $user
     * @param $amount
     * @param $charge
     * @param $trx_type
     * @param $trx_id
     * @param $remarks
     */
    public function makeTransaction($user, $amount, $charge, $trx_type = null, $trx_id, $remarks = null): void
    {
        $transaction = new Transaction();
        $transaction->user_id = $user->id;
        $transaction->amount = getAmount($amount);
        $transaction->charge = $charge;
        $transaction->trx_type = $trx_type;
        $transaction->final_balance = $user->balance;
        $transaction->trx_id = $trx_id;
        $transaction->remarks = $remarks;
        $transaction->save();
    }



}
