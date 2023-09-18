@extends('layout')
@section("title","Trang thanh toán")
@section("content")
<section id="cart_items">
	<div class="breadcrumbs">
		<ol class="breadcrumb">
			<li><a href="#">Home</a></li>
			<li class="active">Thanh toán</li>
		</ol>
	</div>
	<div class="register-req">
		<p>Vui lòng nhập thông tin giao hàng để tiến hành thanh toán</p>
	</div>
	<div class="shopper-informations">
		<div class="row">
			<div class="col-sm-12 clearfix">
				<div class="bill-to">
					<p>Thông tin đơn hàng</p>
					<div class="form-one">
						<form id="checkoutForm" action="{{URL::to('/save-checkout-customer')}}" method="POST">
							{{ csrf_field() }}
							<input type="text" name="shipping_name" class="shipping_name" value="{{ $customerName }}" required>
							<input type="email" name="shipping_email" class="shipping_email" value="{{ $customerEmail }}" required>
							<input type="text" name="shipping_phone" class="shipping_phone" value="{{ $customerPhone }}" required>
							<input type="text" name="shipping_address" class="shipping_address" placeholder="Địa chỉ nhận hàng *" required>
							<textarea name="shipping_note" class="shipping_note" placeholder="Ghi chú đơn hàng của bạn" rows="5"></textarea>
							<input type="submit" name="send_order" class="btn btn-primary sm-10 confirm-order" value="Xác nhận đơn hàng">
						</form>
					</div>
				</div>
			</div>			
		</div>
	</div>
</section>

<script>
    document.getElementById("checkoutForm").addEventListener("submit", function(event) {
        var requiredFields = document.querySelectorAll("[required]");
        var isValid = true;

        for (var i = 0; i < requiredFields.length; i++) {
            if (!requiredFields[i].value) {
                isValid = false;
                break;
            }
        }

        if (!isValid) {
            event.preventDefault();
            alert("Vui lòng nhập đầy đủ thông tin bắt buộc.");
        }
    });
</script>
@endsection
