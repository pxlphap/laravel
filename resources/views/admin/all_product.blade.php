@extends('admin.dashboard')
@section('admin_content')
<div class="table-agile-info">
	<div class="panel panel-default">
		<div class="panel-heading">
			Liệt kê sản phẩm
		</div>
		<div class="row w3-res-tb">
			<div class="col-sm-5 m-b-xs">
				
			</div>
			<div class="col-sm-4">
			</div>
			<div class="col-sm-3">
				<form action="{{URL::to('/search-product')}}" method="POST" class="input-group">
					{{ csrf_field() }}
					<input type="text" class="input-sm form-control" placeholder="Search" name="search_content">
					<input type="submit" class="btn btn-default" value="Go!" name="search">
				</form>

			</div>
		</div>
		<div class="table-responsive">
			<?php 
			$message = Session::get('message');
			if($message){
				echo '<span style="width: 100%;">'.$message.'</span>';
				$message = Session::put('message',null);
			}
			?>
			<table class="table table-striped b-t b-light">
				<thead>
					<tr>
						<th>Tên Sản Phẩm</th>
						<th>Giá</th>
						<th>Mô tả</th>
						<th>Nội dung</th>
						<th>Danh mục</th>
						<th>Xuất xứ</th>
						<th>Hình ảnh</th>
						<th>Hiển thị</th>
						<th style="width:30px;"></th>
					</tr>
				</thead>
				<tbody>
					@foreach($all_product as $key => $item)
					<tr>
						<td>{{ $item->product_name }}</td>
						<td>{{ $item->product_price }}</td>
						<td>{{ $item->product_desc }}</td>
						<td>{{ $item->product_content }}</td>
						<td>{{ $item->category_name }}</td>
						<td>{{ $item->brand_name }}</td>
						<td><img width="150px" src="public/upload/product/{{$item->product_image}}" alt=""></td>
						<td>
							<span class="text-ellipsis">
								<?php if ($item->product_status == 0): ?>
									<a href="{{ URL::to('/active-product/'.$item->product_id) }}">Đang ẩn</a>
								<?php else: ?>
									<a href="{{ URL::to('/deactive-product/'.$item->product_id) }}">Đang hiển thị</a>
								<?php endif; ?>
							</span>
						</td>
						<td>
							<a href="{{URL::to('/edit-product/'.$item->product_id)}}" class="active" ui-toggle-class="">
								<i class="fa fa-check text-success text-active"></i>
							</a>
							<a href="{{URL::to('/remove-product/'.$item->product_id)}}" class="active" ui-toggle-class="" onclick="return confirm('Bạn chắc chắn muốn xoá chứ?')">
								<i class="fa fa-times text-danger text"></i>
							</a>
						</td>
					</tr>
					@endforeach
				</tbody>
			</table>
		</div>
		<footer class="panel-footer">
			<div class="row">

				<div class="col-sm-5 text-center">
					<small class="text-muted inline m-t-sm m-b-sm">showing 30 item</small>
				</div>
				<div class="col-sm-7 text-right text-center-xs">                
					<ul class="pagination pagination-sm m-t-none m-b-none">
						<li><a href=""><i class="fa fa-chevron-left"></i></a></li>
						<li><a href="">1</a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
						<li><a href="">4</a></li>
						<li><a href=""><i class="fa fa-chevron-right"></i></a></li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
</div>
@endsection