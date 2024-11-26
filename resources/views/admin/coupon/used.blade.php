@extends('admin.layouts.app')
@section('title',trans($page_title))


@section('content')

    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">


            <div class="table-responsive">
                <table class="categories-show-table table table-hover table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">@lang('SL')</th>
                        <th scope="col">@lang('Code')</th>
                        <th scope="col">@lang('Value')</th>
                        <th scope="col">@lang('Status')</th>
                        {{-- <th scope="col">@lang('Used At')</th> --}}
                    </tr>
                    </thead>
                    <tbody>
                    @forelse($coupons as $data)
                        <tr>
                            <td data-label="@lang('SL')">{{loopIndex($coupons) + $loop->index	 }}</td>
                            <td data-label="@lang('Code')" class="font-weight-bold">{{$data->code}}</td>
                            <td data-label="@lang('Value')">@lang($data->discount_value) (@lang($data->discount_type))</td>
                            <td data-label="@lang('Status')">{{ ($data->expiry_date < now() ? 'Expired' : 'Fully Used')}}</td>

                            {{-- <td data-label="@lang('Used At')">{{dateTime($data->used_at)}}</td> --}}

                        </tr>
                    @empty
                        <tr>
                            <td class="text-center text-danger" colspan="4">@lang('No Data Found')</td>
                        </tr>
                    @endforelse
                    </tbody>
                </table>
                {{$coupons->links('partials.pagination')}}

            </div>
        </div>
    </div>



@endsection
