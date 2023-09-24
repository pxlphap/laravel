<?php

use Illuminate\Support\Facades\Route;

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
//Frontend
Route::get('/','HomeController@index');
Route::get('/trang-chu','HomeController@index');
Route::get('/shop-information','HomeController@shop_info');
Route::post('/tim-kiem','HomeController@search');
Route::post('/search-customer','AdminController@searchCustomer');

//Danh mục sản phẩm trang chủ
Route::get('danh-muc/{category_id}','CategoryController@show_category_home');
Route::get('xuat-xu/{brand_id}','BrandProduct@show_brand_home');
Route::get('chi-tiet-san-pham/{product_id}','ProductController@chi_tiet_san_pham');

//Backend
Route::get('/dashboard','LoginController@go_to_dashboard');
Route::get('/login','LoginController@go_to_login');
Route::get('/register','LoginController@go_to_register');
Route::post('/dashboard','LoginController@go_to_dashboard');
Route::post('/register-user','LoginController@register');


//Category
Route::get('/add-category', 'CategoryController@add_category');
Route::get('/all-category', 'CategoryController@all_category');

Route::get('/active-category/{category_id}', 'CategoryController@active_category');
Route::get('/deactive-category/{category_id}', 'CategoryController@deactive_category');

Route::post('/save-category-product','CategoryController@save_category_product'); 
Route::post('/update-category-product/{category_id}','CategoryController@update_category_product'); 

Route::get('/edit-category-product/{category_id}','CategoryController@edit_category_product'); 
Route::get('/remove-category-product/{category_id}','CategoryController@remove_category_product'); 

//Brand
Route::get('/add-brand', 'BrandProduct@add_brand');
Route::get('/all-brand', 'BrandProduct@all_brand');

Route::get('/active-brand/{brand_id}', 'BrandProduct@active_brand');
Route::get('/deactive-brand/{brand_id}', 'BrandProduct@deactive_brand');

Route::post('/save-brand-product','BrandProduct@save_brand_product'); 
Route::post('/update-brand-product/{brand_id}','BrandProduct@update_brand_product'); 

Route::get('/edit-brand-product/{brand_id}','BrandProduct@edit_brand_product'); 
Route::get('/remove-brand-product/{brand_id}','BrandProduct@remove_brand_product'); 

//Product
Route::get('/add-product', 'ProductController@add_product');
Route::get('/all-product', 'ProductController@all_product');
Route::get('/thong-ke-doanh-thu', 'AdminController@thong_ke_doanh_thu');
Route::post('/search-thong-ke-doanh-thu', 'AdminController@search_thong_ke_doanh_thu');
Route::get('/thong-ke-san-pham', 'ProductController@thong_ke_san_pham');

Route::get('/active-product/{product_id}', 'ProductController@active_product');
Route::get('/deactive-product/{product_id}', 'ProductController@deactive_product');

Route::post('/save-product','ProductController@save_product'); 
Route::post('/update-product/{product_id}','ProductController@update_product'); 

Route::get('/edit-product/{product_id}','ProductController@edit_product'); 
Route::get('/remove-product/{product_id}','ProductController@remove_product'); 


// Cart

Route::post('/save-cart', 'CartController@save_cart');
Route::get('/view-cart', 'CartController@view_cart');
Route::get('/gio-hang', 'CartController@gio_hang');
Route::get('/del-cart/{session_id}', 'CartController@del_cart');

Route::get('/delete-to-cart/{rowId}', 'CartController@delete_row_cart');
Route::get('/delete-cart', 'CartController@delete_cart');

Route::post('/add-cart-ajax', 'CartController@add_cart_ajax');
Route::post('/update-cart', 'CartController@update_cart');

Route::post('/update-view-cart','CartController@update_cart_quanlity');

// Coupon


Route::get('/unset-coupon', 'CouponController@unset_coupon');
Route::get('/add-coupon', 'CouponController@add_coupon');
Route::get('/delete-coupon/{coupon_id}', 'CouponController@delete_coupon');
Route::get('/all-coupon', 'CouponController@all_coupon');

Route::post('/check-coupon','CartController@check_coupon');
Route::post('/save-coupon','CouponController@save_coupon');

// Login Checkout and customer
Route::get('/delete-fee-home', 'CheckoutController@delete_fee_home');
Route::get('/all-customer', 'AdminController@all_customer');
Route::get('/all-nv', 'AdminController@all_nv');
Route::get('/checkout/{customer_id}', 'CheckoutController@checkout');
Route::get('/login-checkout', 'CheckoutController@login_checkout');
Route::get('/customer/{customer_id}', 'CheckoutController@customer');
Route::get('/logout-checkout', 'CheckoutController@logout_checkout');
Route::get('/payment', 'CheckoutController@payment');
Route::post('/add-customer', 'CheckoutController@add_customer');
Route::post('/login', 'CheckoutController@login_customer');
Route::post('/save-checkout-customer', 'CheckoutController@save_checkout_customer');
Route::post('/calculate-fee', 'CheckoutController@calculate_fee');
Route::post('/get-delivery-home', 'CheckoutController@get_delivery_home');
Route::post('/confirm-order', 'CheckoutController@confirm_order');
Route::post('dat-hang-thanh-cong', 'CheckoutController@done_order');

// Order
Route::post('/save-order', 'CheckoutController@save_order');
Route::get('/manage-order', 'CheckoutController@manage_order');

Route::get('/view-order-detail/{order_id}', 'CheckoutController@view_order_detail');
Route::get('/view-order-detail-customer/{order_id}', 'CheckoutController@view_order_detail_customer');
Route::get('/order-done/{order_id}', 'CheckoutController@order_done');
Route::get('/order-done-customer/{order_id}', 'CheckoutController@order_done_customer');
Route::get('/order-question/{order_id}', 'CheckoutController@order_question');
Route::get('/order-truck/{order_id}', 'CheckoutController@order_truck');
Route::get('/cancel-order/{order_id}', 'CheckoutController@order_cancel');
Route::get('/cancel-order-customer/{order_id}', 'CheckoutController@order_cancel_customer');
Route::get('/delete-order/{order_id}', 'CheckoutController@delete_order');
// send mail

Route::get('/contact','HomeController@contact');
Route::get('/all-contact','AdminController@all_contact');
Route::post('/send-mail', 'HomeController@send_mail');


// login facebook
Route::get('/login-fb','AdminController@login_facebook');
Route::get('/admin/callback','AdminController@callback_facebook');

// login google
Route::get('/login-google','AdminController@login_google');
Route::get('/google/callback','AdminController@callback_google');

// Delivery
Route::get('/delivery','DeliveryController@delivery');
Route::post('/get-delivery','DeliveryController@get_delivery');
Route::post('/add-feeship','DeliveryController@add_feeship');
Route::post('/fetch-feeship','DeliveryController@fetch_feeship');
Route::post('/update-feeship','DeliveryController@update_feeship');

Route::post('/search-product', 'AdminController@searchProduct');
Route::post('/search-nv', 'AdminController@searchNV');
Route::post('/search-order', 'AdminController@searchOrder');
Route::get('/add-nv', 'AdminController@add_nv');
Route::post('/save-nv', 'AdminController@save_nv');
Route::post('/update-nv/{nv_id}','AdminController@update_nv'); 

Route::get('/edit-nv/{nv_id}','AdminController@edit_nv'); 
Route::get('/remove-nv/{nv_id}','AdminController@remove_nv');
Route::get('/view-contact-detail/{contact_id}','AdminController@view_contact_detail');
Route::post('/checkc', 'CouponController@checkc');
