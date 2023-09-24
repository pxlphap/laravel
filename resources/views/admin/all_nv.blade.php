@extends('admin.dashboard')
@section('admin_content')
<div class="table-agile-info">
	<div class="panel panel-default">
		<div class="panel-heading">
			Liệt kê danh sách nhân viên
		</div>
		<div class="row w3-res-tb">
			<div class="col-sm-5 m-b-xs">
			</div>
			<div class="col-sm-4">
			</div>
			<div class="col-sm-3">
				<form action="{{URL::to('/search-nv')}}" method="POST" class="input-group">
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
						<th>ID</th>
						<th>Tên</th>
						<th>Email</th>
						<th>Mật khẩu</th>
						<th style="width:30px;"></th>
					</tr>
				</thead>
				<tbody>
					@foreach($all_nv as $key => $item)
					<tr>
						<td>{{ $item->id}}</td>
						<td>{{ $item->name }}</td>
						<td>{{ $item->email }}</td>
						<td>{{ $item->password }}</td>
						<td>
							<a href="{{URL::to('/edit-nv/'.$item->id)}}" class="active" ui-toggle-class="">
								<i class="fa fa-check text-success text-active"></i>
							</a>
							<a href="{{URL::to('/remove-nv/'.$item->id)}}" class="active" ui-toggle-class="" onclick="return confirm('Bạn chắc chắn muốn xoá chứ?')">
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