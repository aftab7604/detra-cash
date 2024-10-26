<audio id="myNotify">
    <source src="{{asset('assets/admin/css/notify.mp3')}}" type="audio/mpeg">
</audio>
<header class="topbar" data-navbarbg="skin6">

    <nav class="navbar top-navbar navbar-expand-md">
        <div class="navbar-header" data-logobg="skin6">
            <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i
                    class="ti-menu ti-close"></i></a>
            <div class="navbar-brand">
                <a href="{{url('/')}}">
                    <span class="logo-text">
                        <img src="{{getFile(config('location.logoIcon.path').'logo.png' )}}" alt="homepage"
                             class="dark-logo"/>
                        <img src="{{getFile(config('location.logoIcon.path').'logo.png' )}}" class="light-logo"
                             alt="homepage"/>
                    </span>
                </a>
            </div>

            <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)"
               data-toggle="collapse" data-target="#navbarSupportedContent"
               aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i
                    class="ti-more"></i></a>
        </div>

        <div class="navbar-collapse collapse" id="navbarSupportedContent">
            <ul class="navbar-nav float-left mr-auto ml-3 pl-1">
                <li class="nav-item dropdown" id="pushNotificationArea">
                    <a class="nav-link dropdown-toggle pl-md-3 position-relative" href="javascript:void(0)"
                       id="bell" role="button" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        <span><i data-feather="bell" class="svg-icon"></i></span>
                        <span class="badge badge-primary notify-no rounded-circle" v-cloak>@{{ items.length }}</span>
                    </a>

                    <div class="dropdown-menu dropdown-menu-left mailbox animated bounceInDown">
                        <ul class="list-style-none">
                            <li>
                                <div class="scrollable message-center notifications position-relative">
                                    <!-- Message -->
                                    <a v-for="(item, index) in items"
                                       @click.prevent="readAt(item.id, item.description.link)"
                                       href="javascript:void(0)"
                                       class="message-item d-flex align-items-center border-bottom px-3 py-2">
                                        <div class="btn btn-danger rounded-circle btn-circle">
                                            <i :class="item.description.icon" class="text-white"></i>
                                        </div>


                                        <div class="w-75 d-inline-block v-middle pl-2">
                                            <span class="font-12 text-nowrap d-block text-muted" v-cloak
                                                  v-html="item.description.text"></span>
                                            <span class="font-12 text-nowrap d-block text-muted" v-cloak>@{{ item.formatted_date }}</span>
                                        </div>
                                    </a>


                                </div>
                            </li>
                            <li>
                                <a class="nav-link pt-3 text-center text-dark notification-clear-btn"
                                   href="javascript:void(0);"
                                   v-if="items.length > 0" @click.prevent="readAll">
                                    <strong>@lang('Clear all')</strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>

                                <a class="nav-link pt-3 text-center text-dark" href="javascript:void(0);" v-else>
                                    <strong>@lang('No notification found')</strong>
                                </a>

                            </li>
                        </ul>
                    </div>
                </li>
            </ul>

            <ul class="navbar-nav float-right">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="javascript:void(0)" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <img src="{{getFile(config('location.user.path').Auth::user()->image)}}"
                             alt="user"
                             class="rounded-circle width-40p">
                        <span class="ml-2 d-none d-lg-inline-block"><span class="text-dark">@lang('Hello,')</span> <span
                                class="text-dark">{{ Auth::user()->username }}</span> <i
                                data-feather="chevron-down"
                                class="svg-icon"></i></span>
                    </a>


                    <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">

                        <a class="dropdown-item" href="{{route('user.profile') }}">
                            <i class="svg-icon mr-2 ml-1 icon-user"></i>
                            @lang('Profile')
                        </a>

                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="{{ route('logout') }}"
                           onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();"><i
                                data-feather="power" class="svg-icon mr-2 ml-1"></i>
                            {{ __('Logout') }}
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                            @csrf
                        </form>
                    </div>
                </li>


            </ul>
        </div>

    </nav>
</header>


@push('script')
    @auth
        <script>
            'use strict';
            let pushNotificationArea = new Vue({
                el: "#pushNotificationArea",
                data: {
                    items: [],
                },
                beforeMount() {
                    this.getNotifications();
                    this.pushNewItem();
                },
                methods: {
                    getNotifications() {
                        let app = this;
                        axios.get("{{ route('user.push.notification.show') }}")
                            .then(function (res) {
                                app.items = res.data;
                            })
                    },
                    readAt(id, link) {
                        let app = this;
                        let url = "{{ route('user.push.notification.readAt', 0) }}";
                        url = url.replace(/.$/, id);
                        axios.get(url)
                            .then(function (res) {
                                if (res.status) {
                                    app.getNotifications();
                                    if (link != '#') {
                                        window.location.href = link
                                    }
                                }
                            })
                    },
                    readAll() {
                        let app = this;
                        let url = "{{ route('user.push.notification.readAll') }}";
                        axios.get(url)
                            .then(function (res) {
                                if (res.status) {
                                    app.items = [];
                                }
                            })
                    },
                    pushNewItem() {
                        let app = this;
                        // Pusher.logToConsole = true;
                        let pusher = new Pusher("{{ env('PUSHER_APP_KEY') }}", {
                            encrypted: true,
                            cluster: "{{ env('PUSHER_APP_CLUSTER') }}"
                        });
                        let channel = pusher.subscribe('user-notification.' + "{{ Auth::id() }}");
                        channel.bind('App\\Events\\UserNotification', function (data) {
                            app.items.unshift(data.message);
                            var x = document.getElementById("myNotify");
                            x.play();
                        });
                        channel.bind('App\\Events\\UpdateUserNotification', function (data) {
                            app.getNotifications();
                        });
                    }
                }
            });
        </script>
    @endauth
@endpush
