@extends('admin.dashboard')
@section('admin_content')
<div class="table-agile-info">
	<div class="panel panel-default">
		<div class="panel-heading">
			Liệt kê danh sách khách hàng
		</div>
		<div class="row w3-res-tb">
			<div class="col-sm-5 m-b-xs">
			</div>
			<div class="col-sm-4">
			</div>
			<div class="col-sm-3">
				<form action="{{URL::to('/search-customer')}}" method="POST" class="input-group">
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
						<th>ID khách hàng</th>
						<th>Tên khách hàng</th>
						<th>Email</th>
						<th>Số điện thoại</th>
						<th style="width:30px;"></th>
					</tr>
				</thead>
				<tbody>
					@foreach($all_customer as $key => $item)
					<tr>
						<td>{{ $item->customer_id}}</td>
						<td>{{ $item->customer_name }}</td>
						<td>{{ $item->customer_email }}</td>
						<td>{{ $item->customer_phone}}</td>
					</tr>
					@endforeach
				</tbody>
			</table>
		</div>
	</div>
</div>
@endsection