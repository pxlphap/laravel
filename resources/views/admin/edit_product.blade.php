@extends('admin.dashboard')
@section('admin_content')
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading">
				Sửa Sản Phẩm
			</header>
			<?php 
			$message = Session::get('message');
			if($message){
				echo '<span style="width: 100%;">'.$message.'</span>';
				$message = Session::put('message',null);
			}
			?>
			<div class="panel-body">
				@foreach($edit_product as $key => $item)
				<div class="position-center">
					<form role="form" action="{{URL::to('/update-product/'.$item->product_id)}}" method="post" enctype="multipart/form-data">
						{{ csrf_field() }}
						<div class="form-group">
							<label for="exampleInputEmail1">Tên Sản Phẩm</label>
							<input type="text" value="{{$item->product_name}}" name="product_name" class="form-control" id="exampleInputEmail1">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Giá Sản Phẩm</label>
							<input type="text" value="{{$item->product_price}}" name="product_price" class="form-control" id="exampleInputEmail1">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Hình Ảnh Sản Phẩm</label>
							<input type="file" value="{{$item->product_image}}" name="product_image" class="form-control" id="exampleInputEmail1" value="$item->product_image">
							<img width="100px" style="margin-top: 15px;" src="{{URL::to('public/upload/product/'.$item->product_image)}}" alt="Hình ảnh sản phẩm">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Mô Tả Sản Phẩm</label>
							<textarea style="resize: none; min-height: 200px;" row="8" name="product_desc" class="form-control" id="exampleInputPassword1" placeholder="Mô tả Sản Phẩm">{{$item->product_desc}}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Nội Dung Sản Phẩm</label>
							<textarea style="resize: none; min-height: 200px;" row="8" name="product_content" class="form-control" id="exampleInputPassword1">{{$item->product_content}}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Danh Mục</label>
							<select class="form-control input-lg m-bot15" name="product_category">
								@foreach($category_product as $key => $cate)\
								@if($cate->category_id == $item->category_id)
								<option selected value="{{$cate->category_id}}">{{$cate->category_name}}</option>
								@else
								<option value="{{$cate->category_id}}">{{$cate->category_name}}</option>
								@endif
								@endforeach
							</select>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Xuất xứ</label>
							<select class="form-control input-lg m-bot15" name="product_brand">
								@foreach($brand_product as $key => $brand)\
								@if($brand->brand_id == $item->brand_id)
								<option selected value="{{$brand->brand_id}}">{{$brand->brand_name}}</option>
								@else
								<option value="{{$brand->brand_id}}">{{$brand->brand_name}}</option>
								@endif
								@endforeach
							</select>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Hiển Thị</label>
							<select class="form-control input-lg m-bot15" name="product_status">
								<option value="0">Ẩn</option>
								<option value="1">Hiện</option>
							</select>
						</div>
						<button type="submit" name="update_product" class="btn btn-info">Cập Nhật Sản Phẩm</button>
					</form>
				</div>
				@endforeach
			</div>
		</section>

	</div>
</div>
@endsection