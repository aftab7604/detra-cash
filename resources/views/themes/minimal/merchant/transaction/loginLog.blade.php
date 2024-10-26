@extends($theme.'layouts.merchant')
@section('title', trans('Login History'))
@section('content')

    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">
            <div class="mb-3">
                <a href="{{route('user.login-history.remove')}}" class="btn btn-outline-danger"
                   type="button"><i class="fa fa-history"></i> @lang('Clear Data')</a>


                <button class="btn btn-outline-dark deleteTrx"
                        data-toggle="modal"
                        data-target="#deleteTrx"
                        data-route="{{route('user.logoutAllOtherDevice')}}"
                        type="button"><i
                        class="fa fa-sign-in-alt"></i> @lang('Logout All Other Devices')</button>
            </div>
            <div class="table-responsive">
                <table class="table  table-striped table-bordered text-center" id="service-table">
                    <thead>
                    <tr>
                        <th scope="col">@lang('No.')</th>
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
                            <td data-label="@lang('IP')">{{$data->user_ip}}</td>
                            <td data-label="@lang('Browser')">{{$data->browser}}</td>
                            <td data-label="@lang('OS')">{{$data->os}}</td>
                            <td data-label="@lang('Location')">{{$data->location}}</td>
                            <td data-label="@lang('Time')">{{$data->created_at->format('d M,Y H:i')}}</td>
                        </tr>
                    @empty
                        <tr>
                            <td class="text-center text-dark" colspan="100%">@lang('No Data Found')</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
            {{ $logs->appends($_GET)->links($theme.'partials.pagination') }}
        </div>
    </div>



    <!-- The Modal -->
    <div class="modal fade" id="deleteTrx">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="" class="deleteTrxAction" enctype="multipart/form-data">
                    @csrf
                    <!-- Modal Header -->
                    <div class="modal-header modal-colored-header bg-primary">
                        <h5 class="modal-title text-white">@lang('Delete Confirmation')</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="text-dark">@lang('Password')</label>
                            <input id="password" type="password"
                                   class="form-control form-control-lg"
                                   name="password" value="{{old('password')}}"
                                   autocomplete="off">

                            @if($errors->has('password'))
                                <span
                                    class="error text-danger">@lang($errors->first('password')) </span>
                            @endif

                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal"><span>@lang('Close')</span>
                        </button>
                        <button type="submit" class=" btn btn-primary "><span>@lang('Yes')</span>
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>

@endsection

@push('script')
    <script>
        "use strict";
        $(document).on('click', '.deleteTrx', function () {
            var route = $(this).data('route');
            $('.deleteTrxAction').attr('action', route)
        });
    </script>

    @if(count($errors) > 0 )
        @foreach($errors->all() as $key => $error)
            <script>
                Notiflix.Notify.Failure("{{$error}}" );
            </script>
        @endforeach
    @endif
@endpush
