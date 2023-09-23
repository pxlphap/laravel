<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Session;
use DB;
use Illuminate\Support\Facades\Redirect;
session_start();

class ProductController extends Controller
{
    public function add_product(){
        $cate_product =  DB::table('tbl_category_product')->orderby('category_id','desc')->get();
        $brand_product =  DB::table('tbl_brand')->orderby('brand_id','desc')->get();
        return view('admin.add_product')->with('category_product', $cate_product)->with('brand_product', $brand_product);
    }
    public function all_product(){
        $all_product = DB::table('tbl_product')
        ->join('tbl_category_product', 'tbl_category_product.category_id', '=', 'tbl_product.category_id')
        ->join('tbl_brand', 'tbl_brand.brand_id', '=', 'tbl_product.brand_id') 
        ->orderBy('tbl_product.product_id', 'desc')
        ->get();
        
        $manager_product = view('admin.all_product')->with('all_product', $all_product);

        return view('admin.dashboard', ['admin.all_product' => $manager_product]);
    }
    public function thong_ke_san_pham(){
        $all_product = DB::table('tbl_product')
        ->join('tbl_category_product', 'tbl_category_product.category_id', '=', 'tbl_product.category_id')
        ->join('tbl_brand', 'tbl_brand.brand_id', '=', 'tbl_product.brand_id') 
        ->orderBy('tbl_product.product_id', 'desc')
        ->get();
        
        $manager_product = view('admin.statistical_product')->with('all_product', $all_product);

        return view('admin.dashboard', ['admin.statistical_product' => $manager_product]);
    }
   
    public function save_product(Request $request){
        $data = array();
        $data['product_name'] = $request->product_name;
        $data['product_price'] = $request->product_price;
        $data['product_desc'] = $request->product_desc;
        $data['product_content'] = $request->product_content;
        $data['category_id'] = $request->product_category;
        $data['brand_id'] = $request->product_brand;
        $data['product_status'] = $request->product_status;

        $get_image =  $request->file('product_image');
        
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.',$get_name_image));
            $new_image = $name_image.rand(0,99).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('public/upload/product', $new_image);
            $data['product_image'] = $new_image;
            DB::table('tbl_product')->insert($data);
            Session::put('message','Thêm sản phẩm thành công, vui lòng thêm ảnh để sản phẩm được hiển thị rõ ràng hơn');
            return Redirect::to('add-product');
        }
        else{
             DB::table('tbl_product')->insert($data);
            Session::put('message','Thêm sản phẩm thành công');
            return Redirect::to('add-product');
        }
       
    }
    public function active_product($product_id){
        DB::table('tbl_product')->where('product_id', $product_id)->update(['product_status' => 1]);
        Session::put('message', 'Kích hoạt thành công!');
        return Redirect::to('all-product');
    }

    public function deactive_product($product_id){
        DB::table('tbl_product')->where('product_id', $product_id)->update(['product_status' => 0]);
        Session::put('message', 'Ngừng kích hoạt thành công!');
        return Redirect::to('all-product');
    }
    public function edit_product($product_id){
        $cate_product =  DB::table('tbl_category_product')->orderby('category_id','desc')->get();
        $brand_product =  DB::table('tbl_brand')->orderby('brand_id','desc')->get();
        $edit_product = DB::table('tbl_product')->where('product_id',$product_id)->get();
        $manager_product = view('admin.edit_product', [
            'edit_product' => $edit_product,
            'category_product' => $cate_product,
            'brand_product' => $brand_product
        ]);
        return view('admin.dashboard')->with('manager_product', $manager_product);

    }
    public function remove_product($product_id){
        DB::table('tbl_product')->where('product_id',$product_id)->delete();
        Session::put('message', 'Xoá sản phẩm thành công!');
        return Redirect::to('all-product');
    }
    public function update_product(Request $request, $product_id){
        $data = array();
        $data['product_name'] = $request->product_name;
        $data['product_price'] = $request->product_price;
        $data['quantity'] = $request->product_quanlity;
        $data['product_desc'] = $request->product_desc;
        $data['product_content'] = $request->product_content;
        $data['category_id'] = $request->product_category;
        $data['brand_id'] = $request->product_brand;
        $data['product_status'] = $request->product_status;
        $get_image =  $request->file('product_image');
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.',$get_name_image));
            $new_image = $name_image.rand(0,99).'.'.$get_image->getClientOriginalExtension();
            $get_image->move('public/upload/product', $new_image);
            $data['product_image'] = $new_image;
            DB::table('tbl_product')->where('product_id',$product_id)->update($data);
            Session::put('message', 'Cập nhật sản phẩm thành công!');
            return Redirect::to('all-product');
        }
        else{
            DB::table('tbl_product')->where('product_id',$product_id)->update($data);
            Session::put('message', 'Cập nhật sản phẩm thành công!');
            return Redirect::to('all-product');
        }
    }
    public function chi_tiet_san_pham($product_id){
        $category = DB::table('tbl_category_product')
            ->where('category_status', '1')
            ->orderBy('category_id', 'desc')
            ->get();

        $brand = DB::table('tbl_brand')
            ->where('brand_status', '1')
            ->orderBy('brand_id', 'desc')
            ->get();
        $detail_product = DB::table('tbl_product')
        ->join('tbl_category_product', 'tbl_category_product.category_id', '=', 'tbl_product.category_id')
        ->join('tbl_brand', 'tbl_brand.brand_id', '=', 'tbl_product.brand_id') 
        ->where('tbl_product.product_id', $product_id)->get();
         foreach ($detail_product as $key => $value) {
            $category_id = $value->category_id;
        }
         $related_product = DB::table('tbl_product')
            ->join('tbl_category_product', 'tbl_category_product.category_id', '=', 'tbl_product.category_id')
            ->join('tbl_brand', 'tbl_brand.brand_id', '=', 'tbl_product.brand_id')
            ->where('tbl_product.category_id', $category_id)->whereNotIn('tbl_product.product_id',[$product_id])->take(3)->get();

        return view('pages.product.detail-product', compact('category', 'brand', 'detail_product', 'related_product'));
    }

}
