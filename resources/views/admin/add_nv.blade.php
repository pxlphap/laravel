@extends('admin.dashboard')
@section('admin_content')
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading">
				Thêm nhân viên
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
					<form role="form" action="{{URL::to('/save-nv')}}" method="post">
						{{ csrf_field() }}
						<div class="form-group">
							<label for="exampleInputEmail1">Tên nhân viên</label>
							<input type="text" name="nv_name" class="form-control" id="exampleInputEmail1" placeholder="Nhập tên thương hiệu">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Email</label>
							<input type="text" name="nv_email" class="form-control" id="exampleInputEmail1" placeholder="Nhập email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label>
							<input type="text" name="nv_password" class="form-control" id="exampleInputEmail1" placeholder="Nhập email">
						</div>
						<button type="submit" name="add_nv" class="btn btn-info">Thêm nhân viên</button>
					</form>
				</div>

			</div>
		</section>

	</div>
</div>
@endsection