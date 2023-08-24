@extends('admin.dashboard')
@section('admin_content')
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading">
				Thêm Sản Phẩm
			</header>
			<?php 
			$message = Session::get('message');
			if($message){
				echo '<span style="width: 100%;">'.$message.'</span>';
				$message = Session::put('message',null);
			}
			?>
			<div class="panel-body">
				<div class="position-center">
					<form role="form" action="{{URL::to('/save-product')}}" method="post" enctype="multipart/form-data">
						{{ csrf_field() }}
						<div class="form-group">
							<label for="exampleInputEmail1">Tên Sản Phẩm</label>
							<input type="text" name="product_name" class="form-control" id="exampleInputEmail1" placeholder="Nhập tên Sản Phẩm">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Giá Sản Phẩm</label>
							<input type="text" name="product_price" class="form-control" id="exampleInputEmail1" placeholder="Nhập tên Sản Phẩm">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Hình Ảnh Sản Phẩm</label>
							<input type="file" name="product_image" class="form-control" id="exampleInputEmail1">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Mô Tả Sản Phẩm</label>
							<textarea style="resize: none; min-height: 200px;" row="8" name="product_desc" class="form-control" id="exampleInputPassword1" placeholder="Mô tả Sản Phẩm"></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Nội Dung Sản Phẩm</label>
							<textarea style="resize: none; min-height: 200px;" row="8" name="product_content" class="form-control" id="exampleInputPassword1" placeholder="Nội dung Sản Phẩm"></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Danh Mục</label>
							<select class="form-control input-lg m-bot15" name="product_category">
								@foreach($category_product as $key => $item)
								<option value="{{$item->category_id}}">{{$item->category_name}}</option>
								@endforeach
							</select>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Thương Hiệu</label>
							<select class="form-control input-lg m-bot15" name="product_brand">
								@foreach($brand_product as $key => $item)
								<option value="{{$item->brand_id}}">{{$item->brand_name}}</option>
								<div>{{$item->brand_id}</div>
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
						<button type="submit" name="add_product" class="btn btn-info">Thêm Sản Phẩm</button>
					</form>
				</div>

			</div>
		</section>

	</div>
</div>
@endsection