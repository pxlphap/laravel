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
        <form action="{{URL::to('/search-thong-ke-doanh-thu')}}" method="POST" class="input-group">
          {{ csrf_field() }}
          <div class="form-group" style="margin-right: 20px;">
            <label for="search_start">Ngày Bắt Đầu:</label>
            <input type="date" class="form-control" name="search_start" id="search_start">
          </div>

          <div class="form-group">
            <label for="search_end">Ngày Kết Thúc:</label>
            <input type="date" class="form-control" name="search_end" id="search_end">
          </div>
          <button type="submit" class="btn btn-sm btn-default" style="max-height: 35px; display: flex; justify-content: center;align-items: center; margin: 23px 0 0 10px; ">go</button>
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
            </td>
          </tr>
          @endforeach
          
        </tbody>
      </table>
    </div>
  </div>
</div>
<h3 id="total_sale" class="text-center" style="margin-top: 30px;"> Tổng: {{ $totalSale }} VND</h3>
@endsection