@extends('admin.layouts.app')
{{-- @section('title', trans($page_title)) --}}
@section('title')
@section('content')

    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">
            @if(adminAccessRoute(config('role.our_futures.access.store')))
            <div class="d-flex justify-content-end mb-2 text-right">
                <button data-toggle="modal" data-target="#exampleModal" type="button" class="btn btn-primary btn-sm"><i
                        class="fa fa-plus-circle"></i> {{trans('Add Our Feature')}} </button>
            </div>
            @endif


                <div class="table-responsive">
                    <table class="categories-show-table table table-hover table-striped table-bordered">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">@lang('SL')</th>
                            <th scope="col">@lang('Title')</th>
                            <th scope="col">@lang('Image')</th>
                            <th scope="col">@lang('Description')</th>
                            <th scope="col">@lang('Action')</th>

                        </tr>
                        </thead>
                        <tbody>
                        @forelse($OurFeature as $key => $data)
                            <tr>
                                <td data-label="@lang('SL')">{{++$key}}</td>
                                <td data-label="@lang('Name')">
                                    <h5 class="text-dark mb-0 font-16 ">@lang($data->title)</h5>
                                </td>
                                <td><img src="{{getFile(config('location.blog.path').@$data->image)}}" alt="blog image" height="100" width="100"></td>
                                <td>{{ $data->description }}</td>
                                <td>

                                    @if(adminAccessRoute(config('role.our_futures.access.edit')))
                                    <a class="edit_button   btn btn-primary  text-white  btn-sm " href="{{ route('admin.ourFuture.edit',$data->id) }}"> <i class="fa fa-edit"></i></a>
                                    @endif
                                    @if(adminAccessRoute(config('role.our_futures.access.delete')))
                                    <form action="{{ route('admin.ourFuture.destroy', $data->id) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button class="edit_button   btn btn-danger  text-white  btn-sm " type="submit"><i class="fa fa-trash"></i></button>
                                    </form>
                                    @endif
                                </td>


                            </tr>
                        @empty
                            <tr>
                                <td class="text-center text-danger" colspan="100%">@lang('No Data Found')</td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table>
                </div>


        </div>
    </div>




  <!-- Create Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Our Feature Add</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">

            @if ($errors->any())
                <div>
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <form action="{{ route('admin.ourFuture.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <label for="title">Title:</label><br>
                <input  class="form-control"  placeholder="Enter title" type="text" id="title" name="title"><br>
                <label for="image">Image:</label><br>
                <input class="form-control" type="file" id="image" name="image"><br>
                <label for="description">Description:</label><br>
                <textarea class="form-control" id="description" name="description"></textarea><br><br>
                <button class="btn btn-primary" type="submit">Submit</button>
            </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

        </div>
      </div>
    </div>
  </div>




@endsection

