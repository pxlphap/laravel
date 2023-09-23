@extends('admin.dashboard')
@section('admin_content')
<div class="table-agile-info">
	<div class="panel panel-default">
		<div class="panel-heading">
			Liệt kê thương hiệu
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
						<th>Tên thương hiệu</th>
						<th>Mô tả</th>
						<th>Hiển thị</th>
						<th style="width:30px;"></th>
					</tr>
				</thead>
				<tbody>
					@foreach($all_brand_product as $key => $item)
					<tr>
						<td>{{ $item->brand_name }}</td>
						<td>{{ $item->brand_desc}}</td>
						<td><span class="text-ellipsis">
							<?php if ($item->brand_status == 0): ?>
								<a href="{{ URL::to('/active-brand/'.$item->brand_id) }}">Đang ẩn</a>
							<?php else: ?>
								<a href="{{ URL::to('/deactive-brand/'.$item->brand_id) }}">Đang hiển thị</a>
							<?php endif; ?>

						</span></td>
						<td>
							<a href="{{URL::to('/edit-brand-product/'.$item->brand_id)}}" class="active" ui-toggle-class="">
								<i class="fa fa-check text-success text-active"></i>
							</a>
							<a href="{{URL::to('/remove-brand-product/'.$item->brand_id)}}" class="active" ui-toggle-class="" onclick="return confirm('Bạn chắc chắn muốn xoá chứ?')">
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