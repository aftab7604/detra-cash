<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Mail\SendMail;
use App\Models\Subscriber;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Stevebauman\Purify\Facades\Purify;

class SubscriberController extends Controller
{
    public function index()
    {
        $page_title = 'Subscriber Manager';
        $subscribers = Subscriber::latest()->paginate(config('basic.paginate'));
        return view('admin.subscriber.index', compact('page_title', 'subscribers'));
    }


    public function remove(Request $request)
    {
        $rules = [
            'subscriber' => "required|integer"
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $subscriber = Subscriber::findOrFail($request->subscriber);
        $subscriber->delete();
        log_admin_activity('Remove subscriber', 'Remove a subscriber ('.$subscriber->subscriber.')');
        return back()->with('success', 'Subscriber has been removed');
    }


    public function sendEmailForm()
    {
        $page_title = 'Send Email to Subscribers';
        return view('admin.subscriber.send_email', compact('page_title'));
    }

    public function sendEmail(Request $request)
    {


        $purifiedData = Purify::clean($request->except('_token'));
        $rules = [
            'subject' => 'required',
            'message' => 'required',
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $basic = (object)config('basic');
        $email_from = $basic->sender_email;

        $requestMessage = $purifiedData['message'];
        $subject = $purifiedData['subject'];
        $email_body = json_decode($basic->email_description);

        if (!Subscriber::first()) return back()->withInput()->with('error', 'No subscribers to send email.');

        $subscribers = Subscriber::all();
        foreach ($subscribers as $subscriber) {
            $name = explode('@', $subscriber->email)[0];
            $message = str_replace("[[name]]", $name, $email_body);
            $message = str_replace("[[message]]", $requestMessage, $message);
            Mail::to($subscriber->email)->send(new SendMail($email_from, $subject, $message));
        }
        log_admin_activity('Send email', 'Sent a email to all subscribers');
        return back()->with('success', 'Email has been sent to subscribers.');
    }
}
