<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coupon;
use Illuminate\Support\Facades\Redirect; 
use Session;
use App\Http\Requests; 
use Cart;
session_start();

class CouponController extends Controller
{
    public function unset_coupon() {
        $coupon = Session::get('coupon');
        if($coupon) {
            Session::forget('coupon');
            return redirect()->back()->with('message','Xóa mã giảm giá thành công');
        }
    }
    public function add_coupon() {
        return view('admin.coupon.add_coupon');
    }
    public function save_coupon(Request $request) {
        $data = $request->all();
        $coupon = new Coupon();
        $coupon->coupon_name = $data['coupon_name'];
        $coupon->coupon_code = $data['coupon_code'];
        $coupon->coupon_time = $data['coupon_time'];
        $coupon->coupon_condition = $data['coupon_condition'];
        $coupon->coupon_number = $data['coupon_number'];
        $coupon->save();
        Session::put('message','Thêm thành công mã giảm giá');
        return view('admin.coupon.add_coupon');
    }
    public function all_coupon() {
        $coupon = Coupon::orderBy('coupon_id','DESC')->get();
        return view('admin.coupon.all_coupon')->with(compact('coupon',$coupon));
    }
    public function delete_coupon($coupon_id) {
        $coupon = Coupon::find($coupon_id)->first();
        $coupon->delete();
        Session::put('message','Xóa mã giảm giá thành công');
        return Redirect::to('/all-coupon');
    }

    public function checkc(Request $request)
{
    $couponCode = $request->coupon;
    $coupon = Coupon::where('coupon_code', $couponCode)->first();
    if ($coupon) {
        if ($coupon->coupon_time > 0) {
            $value = $coupon->coupon_number;
            if ($coupon->coupon_condition == "1") {
                $discountValue = $value / 100 * floatval(Cart::total(0)); // Tính giá trị giảm giá dưới dạng phần trăm
                $response = "Mã giảm giá hợp lệ, bạn được giảm " . $discountValue . " VND";
            } else {
                $response = "Mã giảm giá hợp lệ, bạn được giảm " . $value . " VND";
            }
        } else {
            $response = "Hết mã giảm giá";
        }
    } else {
        $response = "Mã giảm giá không tồn tại";
    }
    return $response;
}

}
