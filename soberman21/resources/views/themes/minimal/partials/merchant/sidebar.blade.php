<aside class="left-sidebar" data-sidebarbg="skin6">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar" data-sidebarbg="skin6">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('user.home')}}" aria-expanded="false">
                            <i data-feather="home" class="feather-icon"></i>
                            <span class="hide-menu">@lang('Dashboard')</span>
                        </a>
                    </li>


                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('user.recipients')}}" aria-expanded="false">

                        <i class=" fas fa-address-book"></i>
                        <span class="hide-menu">@lang('My Recipients')</span>
                    </a>
                </li>

                    <li class="nav-small-cap"><span class="hide-menu">@lang('Transfer')</span></li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('user.merchant.sendMoney')}}" aria-expanded="false">
                            <i class="fa fa-paper-plane"></i>
                            <span class="hide-menu">@lang('Send Money')</span>
                        </a>
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('user.transfer-log')}}" aria-expanded="false">
                            <i class="fa fa-exchange-alt"></i>
                            <span class="hide-menu">@lang('Transfer Log')</span>
                        </a>
                    </li>

                    <li class="nav-small-cap"><span class="hide-menu">@lang('Payout')</span></li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('user.merchant.payout-money')}}" aria-expanded="false">

                            <i class="fas fa-hand-holding-usd"></i>
                            <span class="hide-menu">@lang('Payout Money')</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('user.payout-history')}}" aria-expanded="false">
                            <i  class="fas fa-history"></i>
                            <span class="hide-menu">@lang('Payout Log')</span>
                        </a>
                    </li>




                <li class="nav-small-cap"><span class="hide-menu">@lang('Fund')</span></li>
                <li class="sidebar-item">
                    <a class="sidebar-link"  href="{{route('user.addFund.wallet')}}" aria-expanded="false">
                        <i data-feather="credit-card" class="feather-icon"></i>
                        <span class="hide-menu">@lang('Add Fund')</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link"  href="{{route('user.fund-history')}}" aria-expanded="false">
                        <i class="fas fa-history"></i>
                        <span class="hide-menu">@lang('Fund Log')</span>
                    </a>
                </li>

                <li class="nav-small-cap"><span class="hide-menu">@lang('LOG')</span></li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('user.transaction')}}" aria-expanded="false">
                        <i data-feather="activity" class="feather-icon"></i>
                        <span class="hide-menu">@lang('Transaction')</span>
                    </a>
                </li>


                <li class="nav-small-cap"><span class="hide-menu">@lang('Withdrow')</span></li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('user.cratewithdrow')}}" aria-expanded="false">
                        <i data-feather="activity" class="feather-icon"></i>
                        <span class="hide-menu">@lang('Withdrow')</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('user.withdrow')}}" aria-expanded="false">
                        <i data-feather="activity" class="feather-icon"></i>
                        <span class="hide-menu">@lang('Withdrow Log')</span>
                    </a>
                </li>

                <li class="nav-small-cap"><span class="hide-menu">@lang('Support Tickets')</span></li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('user.ticket.create') }}" aria-expanded="false">
                        <i class="fas fa-plus-circle"></i>
                        <span class="hide-menu">@lang('Create Ticket')</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('user.ticket.list') }}" aria-expanded="false">
                        <i class="fas fa-ticket-alt"></i>
                        <span class="hide-menu">@lang('Support Ticket')</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('user.login-history') }}" aria-expanded="false">
                        <i class="fas fa-history"></i>
                        <span class="hide-menu">@lang('Login History')</span>
                    </a>
                </li>



            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
