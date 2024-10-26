@extends($theme.'layouts.app')
@section('title',trans($title))

@section('content')
    <section id="why-choose-us" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
        <div class="container">
            <div class="d-flex justify-content-center">
                <div class="section-title title-bar">
                    <h1>@lang('More Countries You Can Send Money To')</h1>
                </div>
            </div>

            <div class="row">
                @forelse($countries as $item)
                    <div class="col-md-6 col-lg-4">
                        <a href="{{route('toCountry',[@$item])}}">
                            <div class="choose-card-wrapper">
                                <div class="choose-card">

                                    <div class="icon">
                                        <img src="{{$item->flag}}" alt="{{$item->name}}">
                                    </div>
                                    <div class="content-title">
                                        <h4>{{$item->name}}</h4>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                @empty
                @endforelse
            </div>
        </div>
    </section>
@endsection
