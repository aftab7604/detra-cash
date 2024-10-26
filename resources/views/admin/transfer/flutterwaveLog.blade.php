@if(isset($exactServices))
    @if($sendMoney->flutter_status)
        <div class="row">
            <div class="col-md-12">
                <div id="accordion">
                    <div class="card">
                        <div class="card-header justify-content-between d-flex"
                             id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse"
                                        data-target="#collapseOne" aria-expanded="true"
                                        aria-controls="collapseOne">
                                    Payment Sending Log
                                </button>
                            </h5>

                            @if($sendMoney->flutter_status)
                                <div
                                    class="alert alert-{{$sendMoney->flutter_status == 'success' ? 'success':'danger'}} "
                                    role="alert">
                                    <strong>{{$sendMoney->flutter_status}} : </strong>
                                    {{$sendMoney->flutter_response}}
                                </div>
                            @endif
                        </div>
                        <div id="collapseOne" class="collapse show"
                             aria-labelledby="headingOne"
                             data-parent="#accordion">
                            <div class="card-body">

                                <table
                                    class="categories-show-table table table-hover table-striped table-bordered">
                                    <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">@lang('ID')</th>
                                        <th scope="col">@lang('Status')</th>
                                        <th scope="col">@lang('Message')</th>
                                        <th scope="col">@lang('Detail')</th>
                                        <th scope="col">@lang('Verify At')</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @forelse($sendMoney->flutterTransactions  as $k => $row)
                                        <tr>
                                            <td data-label="@lang('ID')">
                                                @lang($row->data_id)
                                                @if(!$row->verified_at && $row->data_id)

                                                    <a href="{{route('admin.money-transfer.flutterVerifyTrx',$row->data_id)}}"
                                                       class="btn btn-secondary btn-sm"><i
                                                            class="fa fa-check-circle"></i>
                                                        Verify</a>
                                                @endif
                                            </td>
                                            <td data-label="@lang('Status')">
                                                                        <span
                                                                            class="text-{{($row->status == "success") ? 'success' :'danger'}}">{{$row->status}}</span>
                                            </td>

                                            <td data-label="@lang('Message')"> {{$row->message}}</td>
                                            <td data-label="@lang('Detail')">
                                                @if(isset($row->details))
                                                    <ul class="list">
                                                        @foreach($row->details as $params => $val)
                                                            <li @if( in_array($params,['processor_response','status']) ) class="text-success" @endif>
                                                                <strong>{{@$params}}
                                                                    :</strong> {{print_r($val)}}
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                @endif
                                            </td>
                                            <td data-label="@lang('Verify At')">{{($row->verified_at) ? dateTime($row->verified_at, 'd M, Y h:i A') : '-'}}</td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td class="text-center text-danger"
                                                colspan="100%">@lang('No User Data')</td>
                                        </tr>
                                    @endforelse
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    @endif
@endif
