@extends($theme.'layouts.app')
@section('title', trans('Frequently Asked Questions'))

@push('style')

@endpush
@section('content')
    <section id="send-money-banner" style="background-image: linear-gradient(to right , rgba(56, 80, 129,0.95), rgba(56, 80, 129,0.95)), url({{getFile(config('location.logo.path').'background_image.jpg') ? : 0}});">
        <div class="container">
            <div class="page-banner-content  d-flex justify-content-center align-items-center flex-column">
                <div class="banner-heading">
                    <h1 class="text-center text-uppercase">@yield('title')</h1>
                </div>
            </div>
        </div>
    </section>

    <div class="mainMyInput">
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="@lang('Ask a question or search by keywords.')" title="Type in a name">
    </div>

    @include($theme.'sections.faq')
    @include($theme.'sections.family-support')

@endsection
@push('script')
    <script>
        function myFunction() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("faq");
            tr = table.getElementsByClassName("faq-card");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("a")[0];
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
