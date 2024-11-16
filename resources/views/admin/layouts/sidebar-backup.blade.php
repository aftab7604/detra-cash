<aside class="left-sidebar" data-sidebarbg="skin6">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar" data-sidebarbg="skin6">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">

                @if(adminAccessRoute(config('role.dashboard.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.dashboard')}}" aria-expanded="false">
                            <i data-feather="home" class="feather-icon"></i>
                            <span class="hide-menu">@lang('Dashboard')</span>
                        </a>
                    </li>
                @endif

                @if(adminAccessRoute(config('role.manage_staff.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.staff')}}" aria-expanded="false">
                            <i data-feather="users" class="feather-icon"></i>
                            <span class="hide-menu">@lang('Role Permission')</span>
                        </a>
                    </li>
                @endif

                @if(adminAccessRoute(config('role.staff_activity_log.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.activityLog')}}" aria-expanded="false">
                            <i class="fas fa-history"></i>
                            <span class="hide-menu">@lang('Staff Activity Log')</span>
                        </a>
                    </li>
                @endif

                @if(adminAccessRoute(config('role.staff_loggedin_log.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.loggedIn')}}" aria-expanded="false">
                            <i class="fas fa-history"></i>
                            <span class="hide-menu">@lang('Staff login Log')</span>
                        </a>
                    </li>
                @endif

                @if(adminAccessRoute(config('role.identify_form.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.identify-form')}}" aria-expanded="false">
                            <i data-feather="file-text" class="feather-icon"></i>
                            <span class="hide-menu">@lang('Identity Form')</span>
                        </a>
                    </li>
                @endif

                @if(adminAccessRoute(config('role.service_list.access.view')))
                    <li class="nav-small-cap"><span class="hide-menu">@lang('Manage Remittance')</span></li>
                    <li class="sidebar-item">
                        <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                            <i class="fas fa-globe"></i>
                            <span class="hide-menu">@lang('Manage Country')</span>
                        </a>
                        <ul aria-expanded="false" class="collapse first-level base-level-line">
                            @if(adminAccessRoute(config('role.service_list.access.view')))
                            <li class="sidebar-item">
                                <a href="{{route('admin.service')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('Service List')</span>
                                </a>
                            </li>
                            @endif
                            @if(!adminAccessRoute(config('role.service_info.access.view')))
                            <li class="sidebar-item">
                                <a href="{{route('admin.serviceinfo.index')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('Service Info')</span>
                                </a>
                            </li>
                            @endif
                            @if(adminAccessRoute(config('role.continent_list.access.view')))
                            <li class="sidebar-item">
                                <a href="{{route('admin.continent')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('Continents')</span>
                                </a>
                            </li>
                            @endif
                            @if(adminAccessRoute(config('role.country_list.access.view')))
                            <li class="sidebar-item">
                                <a href="{{route('admin.country')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('Countries') </span>
                                </a>
                            </li>
                            @endif
                        </ul>
                    </li>

                    @if(adminAccessRoute(config('role.purpose_list.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.purpose')}}" aria-expanded="false">
                            <i data-feather="award" class="feather-icon"></i>
                            <span class="hide-menu">@lang('Sending Purpose')</span>
                        </a>
                    </li>
                    @endif
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.sourceOfFund')}}" aria-expanded="false">
                            <i data-feather="help-circle" class="feather-icon"></i>
                            <span class="hide-menu">@lang('Source Of Fund')</span>
                        </a>
                    </li>
                @endif


                @if(adminAccessRoute(array_merge(config('role.manage_coupon.access.view'), config('role.manage_coupon.access.view'))))
                    <li class="sidebar-item">
                        <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                            <i class="fas fa-percent"></i>
                            <span class="hide-menu">@lang('Manage Coupon')</span>
                        </a>
                        <ul aria-expanded="false" class="collapse first-level base-level-line">
                            @if(adminAccessRoute(config('role.manage_coupon.access.view')))
                            <li class="sidebar-item">
                                <a href="{{route('admin.coupon')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('Coupon List')</span>
                                </a>
                            </li>
                            @endif

                            @if(adminAccessRoute(config('role.manage_coupon_used.access.view')))
                            <li class="sidebar-item">
                                <a href="{{route('admin.coupon.used')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('Used Coupon') </span>
                                </a>
                            </li>
                            @endif
                        </ul>
                    </li>
                @endif


               
                @if(adminAccessRoute(config('role.remittance_history.access.view')))
                    <li class="list-divider"></li>
                    <li class="nav-small-cap"><span class="hide-menu">@lang('REMITTANCE HISTORY')</span></li>
                    <li class="sidebar-item">
                        <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                            <i class="fas fa-exchange-alt"></i>
                            <span class="hide-menu">@lang('Transfer History')</span>
                        </a>
                        <ul aria-expanded="false" class="collapse first-level base-level-line">
                            @if(adminAccessRoute(config('role.remittance_history_pending_recharge.access.view')))
                            <li class="sidebar-item">
                                <a href="{{route('admin.money-transfer.recharge.pending')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('Pending Recharge') </span>
                                </a>
                            </li>
                            @endif
                            @if(adminAccessRoute(config('role.remittance_history_pending.access.view')))
                            <li class="sidebar-item">
                                <a href="{{route('admin.money-transfer.pending')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('Pending History') </span>
                                </a>
                            </li>
                            @endif
                            @if(adminAccessRoute(config('role.remittance_history_complete.access.view')))
                            <li class="sidebar-item">
                                <a href="{{route('admin.money-transfer.complete')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('Complete History')</span>
                                </a>
                            </li>
                            @endif
                            @if(adminAccessRoute(config('role.remittance_history_cancelled.access.view')))
                            <li class="sidebar-item">
                                <a href="{{route('admin.money-transfer.cancelled')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('Cancelled History')</span>
                                </a>
                            </li>
                            @endif
                            <li class="sidebar-item">
                                <a href="{{route('admin.money-transfer')}}" class="sidebar-link">
                                    <span class="hide-menu">@lang('All History')</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                @endif
                    @php
                        $user          = App\Models\Admin::where('id',auth()->guard('admin')->user()->id)->with('role')->first();
                    @endphp
                
                    <li class="list-divider"></li>
                    @if($user->role!="Admin" && (adminAccessRoute(config('role.withdraw_history.access.view')) || adminAccessRoute(config('role.payout_history.access.view'))))
                    <li class="nav-small-cap"><span class="hide-menu">@lang('Withdraw History')</span></li>
                    @if(adminAccessRoute(config('role.withdraw_history.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.withdraw-history')}}" >
                            <i class="fas fa-exchange-alt"></i>
                            <span class="hide-menu">@lang('Withdraw History')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.payout_history.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.payout.History')}}" >
                            <i class="fas fa-exchange-alt"></i>
                            <span class="hide-menu">@lang('Payout History')</span>
                        </a>
                    </li>
                    @endif
                    @endif
                @if(adminAccessRoute(array_merge(config('role.payment_method.access.view'), config('role.payment_gateway.access.view'), config('role.payment_log_pending.access.view'), config('role.payment_log.access.view'), config('role.payment_log_report.access.view'))))
                    <li class="list-divider"></li>
                    <li class="nav-small-cap"><span class="hide-menu">@lang('Payment Settings')</span></li>

                    @if(adminAccessRoute(config('role.payment_method.access.view')))
                        <li class="sidebar-item {{menuActive(['admin.payment.methods','admin.edit.payment.methods'],3)}}">
                            <a class="sidebar-link" href="{{route('admin.payment.methods')}}"
                               aria-expanded="false">
                                <i class="fas fa-credit-card"></i>
                                <span class="hide-menu">@lang('Payment Methods')</span>
                            </a>
                        </li>
                    @endif
                    @if(adminAccessRoute(config('role.payment_gateway.access.view')))
                        <li class="sidebar-item {{menuActive(['admin.deposit.manual.index','admin.deposit.manual.create','admin.deposit.manual.edit'],3)}}">
                            <a class="sidebar-link" href="{{route('admin.deposit.manual.index')}}"
                               aria-expanded="false">
                                <i class="fa fa-university"></i>
                                <span class="hide-menu">@lang('Manual Gateway')</span>
                            </a>
                        </li>
                    @endif

                    @if(adminAccessRoute(config('role.payment_log_pending.access.view')))
                        <li class="sidebar-item {{menuActive(['admin.payment.pending'],3)}}">
                            <a class="sidebar-link" href="{{route('admin.payment.pending')}}" aria-expanded="false">
                                <i class="fas fa-spinner"></i>
                                <span class="hide-menu">@lang('Pending Request')
                                    @if( 0 < $totalPendingPayment)
                                        <span class="badge badge-danger badge-pill"> {{$totalPendingPayment}}</span>
                                    @endif
                            </span>
                            </a>
                        </li>
                    @endif
                    @if(adminAccessRoute(config('role.payment_log.access.view')))
                        <li class="sidebar-item {{menuActive(['admin.payment.log','admin.payment.search'],3)}}">
                            <a class="sidebar-link" href="{{route('admin.payment.log')}}" aria-expanded="false">
                                <i class="fas fa-history"></i>
                                <span class="hide-menu">@lang('Payment Log')</span>
                            </a>
                        </li>
                    @endif
                    @if(adminAccessRoute(config('role.payment_log_report.access.view')))
                        <li class="sidebar-item {{menuActive(['admin.payment.reportlog','admin.payment.search'],3)}}">
                            <a class="sidebar-link" href="{{route('admin.payment.reportlog')}}" aria-expanded="false">
                                <i class="fas fa-history"></i>
                                <span class="hide-menu">@lang('Payment Reports')</span>
                            </a>
                        </li>
                    @endif
                @endif


                @if(adminAccessRoute(array_merge(config('role.user_management.access.view'), config('role.add_merchant.access.add'), config('role.merchants.access.view'), config('role.kyc_pending.access.view'), config('role.kyc_log.access.view'), config('role.email_send.access.view'), config('role.loggedin_log.access.view'), config('role.activity_log.access.view'))))
                    {{--Manage User--}}
                    <li class="nav-small-cap"><span class="hide-menu">@lang('Manage User')</span></li>

                    <li class="sidebar-item {{menuActive(['admin.users','admin.users.search','admin.user-edit*','admin.send-email*','admin.users'],3)}}">
                        <a class="sidebar-link" href="{{ route('admin.users') }}" aria-expanded="false">
                            <i class="fas fa-users"></i>
                            <span class="hide-menu">@lang('All User')</span>
                        </a>
                    </li>


                    @if(adminAccessRoute(config('role.add_merchant.access.add')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{ route('admin.merchants.create') }}"
                           aria-expanded="false">
                            <i class="fas fa-user-plus"></i>
                            <span class="hide-menu">@lang('Add Merchant')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.merchants.access.view')))
                    <li class="sidebar-item {{menuActive(['admin.merchants','admin.merchants.search'],3)}}">
                        <a class="sidebar-link" href="{{ route('admin.merchants') }}" aria-expanded="false">
                            <i class="fas fa-users-cog"></i>
                            <span class="hide-menu">@lang('All Merchant')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.kyc_pending.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{ route('admin.users.kyc.pending') }}"
                           aria-expanded="false">
                            <i class="fas fa-spinner"></i>
                            <span class="hide-menu">@lang('Pending KYC')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.kyc_log.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{ route('admin.users.kyc') }}"
                           aria-expanded="false">
                            <i class="fas fa-file-invoice"></i>
                            <span class="hide-menu">@lang('KYC Log')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.email_send.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{ route('admin.email-send') }}"
                           aria-expanded="false">
                            <i class="fas fa-envelope-open"></i>
                            <span class="hide-menu">@lang('Send Email')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.loggedin_log.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{ route('admin.users.loggedIn') }}"
                           aria-expanded="false">
                            <i class="fas fa-history"></i>
                            <span class="hide-menu">@lang('Login Logs')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.loggedin_log.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{ route('admin.users.activityLog') }}"
                           aria-expanded="false">
                            <i class="fas fa-history"></i>
                            <span class="hide-menu">@lang('Activity Logs')</span>
                        </a>
                    </li>
                    @endif
                @endif

                @if(adminAccessRoute(config('role.transaction.access.view')))
                    <li class="list-divider"></li>
                    <li class="nav-small-cap"><span class="hide-menu">@lang('All Transaction')</span></li>
                    <li class="sidebar-item {{menuActive(['admin.transaction*'],3)}}">
                        <a class="sidebar-link" href="{{ route('admin.transaction') }}" aria-expanded="false">
                            <i class="fas fa-exchange-alt"></i>
                            <span class="hide-menu">@lang('Transaction')</span>
                        </a>
                    </li>
                @endif

                @if(adminAccessRoute(config('role.support_ticket.access.view')) || adminAccessRoute(config('role.support_open_ticket.access.view')) || adminAccessRoute(config('role.support_closed_ticket.access.view')) ||  adminAccessRoute(config('role.support_answered_ticket.access.view')) || adminAccessRoute(config('role.subscriber.access.view')))
                
                    <li class="nav-small-cap"><span class="hide-menu">@lang('Support Tickets')</span></li>
                    @endif
                    @if(adminAccessRoute(config('role.support_ticket.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.ticket')}}" aria-expanded="false">
                            <i class="fas fa-ticket-alt"></i>
                            <span class="hide-menu">@lang('All Tickets')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.support_open_ticket.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{ route('admin.ticket',['open']) }}"
                           aria-expanded="false">
                            <i class="fas fa-spinner"></i>
                            <span class="hide-menu">@lang('Open Ticket')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.support_closed_ticket.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{ route('admin.ticket',['closed']) }}"
                           aria-expanded="false">
                            <i class="fas fa-times-circle"></i>
                            <span class="hide-menu">@lang('Closed Ticket')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.support_answered_ticket.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{ route('admin.ticket',['answered']) }}"
                           aria-expanded="false">
                            <i class="fas fa-reply"></i>
                            <span class="hide-menu">@lang('Answered Ticket')</span>
                        </a>
                    </li>
                    @endif

                @if(adminAccessRoute(config('role.subscriber.access.view')))
                    <li class="nav-small-cap"><span class="hide-menu">@lang('Subscriber')</span></li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.subscriber.index')}}" aria-expanded="false">
                            <i class="fas fa-envelope-open"></i>
                            <span class="hide-menu">@lang('Subscriber List')</span>
                        </a>
                    </li>
                @endif

                @if(adminAccessRoute(config('role.our_futures.access.view')) || adminAccessRoute(config('role.website_controls.access.view')) || adminAccessRoute(config('role.color_settings.access.view')) || (adminAccessRoute(config('role.email_controls.access.view')) || adminAccessRoute(config('role.email_template.access.view'))) || (adminAccessRoute(config('role.sms_config.access.view')) || adminAccessRoute(config('role.sms_template.access.view'))) || adminAccessRoute(config('role.notify_config.access.view')) || adminAccessRoute(config('role.notify_template.access.view')) ||  adminAccessRoute(config('role.language_settings.access.view')) )
                    <li class="nav-small-cap"><span class="hide-menu">@lang('Controls')</span></li>
                    @endif
                    @if(adminAccessRoute(config('role.our_futures.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.ourFuture.index')}}" aria-expanded="false">
                            <i data-feather="file-text" class="feather-icon"></i>
                            <span class="hide-menu">@lang('Our Futures')</span>
                        </a>
                    </li>
                    @endif
                    @if(adminAccessRoute(config('role.website_controls.access.view')))
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="{{route('admin.basic-controls')}}" aria-expanded="false">
                                <i class="fas fa-cogs"></i>
                                <span class="hide-menu">@lang('Basic Controls')</span>
                            </a>
                        </li>
                    @endif
                    @if(adminAccessRoute(config('role.color_settings.access.view')))
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="{{route('admin.color-settings')}}" aria-expanded="false">
                                <i class="fas fa-paint-brush"></i>
                                <span class="hide-menu">@lang('Color Settings')</span>
                            </a>
                        </li>
                    @endif
                        @if(adminAccessRoute(config('role.email_controls.access.view')) || adminAccessRoute(config('role.email_template.access.view')))
                        <li class="sidebar-item">
                            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                                <i class="fas fa-envelope"></i>
                                <span class="hide-menu">@lang('Email Settings')</span>
                            </a>
                            <ul aria-expanded="false" class="collapse first-level base-level-line">
                            @if(adminAccessRoute(config('role.email_controls.access.view')))
                                <li class="sidebar-item">
                                    <a href="{{route('admin.email-controls')}}" class="sidebar-link">
                                        <span class="hide-menu">@lang('Email Controls')</span>
                                    </a>
                                </li>
                            @endif
                            @if(adminAccessRoute(config('role.email_template.access.view')))
                                <li class="sidebar-item">
                                    <a href="{{route('admin.email-template.show')}}" class="sidebar-link">
                                        <span class="hide-menu">@lang('Email Template') </span>
                                    </a>
                                </li>
                            @endif
                            </ul>
                        </li>
                        @endif
                        @if(adminAccessRoute(config('role.sms_config.access.view')) || adminAccessRoute(config('role.sms_template.access.view')))
                        <li class="sidebar-item">
                            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                                <i class="fas fa-mobile-alt"></i>
                                <span class="hide-menu">@lang('SMS Settings')</span>
                            </a>
                            <ul aria-expanded="false" class="collapse first-level base-level-line">
                                @if(adminAccessRoute(config('role.sms_config.access.view')))
                                <li class="sidebar-item">
                                    <a href="{{ route('admin.sms.config') }}" class="sidebar-link">
                                        <span class="hide-menu">@lang('SMS Controls')</span>
                                    </a>
                                </li>
                                @endif
                                @if(adminAccessRoute(config('role.sms_template.access.view')))
                                <li class="sidebar-item">
                                    <a href="{{ route('admin.sms-template') }}" class="sidebar-link">
                                        <span class="hide-menu">@lang('SMS Template')</span>
                                    </a>
                                </li>
                                @endif
                            </ul>
                        </li>
                        @endif
                        @if(adminAccessRoute(config('role.notify_config.access.view')) || adminAccessRoute(config('role.notify_template.access.view')))
                        <li class="sidebar-item">
                            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                                <i class="fas fa-bell"></i>
                                <span class="hide-menu">@lang('Push Notification')</span>
                            </a>
                            <ul aria-expanded="false" class="collapse first-level base-level-line">
                                @if(adminAccessRoute(config('role.notify_config.access.view')))
                                <li class="sidebar-item">
                                    <a href="{{route('admin.notify-config')}}" class="sidebar-link">
                                        <span class="hide-menu">@lang('Configuration')</span>
                                    </a>
                                </li>
                                @endif
                                @if(adminAccessRoute(config('role.notify_template.access.view')))
                                <li class="sidebar-item">
                                    <a href="{{ route('admin.notify-template.show') }}" class="sidebar-link">
                                        <span class="hide-menu">@lang('Template')</span>
                                    </a>
                                </li>
                                @endif
                            </ul>
                        </li>
                        @endif
                    @if(adminAccessRoute(config('role.language_settings.access.view')))
                    <li class="sidebar-item {{menuActive(['admin.language.create','admin.language.edit*','admin.language.keywordEdit*'],3)}}">
                        <a class="sidebar-link" href="{{  route('admin.language.index') }}"
                           aria-expanded="false">
                            <i class="fas fa-language"></i>
                            <span class="hide-menu">@lang('Manage Language')</span>
                        </a>
                    </li>
                    @endif


                @if(adminAccessRoute(config('role.theme_settings.access.view')))
                <li class="nav-small-cap"><span class="hide-menu">@lang('Theme Settings')</span></li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('admin.logo-seo')}}" aria-expanded="false">
                        <i class="fas fa-image"></i><span
                            class="hide-menu">@lang('Manage Logo & SEO')</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('admin.breadcrumb')}}" aria-expanded="false">
                        <i class="fas fa-file-image"></i><span
                            class="hide-menu">@lang('Manage Breadcrumb')</span>
                    </a>
                </li>


                <li class="sidebar-item {{menuActive(['admin.template.show*'],3)}}">
                    <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
                        <i class="fas fa-clipboard-list"></i>
                        <span class="hide-menu">@lang('Manage Content')</span>
                    </a>
                    <ul aria-expanded="false"
                        class="collapse first-level base-level-line {{menuActive(['admin.template.show*'],1)}}">

                        @foreach(array_diff(array_keys(config('templates')),['message','template_media']) as $name)
                            <li class="sidebar-item {{ menuActive(['admin.template.show'.$name]) }}">
                                <a class="sidebar-link {{ menuActive(['admin.template.show'.$name]) }}"
                                   href="{{ route('admin.template.show',$name) }}">
                                    <span class="hide-menu">@lang(ucfirst(kebab2Title($name)))</span>
                                </a>
                            </li>
                        @endforeach

                    </ul>
                </li>
                @php
                    $segments = request()->segments();
                    $last  = end($segments);
                @endphp
                <li class="sidebar-item {{menuActive(['admin.content.create','admin.content.show*'],3)}}">
                    <a class="sidebar-link has-arrow {{Request::routeIs('admin.content.show',$last) ? 'active' : '' }}"
                       href="javascript:void(0)" aria-expanded="false">
                        <i class="fas fa-clipboard-list"></i>
                        <span class="hide-menu">@lang('Content Settings')</span>
                    </a>
                    <ul aria-expanded="false"
                        class="collapse first-level base-level-line {{menuActive(['admin.content.create','admin.content.show*'],1)}}">
                        @foreach(array_diff(array_keys(config('contents')),['message','content_media']) as $name)

                            <li class="sidebar-item {{($last == $name) ? 'active' : '' }} ">
                                <a class="sidebar-link {{($last == $name) ? 'active' : '' }}"
                                   href="{{ route('admin.content.index',$name) }}">
                                    <span class="hide-menu">@lang(ucfirst(kebab2Title($name)))</span>
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </li>
                @endif

				@if(adminAccessRoute(config('role.blogcategory.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.blog.category')}}" aria-expanded="false">
                            <i class="fas fa-file-image"></i><span
                                class="hide-menu">@lang('Blog Category')</span>
                        </a>
                    </li>
                @endif
				@if(adminAccessRoute(config('role.blog.access.view')))
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.blog.index')}}" aria-expanded="false">
                            <i class="fas fa-file-image"></i><span
                                class="hide-menu">@lang('Blog List')</span>
                        </a>
                    </li>
                @endif
                <li class="list-divider"></li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('clear')}}" aria-expanded="false">
                        <i class="fas fa-file-image"></i><span
                            class="hide-menu">@lang('Clear Cache')</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
