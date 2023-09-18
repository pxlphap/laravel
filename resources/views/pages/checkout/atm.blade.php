@extends('layout')
@section('content')

<div class="container">
	<div class="row">
		<div class="col-sm-6">
			<h2 class="title text-center">Thanh Toán</h2>
			<p>Thông tin chủ tài khoản: Bùi Văn Pháp</p>
			<p>Số tài khoản: 0383848623</p>
			<p>Ngân hàng: Vietinbank</p>
			<p>Vui Lòng ghi rõ họ tên, số điện thoại để chúng tôi check thông tin của bạn!</p>
			<p>Cảm ơn đã ủng hộ fruit shop, nếu có gì không hài lòng vui lòng liên hệ với chúng tôi!</p>
			<form action="{{URL::to('/dat-hang-thanh-cong')}}" method="POST">
				   {{ csrf_field() }}
				<input type="submit" class="btn btn-primary sm-10" name="submit_order" value="Đã chuyển khoản">
			</form>
		</div>
		<div class="col-sm-6"><img src="{{asset('public/frontend/images/home/qr.png')}}" alt=""></div>
			
			

		</div>
	</div>
</div>
@endsection