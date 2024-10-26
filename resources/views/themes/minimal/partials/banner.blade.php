@if(!request()->routeIs('home') && !request()->routeIs('faq'))
    <section id="send-money-banner" style="background-image: linear-gradient(to right , rgba(81, 149, 211,0.8), rgba(0,0,0,0.65)), url({{getFile(config('location.logo.path').'background_image.jpg') ? : 0}});">
        <div class="container">
            <div class="page-banner-content  d-flex justify-content-center align-items-center flex-column">
                <div class="banner-heading">
                    <h1 class="text-center text-uppercase">@yield('title')</h1>
                </div>
            </div>
        </div>
        @if(isset(request()->route()->uri))
            @if(request()->route()->uri == 'user/recipients')
                <div style="position: relative;">   
                    <a href="{{route('user.recipients.add_recipients')}}" class="btn btn-priamry add_recipient" style="position: absolute; right: 0; bottom: -134px;">Add Recipient</a>
                </div>
            @endif
		@endif
    </section>
@endif
