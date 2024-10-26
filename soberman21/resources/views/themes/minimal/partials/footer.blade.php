
@if(!Request::routeIs('user*'))
<section id="footer" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
    <div class="container">

        <div class="footer-top">
            @if(isset($contactUs['news-letter']) && $newsLetter = $contactUs['news-letter'][0])
            <div class="subscribe-text">
                <h4>@lang(@$newsLetter->description->title)</h4>
                <span>@lang(@$newsLetter->description->sub_title)</span>
            </div>
            <div class="subscribe-input">
                <form action="{{route('subscribe')}}" method="post">
                    @csrf
                    <div class="footer-form d-flex justify-content-between">
                        <input type="email" name="subscribe_email" placeholder="@lang('Email Address')" autocomplete="off">
                        <button class="subscribe-btn">{{trans('Subscribe')}}</button>
                    </div>
                    @error('subscribe_email')
                    <p class="text-danger">{{$message}}</p>
                    @enderror
                </form>
            </div>
            @endif
            <div class="social-links">
                @if(isset($contentDetails['social']))
                <ul class="footer-social d-flex justify-content-end">
                    @foreach($contentDetails['social'] as $data)
                    <li><a href="{{@$data->content->contentMedia->description->link}}"><i class="{{@$data->content->contentMedia->description->icon}}"></i></a></li>
                    @endforeach
                </ul>
                @endif
            </div>
        </div>
        <hr>

        <div class="footer-main">
            <div class="footer-description">
                <div class="logo">
                    <a href="{{route('home')}}">
                    <img src="{{getFile(config('location.logoIcon.path').'logo.png')}}" alt="...">
                    </a>
                </div>

                @if(isset($contactUs['contact-us']) &&  $contactData =  $contactUs['contact-us'][0])
                    <div class="paragraph">
                        <p>{{@$contactData->description->footer_left_text}}</p>
                    </div>
                @endif
            </div>

            <div class="footer-important-links">
                <div class="content-title">
                    <h5>{{trans('About Company')}}</h5>
                </div>
                <ul>
                    <li>
                        <a href="{{route('home')}}">@lang('Home')</a>
                    </li>
                    <li>
                        <a href="{{route('about')}}"> @lang('About Us')</a>
                    </li>
                    <li>
                        <a href="{{route('blog')}}">@lang('Blog')</a>
                    </li>
                    <li>
                        <a href="{{route('faq')}}">@lang('FAQ')</a>
                    </li>
                    <li>
                       <a href="javascript:void(0)" class="js-lcc-settings-toggle">@lang('cookie-consent::texts.alert_settings')</a>
                    </li>
                </ul>
            </div>
            <div class="who-we-are">
                <div class="content-title">
                    <h5>{{trans('Useful Links')}}</h5>
                </div>
                <ul>
                    <li>
                        <a href="{{route('contact')}}">@lang('Contact')</a>
                    </li>
                    @isset($contentDetails['support'])
                        @foreach($contentDetails['support'] as $data)
                        @if($data->content_id == 82)
                        <li>
                                <a href="{{route('terms-and-conditions')}}">@lang(@$data->description->title)</a>
                            </li>
                        	
                        @elseif($data->content_id == 81)
                        
                        	<li>
                                <a href="{{route('privacy-policy')}}">@lang(@$data->description->title)</a>
                            </li>
                        @else
                        <li>
                                <a href="{{route('getLink', [slug(@$data->description->title), @$data->content_id])}}">@lang(@$data->description->title)</a>
                            </li>
                        @endif
                        
                         
                        @endforeach
                    @endisset
                    
                </ul>
            </div>
            @if(isset($contactUs['contact-us']) &&  $contactData =  $contactUs['contact-us'][0])
            <div class="footer-contact-info">
                <div class="content-title">
                    <h5 class="white uppercase">{{trans('Countries Transfer')}}</h5>
                </div>

                <ul id="results"></ul>
                <a href="{{route('seeMoreCountry')}}" class="btn btn-info text-white btn-block load-more"><i class="fa fa-chevron-circle-down"></i> @lang('See Next Slide')</a>
                <ul>
            	<li>
                    <img src="{{asset($themeTrue.'images/visa-seeklogo-01.png')}}" width="50"> <img src="{{asset($themeTrue.'images/visa-seeklogo-02.png')}}" width="50"> <img src="{{asset($themeTrue.'images/paypal.jpg')}}" width="50">
                </li>
            </ul>
            </div>
            @endif
            
        </div>
    </div>
</section>
@endif


<div id="copy-right">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center ">
            <div class="copy">
                <span>
                    {{trans('Copyright')}} &copy; {{date('Y')}} <a href="{{route('home')}}" class="text-white text-decoration-none">{{$basic->site_title}}</a> {{trans('All Right Reserved.')}}
                </span>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <div class="lang">
                    <label for="lang">{{trans('Language')}} :</label>
                    <select id="lang" class="language">
                        @foreach($languages as $language)
                            <option value="{{strtoupper($language->short_name)}}" @if(strtoupper($language->short_name) ==  session()->get('trans')) selected @endif >@lang($language->name)</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="back-to-top show">
<i class="icofont-curved-up"></i>
</div>

<style>
    .wrapper > ul#results li {
        margin-bottom: 2px;
        background: #e2e2e2;
        padding: 20px;
        list-style: none;
    }
    .ajax-loading{
        text-align: center;
    }
    .load-more:hover{
        background-color:blue;
        text-decoration:none;
    }
</style>

@include($theme.'partials.color')


@push('script')

    <script>
        "use strict";
        $(document).ready(function () {
            $("#lang").selectmenu({
                change: function (event, ui) {
                    window.location.href = "{{route('language')}}/" + $(ui.item.element).val()
                }
            });
        });

        $(document).ready(function () {
            let sendSelectId = localStorage.getItem('sendSelectId');
            let sendSelectFlag = localStorage.getItem('sendSelectFlag');
            let sendSelectName = localStorage.getItem('sendSelectName');
            if (sendSelectId) {
                $('.sendFromCountry').val(sendSelectId).selectmenu("refresh")
                $('.sendFromFlag').attr('src', sendSelectFlag)
            }
        });



        $(".sendFromCountry").selectmenu({
            change: function (event, ui) {
                let id = $(this).val();
                let flag = $(ui.item.element).data('flag');
                let name = $(ui.item.element).data('name');
                let code = $(ui.item.element).data('code');
                let resource = $(ui.item.element).data('resource');
                localStorage.setItem('sendSelectId', id);
                localStorage.setItem('sendSelectFlag', flag);
                localStorage.setItem('sendSelectName', name);
                localStorage.setItem('sendSelectCode', code);
                localStorage.setItem('resource', JSON.stringify(resource));
                $('.sendFromCountry').val(id).selectmenu("refresh")
                $('.sendFromFlag').attr('src', flag)

                window.location.href = "{{url()->current()}}"
            }
        });
    </script>




    @if(config('basic.livechat') == 1)


		<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/{{config('basic.twakto')}}/1fkktlo5i';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
    @endif



    <script>
        var site_url = "{{ url('/') }}";
        var page = 1;

        load_more(page);


        function load_more(page){
            $.ajax({
                url: site_url + "/loadMore?page=" + page,
                type: "get",
                datatype: "html",
                beforeSend: function()
                {
                    $('.ajax-loading').show();
                }
            })
                .done(function(data)
                {
                    if(data.length == 0){
                        $('.load-more').addClass("d-none");
                        $('.ajax-loading').html("");
                        // $('.ajax-loading').html("No more records!");
                        return;
                    }
                    $('.ajax-loading').hide();
                    $("#results").append(data);
                })
                .fail(function(jqXHR, ajaxOptions, thrownError)
                {
                    alert('No response from server');
                });
        }
    </script>

@endpush
