<!DOCTYPE html>
<!--[if lt IE 7 ]>
<html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>
<html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>
<html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="en" @if(session()->get('rtl') == 1) dir="rtl" @endif >
<!--<![endif]-->

<head>
    <link href="assets/css/jquery-ui.min.css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    @include('partials.seo')

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Source+Sans+Pro">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/jquery-ui.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/bootstrap.min.css')}}">
    @stack('css-lib')
    <!-- <link rel="stylesheet" type="text/css" href="{{asset('assets/cookie-consent/css/cookie-consent.css')}}"> -->
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/animate.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/fontawesome.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/icofont.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/nice-select.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/select2.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/slick.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/bootstrap-select.min.css')}} ">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/styles.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset($themeTrue.'css/xr/style.css')}}">
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
    </style>
    @stack('style')

    <script src="{{asset($themeTrue.'js/modernizr.custom.js')}}"></script>
    <script src="{{asset($themeTrue.'js/jquery-3.6.0.min.js')}}"></script>

    @if(Request::getpathInfo() == '/user/transfer-log')
    <script type="text/javascript">
        $(document).ready(function() {
            if (localStorage.getItem('country_service') > 0) {
                var $country = {};
                $country = JSON.parse(localStorage.getItem('reciver_moeny_from'));
                var contry_sluf = $country.slug;
                var get_url = "{{config('app.url')}}";
                var newUrl = get_url + '/to/' + contry_sluf;
                window.location = newUrl;
            }
        })
    </script>
    @endif

</head>

<body>
    <div class="loader">
        <img src="{{asset($themeTrue.'images/loader.gif')}}" alt="loader">
    </div>
        <!-- header bd end -->
        <section id="main-nav" class="navbar-background">
            <div class="container-fluid p-0">
                <nav class="navbar navbar-expand-xl w-100">
                    <a class="navbar-brand" href="{{route('home')}}">
                        <img src="{{getFile(config('location.logo.path').'logo.png')}}" alt="{{config('basic.site_title')}}">
                    </a>
                    <div>
                        <ul class="navbar-nav" style="align-items: center;">
                            <li class="nav-item {{menuActive('home')}}">
                                <a class="nav-link" href="{{route('home')}}">@lang('Home') </a>
                            </li>
                            <li class="nav-item {{menuActive('how-it-work')}}">
                                <a class="nav-link" href="{{route('how-it-work')}}">{{trans('How it work')}}</a>
                            </li>
                            <li class="nav-item {{menuActive('faq')}}">
                                <a class="nav-link" href="{{route('faq')}}">{{trans('Help')}}</a>
                            </li>


                            @guest
                            <li class="nav-item {{menuActive('login')}}">
                                <a class="nav-link" href="{{route('login')}}">{{trans('Sign In')}}</a>
                            </li>
                            @if(config('basic.registration') == 1)
                            <li class="nav-item {{menuActive('register')}}">
                                <a class="nav-link" href="{{route('register')}}">{{trans('Sign Up')}}</a>
                            </li>
                            @endif
                            @endguest
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                                    {{trans('Language')}}
                                </a>
                                <div class="dropdown-menu">
                                    @foreach($languages as $language)
                                    <a class="dropdown-item" href="{{route('language', strtoupper($language->short_name))}}">@lang($language->name)</a>
                                    @endforeach
                                </div>
                            </li>
                            <li class="nav-item">
                                @auth
                                @include($theme.'partials.pushNotify')
                                @endauth
                            </li>
                            <li class="nav-item">
                                @auth
                                <li class="nav-item {{menuActive('login')}}">
                                    <a class="nav-link" href="{{route('user.transfer-log')}}">{{trans('Dashboard')}}</a>
                                </li>
                                    <!-- @include($theme.'partials.userAction') -->
                                @endauth
                            </li>
                        </ul>
                        <div class="d-flex align-items-center s-node728">
                            @auth
                            @include($theme.'partials.pushNotify')
                            @endauth
                    
                            @auth
                            @include($theme.'partials.userAction')
                            @endauth
                            <button class="navbar-toggler mr-auto" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                                <i class="icofont-navigation-menu"></i>
                            </button>
                        </div>
                    </div>
                </nav>
                
                <div class="side-nav">
                    <button class="cross">&times;</button>

                    <ul class="navbar-nav">
                        <li class="nav-item {{menuActive('home')}}">
                            <a class="nav-link" href="{{route('home')}}">@lang('Home') </a>
                        </li>
                        <li class="nav-item {{menuActive('how-it-work')}}">
                            <a class="nav-link" href="{{route('how-it-work')}}">{{trans('How it work')}}</a>
                        </li>
                        <li class="nav-item {{menuActive('help')}}">
                            <a class="nav-link" href="{{route('help')}}">{{trans('Help')}}</a>
                        </li>


                        @guest
                        <li class="nav-item {{menuActive('login')}}">
                            <a class="nav-link" href="{{route('login')}}">{{trans('Sign In')}}</a>
                        </li>
                        @if(config('basic.registration') == 1)
                        <li class="nav-item {{menuActive('register')}}">
                            <a class="nav-link" href="{{route('register')}}">{{trans('Sign Up')}}</a>
                        </li>
                        @endif
                        @endguest


                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
                                {{trans('Language')}}
                            </a>
                            <div class="dropdown-menu">
                                @foreach($languages as $language)
                                <a class="dropdown-item" href="{{route('language', strtoupper($language->short_name))}}">@lang($language->name)</a>
                                @endforeach
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

    @include($theme.'partials.banner')

    @yield('content')

    @include($theme.'partials.footer')


    <script src="{{asset($themeTrue.'js/popper-1.12.9.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/jquery-ui.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/bootstrap.min.js')}}"></script>
    @stack('extra-js')
    <script src="{{asset($themeTrue.'js/notiflix-aio-2.7.0.min.js')}}"></script>

    <script src="{{asset($themeTrue.'js/wow.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/jquery.nice-select.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/select2.full.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/slick.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/bootstrap-select.min.js')}}"></script>
    <!-- <script src="{{asset($themeTrue.'js/fontawesome.min.js')}}"></script> -->
    <script src="{{asset($themeTrue.'js/script.js')}}"></script>
    <script src="{{asset($themeTrue.'js/pusher.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/vue.min.js')}}"></script>
    <script src="{{asset($themeTrue.'js/axios.min.js')}}"></script>

   
    @include($theme.'partials.cookie.footer')
    @stack('script')
    @include($theme.'partials.notification')
    <script type="text/javascript">
        // When the user scrolls the page, execute myFunction
        window.onscroll = function() {
            myFunction()
        };

        // Get the header
        var header = document.getElementById("main-nav");

        // Get the offset position of the navbar
        var sticky = header.offsetTop;

        // Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position
        function myFunction() {
            if (window.pageYOffset > sticky) {
                header.classList.add("sticky");
            } else {
                header.classList.remove("sticky");
            }
        }
    </script>

</body>

</html>
