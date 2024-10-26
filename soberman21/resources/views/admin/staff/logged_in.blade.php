@extends('admin.layouts.app')
@section('title')
    @lang("User Login History")
@endsection


@section('content')
    <div class="card card-primary m-0 m-md-4 my-4 m-md-0">
        <div class="card-body">


            <div class="table-responsive">
                <table class="categories-show-table table table-hover table-striped table-bordered">
                    <thead class="thead-primary">
                    <tr>
                        <th scope="col">@lang('No.')</th>
                        <th scope="col">@lang('Name')</th>
                        <th scope="col">@lang('IP')</th>
                        <th scope="col">@lang('Browser')</th>
                        <th scope="col">@lang('OS')</th>
                        <th scope="col">@lang('Location')</th>
                        <th scope="col">@lang('Time')</th>
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($logs as $data)
                        <tr>
                            <td data-label="@lang('No.')">{{loopIndex($logs) + $loop->index}}</td>
                            <td data-label="@lang('Name')">
                                @lang($data->admin->username)
                            </td>
                            <td data-label="@lang('IP')">{{$data->user_ip}}</td>
                            <td data-label="@lang('Browser')">{{$data->browser}}</td>
                            <td data-label="@lang('OS')">{{$data->os}}</td>
                            <td data-label="@lang('Location')">{{$data->location}}</td>
                            <td data-label="@lang('Time')">{{$data->created_at->format('d M,Y H:i')}}</td>
                        </tr>
                    @empty
                        <tr>
                            <td class="text-center text-danger">@lang('No Data Found')</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
                {{$logs->appends(@$search)->links('partials.pagination')}}

            </div>
        </div>
    </div>




@endsection
