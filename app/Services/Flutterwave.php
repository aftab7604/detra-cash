<?php

namespace App\Services;

use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

use Facades\App\Services\BasicCurl;

class Flutterwave
{
    public $publicKey;
    public $secretKey;
    public $encryptionKey;
    public $headers;

    public function __construct()
    {
        $this->publicKey = config('basic.PUBLIC_KEY');
        $this->secretKey = config('basic.SECRET_KEY');
        $this->encryptionKey = config('basic.ENCRYPTION_KEY');
        $this->headers = [
            'Content-Type: application/json',
            'Authorization: Bearer ' . $this->secretKey
        ];
    }


    /*
     * Get all banks supported only
     *
     * Nigeria (NGN) => NG,
     * Ghana (GHS) => GH,
     * Kenya (KES) => KE,
     * Uganda (UGX) => UG,
     * Tanzania (TZS) => TZ,
     * South Africa (ZAR) => ZA
     * Zambia (ZMW) => ZM
     * Cameroon (XAF)   => CM
     * Ivory Coast (XOF) => CI
     * Sierra Leone (SLL) => SL
     * Burkina Faso No Bank Data
     * Guinea Bissau No Bank Data
     * Mali (CFA)  => ML
     * Senegal (XOF)  => SN
     * Rwanda => RW
     * Tunisia (TN)  No Bank Data
     * Guinea-Bissau peso (GW)  => GWP  No Bank Data
     * Guinea Conakry (GN) => GNF No Bank Data
     */

    public function allBanks($countryCode = 'GW')
    {
        $url = 'https://api.flutterwave.com/v3/banks/'.strtoupper($countryCode);
        return BasicCurl::curlGetRequestWithHeaders($url, $this->headers);
    }

    /*
    *  Account verification
    *  This endpoint takes an account number and a bank code and returns the user's account name.
    */
    public function AccountVerification($postParam = [])
    {
        $url = 'https://api.flutterwave.com/v3/accounts/resolve';
        return BasicCurl::curlPostRequestWithHeaders($url, $this->headers, $postParam);
    }


    /*
     *  Transfers (Payouts)
     *  transfers locally and Internationally.
     */
    public function Payouts($postParam = [])
    {
        $url = 'https://api.flutterwave.com/v3/transfers';
        return BasicCurl::curlPostRequestWithHeaders($url, $this->headers, $postParam);
    }


    /*
     * Failed : Authorization required
     * Accept payments directly from customers bank accounts in Nigeria
     *
     */
    public function cardPayments()
    {
        $redirectUrl = 'https://bugfinder.net/flutterwavePayout/index.php';
        $postParam =  [
                "card_number" => "4242424242424242",
                "cvv" => "812",
                "expiry_month" => "12",
                "expiry_year" => "22",
                "currency" => "NGN",
                "amount" => "100000",
                "email" => "ekene@gmail.com",
                "tx_ref" => "MC-3243enewtest-visa-2",
                "type" => "card",
                "redirect_url" => "$redirectUrl",
        ];
        $client= encrypt3Des(json_encode($postParam), $this->encryptionKey);
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://api.flutterwave.com/v3/charges?type=card');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS,   json_encode(['client'=>$client]));

        $headers = array();
        $headers[] = 'Content-Type: application/json';
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $result = curl_exec($ch);
        if (curl_errno($ch)) {
            echo 'Error:' . curl_error($ch);
        }
        curl_close($ch);

        dd($result);
    }


    /*
     * Accept payments directly from customers bank accounts in Nigeria
     */
    public function accountPayments($postParam = [])
    {
        $url = 'https://api.flutterwave.com/v3/charges?type=debit_ng_account';
        return BasicCurl::curlPostRequestWithHeaders($url, $this->headers, $postParam);
    }

    /*
     * Accept payments directly from customers bank accounts in the UK
     */
    public function UK_AccountPayments($postParam = [])
    {
        $url = 'https://api.flutterwave.com/v3/charges?type=debit_uk_account';
        return  BasicCurl::curlPostRequestWithHeaders($url, $this->headers, $postParam);
    }


    /*
     * Mpesa allows merchants to use two payment methods in Kenya (card and Mpesa).
     */
    public function mpesa($postParam = [])
    {
        $url = 'https://api.flutterwave.com/v3/charges?type=mpesa';
        return BasicCurl::curlPostRequestWithHeaders($url, $this->headers, $postParam);
    }

    protected function checkSupportedUSSD( $code)
    {
        $banks = [
            "044",
            "050",
            "070",
            "011",
            "058",
            "030",
            "082",
            "032",
            "033",
            "035",
            "057",
            "215",
            "232",
            "221",
            "214",
            "090110",
        ];

        if (!in_array($code, $banks)){
            throw new \Exception('This bank not available for USSD payments',200);
        }
        return true;

    }

    /*
     * Accept offline payments from customers using USSD
     */
    public function PaymentUSSD($postParam = [])
    {
        $this->checkSupportedUSSD($postParam['account_bank']);
        $url = 'https://api.flutterwave.com/v3/charges?type=ussd';
        return BasicCurl::curlPostRequestWithHeaders($url, $this->headers, $postParam);
    }


    /*
     * Accept payments from customers in Rwanda using their mobile money wallets
     * Transaction Not Yet Verified
     */
    public function rwandaMobileMoney($postParam = [])
    {
        $url = 'https://api.flutterwave.com/v3/charges?type=mobile_money_rwanda';
        return BasicCurl::curlPostRequestWithHeaders($url, $this->headers, $postParam);
    }



    /*
     * Accept payments from Ugandan mobile money wallets
     */
    public function UgandaMobileMoney($postParam = [])
    {
        $url = 'https://api.flutterwave.com/v3/charges?type=mobile_money_uganda';
        return BasicCurl::curlPostRequestWithHeaders($url, $this->headers, $postParam);
    }


    /*
     * Collect payments using Zambia mobile money service
     */
    public function ZambiaMobileMoney($postParam = [])
    {
        $url = 'https://api.flutterwave.com/v3/charges?type=mobile_money_zambia';
        return BasicCurl::curlPostRequestWithHeaders($url, $this->headers, $postParam);
    }


    /*
     * Collect payments using Zambia mobile money service
     */
    public function GhanaMobileMoney($postParam = [])
    {
        $url = 'https://api.flutterwave.com/v3/charges?type=mobile_money_ghana';
        return BasicCurl::curlPostRequestWithHeaders($url, $this->headers, $postParam);
    }

    /*
     *  Verify the transaction reference.
     *  Verify the status of the transaction to be successful.
     *  Verify the currency to be the expected currency
     * Most importantly validate the amount paid to be equal to or at least greater than the amount of the value to be given.
     */
    public function verifyTransaction($id)
    {
        $url = "https://api.flutterwave.com/v3/transactions/$id/verify";
        return BasicCurl::curlGetRequestWithHeaders($url, $this->headers);
    }


}
