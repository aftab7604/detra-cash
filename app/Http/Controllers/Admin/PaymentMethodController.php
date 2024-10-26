<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\Upload;
use App\Models\Gateway;
use App\Models\withdrainfo;
use Illuminate\Http\Request;


class PaymentMethodController extends Controller
{
    use Upload;
    public function index(Gateway $gateway)
    {
        $data['methods'] = Gateway::automatic()->orderBy('sort_by', 'asc')->get();
        $data['page_title'] = 'Payment Methods';
        return view('admin.payment_methods.index', $data);
    }

    public function sortPaymentMethods(Request $request, Gateway $gateway)
    {
        $data = $request->all();
        foreach ($data['sort'] as $key => $value) {
            Gateway::where('code', $value)->update([
                'sort_by' => $key + 1
            ]);
        }
    }

    public function deactivate(Request $request)
    {
        $data = Gateway::where('code', $request->code)->firstOrFail();

        if ($data->status == 1) {
            $data->status = 0;
        } else {
            $data->status = 1;
        }
        $data->save();
        if ($data->status == 1) {
            log_admin_activity('Deactivate payment method', 'Deactivated payment method ('.$data->name.')');
        } else {
            log_admin_activity('Activate payment method', 'Activated payment method ('.$data->name.')');
        }
        return back()->with('success', 'Updated Successfully.');
    }

    public function edit($id)
    {
        $data['method'] = Gateway::findOrFail($id);
        $data['page_title'] = 'Edit Payment Methods';
        return view('admin.payment_methods.edit', $data);
    }

    public function update(Request $request, $id)
    {
        $rules = [
            'currency' => 'required',
            'currency_symbol' => 'required',
            'withdraw_status' => 'required',
            'minimum_deposit_amount' => 'required|numeric',
            'maximum_deposit_amount' => 'required|numeric',
            'percentage_charge' => 'required|numeric',
            'wpercentage_charge' => 'required|numeric',
            'fixed_charge' => 'required|numeric',
            'wfixed_charge' => 'required|numeric',
            'convention_rate' => 'required|numeric',
        ];


        $getGateway = Gateway::findOrFail($id);
        $parameters = [];
        foreach ($request->except('_token', '_method', 'image') as $k => $v) {
            foreach ($getGateway->parameters as $key => $cus) {
                if ($k != $key) {
                    continue;
                } else {
                    $rules[$key] = 'required|max:191';
                    $parameters[$key] = $v;
                }
            }
        }

        $supported_params = [];
        if ($request->has('supported_currency')) {
            foreach ($request->supported_currency as $k => $v) {
                $supported_params[$v] = $v;
            }
        }

        $collectionSpecification = collect($request->rate);
        $rate_params = [];
        if (json_decode($getGateway->supported_currency)) {
            foreach ($collectionSpecification as $k => $v) {
                foreach (json_decode($getGateway->supported_currency) as $key => $cus) {
                    if ($k != $key) {
                        continue;
                    } else {
                        if ($v == null) {
                            $v = 1.00;
                        }
                        $rate_params[$key] = $v;
                    }
                }
            }
        }

        $this->validate($request, $rules);


        if ($request->hasFile('image')) {
            try {
                $old = $getGateway->image ?: null;
                $image = $this->uploadImage($request->image, config('location.gateway.path'), config('location.gateway.size'), $old);
            } catch (\Exception $exp) {
                return back()->with('error', 'Image could not be uploaded.');
            }
        }


        try {
            $res = $getGateway->update([
                'currency' => $request->currency,
                'symbol' => $request->currency_symbol,
                'convention_rate' => $request->convention_rate,
                'withdraw_status' => $request->withdraw_status,
                'min_amount' => $request->minimum_deposit_amount,
                'max_amount' => $request->maximum_deposit_amount,
                'percentage_charge' => $request->percentage_charge,
                'wpercentage_charge' => $request->wpercentage_charge,
                'supported_currency' => $supported_params,
                'convert_rate' => $rate_params,
                'fixed_charge' => $request->fixed_charge,
                'wfixed_charge' => $request->wfixed_charge,
                'parameters' => $parameters,
                'image' => $image ?? $getGateway->image,
                'status' => $request->status
            ]);

            if (!$res) {
                throw new \Exception('Unexpected error! Please try again.');
            }
            log_admin_activity('Activate payment method', 'Activated payment method ('.$getGateway->name.')');
            return back()->with('success', 'Gateway data has been updated.');

        } catch (\Exception $exception) {
            return back()->with('error', $exception->getMessage());
        }

    }

    public function currency($id)
    {
        $data['getGateway'] = withdrainfo::where('gateway_id',$id)->get();
        $data['method'] = Gateway::findOrFail($id);
        return view('admin.payment_methods.currency', $data);
    }

    public function currencycreate(Request $request)
    {
        if($request->name){
            $get = Gateway::findOrFail($request->id);
            $currencies = json_decode($get->currency_lists, true);
            $currencies[$request->name] = $request->name;
            $get->currency_lists=$currencies;
            $get->save();
        }
        log_admin_activity('New currency', 'Added a new currency ('.$request->name.')');
        return back()->with('success', 'Created Successfully.');
    }

    public function currencydestroy($id,$withdrainfo)
    { 
        $get = Gateway::findOrFail($id);
        $currencies = json_decode($get->currency_lists, true);
        if (isset($currencies[$withdrainfo])) {
            unset($currencies[$withdrainfo]);
        }
        $get->currency_lists = json_encode($currencies);
        $get->save();
        log_admin_activity('Delete currency', 'Deleted currency ('.$get->name.')');
        return back()->with('success', 'Destroy Successfully.');
    }

    public function withdrawinfo($id)
    {
        $data['getGateway'] = withdrainfo::where('gateway_id',$id)->get();
        $data['method'] = Gateway::findOrFail($id);
        return view('admin.payment_methods.withdrawinfo', $data);
    }

    public function withdrawinfocreate(Request $request)
    {   

        $w = new withdrainfo();
        $w->gateway_id=$request->mid;
        $w->name=$request->name;
        $w->type=$request->type;
        $w->save();
        log_admin_activity('New payment withdrowal', 'Added payment withdrowal info ('.$request->name.')');
        return back()->with('success', 'Created Successfully.');
        
    }


    public function withdrawinfodestroy($withdrainfo)
    {   
        $withdrainfo=withdrainfo::find($withdrainfo);
        $withdrainfo->delete();
        log_admin_activity('Delete payment withdrowal', 'Deleted payment withdrowal info');
        return back()->with('success', 'Destroy Successfully.');
    }

}
