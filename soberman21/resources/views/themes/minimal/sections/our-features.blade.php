@php
if(session()->get('trans') == 'US')
{
	$language_id = 1;
}else
{
	$code = session()->get('trans');
	$language = \App\Models\Language::where('short_name', $code)->first();
	$language_id = $language->id;
}

$blogs = \App\Models\Blog::where('language_id',$language_id)->with('category')->latest()->limit(6)->get();

$OurFeature = \App\Models\OurFeature::where('language_id',$language_id)->take(6)->get();

$feature = \App\Models\OurFeature::where('language_id',$language_id)->skip(6)->take(1)->get();
$featuresec = \App\Models\OurFeature::where('language_id',$language_id)->skip(7)->take(3)->get();
@endphp


<section class="features container py-5">
    <h4>@lang('OUR FEATURES')</h4>
    <h3>@lang('Where Money Meets Efficiency')</h3>
    <div class="row g-3 pt-40">
        @foreach ($OurFeature as $item)
        <div class="col-lg-4 col-md-6 col-12 aos-init aos-animate" data-aos="zoom-in">
            <div class="card">
                <div class="d-flex">
                    <div class="p-2">
                    <img src="{{getFile(config('location.blog.path').@$item->image)}}" alt="blog image" height="100" width="100">
                    </div>
                        <div>
                            <h3>{{ $item->title }}</h3>
                            <p>{{ $item->description }}</p>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</section>

<section class="how-it-work ptb-60">
    <div class="container mx-auto">
        <div class="row">
            <div class="col-lg-6 col-12">
            @if(isset($feature[0]))
            <img src="{{getFile(config('location.blog.path').@$feature[0]->image)}}" alt="blog image" height="100" width="100">
            @endif
            </div>
            <div class="col-lg-6 col-12 my-auto">
                @if(isset($feature[0]))
                    <div class="text-content">
                        <h4>HOW IT WORK</h4>
                        <h3>{{ $feature[0]->title }}</h3>
                    </div>
                    <div>
                        <p>{{ $feature[0]->description }}</p>
                    </div>
                @endif
                <div class="row g-4 pt-40 bottom-card">
                    @foreach ($featuresec as $item)
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="bottom-card-img">
                                    <div class="bottom-img">
                                        <img src="{{getFile(config('location.blog.path').@$item->image)}}" alt="blog image" height="100" width="100">
                                    </div>
                                    <h3>{{ $item->title }}</h3>
                                <p>{{ $item->description }}</p>
                            </div>
                        </div>
                    @endforeach
                </div>
        </div>
    </div>
</section>

