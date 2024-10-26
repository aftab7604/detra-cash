<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" sizes="16x16" href="{{ getFile(config('location.logoIcon.path').'favicon.png')}}">
    <title>@lang($basic->site_title) | @yield('title')</title>
    <link href="{{asset('assets/admin/css/bootstrap4-toggle.min.css')}}" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/bootstrap.min.css')}}">
    @stack('css-lib')
    @stack('style-lib')
    <link href="{{asset('assets/admin/css/all.min.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('assets/admin/css/select2.min.css')}}" rel="stylesheet">
    <link href="{{asset('assets/admin/css/style.min.css')}}" rel="stylesheet">
    <link href="{{asset('assets/admin/css/style.css')}}" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/styles.css')}}">
    @stack('style')


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

    @include($theme.'partials.merchant.header')
    @include($theme.'partials.merchant.sidebar')

    <div class="page-wrapper">
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


@stack('loadModal')


<script src="{{asset('assets/admin/js/jquery-3.6.0.min.js') }}"></script>
<script src="{{asset('assets/admin/js/popper.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/bootstrap.min.js') }}"></script>
@stack('extra-js')
<script src="{{ asset('assets/admin/js/bootstrap4-toggle.min.js') }}"></script>

<script src="{{ asset('assets/admin/js/app-style-switcher.js') }}"></script>
<script src="{{ asset('assets/admin/js/feather.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/notiflix-aio-2.7.0.min.js')}}"></script>
<script src="{{ asset('assets/admin/js/perfect-scrollbar.jquery.min.js')}}"></script>
<script src="{{ asset('assets/admin/js/sidebarmenu.js')}}"></script>
<script src="{{ asset('assets/admin/js/select2.min.js')}}"></script>
<script src="{{ asset('assets/admin/js/custom.js')}}"></script>

<script src="{{ asset('assets/admin/js/axios.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/vue.min.js') }}"></script>
<script src="{{ asset('assets/admin/js/pusher.min.js') }}"></script>

@stack('script')

@include($theme.'partials.notification')



</body>
</html>
