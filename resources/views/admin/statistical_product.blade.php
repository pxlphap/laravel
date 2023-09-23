@extends('admin.dashboard')
@section('admin_content')
<div class="table-agile-info">
	<div class="panel panel-default">
		<div class="panel-heading">
			Thống kế sản phẩm
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
						<th>Số lượng</th>
					</tr>
				</thead>
				<tbody>
					@foreach($all_product as $key => $item)
					<tr>
						<td>{{ $item->product_name }}</td>
						
						<td>{{ $item->quantity}}</td>
					</tr>
					@endforeach
				</tbody>
			</table>
		</div>
	</div>
</div>
@endsection