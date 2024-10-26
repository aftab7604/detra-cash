<?php

namespace App\Services;

use App\Http\Traits\Notify;
use App\Models\TopUpLog;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class ReloadlyService
{
    use Notify;

    protected $access_token = null;

    public function __construct()
    {
        $this->access_token = @file_get_contents('access_token.txt');
    }

    public function accessToken()
    {
        $postField = [];
//        $postField["client_id"] = "W0KIHaAPOEsjgbv27xIPCllqQQnj0Aoz";
//        $postField["client_secret"] = "lL0QLbrrqN-ThoQiVdoW12bskT8QnG-o1HQO8LoJEETItwSXFvpeWeUruEbHWOY";

        $postField["client_id"] = config('basic.client_id');
        $postField["client_secret"] = config('basic.client_secret');

        $postField["grant_type"] = "client_credentials";
        $postField["audience"] = "https://topups.reloadly.com";
        $POSTFIELDS = json_encode($postField);

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://auth.reloadly.com/oauth/token',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => $POSTFIELDS,
            CURLOPT_HTTPHEADER => array(
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);
        curl_close($curl);
        $response = json_decode($response);
        @file_put_contents('access_token.txt', $response->access_token);
		
		return $response;
    }

    public function accountBalance()
    {
        $access_token = $this->access_token;
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://topups.reloadly.com/accounts/balance',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Accept: application/com.reloadly.topups-v1+json',
                'Authorization: Bearer ' . $access_token,
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);
        curl_close($curl);

        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }

    /*
     * Get all countries
     */
    public function countries()
    {


        $access_token = $this->access_token;
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://topups.reloadly.com/countries?page=1&size=1',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Accept: application/com.reloadly.topups-v1+json',
                'Authorization: Bearer ' . $access_token
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);

        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }

    public function countriesCountrycode(string $code = 'PK')
    {
        $access_token = $this->access_token;
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://topups.reloadly.com/countries/' . $code,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Accept: application/com.reloadly.topups-v1+json',
                'Authorization: Bearer ' . $access_token
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);

        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }

    public function operators()
    {
        $access_token = $this->access_token;
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://topups.reloadly.com/operators?page=1&size=2&includeBundles=true&includeData=true&includePin=true&simplified=false&suggestedAmounts=true&suggestedAmountsMap=true',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $access_token,
                'Accept: application/com.reloadly.topups-v1+json',
            ),
        ));
        $response = curl_exec($curl);

        curl_close($curl);

        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }

    public function operatorId($operatorid = '729')
    {
        $access_token = $this->access_token;

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://topups.reloadly.com/operators/' . $operatorid . '?suggestedAmounts=true&suggestedAmountsMap=true',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $access_token,
                'Accept: application/com.reloadly.topups-v1+json'
            ),
        ));
        $response = curl_exec($curl);
        curl_close($curl);

        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }

    public function operatorCountryCode(string $code = 'BD')
    {
        $access_token = $this->access_token;
        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://topups.reloadly.com/operators/countries/' . $code . '?includeBundles=false&includeData=false&includePin=true&suggestedAmounts=true&suggestedAmountsMap=true',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $access_token,
                'Accept: application/com.reloadly.topups-v1+json',
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);

        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }

    /*
     * Auto-detect an operator
     */
    public function autoDetectOperatorId($phone = '8801825683631', $countryisocode = 'BD')
    {
        $access_token = $this->access_token;

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://topups.reloadly.com/operators/auto-detect/phone/' . $phone . '/countries/' . $countryisocode . '?suggestedAmountsMap=true&SuggestedAmounts=true',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $access_token,
                'Accept: application/com.reloadly.topups-v1+json'
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);

        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }

    /*
     * Get all commissions
     */
    public function commissions()
    {
        $access_token = $this->access_token;

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://topups.reloadly.com/operators/commissions?page=1&size=3',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $access_token,
                'Accept: application/com.reloadly.topups-v1+json',
            ),
        ));
        $response = curl_exec($curl);
        curl_close($curl);

        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }

    /*
     * commissions by operator ID
     */
    public function operatorIdCommissions($id = 25)
    {
        $access_token = $this->access_token;


        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://topups.reloadly.com/operators/' . $id . '/commissions',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $access_token,
                'Accept: application/com.reloadly.topups-v1+json'
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);


        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }


    /*
     * Make a top-up
     *
     * With the /topups endpoint, developers can make an airtime recharge to any mobile number within the operators covered by Reloadly
     */
    public function topups()
    {
        $access_token = $this->access_token;

        if(config('basic.sandbox') == 1){
            $url = 'https://topups-sandbox.reloadly.com/topups';
        }else{
            $url = 'https://topups.reloadly.com/topups';
        }

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => '{
                "operatorId":"25",
                "amount":"125",
                "useLocalAmount": false,
                "customIdentifier": "1223344455555",
                "recipientPhone": {
                    "countryCode": "BD",
                    "number": "8801825683631"
                },
                "senderPhone": {
                    "countryCode": "CA",
                    "number": "1231231231"
                }
            }',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $access_token,
                'Accept: application/com.reloadly.topups-v1+json',
                'Content-Type: application/json'
            ),
        ));
        $response = curl_exec($curl);
        curl_close($curl);


        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }

    /*
     * For every asynchronous top-up that is made, a transaction ID is the only parameter returned as a response. This transaction ID can be used to confirm if the top-up request is successful, still processing, or failed
     */
    public function topupsAsync(object $sendmoney)
    {
        if($sendmoney->service_id == '1' && $sendmoney->payment_status == '1' &&  $sendmoney->status == 2){
            $customIdentifier = $sendmoney->invoice . code(4);
            $FIELDS = [];
            $FIELDS['operatorId'] = optional($sendmoney->provider)->operatorId;
            $FIELDS['amount'] = round($sendmoney->totalBaseAmountPay, 2);
            $FIELDS['useLocalAmount'] = false;
            $FIELDS['customIdentifier'] = $customIdentifier;
            $FIELDS['recipientPhone'] = [
                'countryCode' => optional($sendmoney->getCurrency)->iso_code,
                'number' => $sendmoney->recipient_contact_no
            ];
            $FIELDS['senderPhone'] = [
                'countryCode' => optional($sendmoney->sendCurrency)->iso_code,
                'number' => $sendmoney->sender_phone
            ];
            $access_token = $this->access_token;

            if(config('basic.sandbox') == 1){
                $url = 'https://topups-sandbox.reloadly.com/topups-async';
            }else{
                $url = 'https://topups.reloadly.com/topups-async';
            }

            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => $url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS => json_encode($FIELDS),
                CURLOPT_HTTPHEADER => array(
                    'Authorization: Bearer ' . $access_token,
                    'Accept: application/com.reloadly.topups-v1+json',
                    'Content-Type: application/json'
                ),
            ));

            $response = curl_exec($curl);
            curl_close($curl);

            $response = json_decode($response);
            if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
                $this->accessToken();
            }


            if (isset($response->transactionId)) {
                $sendmoney->status = 1;
                $sendmoney->received_at = Carbon::now();
                $sendmoney->transactionId = @$response->transactionId;
                $sendmoney->save();
                $user = $sendmoney->user;
            }

            $topUpLog = new TopUpLog();
            $topUpLog->send_money_id = $sendmoney->id;
            $topUpLog->customIdentifier = $customIdentifier;
            $topUpLog->topup_response = $response;
            if (isset($response->transactionId)) {
                $topUpLog->status = 1;
            }else{
                $topUpLog->status = 0;
            }
            $topUpLog->save();

//            return $response;
        }

    }

    /*
     * Get the status of a top-up
     *
     * With the /{{transactionId}}/status endpoint, the status of a top-up can be determined in real-time
     */
    public function transactionIdStatus($transactionId = 4035716)
    {
        $access_token = $this->access_token;

        if(config('basic.sandbox') == 1){
            $url = 'https://topups-sandbox.reloadly.com/topups/' . $transactionId . '/status';
        }else{
            $url = 'https://topups.reloadly.com/topups/' . $transactionId . '/status';
        }


        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => $url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $access_token,
                'Accept: application/com.reloadly.topups-v1+json'
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);

        $response = json_decode($response);
        if (isset($response->errorCode) && $response->errorCode == 'INVALID_TOKEN') {
            $this->accessToken();
        }
        return $response;
//        echo $response;
    }

}
