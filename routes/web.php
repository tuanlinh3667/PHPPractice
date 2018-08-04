<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/admin/apartment/list', 'ApartmentController@index');
Route::get('/admin/apartment/show', 'ApartmentController@show');
Route::get('/admin/apartment/create', 'ApartmentController@create');
Route::post('/admin/apartment/store', 'ApartmentController@store');
Route::get('/admin/apartment/edit/{id}', 'ApartmentController@edit');
Route::post('/admin/apartment/update', 'ApartmentController@update');
Route::get('/admin/apartment/delete/{id}', 'ApartmentController@delete');
Route::post('/admin/apartment/destroy/{id}', 'ApartmentController@destroy');

Route::resource('admin/category', 'CategoryController');
Route::resource('admin/collection', 'CollectionController');
Route::resource('admin/article', 'ArticleController');

Route::get('/demo', function (){
    return view('layouts.master');
});

Route::delete("/admin/apartment/destroy-many", "ApartmentController@destroyMany");
Route::get("/admin/apartment/get-json/{id}", "ApartmentController@showJson");
Route::put("/admin/apartment/update-json/{id}", "ApartmentController@quickUpdate");

Route::get('/change-language/{locale}', function ($locale){
    \Illuminate\Support\Facades\Session::put('lang', $locale);
    return redirect() -> back();
});



