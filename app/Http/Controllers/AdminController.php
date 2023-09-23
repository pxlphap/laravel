<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Session;
use DB;
use Illuminate\Support\Facades\Redirect;
session_start();

class AdminController extends Controller
{
	public function all_customer() {
		$all_customers = DB::table('tbl_customers')->get();

		return view('admin.view_customer', ['all_customer' => $all_customers]);
	}

	
	public function all_nv() {
		$all_nv = DB::table('users')->get();

		return view('admin.all_nv', ['all_nv' => $all_nv]);
	}
	public function searchCustomer(Request $request) {
		$searchContent = $request->input('search_content');

		$searchResult = DB::table('tbl_customers')
		->where('customer_name', 'like', '%' . $searchContent . '%')
		->orWhere('customer_email', 'like', '%' . $searchContent . '%')
		->orWhere('customer_phone', 'like', '%' . $searchContent . '%')
		->get();

		return view('admin.view_customer', ['all_customer' => $searchResult]);
	}
	public function searchProduct(Request $request) {
		$searchContent = $request->input('search_content');

		$searchResult = DB::table('tbl_product')
		->where('product_name', 'like', '%' . $searchContent . '%')
		->join('tbl_category_product', 'tbl_category_product.category_id', '=', 'tbl_product.category_id')
		->join('tbl_brand', 'tbl_brand.brand_id', '=', 'tbl_product.brand_id') 
		->orderBy('tbl_product.product_id', 'desc')
		->get();

		return view('admin.all_product', ['all_product' => $searchResult]);
	}
	public function searchNV(Request $request) {
		$searchContent = $request->input('search_content');
		$searchResult = DB::table('users')

		->where('name', 'like', '%' . $searchContent . '%')
		->orWhere('email', 'like', '%' . $searchContent . '%')
		->get();

		return view('admin.all_nv', ['all_nv' => $searchResult]);
	}
	public function searchOrder(Request $request) {
		$searchContent = $request->input('search_content');
		$searchResult = DB::table('tbl_order')
		->join('tbl_customers','tbl_order.customer_id','=','tbl_customers.customer_id')
		->where('order_id', 'like', '%' . $searchContent . '%')
		->get();
		
		return view('admin.manage_order', ['all_order' => $searchResult]);
	}
	public function add_nv(){
		return view('admin.add_nv');
	}
	public function save_nv(Request $request){
		$data = array();
		$data['name'] = $request->nv_name;
		$data['email'] = $request->nv_email;
		$data['password'] = md5($request->nv_password);
		DB::table('users')->insert($data);
		Session::put('message','Thêm nhân viên thành công!');
		return Redirect::to('all-nv');
	}
	public function edit_nv($nv_id){
		$edit_nv = DB::table('users')->where('id',$nv_id)->get();
		$manager_nv = view('admin.edit_nv')->with('edit_nv',$edit_nv);
		return view('admin.dashboard')->with('admin.edit_nv', $manager_nv);
	}
	public function update_nv(Request $request,$nv_id){
		$data = array();
		$data['name'] = $request->name;
		$data['email'] = $request->email;
		$data['password'] = md5($request->password);
		DB::table('users')->where('id',$nv_id)->update($data);
		Session::put('message', 'Cập nhật thông tin nhân viên thành công!');
		return Redirect::to('all-nv');
	}
	public function remove_nv($nv_id){
		DB::table('users')->where('id',$nv_id)->delete();
		Session::put('message', 'Xoá nhân viên thành công!');
		return Redirect::to('all-nv');
	}
	public function all_contact(){
		$all_contact = DB::table('tbl_contact')->get();

		return view('admin.all_contact', ['all_contact' => $all_contact]);
	}
	public function view_contact_detail(){

		return view('admin.view_contact_detail');
	}
}
