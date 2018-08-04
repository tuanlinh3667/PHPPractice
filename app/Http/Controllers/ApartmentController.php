<?php
/**
 * Created by PhpStorm.
 * User: xuanhung
 * Date: 7/17/18
 * Time: 6:34 PM
 */

namespace App\Http\Controllers;

use App;
use App\Apartment;
use App\Category;
use App\Http\Requests\StoreApartmentPost;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use JD\Cloudder\Facades\Cloudder;

class ApartmentController extends Controller
{
    // trả về danh sách bánh.
    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        App::setLocale('vi');
        $categories = Category::all();
        $apartment = Apartment::get();
        return view('admin.apartment.list')
            ->with('apartment_in_view', $apartment)
            ->with('categories', $categories)
            ->with('choosedCategoryId', Input::get('categoryId'));
    }

    // show một sản phẩm.
    public function show()
    {
        return 'show';
    }

    public function showJson($id)
    {
        $apartment = Apartment::find($id);
        if ($apartment == null) {
            return response()->json(['msg' => 'Not found'], 404);
        }
        return response()->json(['item' => $apartment], 200);
    }

    // trả về form.
    public function create()
    {
        $apartment = new Apartment();
        $action = '/admin/apartment/store';
        return view('admin.apartment.form')
            ->with('apartment', $apartment)
            ->with('action', $action);
    }

    // lưu thông tin sản phẩm vào db.
    public function store(StoreApartmentPost $request)
    {
        $request->validated();
        $apartment = new Apartment();
        $apartment->name = Input::get('name');
        $apartment->categoryId = Input::get('categoryId');
        $apartment->price = Input::get('price');
        $apartment->adress = Input::get('adress');
        if(Input::hasFile('images')){
            $image_id = time();
            Cloudder::upload(Input::file('images')->getRealPath(), $image_id);
            $apartment->images = Cloudder::secureShow($image_id);
        }

        $apartment->content = Input::get('content');
        $apartment->description = Input::get('description');
        $apartment->save();
        return redirect('/admin/apartment/list');
    }

    // lấy thông tin sản phẩm cần sửa, đưa về form.
    public function edit($id)
    {
        $action = '/admin/apartment/update';
        $apartment = Apartment::find($id);
        if ($apartment == null) {
            return view('404');
        }
        return view('admin.apartment.form')
            ->with('apartment', $apartment)
            ->with('action', $action);
    }

    // lưu thông tin mới của sản phẩm vào db.
    public function update()
    {
        $id = Input::get('id');
        $apartment = App\Apartment::find($id);
        if ($apartment == null) {
            return view('404');
        }
        $apartment->name = Input::get('name');
        $apartment->categoryId = Input::get('categoryId');
        $apartment->price = Input::get('price');
        $apartment->adress = Input::get('description');
        if(Input::hasFile('images')){
            $image_id = time();
            Cloudder::upload(Input::file('images')->getRealPath(), $image_id);
            $apartment->images = Cloudder::secureShow($image_id);
        }
        $apartment->content = Input::get('content');
        $apartment->note = Input::get('note');
        $apartment->save();
        return redirect('/admin/apartment/list');
    }

    public function quickUpdate(StoreApartmentPost $request, $id)
    {
        $request->validated();
        $apartment = App\Apartment::find($id);
        if ($apartment == null) {
            return response()->json(['msg' => 'Not found'], 404);
        }
        $apartment->name = Input::get('name');
        $apartment->price = Input::get('price');
        $apartment->images = Input::get('images');
        $apartment->save();
        return response()->json(['item' => $apartment], 200);
    }

    // xoá sản phẩm.
    public function delete($id)
    {
        $apartment = App\Apartment::find($id);
        if ($apartment == null) {
            return view('404');
        }
        return view('admin.apartment.confirm_delete')->with('apartment', $apartment);
    }

    // xoá sản phẩm.
    public function destroy($id)
    {
        $apartment = App\Apartment::find($id);
        if ($apartment == null) {
            return view('404');
        }
        $apartment->delete();
        return redirect('/admin/apartment/list');
    }

    public function destroyMany()
    {
        App\Apartment::destroy(Input::get('ids'));
        return Input::get('ids');
    }
}