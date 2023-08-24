@extends('admin.dashboard')
@section('admin_content')
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading">
				Sửa danh mục sản phẩm
			</header>
			<?php 
			$message = Session::get('message');
			if($message){
				echo '<span style="width: 100%;">'.$message.'</span>';
				$message = Session::put('message',null);
			}
			?>
			<div class="panel-body">
				@foreach($edit_category_product as $key => $item)
				<div class="position-center">
					<form role="form" action="{{ URL::to('/update-category-product/'.$item->category_id) }}" method="post">
						{{ csrf_field() }}
						<div class="form-group">
							<label for="exampleInputEmail1">Tên danh mục</label>
							<input type="text" value="{{ $item->category_name }}" name="category_product_name" class="form-control" id="exampleInputEmail1" placeholder="Nhập tên danh mục">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Mô tả danh mục</label>
							<textarea style="resize: none; min-height: 200px;" row="8" name="category_product_desc" class="form-control" id="exampleInputPassword1" placeholder="Mô tả danh mục">{{ $item->category_desc }}</textarea>
						</div>
						<button type="submit" name="update_category_product" class="btn btn-info">Cập nhật danh mục</button>
					</form>

				</div>
				@endforeach
			</div>
		</section>

	</div>
</div>
@endsection