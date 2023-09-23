@extends('admin.dashboard')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      LIỆT KÊ ĐƠN HÀNG
    </div>
    <?php
    $message = Session::get('message');
    if($message) {
      echo "<span class='text-alert'>".$message."</span>";
      Session::put('message',null);
    }
    ?>
    <div class="row w3-res-tb">
      <div class="col-sm-5 m-b-xs">

      </div>
      <div class="col-sm-4">
      </div>
      <div class="col-sm-3">
        <form action="{{URL::to('/search-order')}}" method="POST" class="input-group">
          {{ csrf_field() }}
          <input type="text" class="input-sm form-control" placeholder="Search" name="search_content">
          <input type="submit" class="btn btn-default" value="Go!" name="search">
        </form>
      </div>
    </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>Mã đơn</th>
            <th>Tên người đặt</th>
            <th>Giá trị đơn hàng</th>
            <th>Coupon</th>
            <th>Trạng thái đơn hàng</th>
            <th>Tùy chọn</th>
          </tr>
        </thead>
        <tbody>
          @foreach($all_order as $key =>$order)
          <tr>
            <td>{{ $order->order_id}}</td>
            <td>{{ $order->customer_name}}</td>
            <td>{{ $order->order_total}}</td>
            <td>{{ $order->coupon_id}}</td>
            <td>{{ $order->payment_status}}</td>
            <td>
              <a href="{{URL::to('/view-order-detail/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-eye text-success text-active"></i>
              </a>
              &nbsp;
              <a onclick="return confirm('Đánh dấu đơn hàng đang được xử lý?')" href="{{URL::to('/order-question/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-question text-success text-active"></i>
              </a>
              &nbsp;
              <a onclick="return confirm('Đánh dấu đơn hàng đang giao?')" href="{{URL::to('/order-truck/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-truck text-success text-active"></i>
              </a>
              &nbsp;
              <a onclick="return confirm('Đánh dấu đơn hàng đã giao?')" href="{{URL::to('/order-done/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-check text-success text-active"></i>
              </a>
              &nbsp; 
              <a onclick="return confirm('Bạn có chắc là muốn huỷ đơn này không?')" href="{{URL::to('/cancel-order/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-times text-danger text"></i>
              </a>
              &nbsp;
              <a onclick="return confirm('Bạn có chắc là muốn xóa đơn hàng này không ?')" href="{{URL::to('/delete-order/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-ban text-danger text"></i>
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