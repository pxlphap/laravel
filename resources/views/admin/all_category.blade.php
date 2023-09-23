@extends('admin.dashboard')
@section('admin_content')
<div class="table-agile-info">
	<div class="panel panel-default">
		<div class="panel-heading">
			Liệt kê danh mục
		</div>
		<div class="row w3-res-tb">
			<div class="col-sm-5 m-b-xs">
				                
			</div>
			<div class="col-sm-4">
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<input type="text" class="input-sm form-control" placeholder="Search">
					<span class="input-group-btn">
						<button class="btn btn-sm btn-default" type="button">Go!</button>
					</span>
				</div>
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
						<th>Tên danh mục</th>
						<th>Mô tả</th>
						<th>Hiển thị</th>
						<th style="width:30px;"></th>
					</tr>
				</thead>
				<tbody>
					@foreach($all_category_product as $key => $item)
					<tr>
						<td>{{ $item->category_name }}</td>
						<td>{{ $item->category_desc}}</td>
						<td><span class="text-ellipsis">
							<?php if ($item->category_status == 0): ?>
								<a href="{{ URL::to('/active-category/'.$item->category_id) }}">Đang ẩn</a>
							<?php else: ?>
								<a href="{{ URL::to('/deactive-category/'.$item->category_id) }}">Đang hiển thị</a>
							<?php endif; ?>

						</span></td>
						<td>
							<a href="{{URL::to('/edit-category-product/'.$item->category_id)}}" class="active" ui-toggle-class="">
								<i class="fa fa-check text-success text-active"></i>
							</a>
							<a href="{{URL::to('/remove-category-product/'.$item->category_id)}}" class="active" ui-toggle-class="" onclick="return confirm('Bạn chắc chắn muốn xoá chứ?')">
								<i class="fa fa-times text-danger text"></i>
							</a>
						</td>
					</tr>
					@endforeach

				</tbody>
			</table>
		</div>
	</div>
</div>
@endsection