<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use Session;
use DB;
use Illuminate\Support\Facades\Redirect;
session_start();

class LoginController extends Controller
{
    public function AuthLogin(){
        $admin_id = Session::get('admin_id');
        if($admin_id){
            return Redirect::to('dashboard');
        }else{
            return Redirect::to('login')->send();
        }
    }

    public function dashboard(){
        return view('admin.dashboard');
    }
    public function go_to_dashboard(Request $request){
        $email = $request->email;
        $password = md5($request->password);
        $result = DB::table('users')->where('email', $email)->where('password', $password)->first();

        if ($result) {
            Session::put('name', $result->name);
            Session::put('id', $result->id);
            Session::put('message', '');
            return view('admin.dashboard');
        } else {
            Session::put('message', 'Thông tin đăng nhập không đúng.');
            return view('login.login');
        }
    }
    public function go_to_login(Request $request){
        Session::put('name', null);
        Session::put('id', null);
        return view('login.login');
    }
    public function go_to_register(Request $request){
       return view('login.register');
    }
    public function register(Request $request){
        $data = array();
        $data['name'] = $request->name;
        $data['email'] = $request->email;
        
        $password = $request->password;
        $passwordConfirmation = $request->input('password-re');
        
        if ($password === $passwordConfirmation) {
            $data['password'] = md5($password);
            DB::table('users')->insert($data);
            Session::put('message', 'Đăng ký thành công!');
            return Redirect::to('login');
        } 
        else {
            Session::put('message', 'Mật khẩu và xác nhận mật khẩu không khớp.');
            return Redirect::back()->withInput();
        }
    }
}
