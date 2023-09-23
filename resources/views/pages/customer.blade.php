@extends('layout')
@section('content')


<section id="cart_items">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h2 class="title text-center">Thông tin khách hàng</h2>
				<p>Họ tên: {{ $customerName }}</p>
				<p>Email: {{ $customerEmail }}</p>
				<p>Số điện thoại: {{ $customerPhone }}</p>
			</div>
		</div>
	</div>
	<h2 class="title text-center" style="margin-top: 50px;">Giỏ hàng của bạn</h2>
	<div class="table-responsive cart_info">
		<table class="table table-condensed">
			<thead>
				<tr class="cart_menu">
					<td class="image">Hình ảnh</td>
					<td class="description">Tên sản phẩm</td>
					<td class="price">Giá sản phẩm</td>
					<td class="quantity">Số lượng</td>
					<td class="total">Thành tiền</td>
				</tr>
			</thead>
			<tbody>
				<?php
				$carts = Cart::content();
				?>
				@foreach($carts as $cart_item)
				<tr>
					<td class="cart_product">
						<a href=""><img src="{{URL::to('public/upload/product/'.$cart_item->options->image)}}" alt="" width="50" height="50"></a>
					</td>
					<td class="cart_description">
						<h4><a href="">{{$cart_item->name}}</a></h4>
						<p>Mã sản phẩm: {{$cart_item->id}}</p>
					</td>
					<td class="cart_price">
						<p>{{number_format($cart_item->price)." VND"}}</p>
					</td>
					<td class="cart_quantity">
						<form action="{{URL::to('/update-view-cart')}}" method="POST">
							{{ csrf_field() }}
							<div class="cart_quantity_button">
								<input type="hidden" name="rowIDChangeQty" value="{{$cart_item->rowId}}">
								<input class="cart_quantity_input" type="number" name="quantity_change" value="{{$cart_item->qty}}" size="2">
								<input type="submit" value="Cập nhật" class="submitQty">
							</div>
						</form>
					</td>
					<td class="cart_total">
						<p class="cart_total_price">
							<?php
							$subtotal = $cart_item->price * $cart_item->qty;
							echo number_format($subtotal). " VND";
							?>
						</p>
					</td>
					<td class="cart_delete">
						<a class="cart_quantity_delete" href="{{URL::to('/delete-to-cart/'.$cart_item->rowId)}}"><i class="fa fa-times"></i></a>
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
	</div>

	<h2 class="title text-center" style="margin-top: 50px;">Đơn hàng của bạn</h2>
	<div class="table-responsive cart_info">
		<table class="table table-condensed">
			<thead>
				<tr class="cart_menu">
					<td class="image">Mã đơn</td>
					<td class="price">Giá trị đơn hàng</td>
					<td class="quantity">Trạng thái đơn hàng</td>
					<td class="total">Tuỳ chọn</td>
				</tr>
			</thead>
			<tbody>
				@foreach($orders as $order)
				<tr>
					<td class="cart_description">
						<p>{{ $order->order_id }}</p>
					</td>
					<td class="cart_price">
						<p>{{ $order->order_total }}</p>
					</td>
					<td class="cart_quantity">
						<p>{{ $order->payment_status }}</p>
					</td>
					<td class="option">
						<a href="{{URL::to('/view-order-detail-customer/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
							<i class="fa fa-eye text-success text-active"></i>
						</a>
						&nbsp;
						<a onclick="return confirm('Đánh dấu đơn hàng đã giao?')" href="{{URL::to('/order-done-customer/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
							<i class="fa fa-check text-success text-active"></i>
						</a>
						&nbsp; 
						<a onclick="return confirm('Bạn có chắc là muốn huỷ đơn này không?')" href="{{URL::to('/cancel-order-customer/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
							<i class="fa fa-times text-danger text"></i>
						</a>
						&nbsp;
					</td>
				</tr>
				@endforeach
			</tbody>
		</table>
	</div>
</section>
@endsection
