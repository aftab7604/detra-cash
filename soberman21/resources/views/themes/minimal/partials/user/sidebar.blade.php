<aside class="left-sidebar" data-sidebarbg="skin6">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar" data-sidebarbg="skin6">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">

                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('user.home')}}" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home feather-icon"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                        <span class="hide-menu">@lang('Dashboard')</span>
                    </a>
                </li>


                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('user.transfer-log')}}" aria-expanded="false">
                        <i class="fa fa-exchange-alt"></i>
                        <span class="hide-menu">@lang('Transfer Log')</span>
                    </a>
                </li>

                
                <li class="sidebar-item">
                    <a class="sidebar-link"  href="{{route('user.recipients')}}" aria-expanded="false">

                        <i class=" fas fa-address-book"></i>
                        <span class="hide-menu">@lang('My Recipients')</span>
                    </a>
                </li>

                
                <li class="sidebar-item">
                    <a class="sidebar-link"  href="{{route('user.transaction')}}" aria-expanded="false">
                        <i class="fa fa-exchange-alt"></i>
                        <span class="hide-menu">@lang('Transaction')</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('user.sendUserMoney')}}" aria-expanded="false">
                        <i class="fa fa-exchange-alt"></i>
                        <span class="hide-menu">@lang('Send Money')</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{route('user.fund-history')}}" aria-expanded="false">
                        <i class="fa fa-exchange-alt"></i>
                        <span class="hide-menu">@lang('Payment Log')</span>
                    </a>
                </li>

                
                <li class="sidebar-item">
                    <a class="sidebar-link" href="{{ route('user.profile') }}" aria-expanded="false">
                        <i class="fa fa-exchange-alt"></i>
                        <span class="hide-menu">@lang('Profile Settings')</span>
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

                <li class="sidebar-item"> 
                    <a  class="sidebar-link" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-power svg-icon mr-2 ml-1"><path d="M18.36 6.64a9 9 0 1 1-12.73 0"></path><line x1="12" y1="2" x2="12" y2="12"></line></svg>
                        <span class="hide-menu">{{trans('Logout') }}</span>
                    </a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                        @csrf
                    </form>
                </li>

            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
