<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
@if(isset($templates['testimonial'][0]) && $testimonial = $templates['testimonial'][0])
    <style>
        .owl-nav{
            margin-left: 48% !important;
            font-size: 30px !important;
        }
        .owl-prev span{
            margin-right: 25px !important;
        }
    </style>
    <section id="testimonial" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
        <div class="mr-5" style="margin-left: 50px !important;">
            <div class="d-flex justify-content-center">
                <div class="section-title title-bar">
                    <h1>@lang(@$testimonial->description->title)</h1>
                </div>
            </div>
            <div id="carouselExampleControls">
                <div class="owl-carousel owl-theme">

                    @if(isset($contentDetails['testimonial']))
                        @foreach($contentDetails['testimonial'] as $key=>$data)

                        <div class="item {{($key == 0) ? "active":""}} ">
                            <div class="client-card-wrapper">
                                <div class="client-card">
                                    
                                    <div class="client-info">
                                    
                                        <hr>
                                        <br>
                                    
                                        <div class="paragraph">
                                            <p>
                                                @lang(@$data->description->description)
                                            </p>
                                        </div>
                                        <div class="name">
                                            <div class="row">
                                                <div class="col-md-2 padding-right-zero">
                                                    <img src="{{getFile(config('location.content.path').@$data->content->contentMedia->description->image)}}" alt="client image" class="img-fluid rounder-image-testimonial">
                                                </div>
                                                <div class="col-md-8 testtimonail-name">
                                                    <h3>@lang(@$data->description->name) </h3>
                                                    <p>@lang(@$data->description->designation)</p>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    @endif

                </div>
                {{-- <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <i class="icofont-rounded-left"></i>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <i class="icofont-rounded-right"></i>
                </a> --}}
            </div>
        </div>
    </section>
@endif

<script>
    $('.owl-carousel').owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:2
        },
        1200:{
            items:3
        }
    }
})
</script>