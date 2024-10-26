@extends($theme.'layouts.app')
@section('title', trans($title))

@section('content')
    <section id="blog-grid" class="wow fadeInUp" data-wow-delay=".2s" data-wow-offset="300">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">
                    <div class="mainBlogMyInput">
                        <input type="text" id="myBlogInput" onkeyup="myFunction2()" placeholder="@lang('Search Blog')" title="Type in a name">
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row" id="blogcontents">
                @foreach($contentDetails as $data)
                <div class="col-lg-6">
                    <div class="blog-card-wrapper">
                        <div class="blog-card">
                            <div class="blog-image">
                                <img src="{{getFile(config('location.blog.path').@$data->image)}}" alt="blog image">
                            </div>
                            <div class="blog-content">
                                <div class="author-and-date">
                                    <div class="name media align-items-center">
                                        <span>{{trans('By Admin')}}</span>
                                    </div>
                                    <div class="date">
                                        <span>{{dateTime(@$data->created_at)}}</span>
                                    </div>
                                </div>
                                <hr>
                                <div class="blog-content-main">
                                    <div class="blog-heading">
                                        <h3>{{\Str::limit(@$data->name,40)}}</h3>
                                    </div>
                                    <div class="paragraph">
                                        <p>{{Illuminate\Support\Str::limit(strip_tags(@$data->description),120)}}</p>
                                    </div>
                                    <div class="read-more-button">
                                        <a href="{{route('blogDetails',[slug(@$data->name), $data->id])}}" class="anim-button">
                                            <span class="layer1">{{trans('READ MORE')}}</span>
                                            <span class="layer2"></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach

            </div>
        </div>
    </section>
    @include($theme.'sections.family-support')
@endsection

@push('script')
    <script>
        function myFunction2() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myBlogInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("blogcontents");
            tr = table.getElementsByClassName("col-lg-6");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("h3")[0];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
@endpush
