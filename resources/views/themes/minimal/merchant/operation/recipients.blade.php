@extends($theme.'layouts.merchant')
@section('title',trans('MY RECIPIENTS'))
@section('content')

    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">
            <div class="table-responsive">
                <div class="text-right">
                    <a href="{{ route('user.recipients.add_recipients') }}" class="btn btn-success my-2">Add Recipients </a>
                </div>
                <table class="table  table-striped table-bordered text-center" id="service-table">
                    <thead class="thead-dark">
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
                           
                            <td data-label="@lang('SL')">
                                <a href="{{route('user.recipients.editrecipients')}}?id={{$data->id}}" class="btn btn-success">Edit</a>
                                {{loopIndex($logs) + $k}}
                            </td>
                            <td data-label="@lang('Name')">{{$data->recipient_name}}</td>
                            <td data-label="@lang('Email')">{{($data->email) ??'N/A'}}</td>
                            <td data-label="@lang('Contact No')">{{($data->phone) ??'N/A'}}</td>
                        </tr>
                    @empty
                        <tr class="text-center">
                            <td colspan="100%">{{__('No Data Found!')}}</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
            {{ $logs->appends($_GET)->links($theme.'partials.pagination') }}
        </div>
    </div>

@endsection



