@extends('layout')
@section("content")
<section id="form"><!--form-->
    <div class="row">
        <div class="col-sm-4 col-sm-offset-1">
            <div class="login-form"><!--login form-->
                <h2>Đăng nhập</h2>
                <form action="{{URL::to('/login')}}" method="POST" onsubmit="return validateLoginForm()">
                    <span id="loginMessage">
                        <?php 
                            $message = Session::get('message');
                            if($message) {
                                echo $message;
                                Session::put('message',NULL);
                            }
                        ?>
                    </span>
                    {{ csrf_field() }}
                    <input type="email" placeholder="Địa chỉ email" name="email_account" id="email_account" />
                    <input type="password" placeholder="Mật khẩu" name="password_account" id="password_account" />
                    <span>
                        <input type="checkbox" class="checkbox"> 
                        Ghi nhớ đăng nhập
                    </span>
                    <button type="submit" class="btn btn-default">Đăng nhập</button>
                </form>
            </div><!--/login form-->
        </div>
        <div class="col-sm-1">
            <h2 class="or">HOẶC</h2>
        </div>
        <div class="col-sm-4">
            <div class="signup-form"><!--sign up form-->
                <h2>Đăng ký tài khoản</h2>
                <form action="{{URL::to('/add-customer')}}" method="POST" onsubmit="return validateSignupForm()">
                    {{csrf_field()}}
                    <input type="text" name="customer_name" placeholder="Họ tên" id="customer_name" />
                    <input type="email" name="customer_email" placeholder="Địa chỉ email" id="customer_email" />
                    <input type="tel" name="customer_phone" placeholder="Số điện thoại" id="customer_phone">
                    <input type="password" name="customer_password" placeholder="Mật khẩu" id="customer_password" />
                    <button type="submit" class="btn btn-default">Đăng ký</button>
                </form>
            </div><!--/sign up form-->
        </div>
    </div>
</section><!--/form-->

<script>
    function validateLoginForm() {
        var email = document.getElementById('email_account').value;
        var password = document.getElementById('password_account').value;

        if (!email || !password) {
            alert('Vui lòng điền đầy đủ thông tin đăng nhập.');
            return false;
        }

        return true;
    }

    function validateSignupForm() {
        var name = document.getElementById('customer_name').value;
        var email = document.getElementById('customer_email').value;
        var phone = document.getElementById('customer_phone').value;
        var password = document.getElementById('customer_password').value;

        if (!name || !email || !phone || !password) {
            alert('Vui lòng điền đầy đủ thông tin đăng ký.');
            return false;
        }

        return true;
    }
</script>
@endsection
