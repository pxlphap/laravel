@extends('admin.dashboard')
@section('admin_content')
<div class="table-agile-info">
	<div class="panel panel-default">
		<div class="panel-heading">
			Liệt kê danh sách khách hàng liên hệ
		</div>
		<div class="row w3-res-tb">
			<div class="col-sm-5 m-b-xs">
			</div>
			<div class="col-sm-4">
			</div>
			<div class="col-sm-3">
				<form action="{{URL::to('/search-contact')}}" method="POST" class="input-group">
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
						<th>Tiêu đề</th>
						<th>Nội dung</th>
						<th>Tùy chọn</th>
					</tr>
				</thead>
				<tbody>
					@foreach($all_contact as $key => $item)
					<tr>
						<td>{{ $item->contact_id}}</td>
						<td>{{ $item->contact_name }}</td>
						<td>{{ $item->contact_email }}</td>
						<td>{{ $item->contact_title }}</td>
						<td>{{ $item->contact_content }}</td>
						<td>
							<a href="{{URL::to('/view-contact-detail/'.$item->contact_id)}}" class="active styling-edit" ui-toggle-class="">
								<i class="fa fa-eye text-success text-active"></i>
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