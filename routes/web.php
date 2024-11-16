<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\Admin\OurFeaturesController;
use Illuminate\Support\Facades\Hash;

Route::get('/loadMore', 'FrontendController@loadMore')->name('loadMore');
Route::get('/test', 'TestController@test')->name('test');
Route::get('/getData', 'TestController@getData')->name('getData');
Route::get('/mobile_money_ghana-verify', 'TestController@mobileMoneyGhanaVerify')->name('mobile_money_ghana.verify');
Route::get('/mobile_money_zambia-verify', 'TestController@mobileMoneyZambiaVerify')->name('mobile_money_zambia.verify');

Route::get('/payoutTransIpn', 'TestController@payoutTransIpn')->name('payoutTransIpn');
Route::get('/mobileMoneyVerify', 'TestController@mobileMoneyVerify')->name('mobileMoneyVerify');

Route::get('/cron', 'FrontendController@cron')->name('cron');

Route::get('/clear', function () {
    // $pas = Hash::make("123456");
    // dd($pas); 
    $output = new \Symfony\Component\Console\Output\BufferedOutput();
    Artisan::call('optimize:clear', array(), $output);
    return redirect()->back()->with('success', 'Cache Clear Successfully ');
})->name('clear');

Route::get('queue-work', function () {
    return Illuminate\Support\Facades\Artisan::call('queue:work', ['--stop-when-empty' => true]);
});
Route::get('schedule-run', function () {
    return Illuminate\Support\Facades\Artisan::call('schedule:run');
});

Route::group(['prefix' => 'admin', 'as' => 'admin.'], function () {
    Route::get('/', 'Admin\LoginController@showLoginForm')->name('login');
    Route::post('/', 'Admin\LoginController@login')->name('login');
    Route::post('/logout', 'Admin\LoginController@logout')->name('logout');
    Route::get('/admincheck', 'Admin\VerificationController@check')->name('admincheck');

    Route::get('/check', 'Admin\VerificationController@check')->name('check');
    Route::get('/2fa/resend_code', 'Admin\VerificationController@resendCode2Fa')->name('resendCode2Fa');
    Route::post('/twoFAverifyOTP', 'Admin\VerificationController@twoFAverifyOTP')->name('twoFAverifyOTP');

    //Route::post('twoFA-Verify', 'User\VerificationController@twoFAverify')->name('twoFA-Verify');

    Route::get('/password/reset', 'Admin\Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
    Route::post('/password/email', 'Admin\Auth\ForgotPasswordController@sendResetLinkEmail')->name('password.email');
    Route::get('/password/reset/{token}', 'Admin\Auth\ResetPasswordController@showResetForm')->name('password.reset');
    Route::post('/password/reset', 'Admin\Auth\ResetPasswordController@reset')->name('password.update');


    Route::get('/403', 'Admin\DashboardController@forbidden')->name('403');

    Route::group(['middleware' => ['auth:admin',  'ipcheck']], function () {
        Route::get('/profile', 'Admin\DashboardController@profile')->name('profile');
        Route::put('/profile', 'Admin\DashboardController@profileUpdate')->name('profileUpdate');
        Route::get('/password', 'Admin\DashboardController@password')->name('password');
        Route::put('/password', 'Admin\DashboardController@passwordUpdate')->name('passwordUpdate');
        
        Route::group(['middleware'=>['permission']],function(){ 
            Route::get('push-chat-show/{id}', 'ChatNotificationController@showByAdmin')->name('push.chat.show');
            Route::post('push-chat-newMessage', 'ChatNotificationController@newMessageByAdmin')->name('push.chat.newMessage');

            Route::get('push-notification-show', 'SiteNotificationController@showByAdmin')->name('push.notification.show');
            Route::get('push.notification.readAll', 'SiteNotificationController@readAllByAdmin')->name('push.notification.readAll');
            Route::get('push-notification-readAt/{id}', 'SiteNotificationController@readAt')->name('push.notification.readAt');
            Route::match(['get', 'post'], 'pusher-config', 'SiteNotificationController@pusherConfig')->name('pusher.config');


           


            Route::get('/dashboard', 'Admin\DashboardController@dashboard')->name('dashboard');

            // Our Features
            // Route::get('/tick', 'Admin\OurFeaturesController@index')->name('tick');
            Route::resource('ourFuture', OurFeaturesController::class);

            Route::get('/staff', 'Admin\ManageRolePermissionController@staff')->name('staff');
            Route::post('/staff', 'Admin\ManageRolePermissionController@storeStaff')->name('storeStaff');
            Route::put('/staff/{id}', 'Admin\ManageRolePermissionController@updateStaff')->name('updateStaff');
            Route::post('/role', 'Admin\ManageRolePermissionController@storeRole')->name('storeRole');
            Route::put('/role/{id}', 'Admin\ManageRolePermissionController@updateRole')->name('updateRole');
            Route::get('/activitylog', 'Admin\ManageRolePermissionController@ActivityLog')->name('activityLog');
            Route::get('/loggedIn', 'Admin\ManageRolePermissionController@loggedIn')->name('loggedIn');

            Route::get('/identy-form', 'Admin\IdentyVerifyFromController@index')->name('identify-form');
            Route::post('/identy-form', 'Admin\IdentyVerifyFromController@store')->name('identify-form.store');

            // Services
            Route::get('/service', 'Admin\UtilitesController@service')->name('service');
            Route::get('service/data', 'Admin\UtilitesController@getService')->name('list.service');
            Route::get('service/add', 'Admin\UtilitesController@getService')->name('service.add');
            Route::put('service/add', 'Admin\UtilitesController@storeService')->name('service.store');
            Route::get('service/{id}/edit', 'Admin\UtilitesController@editService')->name('service.edit');
            Route::put('service/{id}/update', 'Admin\UtilitesController@updateService')->name('service.update');
            Route::delete('service/{id}/delete', 'Admin\UtilitesController@destroyService')->name('service.delete');

            // Services info
            Route::resource('/serviceinfo', 'Admin\ServiceinfoController');

            // continent
            Route::get('/continent', 'Admin\UtilitesController@continent')->name('continent');
            Route::get('continent/data', 'Admin\UtilitesController@getContinent')->name('list.continent');
            Route::post('continent/store', 'Admin\UtilitesController@storeContinent')->name('store.continent');
            Route::post('continent/update', 'Admin\UtilitesController@updateContinent')->name('update.continent');
            Route::post('continent/delete', 'Admin\UtilitesController@destroyContinent')->name('delete.continent');

            // country
            Route::get('/country', 'Admin\CountryController@index')->name('country');
            Route::get('/country/add', 'Admin\CountryController@add')->name('country.create');
            Route::post('/country/add', 'Admin\CountryController@store')->name('country.store');
            Route::get('/country/{country}/edit', 'Admin\CountryController@edit')->name('country.edit');
            Route::patch('/country/{country}', 'Admin\CountryController@update')->name('country.update');
            Route::post('/country/active', 'Admin\CountryController@activeMultiple')->name('country.multiple-active');
            Route::post('/country/inactive', 'Admin\CountryController@inActiveMultiple')->name('country.multiple-inactive');
            Route::get('/country/{country}/service', 'Admin\CountryController@countryService')->name('country.service');
            Route::post('/country/{country}/service', 'Admin\CountryController@serviceStore')->name('country.service.store');
            Route::patch('/country/{country}/service', 'Admin\CountryController@serviceUpdate')->name('country.service.update');
            Route::get('/country/{country}/service/{service}/charge', 'Admin\CountryController@serviceCharge')->name('country.service.charge');
            Route::post('/country/serviceCharge', 'Admin\CountryController@serviceChargeStore')->name('country.service.charge.store');
            Route::get('/country/{country}/limit', 'Admin\CountryController@limit')->name('country.limit');
            Route::post('/country/{country}/limit', 'Admin\CountryController@updateLimit')->name('country.limit.update');


            Route::post('/country/{country}/operatorImport', 'Admin\CountryController@operatorImport')->name('country.service.operatorImport');

            Route::get('/country/serviceImport/{country}/{shortCode}', 'Admin\CountryController@serviceImport')->name('country.serviceImport');


            // Sending Purpose
            Route::get('/purpose', 'Admin\UtilitesController@purpose')->name('purpose');
            Route::get('purpose/data', 'Admin\UtilitesController@getPurpose')->name('list.purpose');
            Route::get('purpose/add', 'Admin\UtilitesController@addPurpose')->name('purpose.add');
            Route::put('purpose/add', 'Admin\UtilitesController@storePurpose')->name('purpose.add');
            // Route::post('purpose', 'Admin\UtilitesController@storePurpose')->name('purpose.store');
            Route::get('purpose/{id}/edit', 'Admin\UtilitesController@editPurpose')->name('purpose.edit');
            Route::put('purpose/{id}/update', 'Admin\UtilitesController@updatepurpose')->name('purpose.update');
            Route::delete('purpose/{id}/delete', 'Admin\UtilitesController@destroyPurpose')->name('purpose.delete');

            // Source Of Fund
            Route::get('/sourceOfFund', 'Admin\UtilitesController@sourceOfFund')->name('sourceOfFund');
            Route::get('sourceOfFund/data', 'Admin\UtilitesController@getSF')->name('list.sourceOfFund');
            Route::get('sourceOfFund/add', 'Admin\UtilitesController@addSF')->name('sourceOfFund.add');
            Route::put('sourceOfFund/add', 'Admin\UtilitesController@storeSF')->name('sourceOfFund.store');
            Route::get('sourceOfFund/{id}/edit', 'Admin\UtilitesController@editSF')->name('sourceOfFund.edit');
            Route::put('sourceOfFund/{id}/update', 'Admin\UtilitesController@updateSF')->name('sourceOfFund.update');
            Route::delete('sourceOfFund/{id}/delete', 'Admin\UtilitesController@destroySF')->name('sourceOfFund.delete');


            // Services
            Route::get('/coupon', 'Admin\CouponController@coupon')->name('coupon');
            Route::get('/coupon/used', 'Admin\CouponController@couponUsed')->name('coupon.used');
            Route::post('/coupon', 'Admin\CouponController@store')->name('coupon.store');


            Route::get('/money-transfer', 'Admin\TransferLogController@index')->name('money-transfer');
            Route::get('/money-transfer/recharge/pending', 'Admin\TransferLogController@rechargePending')->name('money-transfer.recharge.pending');

            Route::get('/money-transfer/complete', 'Admin\TransferLogController@complete')->name('money-transfer.complete');
            Route::get('/money-transfer/pending', 'Admin\TransferLogController@pending')->name('money-transfer.pending');
            Route::get('/money-transfer/cancelled', 'Admin\TransferLogController@cancelled')->name('money-transfer.cancelled');
            Route::get('/money-transfer/search', 'Admin\TransferLogController@search')->name('money-transfer.search');
            Route::get('/money-transfer/{sendMoney:id}/details', 'Admin\TransferLogController@details')->name('money-transfer.details');
            Route::post('/money-transfer/{sendMoney:id}', 'Admin\TransferLogController@updatestatus')->name('money-transfer.updatestatus');
            Route::get('/money-transfer/{file?}/download', 'Admin\TransferLogController@download')->name('money-transfer.download');
            Route::put('/money-transfer/{sendMoney?}/action', 'Admin\TransferLogController@action')->name('money-transfer.action');

            // withdraw
            Route::get('/withdraw-history', 'Admin\TransferLogController@withdraw')->name('withdraw-history');
            Route::get('/withdraw-view/{id}', 'Admin\TransferLogController@view')->name('payout-view');
            Route::post('/withdraw-confirm/{id}', 'Admin\PayoutRecordController@payoutConfirm')->name('withdraw-confirm');
            Route::post('/withdraw-cancel/{id}', 'Admin\PayoutRecordController@payoutCancel')->name('withdraw-cancel');
            Route::post('withdraw/{id}/update', 'Admin\TransferLogController@withdrawupdate')->name('withdraw.update');


            // Payout
            Route::get('/payout-History', 'Admin\TransferLogController@payout')->name('payout.History');
            Route::put('/payout-action/{id}', 'Admin\PayoutRecordController@action')->name('payout-action');
            Route::get('/payout-log', 'Admin\PayoutRecordController@index')->name('payout-log');
            Route::get('/payout-log/search', 'Admin\PayoutRecordController@search')->name('payout-log.search');
            /*
            * Reloadly
            */
            Route::put('/money-transfer/{sendMoney?}/rechargeRequest', 'Admin\TransferLogController@rechargeRequest')->name('money-transfer.rechargeRequest');
            /*
            * Fluttwerwave
            */

            Route::put('/money-transfer/{sendMoney?}/flutterAction', 'Admin\TransferLogController@flutterAction')->name('money-transfer.flutterAction');
            Route::get('/money-transfer/{id}/flutterVerifyTrx', 'Admin\TransferLogController@flutterVerifyTrx')->name('money-transfer.flutterVerifyTrx');
            Route::put('/money-transfer/{id}/flutterVerifyAcc', 'Admin\TransferLogController@flutterVerifyAcc')->name('money-transfer.flutterVerifyAcc');


            /*=====Payment Log=====*/
            Route::get('payment-method/{id}', 'Admin\PaymentMethodController@withdrawinfo')->name('payment.methods.withdrawinfo');
            Route::post('payment-withdrawinfocreate', 'Admin\PaymentMethodController@withdrawinfocreate')->name('payment.methods.withdrawinfocreate');
            Route::delete('payment-withdrawinfodestroy/{id}', 'Admin\PaymentMethodController@withdrawinfodestroy')->name('payment.methods.withdrawinfodestroy');
            Route::get('payment-methods', 'Admin\PaymentMethodController@index')->name('payment.methods');
            Route::any('payment-methods/deactivate', 'Admin\PaymentMethodController@deactivate')->name('payment.methods.deactivate');
            Route::post('sort-payment-methods', 'Admin\PaymentMethodController@sortPaymentMethods')->name('sort.payment.methods');
            Route::get('payment-methods/edit/{id}', 'Admin\PaymentMethodController@edit')->name('edit.payment.methods');
            Route::put('payment-methods/update/{id}', 'Admin\PaymentMethodController@update')->name('update.payment.methods');

            Route::get('payment-method/currency/{id}', 'Admin\PaymentMethodController@currency')->name('payment.methods.currency');
            Route::post('payment-currencycreate', 'Admin\PaymentMethodController@currencycreate')->name('payment.methods.currencycreate');
            Route::delete('payment-currencydestroy/{id}/{cur}', 'Admin\PaymentMethodController@currencydestroy')->name('payment.methods.currencydestroy');



            // Manual Methods
            Route::get('payment-methods/manual', 'Admin\ManualGatewayController@index')->name('deposit.manual.index');
            Route::get('payment-methods/manual/new', 'Admin\ManualGatewayController@create')->name('deposit.manual.create');
            Route::post('payment-methods/manual/new', 'Admin\ManualGatewayController@store')->name('deposit.manual.store');
            Route::get('payment-methods/manual/edit/{id}', 'Admin\ManualGatewayController@edit')->name('deposit.manual.edit');
            Route::put('payment-methods/manual/update/{id}', 'Admin\ManualGatewayController@update')->name('deposit.manual.update');


            Route::get('payment/pending', 'Admin\PaymentLogController@pending')->name('payment.pending');
            Route::get('payment/log', 'Admin\PaymentLogController@index')->name('payment.log');
            Route::get('payment/reportlog', 'Admin\PaymentLogController@reportindex')->name('payment.reportlog');
            Route::get('payment/search', 'Admin\PaymentLogController@search')->name('payment.search');
            Route::get('payment/searchreport', 'Admin\PaymentLogController@searchreport')->name('payment.searchreport');
            Route::get('payment/genratepdfreport', 'Admin\PaymentLogController@genratepdfreport')->name('payment.genratepdfreport');
            Route::get('payment/genrateexcelreport', 'Admin\PaymentLogController@genrateexcelreport')->name('payment.genrateexcelreport');
            Route::put('payment/action/{id}', 'Admin\PaymentLogController@action')->name('payment.action');


            /*====Manage Users ====*/
            Route::get('/users', 'Admin\UsersController@index')->name('users');
            Route::get('/users/search', 'Admin\UsersController@search')->name('users.search');

            Route::get('/merchants/create', 'Admin\UsersController@merchantCreate')->name('merchants.create');
            Route::post('/merchants/create', 'Admin\UsersController@merchantStore')->name('merchants.store');
            Route::get('/merchants', 'Admin\UsersController@merchant')->name('merchants');
            Route::get('/merchants/search', 'Admin\UsersController@merchantSearch')->name('merchants.search');


            Route::post('/users-active', 'Admin\UsersController@activeMultiple')->name('user-multiple-active');
            Route::post('/users-inactive', 'Admin\UsersController@inactiveMultiple')->name('user-multiple-inactive');
            Route::get('/user/edit/{id}', 'Admin\UsersController@userEdit')->name('user-edit');
            Route::post('/user/update/{id}', 'Admin\UsersController@userUpdate')->name('user-update');
            Route::post('/user/password/{id}', 'Admin\UsersController@passwordUpdate')->name('userPasswordUpdate');
            Route::post('/user/balance-update/{id}', 'Admin\UsersController@userBalanceUpdate')->name('user-balance-update');

            Route::get('/user/send-email/{id}', 'Admin\UsersController@sendEmail')->name('send-email');
            Route::post('/user/send-email/{id}', 'Admin\UsersController@sendMailUser')->name('user.email-send');
            Route::get('/user/transaction/{id}', 'Admin\UsersController@transaction')->name('user.transaction');
            Route::get('/user/payment/{id}', 'Admin\UsersController@funds')->name('user.fundLog');
            Route::get('/user/transfer/{id}', 'Admin\UsersController@transfer')->name('user.transfer');
            Route::get('/user/loggedIn/{id}', 'Admin\UsersController@singleLoggedIn')->name('user.loggedIn');
            Route::get('/email-send', 'Admin\UsersController@emailToUsers')->name('email-send');
            Route::post('/email-send', 'Admin\UsersController@sendEmailToUsers')->name('email-send.store');
            Route::get('/users/loggedIn', 'Admin\UsersController@loggedIn')->name('users.loggedIn');
            Route::get('/users/activitylog', 'Admin\UsersController@ActivityLog')->name('users.activityLog');
            Route::post('/user/loginAccount/{id}', 'Admin\UsersController@loginAccount')->name('user-loginAccount');

            Route::get('users/kyc/pending', 'Admin\UsersController@kycPendingList')->name('users.kyc.pending');
            Route::get('users/kyc', 'Admin\UsersController@kycList')->name('users.kyc');
            Route::put('users/kycAction/{id}', 'Admin\UsersController@kycAction')->name('users.Kyc.action');
            Route::get('user/{user}/kyc', 'Admin\UsersController@userKycHistory')->name('user.userKycHistory');


            /* ====== Transaction Log =====*/
            Route::get('/transaction', 'Admin\LogController@transaction')->name('transaction');
            Route::get('/transaction-search', 'Admin\LogController@transactionSearch')->name('transaction.search');


            /* ===== Support Ticket ====*/
            Route::get('tickets/{status?}', 'Admin\TicketController@tickets')->name('ticket');
            Route::get('tickets/open', 'Admin\TicketController@tickets')->name('ticket.open');
            Route::get('tickets/closed', 'Admin\TicketController@tickets')->name('ticket.closed');
            Route::get('tickets/answered', 'Admin\TicketController@tickets')->name('ticket.answered');
            Route::get('tickets/view/{id}', 'Admin\TicketController@ticketReply')->name('ticket.view');
            Route::put('ticket/reply/{id}', 'Admin\TicketController@ticketReplySend')->name('ticket.reply');
            Route::get('ticket/download/{ticket}', 'Admin\TicketController@ticketDownload')->name('ticket.download');
            Route::post('ticket/delete', 'Admin\TicketController@ticketDelete')->name('ticket.delete');

            /* ===== Subscriber =====*/
            Route::get('subscriber', 'Admin\SubscriberController@index')->name('subscriber.index');
            Route::post('subscriber/remove', 'Admin\SubscriberController@remove')->name('subscriber.remove');
            Route::get('subscriber/send-email', 'Admin\SubscriberController@sendEmailForm')->name('subscriber.sendEmail');
            Route::post('subscriber/send-email', 'Admin\SubscriberController@sendEmail')->name('subscriber.mail');


            /* ======== CONTROLS ========== */
            Route::get('/basic-controls', 'Admin\BasicController@index')->name('basic-controls');
            Route::post('/basic-controls', 'Admin\BasicController@updateConfigure')->name('basic-controls.update');
            Route::get('/color-settings', 'Admin\BasicController@colorSettings')->name('color-settings');
            Route::post('/color-settings', 'Admin\BasicController@colorSettingsUpdate')->name('color-settings.update');

            /* ======== CONTROLS ========== */
            Route::get('referral-rewardSetting','ManageReferralRewardController@rewardSetting')->name('referral.rewardSetting');


            Route::get('/email-controls', 'Admin\EmailTemplateController@emailControl')->name('email-controls');
            Route::post('/email-controls', 'Admin\EmailTemplateController@emailConfigure')->name('email-controls.update');
            Route::get('/email-template', 'Admin\EmailTemplateController@show')->name('email-template.show');
            Route::get('/email-template/edit/{id}', 'Admin\EmailTemplateController@edit')->name('email-template.edit');
            Route::post('/email-template/update/{id}', 'Admin\EmailTemplateController@update')->name('email-template.update');


            /*========Sms control ========*/
            Route::match(['get', 'post'], '/sms-controls', 'Admin\SmsTemplateController@smsConfig')->name('sms.config');
            Route::get('/sms-template', 'Admin\SmsTemplateController@show')->name('sms-template');
            Route::get('/sms-template/edit/{id}', 'Admin\SmsTemplateController@edit')->name('sms-template.edit');
            Route::post('/sms-template/update/{id}', 'Admin\SmsTemplateController@update')->name('sms-template.update');


            Route::get('/notify-config', 'Admin\NotifyController@notifyConfig')->name('notify-config');
            Route::post('/notify-config', 'Admin\NotifyController@notifyConfigUpdate')->name('notify-config.update');
            Route::get('/notify-template', 'Admin\NotifyController@show')->name('notify-template.show');
            Route::get('/notify-template/edit/{id}', 'Admin\NotifyController@edit')->name('notify-template.edit');
            Route::post('/notify-template/update/{id}', 'Admin\NotifyController@update')->name('notify-template.update');


            /* ===== ADMIN Language SETTINGS ===== */
            Route::get('language', 'Admin\LanguageController@index')->name('language.index');
            Route::get('language/create', 'Admin\LanguageController@create')->name('language.create');
            Route::post('language/create', 'Admin\LanguageController@store')->name('language.store');
            Route::get('language/{language}', 'Admin\LanguageController@edit')->name('language.edit');
            Route::put('language/{language}', 'Admin\LanguageController@update')->name('language.update');
            Route::delete('language/{language}', 'Admin\LanguageController@delete')->name('language.delete');
            Route::get('/language/keyword/{id}', 'Admin\LanguageController@keywordEdit')->name('language.keywordEdit');
            Route::put('/language/keyword/{id}', 'Admin\LanguageController@keywordUpdate')->name('language.keywordUpdate');
            Route::post('/language/importJson', 'Admin\LanguageController@importJson')->name('language.importJson');
            Route::post('store-key/{id}', 'Admin\LanguageController@storeKey')->name('language.storeKey');
            Route::put('update-key/{id}', 'Admin\LanguageController@updateKey')->name('language.updateKey');
            Route::delete('delete-key/{id}', 'Admin\LanguageController@deleteKey')->name('language.deleteKey');


            /* ======== THEME SETTINGS ========== */
            Route::get('/logo-seo', 'Admin\BasicController@logoSeo')->name('logo-seo');
            Route::put('/logoUpdate', 'Admin\BasicController@logoUpdate')->name('logoUpdate');
            Route::put('/seoUpdate', 'Admin\BasicController@seoUpdate')->name('seoUpdate');
            Route::get('/breadcrumb', 'Admin\BasicController@breadcrumb')->name('breadcrumb');
            Route::put('/breadcrumb', 'Admin\BasicController@breadcrumbUpdate')->name('breadcrumbUpdate');


            /* ===== ADMIN TEMPLATE SETTINGS ===== */
            Route::get('template/{section}', 'Admin\TemplateController@show')->name('template.show');
            Route::put('template/{section}/{language}', 'Admin\TemplateController@update')->name('template.update');
            Route::get('contents/{content}', 'Admin\ContentController@index')->name('content.index');
            Route::get('content-create/{content}', 'Admin\ContentController@create')->name('content.create');
            Route::put('content-create/{content}/{language?}', 'Admin\ContentController@store')->name('content.store');
            Route::get('content-show/{content}/{name?}', 'Admin\ContentController@show')->name('content.show');
            Route::put('content-update/{content}/{language?}', 'Admin\ContentController@update')->name('content.update');
            Route::delete('contents/{id}', 'Admin\ContentController@contentDelete')->name('content.delete');


            // Blog Management
            Route::get('/blog/category', 'Admin\BlogController@category')->name('blog.category');
            Route::get('/blog/categoryadd', 'Admin\BlogController@categoryadd')->name('blog.categoryadd');
            Route::get('blog/categoryedit/{id}', 'Admin\BlogController@editcategory')->name('blog.categoryedit');
            Route::delete('/blog/categorydel/{id}', 'Admin\BlogController@destroyCategory')->name('blog.categorydel');
            Route::get('/blog/category/data', 'Admin\BlogController@destroycategory')->name('list.blog.category');
            Route::post('/blog/category/store', 'Admin\BlogController@storeCategory')->name('store.blog.category');
            Route::put('/blog/category/update/{id}', 'Admin\BlogController@updateCategory')->name('update.blog.category');



            // Manual Methods
            Route::get('blog', 'Admin\BlogController@index')->name('blog.index');
            Route::get('blog/new', 'Admin\BlogController@create')->name('blog.create');
            Route::post('blog/new', 'Admin\BlogController@store')->name('blog.store');
            Route::get('blog/edit/{id}', 'Admin\BlogController@edit')->name('blog.edit');
            Route::put('blog/update/{id}', 'Admin\BlogController@update')->name('blog.update');
            Route::delete('blog/delete/{id}', 'Admin\BlogController@delete')->name('blog.delete');
        });
        
    });
});

Route::get('/stripeajax', 'PaymentController@stripeajax')->name('stripeajax');

//Route::middleware('Maintenance')->group(function () {

    Auth::routes(['verify' => true]);

    Route::group(['middleware' => ['guest']], function () {
        Route::get('register/{sponsor?}', 'Auth\RegisterController@sponsor')->name('register.sponsor');
    });

    Route::group(['middleware' => ['auth'], 'prefix' => 'user', 'as' => 'user.'], function () {
        Route::get('/check', 'User\VerificationController@check')->name('check');
        Route::get('/inactive', 'User\VerificationController@inactive')->name('inactive');
        Route::get('/resend_code', 'User\VerificationController@resendCode')->name('resendCode');
        Route::post('/mail-verify', 'User\VerificationController@mailVerify')->name('mailVerify');
        Route::post('/sms-verify', 'User\VerificationController@smsVerify')->name('smsVerify');


        Route::get('/2fa/resend_code', 'User\VerificationController@resendCode2Fa')->name('resendCode2Fa');
        Route::post('/twoFAverifyOTP', 'User\VerificationController@twoFAverifyOTP')->name('twoFAverifyOTP');

        Route::post('twoFA-Verify', 'User\VerificationController@twoFAverify')->name('twoFA-Verify');

        Route::middleware('userCheck')->group(function () {

            Route::middleware('kyc')->group(function () {
                Route::get('/dashboard', 'User\HomeController@index')->name('home');
                Route::get('/recipients', 'User\HomeController@recipients')->name('recipients');
                Route::get('/recipients/add_recipients', 'User\HomeController@add_recipients')->name('recipients.add_recipients');
                Route::get('/recipients/editrecipients', 'User\HomeController@editrecipients')->name('recipients.editrecipients');
                Route::patch('/recipients/editrecipients', 'User\HomeController@updaterecipients')->name('recipients.editrecipients');
                Route::patch('/recipients/add_recipients', 'User\HomeController@store_recipients')->name('recipients.add_recipients');
                Route::post('/ajaxgetRecipient', 'User\HomeController@ajaxgetRecipient')->name('ajaxgetRecipient');


                Route::post('/calculation', 'User\HomeController@calculation')->name('calculation.store');
                Route::get('/send-money/{sendMoney:invoice}/{action}', 'User\HomeController@sendMoneyAction')->name('sendMoney.action');
                Route::get('/send-money/{sendMoney:invoice}', 'User\HomeController@sendMoney')->name('sendMoney');
                Route::get('/send-user-money', 'User\HomeController@sendUserMoney')->name('sendUserMoney');
                Route::get('/send-user-money-recipient/{id}', 'User\HomeController@sendUserMoneyrecipient')->name('sendUserMoneyrecipient');
                Route::patch('/send-money/{sendMoney:invoice}', 'User\HomeController@sendMoneyFormData')->name('sendMoney.formData');
                Route::get('/transfer-log', 'User\HomeController@transferLog')->name('transfer-log');
                Route::get('/transfer-log/search', 'User\HomeController@transferLogSearch')->name('transfer-log.search');
                Route::post('/transfer-log/delete/{id}', 'User\HomeController@transferLogDelete')->name('transfer-log.delete');

                Route::get('pay-now', 'User\HomeController@payNow')->name('addFund');
                Route::post('pay-now', 'PaymentController@payNowRequest')->name('addFund.request');
                Route::get('pay-confirm', 'PaymentController@depositConfirm')->name('addFund.confirm');
                Route::post('pay-confirm', 'PaymentController@fromSubmit')->name('addFund.fromSubmit');

                //transaction
                Route::get('/transaction', 'User\HomeController@transaction')->name('transaction');
                Route::get('/transaction-search', 'User\HomeController@transactionSearch')->name('transaction.search');
                Route::get('/payment-history', 'User\HomeController@fundHistory')->name('fund-history');
                Route::get('/payment-history/search', 'User\HomeController@fundHistorySearch')->name('fund-history.search');
                Route::get('/login-history', 'User\HomeController@loginHistory')->name('login-history');
                Route::get('/withdrow', 'User\HomeController@withdrow')->name('withdrow');
                Route::get('/cratewithdrow', 'User\HomeController@cratewithdrow')->name('cratewithdrow');
                Route::post('/cratewithdrow', 'User\HomeController@storewithdrow')->name('storewithdrow');
                Route::post('/withdrowdada', 'User\HomeController@withdrowdada')->name('withdrowdada');
                Route::get('/login-history/remove', 'User\HomeController@loginHistoryRemove')->name('login-history.remove');
                Route::post('/logoutAllOtherDevice', 'User\HomeController@logoutAllOtherDevice')->name('logoutAllOtherDevice');


                Route::get('push-notification-show', 'SiteNotificationController@show')->name('push.notification.show');
                Route::get('push.notification.readAll', 'SiteNotificationController@readAll')->name('push.notification.readAll');
                Route::get('push-notification-readAt/{id}', 'SiteNotificationController@readAt')->name('push.notification.readAt');
                Route::get('push-chat-show/{id}', 'ChatNotificationController@show')->name('push.chat.show');
                Route::post('push-chat-newMessage', 'ChatNotificationController@newMessage')->name('push.chat.newMessage');

                Route::get('/withdraw-history', 'User\PayoutController@withdrawHistory')->name('withdraw.history');
                Route::get('/withdraw-history-search', 'User\PayoutController@withdrawHistorySearch')->name('withdraw.history.search');
            });


            Route::get('/profile', 'User\HomeController@profile')->name('profile');
            Route::get('/downloadprofile', 'User\HomeController@downloadprofile')->name('downloadprofile');
            Route::post('/updateProfile', 'User\HomeController@updateProfile')->name('updateProfile');
            Route::put('/updateInformation', 'User\HomeController@updateInformation')->name('updateInformation');
            Route::post('/updatePassword', 'User\HomeController@updatePassword')->name('updatePassword');
            Route::post('/update/two-fa', 'User\HomeController@updateTwoFa')->name('updateTwoFa');
            Route::post('/verificationSubmit', 'User\HomeController@verificationSubmit')->name('verificationSubmit');
            Route::post('/addressVerification', 'User\HomeController@addressVerification')->name('addressVerification');


            Route::group(['prefix' => 'ticket', 'as' => 'ticket.'], function () {
                Route::get('/', 'User\SupportController@index')->name('list');
                Route::get('/create', 'User\SupportController@create')->name('create');
                Route::post('/create', 'User\SupportController@store')->name('store');
                Route::get('/view/{ticket}', 'User\SupportController@ticketView')->name('view');
                Route::put('/reply/{ticket}', 'User\SupportController@reply')->name('reply');
                Route::get('/download/{ticket}', 'User\SupportController@download')->name('download');
            });


            // merchant
            Route::get('add-fund', 'User\HomeController@addFund')->name('addFund.wallet');
            Route::post('add-fund', 'PaymentController@addFundRequest')->name('addFund.wallet.request');

            Route::get('/sendMoney', 'User\HomeController@merchantSendMoney')->name('merchant.sendMoney');
            Route::post('/send-money/{sendMoney:invoice}', 'User\HomeController@merchantSendMoneyFormData')->name('merchant.sendMoney.formData');
            Route::get('/payout-money', 'User\HomeController@merchantPayout')->name('merchant.payout-money');
            Route::post('/payout-money', 'User\HomeController@merchantPayoutRequest')->name('merchant.payout-money.request');
            Route::get('/payout-money/{sendMoney:invoice}', 'User\HomeController@payoutRequestInfo')->name('merchant.payout-money.info');
            Route::get('/payout-money-emailsent/{id}', 'User\HomeController@payoutRequestInfosent')->name('merchant.payout-money-emailsent');
            Route::put('/payout-money/{sendMoney:invoice}', 'User\HomeController@payoutRequestConfirm')->name('merchant.payout-money.payoutRequestConfirm');
            Route::get('/payout-history', 'User\HomeController@payoutHistory')->name('payout-history');

        });
    });


    Route::match(['get', 'post'], 'success', 'PaymentController@success')->name('success');
    Route::match(['get', 'post'], 'failed', 'PaymentController@failed')->name('failed');
    Route::match(['get', 'post'], 'payment/{code}/{trx?}/{type?}', 'PaymentController@gatewayIpn')->name('ipn');

    Route::get('/to/{country:slug}', 'FrontendController@toCountry')->name('toCountry');
    Route::get('/see-more', 'FrontendController@seeMoreCountry')->name('seeMoreCountry');
    Route::get('/getcountryrate/{id}', 'FrontendController@getcountryrate')->name('getcountryrate');
    Route::post('/ajaxCountryService', 'FrontendController@ajaxCountryService')->name('ajaxCountryService');
    Route::post('/ajaxMoneyCalculation', 'FrontendController@ajaxMoneyCalculation')->name('ajaxMoneyCalculation');
    Route::post('/ajaxCheckAccount', 'FrontendController@ajaxCheckAccount')->name('ajaxCheckAccount');

    Route::post('/applycupon', 'User\HomeController@applycupon')->name('applycupon');

    Route::get('/language/{code?}', 'FrontendController@language')->name('language');

    Route::get('/', 'FrontendController@index')->name('home'); // this is starting point
    Route::get('/how-it-work', 'FrontendController@howItWork')->name('how-it-work');
    Route::get('/help', 'FrontendController@help')->name('help');
    Route::get('/about', 'FrontendController@about')->name('about');
    Route::get('/faq', 'FrontendController@faq')->name('faq');
    Route::get('/contact', 'FrontendController@contact')->name('contact');
    Route::post('/contact', 'FrontendController@contactSend')->name('contact.send');
    Route::get('/blog/details/{slug}/{id}', 'FrontendController@blogDetails')->name('blogDetails');
    Route::get('/blog', 'FrontendController@blog')->name('blog');
    Route::get('/blog/category/{slug?}/{id}', 'FrontendController@blogCategory')->name('blog.category');

    Route::post('/subscribe', 'FrontendController@subscribe')->name('subscribe');
    Route::get('/currencyList', 'FrontendController@currencyList')->name('currencyList');
    Route::get('/serviceList', 'FrontendController@serviceList')->name('serviceList');
    Route::get('/getCharge', 'FrontendController@getCharge')->name('getCharge');
    Route::get('/{getLink}/{content_id}', 'FrontendController@getLink')->name('getLink');
    Route::get('/privacy-policy', 'FrontendController@privacy')->name('privacy-policy');
    Route::get('/terms-and-conditions', 'FrontendController@termsandconditions')->name('terms-and-conditions');

//});
