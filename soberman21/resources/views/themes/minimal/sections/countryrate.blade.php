<section class="countries">
    <div class="container-fluid">
        <div>
            <h3 class="text-center text-white">@lang('Monitoring Real-time')</h3>
            <div class="select-country" style="width: 300px;">
                <h4 class="text-center text-white py-2">@lang('Select Country')</h4>
                <select id="countrySelect">
                    @foreach($sendFromCountry as $country)
                        <option value="{{ $country->id }}" data-image="{{ $country->flag }}">{{  $country->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>

        <div class="row g-5">
            <div class="col-lg-12 col-12">
                <div class="row g-4 country-list sender-country py-4">

                </div>
            </div>
        </div>
    </div>
</section>

@push('script')

<script>
    $(document).ready(function() {
        $('#countrySelect').select2({
            templateResult: formatState,
            templateSelection: formatSelection,
        });

        $('#countrySelect').on('change', function() {
            var selectedValues = $(this).val();
            var url = '{{ route("getcountryrate", ":selectedValues") }}';
            url = url.replace(':selectedValues', selectedValues);
            // Send AJAX request with selected values
            $.ajax({
                url: url,
                method: 'get',
                success: function(response) {
                    var li=''
                    response.countries.forEach(element => {
                        li += `<div class="col-md-3 col-6 mt-2">
                                <div class="card">
                                    <div class="d-flex">
                                        <div class="thumb">
                                            <img src="${element.flag}" alt="">
                                        </div>
                                        <div>
                                            <h4>${ element.name }</h4>
                                            <p>1 ${response.single.code} = ${parseFloat(element.rate/response.single.rate).toFixed(2)} ${  element.code }</p>
                                        </div>
                                    </div>
                                </div>
                            </div>`

                    });
                    $('.sender-country').html(li)

                },
                error: function(xhr, status, error) {
                    // Handle error
                    console.error('AJAX request failed:', error);
                }
            });
        });

        var selectedValues = $('#countrySelect').val();
        var url = '{{ route("getcountryrate", ":selectedValues") }}';
        url = url.replace(':selectedValues', selectedValues);
        // Send AJAX request with selected values
        $.ajax({
            url: url,
            method: 'get',
            success: function(response) {
                var li=''
                response.countries.forEach(element => {
                    li += `<div class="col-md-3 col-6 mt-2">
                            <div class="card">
                                <div class="d-flex">
                                    <div class="thumb">
                                        <img src="${element.flag}" alt="">
                                    </div>
                                    <div>
                                        <h4>${ element.name }</h4>
                                        <p>1 ${response.single.code} = ${parseFloat(element.rate/response.single.rate).toFixed(2)} ${  element.code }</p>
                                    </div>
                                </div>
                            </div>
                        </div>`

                });
                $('.sender-country').html(li)

            },
            error: function(xhr, status, error) {
                // Handle error
                console.error('AJAX request failed:', error);
            }
        });

    });

    function formatState (state) {
        if (!state.id) {
            return state.text;
        }
        var baseUrl = $(state.element).data('image');
        var $state = $(
            '<span><img src="' + baseUrl + '" class="img-flag" /> ' + state.text + '</span>'
        );
        return $state;
    };
    function formatSelection (selection) {
        if (!selection.id) {
            return selection.text;
        }
        var baseUrl = $(selection.element).data('image');
        var $selection = $(
            '<span><img src="' + baseUrl + '" class="img-flag" /> ' + selection.text + '</span>'
        );
        return $selection;
    };
</script>

@endpush

@push('style')
    <style>
        .img-flag{
            width: 25px;
            height: 25px;
            border-radius: 50%;
        }
        .select-country .select2-selection.select2-selection--single {
            justify-content: flex-start;
            padding: 22px 0;
            color: black;
            align-items: center;
        }
        .select-country .select2-selection__rendered::after{
            display: none
        }
        .thumb img{
            border-radius: 40%;
        }
    </style>
@endpush