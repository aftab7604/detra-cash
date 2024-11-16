<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\Upload;
use App\Models\Color;
use App\Models\Configure;
use Illuminate\Support\Facades\Artisan;
use Image;
use Session;
use Illuminate\Http\Request;
use Stevebauman\Purify\Facades\Purify;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;
class BasicController extends Controller
{
    use Upload;

    public function index()
    {
        $configure = Configure::firstOrNew();
        $timeZone = timezone_identifiers_list();
        $control = $configure;
        $control->time_zone_all = $timeZone;
        return view('admin.basic-controls', compact('control'));
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function updateConfigure(Request $request)
    {
   
        $configure = Configure::firstOrNew();
        $reqData = Purify::clean($request->except('_token', '_method'));
        $request->validate([
            'site_title' => 'required',
            'time_zone' => 'required',
            'currency' => 'required',
            'currency_symbol' => 'required',
            'rate' => 'required|numeric',
            'fraction_number' => 'required|integer',
            'paginate' => 'required|integer',
            'merchant_commission' =>['required','numeric', 'min:0','max:100', 'regex:/^\d+(\.\d{1,2})?$/'],
            'merchant_profit' =>['required','numeric', 'min:0','max:100', 'regex:/^\d+(\.\d{1,2})?$/'],
            'session_expire' => 'required|min:5|integer',
            'client_id' => 'required',
            'client_secret' => 'required',
            'reward_min_txn'=>'required|numeric',
            'referral_reward'=>'required|numeric',
            'refree_reward'=>'required|numeric',
        ]);

        config(['basic.site_title' => $reqData['site_title']]);
        config(['basic.time_zone' => $reqData['time_zone']]);
        config(['basic.currency' => $reqData['currency']]);
        config(['basic.currency_symbol' => $reqData['currency_symbol']]);
        config(['basic.rate' => (float) $reqData['rate']]);
        config(['basic.fraction_number' => (int) $reqData['fraction_number']]);
        config(['basic.paginate' => (int) $reqData['paginate']]);
        config(['basic.sms_notification' => (int) $reqData['sms_notification']]);
        config(['basic.email_notification' => (int) $reqData['email_notification']]);
        config(['basic.sms_verification' => (int) $reqData['sms_verification']]);
        config(['basic.email_verification' => (int) $reqData['email_verification']]);
        config(['basic.google_captcha' => (int) $reqData['google_captcha']]);
        config(['basic.google_captcha_key' => trim($reqData['google_captcha_key']) ]);
        config(['basic.google_captcha_secret_key' => trim($reqData['google_captcha_secret_key']) ]);
        config(['basic.currency_api_key' => trim($reqData['currency_api_key']) ]);
        config(['basic.registration' => (int) $reqData['registration']]);
        config(['basic.strong_password' => (int) $reqData['strong_password']]);
        config(['basic.identity_verification' => (int) $reqData['identity_verification']]);
        config(['basic.address_verification' => (int) $reqData['address_verification']]);
        config(['basic.merchant_commission' => (float) $reqData['merchant_commission']]);
        config(['basic.merchant_profit' => (float) $reqData['merchant_profit']]);
        config(['basic.maintenance' => (int) $reqData['maintenance']]);
        config(['basic.session_expire' => (int) $reqData['session_expire']]);
        config(['basic.client_id' => $reqData['client_id']]);
        config(['basic.client_secret' =>  $reqData['client_secret']]);
        config(['basic.sandbox' => (int) $reqData['sandbox']]);
        config(['basic.livechat' => (int) $reqData['livechat']]);
        config(['basic.twakto' =>  $reqData['twakto']]);
        config(['basic.twofaotp' =>  $reqData['twofaotp']]);
        config(['basic.twofaauth' =>  $reqData['twofaauth']]);

        config(['basic.PUBLIC_KEY' =>  $reqData['PUBLIC_KEY']]);
        config(['basic.SECRET_KEY' =>  $reqData['SECRET_KEY']]);
        config(['basic.ENCRYPTION_KEY' =>  $reqData['ENCRYPTION_KEY']]);

        $fp = fopen(base_path() . '/config/basic.php', 'w');
        fwrite($fp, '<?php return ' . var_export(config('basic'), true) . ';');
        fclose($fp);

        $configure->fill($reqData)->save();


        // turning on/off 2fa Auth
//         $configPath = config_path('fortify.php');
//         $configContent = file_get_contents($configPath);
//         if($reqData['twofaauth']==0)
//         {
//             if (strpos($configContent, "Features::twoFactorAuthentication([") !== false) {
//                 // Remove the entire block for two-factor authentication
//                 $configContent = preg_replace(
//                     '/Features::twoFactorAuthentication\(\[\s*\'confirmPassword\'\s*=>\s*true,\s*\]\),/s', 
//                     '', 
//                     $configContent
//                 );

//                 File::put($configPath, $configContent);

//                 echo "Features::twoFactorAuthentication has been removed, making the features array empty.\n";
//             }
//         }
//         else
//         {
//             $configContent = preg_replace(
//                 '/\'features\'\s*=>\s*\[\s*\]/', 
//                 "'features' => [
//     Features::twoFactorAuthentication([
//         'confirmPassword' => true,
//     ]),
// ]", 
//                 $configContent
//             );

//             File::put($configPath, $configContent);
//         }

        putPermanentEnv('SESSION_LIFETIME',config('basic.session_expire'));
      
        Artisan::call('optimize:clear');
        Artisan::call('view:clear');
        Artisan::call('config:clear');
        Artisan::call('cache:clear');
       
        log_admin_activity('Update basic control', 'Updated basic control');
     
        session()->flash('success', ' Updated Successfully');
        return redirect()->back();
    }


    public function colorSettings()
    {
        $configure = Color::firstOrNew();
        $control = $configure;
        return view('admin.colors', compact('control'));
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function colorSettingsUpdate(Request $request)
    {
        $configure = Color::firstOrNew();
        $reqData = Purify::clean($request->except('_token', '_method'));
        config(['color.background_color' => $reqData['background_color']]);
        config(['color.background_alternative_color' => $reqData['background_alternative_color']]);
        config(['color.secondary_background_color' => $reqData['secondary_background_color']]);
        config(['color.base_color' => $reqData['base_color']]);
        config(['color.secondary_color' => $reqData['secondary_color']]);
        config(['color.secondary_alternative_color' => $reqData['secondary_alternative_color']]);
        config(['color.title_color' => $reqData['title_color']]);
        config(['color.text_color' => $reqData['text_color']]);
        config(['color.natural_color' => $reqData['natural_color']]);
        config(['color.border_color' => $reqData['border_color']]);
        config(['color.error_color' => $reqData['error_color']]);

        $fp = fopen(base_path() . '/config/color.php', 'w');
        fwrite($fp, '<?php return ' . var_export(config('color'), true) . ';');
        fclose($fp);
        $configure->fill($reqData)->save();

        Artisan::call('optimize:clear');
        log_admin_activity('Update color settings', 'Updated color settings');
        session()->flash('success', ' Updated Successfully');
        return redirect()->back();
    }


    public function logoSeo()
    {
        $seo = (object)config('seo');
        return view('admin.logo', compact('seo'));
    }

    public function logoUpdate(Request $request)
    {
        if ($request->hasFile('image')) {
            try {
                $old = 'logo.png';
                $this->uploadImage($request->image, config('location.logo.path'), null, $old, null, $old);
            } catch (\Exception $exp) {
                return back()->with('error', 'Logo could not be uploaded.');
            }
        }
        if ($request->hasFile('admin_image')) {
            try {
                $old = 'admin-logo.png';
                $this->uploadImage($request->admin_image, config('location.logo.path'), null, $old, null, $old);
            } catch (\Exception $exp) {
                return back()->with('error', 'Admin Logo could not be uploaded.');
            }
        }
        if ($request->hasFile('favicon')) {
            try {
                $old = 'favicon.png';
                $this->uploadImage($request->favicon, config('location.logo.path'), null, $old, null, $old);
            } catch (\Exception $exp) {
                return back()->with('error', 'favicon could not be uploaded.');
            }
        }
        log_admin_activity('Update logo', 'Updated logo');
        return back()->with('success', 'Logo has been updated.');
    }


    public function breadcrumb()
    {
        return view('admin.banner');
    }

    public function breadcrumbUpdate(Request $request)
    {
        if ($request->hasFile('banner')) {
            try {
                $old = 'banner.jpg';
                $this->uploadImage($request->banner, config('location.logo.path'), null, $old, null, $old);
            } catch (\Exception $exp) {
                return back()->with('error', 'Banner could not be uploaded.');
            }
        }

        if ($request->hasFile('background_image')) {
            try {
                $old = 'background_image.jpg';
                $this->uploadImage($request->background_image, config('location.logo.path'), null, $old, null, $old);
            } catch (\Exception $exp) {
                return back()->with('error', 'Background Image could not be uploaded.');
            }
        }
        log_admin_activity('Update banner', 'Updated banner');
        return back()->with('success', 'Banner has been updated.');
    }


    public function seoUpdate(Request $request)
    {

        $reqData = Purify::clean($request->except('_token', '_method'));
        $request->validate([
            'meta_keywords' => 'required',
            'meta_description' => 'required',
            'social_title' => 'required',
            'social_description' => 'required'
        ]);


        config(['seo.meta_keywords' => $reqData['meta_keywords']]);
        config(['seo.meta_description' => $request['meta_description']]);
        config(['seo.social_title' => $reqData['social_title']]);
        config(['seo.social_description' => $reqData['social_description']]);


        if ($request->hasFile('meta_image')) {
            try {
                $old = config('seo.meta_image');
                $meta_image = $this->uploadImage($request->meta_image, config('location.logo.path'), null, $old, null, $old);
                config(['seo.meta_image' => $meta_image]);
            } catch (\Exception $exp) {
                return back()->with('error', 'favicon could not be uploaded.');
            }
        }

        $fp = fopen(base_path() . '/config/seo.php', 'w');
        fwrite($fp, '<?php return ' . var_export(config('seo'), true) . ';');
        fclose($fp);
        Artisan::call('config:clear');
        Artisan::call('cache:clear');
        log_admin_activity('Update seo', 'Updated seo');
        return back()->with('success', 'Update Successfully.');

    }
}
