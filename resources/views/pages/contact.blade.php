@extends('layout')
@section("content")
<div class="col-sm-9">
    <div class="contact-form">
        <h2 class="title text-center">Liên hệ với chúng tôi</h2>
       <?php
            $message = Session::get('message');
            if($message != null) {
                Session::put('message',null);
                echo "<p style='color: red;text-align: center'>".$message."</p>";  
            }
       ?>
        <div class="status alert alert-success" style="display: none"></div>
            <form action="{{URL::to('/send-mail')}}" id="main-contact-form" class="contact-form row" name="contact-form" method="POST">
                {{ csrf_field() }}
                <div class="form-group col-md-6">
                    <input type="text" name="contact_name" class="form-control" required="required" placeholder="Tên">
                </div>
                <div class="form-group col-md-6">
                    <input type="email" name="contact_email" class="form-control" required="required" placeholder="Địa chỉ email">
                </div>
                <div class="form-group col-md-12">
                    <input type="text" name="contact_title" class="form-control" required="required" placeholder="Tiêu đề lời nhắn">
                </div>
                <div class="form-group col-md-12">
                    <textarea name="contact_content" id="message" required="required" class="form-control" rows="8" placeholder="Nội dung lời nhắn"></textarea>
                </div>                        
                <div class="form-group col-md-12">
                    <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
                </div>
            </form>
        </div>
    </div>
<div class="col-sm-3">
    <div class="contact-info">
        <h2 class="title text-center">Thông tin shop</h2>
        <address>
            <p>Fruit 247</p>
            <p>Tân Thịnh</p>
            <p>Thái Nguyên VN</p>
            <p>Mobile: +84 383 848 623</p>
            <p>Email: pxlphap@gmail.com</p>
        </address>
        <div class="social-networks">
            <h2 class="title text-center">Mạng xã hội</h2>
            <ul>
                <li>
                    <a href="#"><i class="fa fa-facebook"></i></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-google-plus"></i></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-youtube"></i></a>
                </li>
            </ul>
        </div>
    </div>
</div> 	
@endsection