<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Session;
use DB;
use Illuminate\Support\Facades\Redirect;
session_start();


class HomeController extends Controller
{
    public function index(){
        $category = DB::table('tbl_category_product')
        ->where('category_status', '1')
        ->orderBy('category_id', 'desc')
        ->get();

        $brand = DB::table('tbl_brand')
        ->where('brand_status', '1')
        ->orderBy('brand_id', 'desc')
        ->get();

        $all_product = DB::table('tbl_product')->where('product_status','1')->orderby('product_id','desc')->limit(9)->get();
        return view('pages.home', compact('category', 'brand','all_product'));
    }
    public function search(Request $request){

        $keywords = $request->keywords_submit;

        $category = DB::table('tbl_category_product')
        ->where('category_status', '1')
        ->orderBy('category_id', 'desc')
        ->get();

        $brand = DB::table('tbl_brand')
        ->where('brand_status', '1')
        ->orderBy('brand_id', 'desc')
        ->get();

        $search_product = DB::table('tbl_product')->where('product_name','like','%'.$keywords.'%')->get(); 

        return view('pages.product.search', compact('category', 'brand','search_product'));
    }
    public function contact(){
        $category = DB::table('tbl_category_product')
        ->where('category_status', '1')
        ->orderBy('category_id', 'desc')
        ->get();

        $brand = DB::table('tbl_brand')
        ->where('brand_status', '1')
        ->orderBy('brand_id', 'desc')
        ->get();
        return view('pages.contact', compact('category', 'brand'));
    }
    public function shop_info(){
        $category = DB::table('tbl_category_product')
        ->where('category_status', '1')
        ->orderBy('category_id', 'desc')
        ->get();

        $brand = DB::table('tbl_brand')
        ->where('brand_status', '1')
        ->orderBy('brand_id', 'desc')
        ->get();
        return view('pages.shop_info', compact('category', 'brand'));
    }
    public function send_mail(Request $request){
        $data = array();
        $data['contact_name'] = $request->contact_name;
        $data['contact_email'] = $request->contact_email;
        $data['contact_title'] = $request->contact_title;
        $data['contact_content'] = $request->contact_content;
        DB::table('tbl_contact')->insert($data);
        Session::put('message','Gửi form liên hệ thành công!');
        return Redirect::to('contact');
    }
}


