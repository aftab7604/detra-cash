@extends($theme.'layouts.user')
@section('title',trans($page_title))
@section('content')
    <section id="add-recipient-form">
        <div class="row justify-content-between">
            <div class="col-lg-12">
                <div class="overview mx-lg-5">
                    <div class="overview-list">
                        <div class="text-right">
                            <a href="{{ route('user.recipients.add_recipients') }}" class="btn btn-success my-2">Add Recipients </a>
                        </div>
                        <div class="table-responsive">
                            <table class="table  table-striped table-bordered text-center" id="service-table">
                                <thead>
                                <tr>
                                    <th scope="col">@lang('SL')</th>
                                    <th scope="col">@lang('Name')</th>
                                    <th scope="col">@lang('Email')</th>
                                    <th scope="col">@lang('Contact No')</th>
                                </tr>
                                </thead>
                                <tbody>
                                    @forelse($logs as $k => $data)
                                        <tr>
                                            <td data-label="@lang('SL')">{{loopIndex($logs) + $k}}
                                                <a href="{{route('user.recipients.editrecipients')}}?id={{$data->id}}" class="btn btn-success">Edit</a>
                                                <a href="/" onclick="cashid({{ $data->id }})" class="btn btn-success">Send Money</a>
                                            </td>
                                            <td data-label="@lang('Name')">{{$data->recipient_name}}</td>
                                            <td data-label="@lang('Email')">{{($data->email) ??'N/A'}}</td>
                                            <td data-label="@lang('Contact No')">{{($data->country_code) ??''}}{{($data->phone) ??'N/A'}}</td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="100%">@lang('No Data Found')</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                        {{ $logs->appends($_GET)->links($theme.'partials.pagination') }}
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection


@push('script')
<script type="text/javascript">
	$('.send_money_user').click(function(){
		var resource = $(this).attr('data-resource');
		localStorage.setItem('recipientUser', JSON.stringify(resource));
		var base_url = "{{config('app.url')}}";
		var newUrl = base_url+'/user/send-user-money';
		window.location = newUrl;
	})
    function cashid(cashid){
        sessionStorage.setItem("recid", cashid);
    }
</script>
@endpush