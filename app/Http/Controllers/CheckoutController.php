<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB; 
use Session;
use App\Http\Requests;
use Illuminate\Support\Facades\Redirect;
use Cart;

session_start();
class CheckoutController extends Controller
{
    public function confirm_order(Request $request) {
        $data = $request->all();
        $shipping = new Shipping();
        $shipping->shipping_name = $data['shipping_name'];
        $shipping->shipping_address = $data['shipping_address'];
        $shipping->shipping_phone = $data['shipping_phone'];
        $shipping->shipping_email = $data['shipping_email'];
        $shipping->shipping_note = $data['shipping_note'];
        $shipping->shipping_method = $data['payment_select'];
        $shipping->save();

        $shipping_id = $shipping->shipping_id;
        $order_code = substr(md5(microtime()), rand(0,26),5);
        
        $order = new Order();
        $order->shipping_id = $shipping_id;
        $order->customer_id = Session::get('customer_id');
        $order->order_code = $order_code;
        $order->order_status = 1;
        $order->created_at = now();
        $order->save();
        if(Session::get('cart')) {
            foreach(Session::get('cart') as $key => $cart) {
                $orderDetail = new OrderDetail();
                $orderDetail->order_code = $order_code;
                $orderDetail->product_id = $cart['product_id'];
                $orderDetail->product_name = $cart['product_name'];
                $orderDetail->product_price = $cart['product_price'];
                $orderDetail->product_sales_quanlity = $cart['product_qty'];
                $orderDetail->order_feeship = $data['feeship'];
                $orderDetail->order_coupon =  $data['coupon'];
                $orderDetail->save();
            }
        }
        Session::forget('fee');
        Session::forget('cart');
        Session::forget('coupon');

    }
    public function delete_fee_home() {
        if(Session::get('fee')) {
            Session::forget('fee');
        }
        return redirect()->back();
    }
    public function calculate_fee(Request $request) {
        $data = $request->all();
        $feeship = Feeship::where('fee_matp',$data['cityId'])->where('fee_maqh',$data['provinceId'])->where('fee_xaid',$data['wardId'])->get();
        if($feeship) {
            if($feeship->count() > 0) {
                foreach($feeship as $key => $fee) {
                    Session::put('fee',$fee->fee_feeship);
                    Session::save();
                }
            } else {
                Session::put('fee',10000);
                Session::save();
            }
        }        
    }
    public function get_delivery_home(Request $request) {
        $data = $request->all();
        $output = '';
        if($data['action'] == 'nameCity') {
            $selectProvince = Province::where('matp',$data['ma_id'])->orderBy('maqh','ASC')->get();
            $output .= "<option value='0'>---Chọn quận huyện---</option>";
            foreach($selectProvince as $key => $qh) {
                $output .="<option value='".$qh->maqh."'>".$qh->name_quanhuyen."</option>";
            }
        } else {
            $selectWards = Wards::where('maqh',$data['ma_id'])->orderBy('xaid','ASC')->get();
            $output .= "<option value='0'>---Chọn xã phường---</option>";
            foreach($selectWards as $key => $xp) {
                $output .= "<option value='".$xp->xaid."'>".$xp->name_xaphuong."</option>";
            }
        }
        echo $output;
    }
    public function AuthLogin() {
        if(Session::get('admin_id') != null) {
            return Redirect::to('admin.dashboard');
        } else {
            return Redirect::to('admin')->send();
        }
    }
    public function login_checkout(Request $request)  {
        $meta_title = "Đăng nhập hoặc đăng ký tài khoản";
        $meta_desc = "Đăng nhập hoặc đăng ký tài khoản của shop";
        $meta_keywords = "đăng nhập , login";
        $meta_canonical = $request->url();
        $image_og = "";

        $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','1')->orderby('brand_id','desc')->get();
        return view('pages.checkout.login_checkout')->with('category',$cate_product)->with('brand',$brand_product)
        ->with('meta_title',$meta_title)
        ->with('meta_desc',$meta_desc)
        ->with('meta_keywords',$meta_keywords)
        ->with('meta_canonical',$meta_canonical)
        ->with('image_og',$image_og);
    }
    public function customer($customer_id) {
        $customer = DB::table('tbl_customers')->where('customer_id', $customer_id)->first();
        $orders = DB::table('tbl_order')
        ->where('tbl_order.customer_id', $customer_id)
        ->join('tbl_customers', 'tbl_order.customer_id', '=', 'tbl_customers.customer_id')
        ->join('tbl_payment', 'tbl_order.payment_id', '=', 'tbl_payment.payment_id')
        ->select('tbl_order.order_id', 'tbl_customers.customer_name', 'tbl_order.order_total', 'tbl_payment.payment_status')
        ->orderBy('tbl_order.order_id', 'desc')
        ->get();

        $customerName = $customer->customer_name;
        $customerPhone = $customer->customer_phone;
        $customerEmail = $customer->customer_email;

        $cate_product = DB::table('tbl_category_product')->where('category_status', '1')->orderBy('category_id', 'desc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status', '1')->orderBy('brand_id', 'desc')->get();

        return view('pages.customer')
        ->with('category', $cate_product)
        ->with('brand', $brand_product)
        ->with('customerName', $customerName)
        ->with('customerPhone', $customerPhone)
        ->with('customerEmail', $customerEmail)
        ->with('orders', $orders);

    }
    public function add_customer(Request $request) {
        $data = array();
        $data['customer_name'] = $request->customer_name;
        $data['customer_email'] = $request->customer_email;
        $data['customer_phone'] = $request->customer_phone;
        $data['customer_password'] = md5($request->customer_password);

        $customer_id = DB::table('tbl_customers')->insertGetId($data);
        $customer_name = $request->customer_name;

        Session::put('customer_id',$customer_id);
        Session::put('customer_name',$customer_name);
        
        return Redirect::to('/trang-chu');
    }

    public function checkout(Request $request, $customer_id) {
        $customer = DB::table('tbl_customers')->where('customer_id', $customer_id)->first();
        $meta_title = "Thông tin giao hàng";
        $meta_desc = "Trang nhập thông tin giao hàng của bạn";
        $meta_keywords = "giao hàng xwatch247, xwatch247 checkout";
        $meta_canonical = $request->url();
        $image_og = "";

        $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','1')->orderby('brand_id','desc')->get();
        
        if ($customer) {
            $customerName = $customer->customer_name;
            $customerPhone = $customer->customer_phone;
            $customerEmail = $customer->customer_email;

            $cate_product = DB::table('tbl_category_product')->where('category_status', '1')->orderBy('category_id', 'desc')->get();
            $brand_product = DB::table('tbl_brand')->where('brand_status', '1')->orderBy('brand_id', 'desc')->get();
            return view('pages.checkout.view_checkout')->with('category',$cate_product)->with('brand',$brand_product)
            ->with('meta_title',$meta_title)
            ->with('meta_desc',$meta_desc)
            ->with('meta_keywords',$meta_keywords)
            ->with('meta_canonical',$meta_canonical)
            ->with('customerName', $customerName)
            ->with('customerPhone', $customerPhone)
            ->with('customerEmail', $customerEmail);

        } else {
         return view('pages.checkout.view_checkout')->with('category',$cate_product)->with('brand',$brand_product)
         ->with('meta_title',$meta_title)
         ->with('meta_desc',$meta_desc)
         ->with('meta_keywords',$meta_keywords)
         ->with('meta_canonical',$meta_canonical)
         ->with('customerName', '')
         ->with('customerPhone', '')
         ->with('customerEmail', '');
     }
 }
 public function save_checkout_customer(Request $request) {
    $data = array();
    $data['shipping_name'] = $request->shipping_name;
    $data['shipping_email'] = $request->shipping_email;
    $data['shipping_phone'] = $request->shipping_phone;
    $data['shipping_address'] = $request->shipping_address;
    $data['shipping_note'] = $request->shipping_note;

    $shipping_id = DB::table('tbl_shipping')->insertGetId($data);
    Session::put('shipping_id',$shipping_id);
    return Redirect::to('/payment');
}
public function payment(Request $request) {
    $meta_title = "Chọn phương thức thanh toán";
    $meta_desc = "Trang Chọn phương thức thanh toán của bạn";
    $meta_keywords = "thanh toán , payment";
    $meta_canonical = $request->url();
    $image_og = "";
    $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
    $brand_product = DB::table('tbl_brand')->where('brand_status','1')->orderby('brand_id','desc')->get();
    return view('pages.checkout.payment')->with('category',$cate_product)->with('brand',$brand_product)
    ->with('meta_title',$meta_title)
    ->with('meta_desc',$meta_desc)
    ->with('meta_keywords',$meta_keywords)
    ->with('meta_canonical',$meta_canonical)
    ->with('image_og',$image_og);
}
public function logout_checkout() {
    Session::put('shipping_id',null);
    Session::put('customer_id',null);
    Session::put('customer_name',null);
    return Redirect::to('/login-checkout');
}
public function login_customer(Request $request) {
    $email = $request->email_account;
    $password = md5($request->password_account);

    $result = DB::table('tbl_customers')->where('customer_email',$email)->where('customer_password',$password)->first();


    if($result) {
        Session::put('customer_id',$result->customer_id);
        Session::put('customer_name',$result->customer_name);
        return Redirect::to('/trang-chu');
    } else {
        Session::put('message','Mật khẩu hoặc tài khoản không đúng, vui lòng nhập lại!');
        return Redirect::to('/login-checkout');

    }

}
public function save_order(Request $request) {
    $data = array();
    $data['payment_method'] = $request->payment_value;
    $data['payment_status'] = "Đang chờ xử lý";
    $data['created_at'] = now(); 

    $payment_id = DB::table('tbl_payment')->insertGetId($data);

    $data_order = array();
    $data_order['customer_id'] = Session::get('customer_id');
    $data_order['shipping_id'] = Session::get('shipping_id');
    $data_order['payment_id'] = $payment_id;
    $data_order['order_total'] = 0;
    $coupon = $request->coupon;
    $coupon_condition = DB::table('tbl_coupon')
        ->where('coupon_code', $coupon)->value('coupon_condition');
    $data_order['created_at'] = now(); 

    if ($coupon_condition == 1) {
        $coupon_time = DB::table('tbl_coupon')->where('coupon_code', $coupon)->value('coupon_time');
        if ($coupon_time !== null) {
            $coupon_time -= 1; 
            $couponNumber = DB::table('tbl_coupon')
                ->where('coupon_code', $coupon)->value('coupon_number');
            $discount = Cart::total() * ($couponNumber / 100);
            $data_order['order_total'] = Cart::total() - $discount;

            DB::table('tbl_coupon')
                ->where('coupon_code', $coupon)
                ->update(['coupon_time' => $coupon_time]);
        }
        else{
            $data_order['order_total'] = Cart::total();
        }
    } else {
        $coupon_time = DB::table('tbl_coupon')->where('coupon_code', $coupon)->value('coupon_time');
        if ($coupon_time !== null) {
            $coupon_time -= 1; 
            $couponNumber = DB::table('tbl_coupon')
                ->where('coupon_code', $coupon)->value('coupon_number');
            $data_order['order_total'] = Cart::total() - $couponNumber;

            DB::table('tbl_coupon')
                ->where('coupon_code', $coupon)
                ->update(['coupon_time' => $coupon_time]);
        }
        else{
            $data_order['order_total'] = Cart::total();
        }
    }

    $get_coupon_id = DB::table('tbl_coupon')->where('coupon_code', $request->coupon)->value('coupon_id');
    $data_order['coupon_id'] =  $get_coupon_id;
    $data_order['created_at'] = now(); 

    $order_id = DB::table('tbl_order')->insertGetId($data_order);

    $data_detail_order = array();
    $content = Cart::content();

    foreach($content as $v_content) {
        $data_detail_order['order_id'] = $order_id;
        $data_detail_order['product_id'] = $v_content->id;
        $data_detail_order['product_name'] = $v_content->name;
        $data_detail_order['product_price'] = $v_content->price;
        $data_detail_order['product_sales_quanlity'] =  $v_content->qty;
        $data_detail_order['created_at'] = now(); 

        DB::table('tbl_order_details')->insert($data_detail_order);
        $product_id = $v_content->id;
        $product_qty = $v_content->qty;

        $product = DB::table('tbl_product')->where('product_id', $product_id)->first();

        if ($product) {
            $current_quantity = $product->quantity;

            if ($current_quantity >= $product_qty) {
                DB::table('tbl_product')
                    ->where('product_id', $product_id)
                    ->decrement('quantity', $product_qty);
            } else {
                // Xử lý tình huống khi số lượng sản phẩm không đủ
            }
        }
    }

    if ($data['payment_method'] == 1) {
        Cart::destroy();
        return view('pages.checkout.atm');
    } elseif ($data['payment_method'] == 2) {
        Cart::destroy();
        $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
        $brand_product = DB::table('tbl_brand')->where('brand_status','1')->orderby('brand_id','desc')->get();

        $meta_title = "Đặt hàng thành công";
        $meta_desc = "";
        $meta_keywords = "";
        $meta_canonical = $request->url();
        $image_og = "";

        return view('pages.checkout.handcash')->with('category', $cate_product)->with('brand', $brand_product)
            ->with('meta_title', $meta_title)
            ->with('meta_desc', $meta_desc)
            ->with('meta_keywords', $meta_keywords)
            ->with('meta_canonical', $meta_canonical)
            ->with('image_og', $image_og);
    }
}

public function manage_order() {
    $all_order = DB::table('tbl_order')
        ->join('tbl_customers', 'tbl_order.customer_id', '=', 'tbl_customers.customer_id')
        ->join('tbl_payment', 'tbl_order.payment_id', '=', 'tbl_payment.payment_id')
        ->select('tbl_order.order_id', 'tbl_customers.customer_name', 'tbl_order.order_total', 'tbl_payment.payment_status', 'tbl_order.coupon_id') 
        ->orderBy('tbl_order.order_id', 'desc')
        ->get();

    return view('admin.manage_order')->with('all_order', $all_order);
}
public function view_order_detail($order_id) {
    $order_by_id = DB::table('tbl_order')
        ->join('tbl_customers','tbl_customers.customer_id','=','tbl_order.customer_id')
        ->join('tbl_coupon','tbl_coupon.coupon_id','=','tbl_order.coupon_id')
        ->join('tbl_shipping','tbl_shipping.shipping_id','=','tbl_order.shipping_id')
        ->join('tbl_order_details','tbl_order_details.order_id','=','tbl_order.order_id')
        ->where('tbl_order.order_id',$order_id)
        ->select('tbl_order.*','tbl_customers.*','tbl_shipping.*','tbl_order_details.*','tbl_coupon.*')
        ->first();

    $coupon_info = DB::table('tbl_coupon')->where('coupon_id', $order_by_id->coupon_id)->first();

    $products = DB::table('tbl_order_details')->where('tbl_order_details.order_id', $order_id)->get();

    return view('admin.view_order')
        ->with('order_by_id', $order_by_id)
        ->with('order_list', $products)
        ->with('coupon_info', $coupon_info);
}


public function view_order_detail_customer($order_id) {
    $category = DB::table('tbl_category_product')
        ->where('category_status', '1')
        ->orderBy('category_id', 'desc')
        ->get();

    $brand = DB::table('tbl_brand')
        ->where('brand_status', '1')
        ->orderBy('brand_id', 'desc')
        ->get();

      $order_by_id = DB::table('tbl_order')
        ->join('tbl_customers','tbl_customers.customer_id','=','tbl_order.customer_id')
        ->join('tbl_coupon','tbl_coupon.coupon_id','=','tbl_order.coupon_id')
        ->join('tbl_shipping','tbl_shipping.shipping_id','=','tbl_order.shipping_id')
        ->join('tbl_order_details','tbl_order_details.order_id','=','tbl_order.order_id')
        ->where('tbl_order.order_id',$order_id)
        ->select('tbl_order.*','tbl_customers.*','tbl_shipping.*','tbl_order_details.*','tbl_coupon.*')
        ->first();
    $coupon_info = DB::table('tbl_coupon')->where('coupon_id', $order_by_id->coupon_id)->first();
    $products = DB::table('tbl_order_details')->where('tbl_order_details.order_id',$order_id)->get();
    return view('pages.view_order_customer')
    ->with('order_by_id',$order_by_id)
    ->with('order_list',$products)
    ->with('category', $category)
    ->with('brand', $brand)
    ->with('coupon_info', $coupon_info);
}
public function delete_order($order_id) {
    DB::table('tbl_order_details')->where('order_id',$order_id)->delete();
    DB::table('tbl_order')->where('order_id',$order_id)->delete();
    Session::put('message','Xóa đơn hàng thành công');
    return Redirect::to('/manage-order');
}
public function order_done($order_id) {
    $text_update = "Đã giao";

    $payment_id = DB::table('tbl_order')
    ->where('order_id', $order_id)
    ->orderBy('payment_id', 'asc')
    ->value('payment_id');

    if ($payment_id !== null) {
        DB::table('tbl_payment')
        ->where('payment_id', $payment_id)
        ->update(['payment_status' => $text_update]);
        Session::put('message', 'Đánh dấu đơn hàng ' . $order_id .' đã giao');
    } else {
        Session::put('message', 'Không tìm thấy payment_id cho đơn hàng ' . $order_id);
    }

    return Redirect::to('/manage-order');
}
public function order_done_customer($order_id) {
    $text_update = "Đã giao";

    $order = DB::table('tbl_order')
    ->where('order_id', $order_id)
    ->first();

    if ($order) {
        $customer_id = $order->customer_id;
        $payment_id = $order->payment_id;
        DB::table('tbl_payment')
        ->where('payment_id', $payment_id)
        ->update(['payment_status' => $text_update]);

        Session::put('message', 'Đánh dấu đơn hàng ' . $order_id .' đã giao');

        return redirect('/customer/'.$customer_id);
    } else {
        Session::put('message', 'Không tìm thấy đơn hàng có ID ' . $order_id);
        return redirect('/'); 
    }
}
public function order_question($order_id) {
    $text_update = "Đang chờ xử lý";

    $payment_id = DB::table('tbl_order')
    ->where('order_id', $order_id)
    ->orderBy('payment_id', 'asc')
    ->value('payment_id');

    if ($payment_id !== null) {
        DB::table('tbl_payment')
        ->where('payment_id', $payment_id)
        ->update(['payment_status' => $text_update]);
        Session::put('message', 'Đánh dấu đơn hàng ' . $order_id .' đang chờ xử lý');
    } else {
        Session::put('message', 'Không tìm thấy payment_id cho đơn hàng ' . $order_id);
    }

    return Redirect::to('/manage-order');
}
public function order_truck($order_id) {
    $text_update = "Đang giao";

    $payment_id = DB::table('tbl_order')
    ->where('order_id', $order_id)
    ->orderBy('payment_id', 'asc')
    ->value('payment_id');

    if ($payment_id !== null) {
        DB::table('tbl_payment')
        ->where('payment_id', $payment_id)
        ->update(['payment_status' => $text_update]);
        Session::put('message', 'Đánh dấu đơn hàng ' . $order_id .' đang giao');
    } else {
        Session::put('message', 'Không tìm thấy payment_id cho đơn hàng ' . $order_id);
    }

    return Redirect::to('/manage-order');
}
public function order_cancel($order_id) {
    $text_update = "Đã huỷ";

    $payment_id = DB::table('tbl_order')
    ->where('order_id', $order_id)
    ->orderBy('payment_id', 'asc')
    ->value('payment_id');

    if ($payment_id !== null) {
        DB::table('tbl_payment')
        ->where('payment_id', $payment_id)
        ->update(['payment_status' => $text_update]);
        Session::put('message', 'Đánh dấu đơn hàng ' . $order_id .' đã huỷ');
    } else {
        Session::put('message', 'Không tìm thấy payment_id cho đơn hàng ' . $order_id);
    }

    return Redirect::to('/manage-order');
}
public function order_cancel_customer($order_id) {
    $text_update = "Đã huỷ";

    $payment_id = DB::table('tbl_order')
    ->where('order_id', $order_id)
    ->orderBy('payment_id', 'asc')
    ->value('payment_id');

    if ($payment_id !== null) {
        DB::table('tbl_payment')
        ->where('payment_id', $payment_id)
        ->update(['payment_status' => $text_update]);
        Session::put('message', 'Đánh dấu đơn hàng ' . $order_id .' đã huỷ');
    } else {
        Session::put('message', 'Không tìm thấy payment_id cho đơn hàng ' . $order_id);
    }

    return back();
}

public function done_order(){
    $cate_product = DB::table('tbl_category_product')->where('category_status','1')->orderby('category_id','desc')->get();
    $brand_product = DB::table('tbl_brand')->where('brand_status','1')->orderby('brand_id','desc')->get();
    return view('pages.checkout.handcash')->with('category',$cate_product)->with('brand',$brand_product);
}
}
