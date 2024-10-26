<!DOCTYPE html>
<html class="no-js" lang="en" @if(session()->get('rtl') == 1) dir="rtl" @endif >
<head>
    <link href="assets/css/jquery-ui.min.css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />

    <link href="{{asset('assets/admin/css/select2.min.css')}}" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/jquery-ui.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/icofont.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/styles.css')}}">

    <link href="{{asset('assets/admin/css/style.min.css')}}" rel="stylesheet">

   
    <style type="text/css">
        input[id^=lcc-]:disabled {
            color: #777;
            cursor: default;
            opacity: .55;
            position: relative;
            left: -5px;
        }

        .custom-cookie-button {
            bottom: 30px;
            left: 30px;
            position: fixed;
            line-height: 40px;
            color: var(--natural-color);
            text-align: center;
            border-radius: 3px;
            cursor: pointer;
            z-index: 1000;
            -webkit-transition: .5s;
            transition: .5s;
        }
        .sidebar-nav #sidebarnav .sidebar-item .sidebar-link {
    padding: 15px 30px;
}
    </style>
    @stack('style')
    <script src="{{asset($themeTrue.'js/jquery-3.6.0.min.js')}}"></script>

</head>

<body>

<div class="preloader">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>

    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
     data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">

    @include($theme.'partials.user.header')
    @include($theme.'partials.user.sidebar')

    <div class="page-wrapper" style="display: block;">
        <div class="page-breadcrumb">
            <div class="row">
                <div class="col-12 align-self-center">
                    <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">@yield('title')</h4>
                    <div class="d-flex align-items-center">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb m-0 p-0">
                                <li class="breadcrumb-item text-muted active" aria-current="page">@lang('Dashboard')</li>
                                <li class="breadcrumb-item text-muted" aria-current="page">@yield('title')</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>


        @yield('content')
        <footer class="footer text-center text-muted">
            {{trans('Copyrights')}} © {{date('Y')}} @lang('All Rights Reserved By') @lang($basic->site_title)
        </footer>
    </div>
</div>


    <script src="{{asset($themeTrue.'js/jquery-ui.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/bootstrap.min.js')}}"></script>
    @stack('extra-js')
    <script src="{{asset($themeTrue.'js/notiflix-aio-2.7.0.min.js')}}"></script>
    <script src="{{ asset('assets/admin/js/sidebarmenu.js')}}"></script>
    <script src="{{ asset('assets/admin/js/feather.min.js') }}"></script>
    <script src="{{asset($themeTrue.'js/wow.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/jquery.nice-select.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/select2.full.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/slick.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/bootstrap-select.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/script.js')}}"></script>
    <script src="{{asset($themeTrue.'js/pusher.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/vue.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/axios.min.js')}}"></script>
    <script src="{{ asset('assets/admin/js/perfect-scrollbar.jquery.min.js')}}"></script>
    <script src="{{ asset('assets/admin/js/custom.js')}}"></script>
   
    @stack('script')
    @include($theme.'partials.notification')

</body>

</html>
