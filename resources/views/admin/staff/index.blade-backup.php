@extends('admin.layouts.app')
@section('title',trans($title))
@section('content')



    <div class="card card-primary m-0 m-md-4 my-4 m-md-0 shadow">
        <div class="card-body">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link"
                        data-toggle="tab" data-target="#home" type="button" role="tab"
                        aria-controls="home" aria-selected="true">@lang('Users')</a>
                </li>

                <li class="nav-item" role="presentation">
                    <a class="nav-link"
                        data-toggle="tab" data-target="#role" type="button" role="tab"
                        aria-controls="role" aria-selected="false">@lang('Roles')</a>
                </li>
            </ul>

            <div class="tab-content " id="myTabContent">
                <div id="home" role="tabpanel" aria-labelledby="home-tab" class="tab-pane fade px-3 pt-3">
                    @if(adminAccessRoute(config('role.manage_staff.access.add')))
                    <div class="d-flex justify-content-end mb-2 text-right">
                        <button  data-target="#addUserModal"  data-toggle="modal"  class="btn btn-primary btn-sm"><i class="fa fa-user-plus"></i> {{trans('Add New User')}} </button>
                    </div>
                    @endif

                    <div class="table-responsive">
                        <table class="categories-show-table table table-hover table-striped table-bordered">
                            <thead class="thead-dark">
                            <tr>
                                <th scope="col">@lang('SL')</th>
                                <th scope="col">@lang('Username')</th>
                                <th scope="col">@lang('Email')</th>
                                <th scope="col">@lang('Phone')</th>
                                <th scope="col">@lang('Role')</th>
                                <th scope="col">@lang('Status')</th>
                                @if(adminAccessRoute(config('role.manage_staff.access.edit')))
                                <th scope="col">@lang('Action')</th>
                                @endif
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($admins as $k => $data)
                                <tr>
                                    <td data-label="SL">{{++$k}}</td>
                                    <td data-label="Username"><strong>{{$data->username}}</strong></td>
                                    <td data-label="Email">{{$data->email}}</td>
                                    <td data-label="Phone">{{$data->phone}}</td>
                                    <td data-label="Role">{{$data->role->role}}</td>

                                    <td>
                                        <span  class="badge  badge-pill  badge-{{ $data->status ==0 ? 'danger' : 'success' }}">{{ $data->status == 0 ? 'Deactive' : 'Active' }}</span>
                                    </td>
                                    @if(adminAccessRoute(config('role.manage_staff.access.edit')))
                                    <td data-label="@lang('Action')">
                                            <button
                                                class="edit_button   btn btn-primary  text-white  btn-sm "
                                                data-target="#myUserModal{{$data->id}}"
                                                data-id="{{$data->id }}"
                                                data-toggle="modal">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                        <!-- Modal for Edit button -->
                                        <div class="modal fade" id="myUserModal{{$data->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                            aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content ">
                                                    <div class="modal-header modal-colored-header bg-primary">
                                                        <h4 class="modal-title" id="myModalLabel">@lang('Manage Admin Role')</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    </div>

                                                    <form role="form" method="POST" class="actionRoute" action="{{route('admin.updateStaff',$data)}}" enctype="multipart/form-data">
                                                        @csrf
                                                        @method('put')
                                                        <div class="modal-body">

                                                            <div class="row">
                                                                <div class="form-group col-md-6">
                                                                    <label class="text-dark"> {{trans('First Name(s)')}} :</label>
                                                                    <input class="form-control " name="first_name"
                                                                        placeholder="{{trans('First Name')}}" value="{{$data->first_name}}" required>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="text-dark"> {{trans('Last Name')}} :</label>
                                                                    <input class="form-control " name="last_name"
                                                                        placeholder="{{trans('Last Name')}}" value="{{$data->last_name}}"
                                                                        required>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label class="text-dark"> {{trans('E-Mail')}} :</label>
                                                                    <input class="form-control " name="email"
                                                                        placeholder="Email Address" value="{{$data->email}}"
                                                                        required>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label class="text-dark"> {{trans('Select Country')}} :</label>
                                                                    <select name="country_id" id="event-country"
                                                                            class="form-control " required>
                                                                        <option value="" @if(old('country_id') == '') selected @endif></option>
                                                                        @foreach($countries as $k => $country)
                                                                            <option value="{{$country->id}}" @if($data->country_id == $country->id) selected @endif>
                                                                                {{$country->name}}
                                                                            </option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-md-4">
                                                                    <label class="text-dark"> {{trans('Phone')}} :</label>
                                                                    <input type="hidden" class="phone_code" name="phone_code" value="+49">
                                                                    <input class="form-control dialcode-set phone" aria-describedby="inputGroup-sizing-lg" name="phone"
                                                                        placeholder="{{trans('Mobile Number')}}" value="{{$data->phone}}"
                                                                        required>
                                                                </div>
                                                                <div class="form-group col-md-12">
                                                                    <label class="text-dark"> {{trans('Address')}} :</label>
                                                                    <textarea type="hidden" class="form-control dialcode-set address" name="address">{{$data->address}}</textarea>
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <label class="text-dark"> {{trans('City')}} :</label>
                                                                    <input type="text" name="city" placeholder="City"
                                                                           class="form-control " value="{{$data->city}}">
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <label class="text-dark"> {{trans('State')}} :</label>
                                                                    <input type="text" name="state" placeholder="State"
                                                                           class="form-control " value="{{$data->state}}">
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <label class="text-dark"> {{trans('Post Code')}} :</label>
                                                                    <input type="text" name="post_code" placeholder="Post Code"
                                                                           class="form-control " value="{{$data->post_code}}">
                                                                </div>
                                                                <div class="form-group col-md-3">
                                                                    <label class="text-dark"> {{trans('Preferred Language')}} :</label>
                                                                    <select name="language_id" id="event-language"
                                                                            class="form-control " required>
                                                                        <option value="" @if(old('language') == '') selected @endif></option>
                                                                        @foreach($languages as $k => $language)
                                                                            <option value="{{$language->id}}" @if($data->language_id == $language->id) selected @endif>
                                                                                {{$language->name}}
                                                                            </option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="text-dark"> {{trans('Password')}} :</label>
                                                                    <input type="password" name="password" placeholder="Password"
                                                                        class="form-control " value="">
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="text-dark"> {{trans('Select Role')}} :</label>
                                                                    <select name="role" id="event-role"
                                                                            class="form-control " required>
                                                                            <option value="" @if(old('role') == '') selected @endif></option>
                                                                            @foreach($roles as $k => $role)
                                                                            <option value="{{$role->id}}" @if($data->role_id == $role->id) selected @endif>
                                                                                {{$role->role}}
                                                                            </option>
                                                                            @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="form-group col-md-6">
                                                                    <label class="text-dark"> {{trans('Select Status')}} :</label>
                                                                    <select name="status" id="event-status"
                                                                            class="form-control " required>
                                                                        <option value="1" @if($data->status == '1') selected @endif>
                                                                            {{trans('Active')}}
                                                                        </option>
                                                                        <option value="0" @if($data->status == '0') selected @endif>
                                                                            {{trans('DeActive')}}
                                                                        </option>
                                                                    </select>
                                                                    <br>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                                                            <button type="submit" class="btn btn-success" >@lang('Update')</button>
                                                        </div>

                                                    </form>


                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    @endif
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="role" role="tabpanel" aria-labelledby="home-tab" class="tab-pane fade px-3 pt-3">
                    @if(adminAccessRoute(config('role.manage_staff.access.add')))
                    <div class="d-flex justify-content-end mb-2 text-right">
                        <button  data-target="#addRoleModal"  data-toggle="modal"  class="btn btn-primary btn-sm"><i class="fa fa-user-plus"></i> {{trans('Add New Role')}} </button>
                    </div>
                    @endif

                    <div class="table-responsive">
                        <table class="categories-show-table table table-hover table-striped table-bordered">
                            <thead class="thead-dark">
                            <tr>
                                <th scope="col">@lang('SL')</th>
                                <th scope="col">@lang('Role')</th>
                                @if(adminAccessRoute(config('role.manage_staff.access.edit')))
                                <th scope="col">@lang('Action')</th>
                                @endif
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($roles as $k => $role)
                                <tr>
                                    <td data-label="SL">{{++$k}}</td>
                                    <td data-label="Username"><strong>{{$role->role}}</strong></td>
                                    @if(adminAccessRoute(config('role.manage_staff.access.edit')))
                                    <td data-label="@lang('Action')">
                                        <button
                                                class="edit_button   btn btn-primary  text-white  btn-sm "
                                                data-target="#myRoleModal{{$role->id}}"
                                                data-id="{{$role->id }}"
                                                data-toggle="modal">
                                                <i class="fa fa-edit"></i>
                                        </button>

                                        <!-- Modal for Edit button -->
                                        <div class="modal fade" id="myRoleModal{{$role->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                            aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content ">
                                                    <div class="modal-header modal-colored-header bg-primary">
                                                        <h4 class="modal-title" id="myModalLabel">@lang('Manage Role')</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    </div>

                                                    <form role="form" method="POST" class="actionRoute" action="{{route('admin.updateRole', $role)}}" enctype="multipart/form-data">
                                                        @csrf
                                                        @method('put')
                                                        <div class="modal-body">

                                                            <div class="row">
                                                                <div class="form-group col-md-6">
                                                                    <label class="text-dark"> {{trans('Name')}} :</label>
                                                                    <input class="form-control " name="name"
                                                                        placeholder="{{trans('Name')}}" value="{{$role->role}}" required>
                                                                </div>

                                                                <div class="form-group col-md-12">
                                                                    <div class="card">
                                                                        <div class="card-header d-flex justify-content-between text-center">
                                                                            <h5 class="card-title text-center">{{trans('Accessibility')}}</h5>
                                                                        </div>

                                                                        <div class="card-body select-all-access">
                                                                            <div class="form-group">
                                                                                <label><input type="checkbox" class="selectAll" name="accessAll"> {{trans('Select All')}}</label>
                                                                            </div>

                                                                            <table class=" table table-hover table-striped table-bordered text-center">
                                                                                <thead class="thead-dark">
                                                                                <tr>
                                                                                    <th class="text-left">@lang('Permissions')</th>
                                                                                    <th>@lang('View')</th>
                                                                                    <th>@lang('Add')</th>
                                                                                    <th>@lang('Edit')</th>
                                                                                    <th>@lang('Delete')</th>
                                                                                </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                @foreach(config('role') as $key => $value)
                                                                                <tr>
                                                                                    <td data-label="Permissions" class="text-left">{{$value['label']}}</td>
                                                                                    <td data-label="View">
                                                                                        @if(!empty($value['access']['view']))
                                                                                        <input type="checkbox" value="{{join(',',$value['access']['view'])}}" name="access[]"
                                                                                        @if(in_array_any( $value['access']['view'], $role->permissions ))
                                                                                            checked
                                                                                        @endif
                                                                                        />
                                                                                        @endif
                                                                                    </td>
                                                                                    <td data-label="Add">
                                                                                        @if(!empty($value['access']['add']))
                                                                                        <input type="checkbox" value="{{join(',',$value['access']['add'])}}" name="access[]"

                                                                                        @if(in_array_any($value['access']['add'], $role->permissions))
                                                                                            checked
                                                                                            @endif
                                                                                        />
                                                                                        @endif
                                                                                    </td>
                                                                                    <td data-label="Edit">
                                                                                        @if(!empty($value['access']['edit']))
                                                                                        <input type="checkbox" value="{{join(',',$value['access']['edit'])}}" name="access[]"
                                                                                            @if(in_array_any($value['access']['edit'], $role->permissions))
                                                                                            checked
                                                                                            @endif/>
                                                                                        @endif
                                                                                    </td>

                                                                                    <td data-label="Delete">
                                                                                        @if(!empty($value['access']['delete']))
                                                                                        <input type="checkbox" value="{{join(',',$value['access']['delete'])}}" name="access[]"
                                                                                            @if(in_array_any( $value['access']['delete'], $role->permissions))
                                                                                            checked
                                                                                            @endif
                                                                                        />
                                                                                        @endif
                                                                                    </td>
                                                                                </tr>
                                                                                @endforeach
                                                                                </tbody>
                                                                            </table>


                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                                                            <button type="submit" class="btn btn-success" >@lang('Update')</button>
                                                        </div>

                                                    </form>


                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    @endif
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>


        </div>
    </div>





    <!-- Modal for Add button -->
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Manage User')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <form role="form" method="POST" class="actionRoute" action="{{route('admin.storeStaff')}}" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="text-dark"> {{trans('First Name(s)')}} :</label>
                                <input class="form-control " name="first_name"
                                       placeholder="{{trans('First Name')}}" value="" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="text-dark"> {{trans('Last Name')}} :</label>
                                <input class="form-control " name="last_name"
                                       placeholder="{{trans('Last Name')}}" value=""
                                       required>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="text-dark"> {{trans('E-Mail')}} :</label>
                                <input class="form-control " name="email"
                                       placeholder="Email Address" value="{{old('email')}}"
                                       required>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="text-dark"> {{trans('Select Country')}} :</label>
                                <select name="country_id" id="event-country"
                                        class="form-control " required>
                                    <option value="" @if(old('country_id') == '') selected @endif></option>
                                    @foreach($countries as $k => $country)
                                        <option value="{{$country->id}}">
                                            {{$country->name}}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="text-dark"> {{trans('Phone')}} :</label>
                                <input type="hidden" class="phone_code" name="phone_code" value="+49">
                                <input class="form-control dialcode-set phone" aria-describedby="inputGroup-sizing-lg" name="phone"
                                       placeholder="{{trans('Mobile Number')}}" value="{{old('phone')}}"
                                       required>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="text-dark"> {{trans('Address')}} :</label>
                                <textarea type="hidden" class="form-control dialcode-set address" name="address"></textarea>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="text-dark"> {{trans('City')}} :</label>
                                <input type="text" name="city" placeholder="City"
                                       class="form-control " value="{{old('city')}}">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="text-dark"> {{trans('State')}} :</label>
                                <input type="text" name="state" placeholder="State"
                                       class="form-control " value="{{old('state')}}">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="text-dark"> {{trans('Post Code')}} :</label>
                                <input type="text" name="post_code" placeholder="Post Code"
                                       class="form-control " value="{{old('post_code')}}">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="text-dark"> {{trans('Preferred Language')}} :</label>
                                <select name="language_id" id="event-language"
                                        class="form-control " required>
                                    <option value=""></option>
                                    @foreach($languages as $k => $language)
                                        <option value="{{$language->id}}">
                                            {{$language->name}}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="text-dark"> {{trans('Password')}} :</label>
                                <input type="password" name="password" placeholder="Password"
                                       class="form-control " value="{{old('password')}}">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="text-dark"> {{trans('Select Role')}} :</label>
                                <select name="role" id="event-role"
                                        class="form-control " required>
                                        <option value="" @if(old('role') == '') selected @endif></option>
                                        @foreach($roles as $k => $role)
                                        <option value="{{$role->id}}" @if(old('role') == '{{$role->id}}') selected @endif>
                                            {{$role->role}}
                                        </option>
                                        @endforeach
                                </select>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="text-dark"> {{trans('Select Status')}} :</label>
                                <select name="status" id="event-status"
                                        class="form-control " required>
                                    <option value="1" @if(old('status') == '1') selected @endif>
                                        {{trans('Active')}}
                                    </option>
                                    <option value="0" @if(old('status') == '0') selected @endif>
                                        {{trans('DeActive')}}
                                    </option>
                                </select>
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-success" >@lang('Save')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content ">
                <div class="modal-header modal-colored-header bg-primary">
                    <h4 class="modal-title" id="myModalLabel">@lang('Manage Role')</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <form role="form" method="POST" class="actionRoute" action="{{route('admin.storeRole')}}" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">

                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="text-dark"> {{trans('Name')}} :</label>
                                <input class="form-control " name="name"
                                       placeholder="{{trans('Name')}}" value="{{old('name')}}" required>
                            </div>

                            <div class="form-group col-md-12">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between text-center">
                                        <h5 class="card-title text-center">{{trans('Accessibility')}}</h5>
                                    </div>

                                    <div class="card-body select-all-access">
                                        <div class="form-group">
                                            <label><input type="checkbox" class="selectAll" name="accessAll"> {{trans('Select All')}}</label>
                                        </div>

                                        <table class=" table table-hover table-striped table-bordered text-center">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th class="text-left">@lang('Permissions')</th>
                                                <th>@lang('View')</th>
                                                <th>@lang('Add')</th>
                                                <th>@lang('Edit')</th>
                                                <th>@lang('Delete')</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach(config('role') as $key => $value)
                                                <tr>
                                                    <td data-label="Permissions" class="text-left">{{$value['label']}}</td>
                                                    <td data-label="View">
                                                        @if(!empty($value['access']['view']))
                                                            <input type="checkbox" value="{{join(',',$value['access']['view'])}}" name="access[]"/>
                                                        @endif
                                                    </td>
                                                    <td data-label="Add">
                                                        @if(!empty($value['access']['add']))
                                                            <input type="checkbox" value="{{join($value['access']['add'])}}" name="access[]"/>
                                                        @endif
                                                    </td>
                                                    <td data-label="Edit">
                                                        @if(!empty($value['access']['edit']))
                                                            <input type="checkbox" value="{{join($value['access']['edit'])}}" name="access[]"/>
                                                        @endif
                                                    </td>
                                                    <td data-label="Delete">
                                                        @if(!empty($value['access']['delete']))
                                                            <input type="checkbox" value="{{join($value['access']['delete'])}}" name="access[]"/>
                                                        @endif
                                                    </td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>


                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">@lang('Close')</button>
                        <button type="submit" class="btn btn-success" >@lang('Save')</button>
                    </div>

                </form>


            </div>
        </div>
    </div>

@endsection

@push('js')

    <script>
        $(document).ready(function () {
            "use strict";
            $('.selectAll').on('click', function () {
                if($(this).is(':checked')){
                    $(this).parents('.select-all-access').find('input[type="checkbox"]').attr('checked','checked')
                }else {
                    $(this).parents('.select-all-access').find('input[type="checkbox"]').removeAttr('checked')
                }
            })
        })

    </script>
@endpush

@push('style')
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <link rel="stylesheet" href="{{asset($themeTrue.'css/intlTelInput.css')}}">
    <script src="{{asset($themeTrue.'js/intlTelInput.js')}}"></script>
@endpush
@push('script')
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.12/js/intlTelInput.min.js"></script>
<script>
$(document).ready(function () {
    var phoneInputs = document.querySelectorAll(".phone");
    var inputCountry = document.querySelector("#country");
    var phoneCode = "+49";
    var itiInstances = [];

    // Initialize intlTelInput for each phone input
    phoneInputs.forEach(function(input) {
        var iti = window.intlTelInput(input, {
            separateDialCode: true,
            initialCountry: "de",  // Set the default country to "de"
            preferredCountries: ["de"],
            utilsScript: "{{asset($themeTrue.'js/utils.js')}}",
        });

        itiInstances.push(iti);

        // Attach country change event to each input
        input.addEventListener('countrychange', function(e) {
            var selectedCountryData = iti.getSelectedCountryData();
            console.log('Country changed to:', selectedCountryData.name, selectedCountryData.iso2);

            // Call your custom function here
            handleCountryChange(selectedCountryData, input);
        });
    });

    // Custom function to handle country change
    function handleCountryChange(countryData, inputElement) {
        phoneCode = countryData.iso2;
        console.log('New country selected:', countryData.name, countryData.dialCode);
        // Perform additional actions based on the countryData
        $('.phone_code').val(countryData.dialCode);
    }


});


</script>
