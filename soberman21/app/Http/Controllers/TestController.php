<?php

namespace App\Http\Controllers;

use App\Models\FlutterTransaction;
use App\Models\SendMoney;
use Carbon\Carbon;
use Illuminate\Http\Request;

class TestController extends Controller
{

    public function test()
    {
//        'api-key: zg44PZf6UoFWAj26PS715yGX542oXAof'


        $headers = [
            'Content-Type: application/json',
            'api-key: zg44PZf6UoFWAj26PS715yGX542oXAof'
        ];


        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://sandboxapi.fincra.com/disbursements/payouts/',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_HTTPHEADER => $headers,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS =>'{
                "business": "5e3cb44238307d13974959d2",
                "sourceCurrency": "NGN",
                "destinationCurrency": "NGN",
                "amount": "100",
                "description": "i want to pay my vendor",
                "paymentDestination": "0690000040",
                "beneficiary": {
                    "firstName": "Hassan",
                    "lastName": "Sarz",
                    "country": "ng",
                    "phone": "0803443433",
                    "accountNumber": "0124775489",
                    "type": "individual",
                    "email": "ronniearea@gmail.com",
                    "bankCode": "044"
                }

}',
        ));

        $response = curl_exec($curl);
        curl_close($curl);

        $response = json_decode($response);
        dd($response);


    }


    public function getData(Request $request)
    {
        $response = json_decode($request->all());
        $data_id = $response->transfer->id;
        dd($response);

//        dd(json_decode($request->resp));
//        Flutterwave::verifyTransaction(->id);

//        dd($result);
//        $response =  Flutterwave::verifyTransaction(2660819);
//        $response = json_decode($response);
//        dd($response);
    }

    public function payoutTransIpn(Request $request)
    {
//        $res = file_get_contents('php://input');
//        @file_put_contents(time().'_Payouts_output.txt', $res);
        $response = json_decode($request->all());
        $data_id = $response->transfer->id;

        $data = FlutterTransaction::where('data_id', $data_id)->orderBy('id', 'desc')->first();
        if ($data) {
            $data->details = @$response->transfer;
            $data->status = @$response->transfer->status;
            $data->message = @$response->transfer->complete_message;
            $data->verified_at = Carbon::now();
            $data->save();

            $SendMoney = SendMoney::where('id', $data->send_money_id)->where('payment_status', 1)->first();
            if ($SendMoney) {
                $SendMoney->flutter_status = $data->status;
                $SendMoney->flutter_response = $data->message;
                $SendMoney->save();
            }
        }
    }


    public function mobileMoneyVerify(Request $request)
    {
        $response = json_decode($request->resp);
        if ($response->status == 'error') {
            return redirect('/')->with('error', $response->message);
        }
        $trx = @$response->data->txRef;

        $flutterTrx = FlutterTransaction::where('reference', $trx)->orderBy('id', 'desc')->with('send_money')->firstOrFail();
        if ($response->status == 'success') {
            if ($flutterTrx) {
                $flutterTrx->data_id = $response->data->id;
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
        $sendMoney = $flutterTrx->send_money;

        return redirect()->route('admin.money-transfer.details', [$sendMoney]);
    }


    public function mobileMoneyGhanaVerify(Request $request)
    {
        $response = json_decode($request->resp);

        if ($response->status == 'error') {
            return redirect('/')->with('error', $response->message);
        }

        $trx = @$response->data->txRef;
        $flutterTrx = FlutterTransaction::where('reference', $trx)->orderBy('id', 'desc')->with('send_money')->firstOrFail();

        if ($response->status == 'success') {
            if ($flutterTrx) {
                $flutterTrx->data_id = $response->data->id;
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

        $sendMoney = $flutterTrx->send_money;
        return redirect()->route('admin.money-transfer.details', [$sendMoney]);

    }

    public function mobileMoneyZambiaVerify(Request $request)
    {
        $response = json_decode($request->resp);
        if ($response->status == 'error') {
            return redirect('/')->with('error', $response->message);
        }

        $trx = @$response->data->txRef;
        $flutterTrx = FlutterTransaction::where('reference', $trx)->orderBy('id', 'desc')->with('send_money')->firstOrFail();

        if ($response->status == 'success') {
            if ($flutterTrx) {
                $flutterTrx->data_id = $response->data->id;
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

        $sendMoney = $flutterTrx->send_money;
        return redirect()->route('admin.money-transfer.details', [$sendMoney]);
    }
}
