@extends('layouts.master', ['currentPage' => 'bakery-list'])
@section('page-title', 'List Bakery - Admin Page')
@section('content')
    <div class="card">
        <div class="card-body">
            <h3 class="card-title float-left">
                {{ __('messages.list_product') }}
                {{ __('messages.Hiển thị tất cả bánh') }}
            </h3>
            <a href="/admin/bakery/create" class="btn float-right"><i class="fas fa-plus-circle"></i> Create new</a>
            <div class="clearfix"></div>
            <div class="alert alert-success d-none" role="alert" id="messageSuccess"></div>
            <div class="alert alert-danger d-none" role="alert" id="messageError"></div>
            @if(count($bakeries_in_view)>0)
            <table class="table table-striped">
                {{--<tr class="row">--}}
                    {{--<td class="col-md-12">--}}
                        {{--<form action="/admin/bakery/list" method="get">--}}
                            {{--<select name="categoryId">--}}
                                {{--<option value="0">All</option>--}}
                                {{--@foreach($categories as $category)--}}
                                    {{--<option value="{{$category->id}}" {{$category->id==$choosedCategoryId?'selected':''}}>{{$category->name}}</option>--}}
                                {{--@endforeach--}}
                            {{--</select>--}}
                            {{--<input type="submit" value="Search">--}}
                        {{--</form>--}}
                    {{--</td>--}}
                {{--</tr>--}}
                <thead>
                    <tr class="row">
                        <th class="col-md-1"></th>
                        <th class="col-md-1">{{ __('messages.ID') }}</th>
                        <th class="col-md-2">Thumbnail</th>
                        <th class="col-md-2">Name</th>
                        <th class="col-md-2">Description</th>
                        <th class="col-md-1">Price</th>
                        <th class="col-md-3">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($bakeries_in_view as $item)
                    <tr class="row" id="row-item-{{$item->id}}">
                        <td class="col-md-1 text-center">
                            <input type="checkbox" class="check-item">
                        </td>
                        <td class="col-md-1">{{$item->id}}</td>
                        <td class="col-md-2">
                            <div class="card"
                                 style="background-image: url('{{$item->images}}'); background-size: cover; width: 60px; height: 60px;">
                            </div>
                        </td>
                        <td class="col-md-2">{{$item->name}}</td>
                        <td class="col-md-2">{{$item->description}}</td>
                        <td class="col-md-1">{{$item->price}}</td>
                        <td class="col-md-3">
                            <a href="#" class="btn btn-link btn-quick-edit">Quick Edit</a>&nbsp;&nbsp;
                            <a href="/admin/bakery/edit/{{$item -> id}}" class="btn btn-link btn-edit">Edit</a>&nbsp;&nbsp;
                            <a href="#" id="{{$item-> id}}" class="btn btn-link btn-delete">Delete</a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="row">
                <div class="col-md-8 form-inline">
                    <div class="form-check mb-2">
                        <input class="form-check-input" type="checkbox" value="" id="check-all">
                        <label class="form-check-label" for="defaultCheck1">
                            Check all
                        </label>
                    </div>
                    <div class="form-group mx-sm-3 mb-2">
                        <select id="select-action" class="form-control">
                            <option selected value="0">--Select action--</option>
                            <option value="1">Delete all checked</option>
                            <option value="2">Another action</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary mb-2" id="btn-apply">Apply</button>
                </div>
                <div class="col-md-4">
                    <div class="float-right">
                        {{--{{ $bakeries_in_view ->links() }}--}}
                    </div>
                </div>
            </div>
            @else
                <div class="alert alert-info" role="alert">
                    Have no bakery, click <a href="/admin/bakery/create">here</a> to create new.
                </div>
            @endif
        </div>
    </div>

    <!-- Modal Edit BAkery-->
    <div class="modal fade" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Quick Edit Bakery</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="" name="edit-bakery-form">
                        <input type="hidden" name="id">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control w-50">
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input type="number" name="price" class="form-control w-25">
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input type="text" name="images" class="form-control">
                            <img src="" alt="" class="img-thumbnail mt-2" style="width: 100px">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="btn-update-bakery">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <script>
        var listDeleteButton = document.getElementsByClassName('btn-delete');
        for (var i = 0; i < listDeleteButton.length; i++) {
            listDeleteButton[i].onclick = function () {
                if(confirm('Are you sure ?')){
                    var params = '_token={{csrf_token()}}';
                    var currentId = this.id;
                    var xhttp = new XMLHttpRequest();
                    xhttp.open("POST", "/admin/bakery/destroy/" + currentId, true);
                    xhttp.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                            alert('Delete success!');
                        }
                    };
                    xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xhttp.send(params);
                }
            }
        }
    </script>
    <script src="{{asset('js/myscript.js')}}"></script>
@endsection