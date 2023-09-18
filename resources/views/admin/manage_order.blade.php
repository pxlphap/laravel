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
            <td>{{ $order->order_status}}</td>
            <td>
              <a href="{{URL::to('/view-order-detail/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-eye text-success text-active"></i>
              </a>
              &nbsp;
              <a onclick="return confirm('Bạn có chắc là muốn xóa đơn hàng này không ?')" href="{{URL::to('/delete-order/'.$order->order_id)}}" class="active styling-edit" ui-toggle-class="">
                <i class="fa fa-times text-danger text"></i>
              </a>
            </td>
          </tr>
          @endforeach
          
        </tbody>
      </table>
    </div>
    <footer class="panel-footer">
      <div class="row">

        <div class="col-sm-5 text-center">
          <small class="text-muted inline m-t-sm m-b-sm">showing 20-30 of 50 items</small>
        </div>
        <div class="col-sm-7 text-right text-center-xs">                
          <ul class="pagination pagination-sm m-t-none m-b-none">
            <li><a href=""><i class="fa fa-chevron-left"></i></a></li>
            <li><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">4</a></li>
            <li><a href=""><i class="fa fa-chevron-right"></i></a></li>
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>
@endsection