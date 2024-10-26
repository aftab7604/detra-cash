@extends('admin.layouts.app')
@section('title')
    @lang("User Action History")
@endsection


@section('content')
    <div class="card card-primary m-0 m-md-4 my-4 m-md-0">
        <div class="card-body">


            <div class="table-responsive">
                <table class="categories-show-table table table-hover table-striped table-bordered">
                    <thead class="thead-primary">
                    <tr>
                        <th scope="col">@lang('No.')</th>
                        <th scope="col">@lang('User Name')</th>
                        <th scope="col">@lang('Activity')</th>
                        <th scope="col">@lang('Description')</th>
                        <th scope="col">@lang('Time')</th>
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($activitylogs as $data)
                        <tr>
                            <td data-label="@lang('No.')">{{loopIndex($activitylogs) + $loop->index}}</td>
                            <td data-label="@lang('User Name')">
                                <a href="{{route('admin.user-edit',[$data->user_id])}}" target="_blank" class="text-capitalize">
                                    @lang($data->user->fullname)
                                </a>
                            </td>
                            <td data-label="@lang('Action')">{{$data->action}}</td>
                            <td data-label="@lang('Description')">{{$data->description}}</td>
                            <td data-label="@lang('Time')">{{$data->created_at->format('d M,Y H:i')}}</td>
                        </tr>
                    @empty
                        <tr>
                            <td class="text-center text-danger">@lang('No Data Found')</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
                {{$activitylogs->appends(@$search)->links('partials.pagination')}}

            </div>
        </div>
    </div>




@endsection
