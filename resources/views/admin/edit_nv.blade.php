@extends('admin.dashboard')
@section('admin_content')
<div class="row">
	<div class="col-lg-12">
		<section class="panel">
			<header class="panel-heading">
				Sửa nhân viên
			</header>
			<?php 
			$message = Session::get('message');
			if($message){
				echo '<span style="width: 100%;">'.$message.'</span>';
				$message = Session::put('message',null);
			}
			?>
			<div class="panel-body">
				@foreach($edit_nv as $key => $item)
				<div class="position-center">
					<form role="form" action="{{ URL::to('/update-nv/'.$item->id) }}" method="post">
						{{ csrf_field() }}
						<div class="form-group">
							<label for="">Tên nhân viên</label>
							<input type="text" value="{{ $item->name }}" name="name" class="form-control" id="exampleInputEmail1" placeholder="Tên">
						</div>
						<div class="form-group">
							<label for="">Email</label>
							<input type="text" value="{{ $item->email}}" name="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
						</div>
						<div class="form-group">
							<label for="">Mật khẩu</label>
							<input type="text" value="{{ $item->password }}" name="password" class="form-control" id="exampleInputEmail1" placeholder="Password">
						</div>
						
						<button type="submit" name="update_nv" class="btn btn-info">Cập nhật</button>
					</form>

				</div>
				@endforeach
			</div>
		</section>

	</div>
</div>
@endsection