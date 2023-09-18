<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Session;
use DB;
use Illuminate\Support\Facades\Redirect;
session_start();

class BrandProduct extends Controller
{
    public function add_brand(){
        return view('admin.add_brand');
    }
    public function all_brand(){
        $all_brand = DB::table('tbl_brand')->get();
        $manager_brand_product = view('admin.all_brand')->with('all_brand_product', $all_brand);

        return view('admin.dashboard')->with('admin.all_brand', $manager_brand_product);
    }

    public function save_brand_product(Request $request){
        $data = array();
        $data['brand_name'] = $request->brand_product_name;
        $data['brand_desc'] = $request->brand_product_desc;
        $data['brand_status'] = $request->brand_status;
        DB::table('tbl_brand')->insert($data);
        Session::put('message','Thêm danh mục sản phẩm thành công!');
        return Redirect::to('all-brand');
    }
    public function active_brand($brand_id){
        DB::table('tbl_brand')->where('brand_id', $brand_id)->update(['brand_status' => 1]);
        Session::put('message', 'Kích hoạt danh mục thành công!');
        return Redirect::to('all-brand');
    }

    public function deactive_brand($brand_id){
        DB::table('tbl_brand')->where('brand_id', $brand_id)->update(['brand_status' => 0]);
        Session::put('message', 'Ngừng kích hoạt danh mục thành công!');
        return Redirect::to('all-brand');
    }
    public function edit_brand_product($brand_id){
        $edit_brand_product = DB::table('tbl_brand')->where('brand_id',$brand_id)->get();
        $manager_brand_product = view('admin.edit_brand')->with('edit_brand_product',$edit_brand_product);
        return view('admin.dashboard')->with('admin.edit_brand', $manager_brand_product);
    }
    public function remove_brand_product($brand_id){
        DB::table('tbl_brand')->where('brand_id',$brand_id)->delete();
        Session::put('message', 'Xoá danh mục sản phẩm thành công!');
        return Redirect::to('all-brand');
    }
    public function update_brand_product(Request $request, $brand_id){
        $data = array();
        $data['brand_name'] = $request->brand_product_name;
        $data['brand_desc'] = $request->brand_product_desc;
        DB::table('tbl_brand')->where('brand_id',$brand_id)->update($data);
        Session::put('message', 'Cập nhật danh mục sản phẩm thành công!');
        return Redirect::to('all-brand');
    }
    public function show_brand_home(Request $request, $brand_id){
        $category = DB::table('tbl_category_product')
            ->where('category_status', '1')
            ->orderBy('category_id', 'desc')
            ->get();

        $brand = DB::table('tbl_brand')
            ->where('brand_status', '1')
            ->orderBy('brand_id', 'desc')
            ->get();

        $brand_by_id = DB::table('tbl_product')
            ->join('tbl_brand', 'tbl_product.brand_id', '=', 'tbl_brand.brand_id')
            ->where('tbl_product.brand_id', $brand_id)
            ->get();

        $brand_name = DB::table('tbl_brand')
            ->where('brand_id', $brand_id)
            ->value('brand_name');

        return view('pages.brand.brand_by_id', compact('category', 'brand', 'brand_by_id', 'brand_name'));
    }


}
