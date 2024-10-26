@if(!request()->routeIs('home') && !request()->routeIs('faq'))
    <section id="send-money-banner" style="background-image: linear-gradient(to right , rgba(56, 80, 129,0.95), rgba(56, 80, 129,0.95)), url({{getFile(config('location.logo.path').'background_image.jpg') ? : 0}});">
        <div class="container">
            <div class="page-banner-content  d-flex justify-content-center align-items-center flex-column">
                <div class="banner-heading">
                    <h1 class="text-center text-uppercase">@yield('title')</h1>
                </div>
            </div>
        </div>
		@if(isset(request()->route()->uri))
        @if(request()->route()->uri == 'user/recipients')
        	<div class="testing_data">
        		<a href="{{route('user.recipients.add_recipients')}}" class="btn btn-priamry add_recipient">Add Recipient</a>
        	</div>
        
        
        @endif
		@endif
    </section>
@endif
