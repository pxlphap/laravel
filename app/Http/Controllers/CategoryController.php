<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Session;
use DB;
use Illuminate\Support\Facades\Redirect;
use App\Models\Category;
use App\Models\Brand;
use App\Models\Product;
session_start();


class CategoryController extends Controller
{
    public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('login')->send();
        }
    }
    public function add_category(){
        return view('admin.add_category');
    }
    public function all_category(){
        $all_category = DB::table('tbl_category_product')->get();
        $manager_category_product = view('admin.all_category')->with('all_category_product', $all_category);
        return view('admin.dashboard')->with('admin.all_category', $manager_category_product);
    }

    public function save_category_product(Request $request){
        $data = array();
        $data['category_name'] = $request->category_product_name;
        $data['category_desc'] = $request->category_product_desc;
        $data['category_status'] = $request->category_status;
        DB::table('tbl_category_product')->insert($data);
        Session::put('message','Thêm danh mục sản phẩm thành công!');
        return Redirect::to('all-category');
    }
    public function active_category($category_id){
        DB::table('tbl_category_product')->where('category_id', $category_id)->update(['category_status' => 1]);
        Session::put('message', 'Kích hoạt danh mục thành công!');
        return Redirect::to('all-category');
    }

    public function deactive_category($category_id){
        DB::table('tbl_category_product')->where('category_id', $category_id)->update(['category_status' => 0]);
        Session::put('message', 'Ngừng kích hoạt danh mục thành công!');
        return Redirect::to('all-category');
    }
    public function edit_category_product($category_id){
        $edit_category_product = DB::table('tbl_category_product')->where('category_id',$category_id)->get();
        $manager_category_product = view('admin.edit_category')->with('edit_category_product',$edit_category_product);
        return view('admin.dashboard')->with('admin.edit_category', $manager_category_product);
    }
    public function remove_category_product($category_id){
        DB::table('tbl_category_product')->where('category_id',$category_id)->delete();
        Session::put('message', 'Xoá danh mục sản phẩm thành công!');
        return Redirect::to('all-category');
    }
    public function update_category_product(Request $request,$category_id){
        $data = array();
        $data['category_name'] = $request->category_product_name;
        $data['category_desc'] = $request->category_product_desc;
        DB::table('tbl_category_product')->where('category_id',$category_id)->update($data);
        Session::put('message', 'Cập nhật danh mục sản phẩm thành công!');
        return Redirect::to('all-category');
    }
    public function show_category_home(Request $request, $category_id){
        $category = DB::table('tbl_category_product')
            ->where('category_status', '1')
            ->orderBy('category_id', 'desc')
            ->get();

        $brand = DB::table('tbl_brand')
            ->where('brand_status', '1')
            ->orderBy('brand_id', 'desc')
            ->get();

        $category_by_id = DB::table('tbl_product')
            ->join('tbl_category_product', 'tbl_product.category_id', '=', 'tbl_category_product.category_id')
            ->where('tbl_product.category_id', $category_id)
            ->get();

        // Lấy thông tin category_name từ bảng tbl_category_product
        $category_name = DB::table('tbl_category_product')
            ->where('category_id', $category_id)
            ->value('category_name');

        return view('pages.category.category_by_id', compact('category', 'brand', 'category_by_id', 'category_name'));
    }
    
}   
