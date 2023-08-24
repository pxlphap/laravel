@extends('admin.dashboard')
@section('admin_content')
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading">
				Thêm danh mục sản phẩm
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
					<form role="form" action="{{URL::to('/save-category-product')}}" method="post">
						{{ csrf_field() }}
						<div class="form-group">
							<label for="exampleInputEmail1">Tên danh mục</label>
							<input type="text" name="category_product_name" class="form-control" id="exampleInputEmail1" placeholder="Nhập tên danh mục">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Mô tả danh mục</label>
							<textarea style="resize: none; min-height: 200px;" row="8" name="category_product_desc" class="form-control" id="exampleInputPassword1" placeholder="Mô tả danh mục"></textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Hiển thị</label>
							<select class="form-control input-lg m-bot15" name="category_status">
								<option value="0">Ẩn</option>
								<option value="1">Hiện</option>
							</select>
						</div>
						<button type="submit" name="add_category_product" class="btn btn-info">Thêm danh mục</button>
					</form>
				</div>

			</div>
		</section>

	</div>
</div>
@endsection