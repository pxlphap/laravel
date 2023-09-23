@extends('admin.dashboard')
@section('admin_content')
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      LIỆT KÊ MÃ GIẢM GIÁ
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
        <div class="input-group">
        </div>
      </div>
    </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            <th>Tên mã giảm giá</th>
            <th>Mã giảm giá</th>
            <th>Số lượng mã</th>
            <th>Chức năng mã</th>
            <th>Số lượng giảm</th>
            <th>Tùy chọn</th>
          </tr>
        </thead>
        <tbody>
          @foreach($coupon as $key =>$cp)
          <tr>
            
            <td>{{ $cp->coupon_name}}</td>
            <td>{{ $cp->coupon_code}}</td>
            <td>{{ $cp->coupon_time}}</td>
            <td><span class="text-ellipsis">
              <?php
                if($cp->coupon_condition == 1) {
              ?>
                Giảm theo phần trăm
              <?php } else { ?>
                Giảm theo tiền
              <?php 
                }
              ?>
            </span></td>
            
            <td>
              @if($cp->coupon_condition == 1)
              {{ $cp->coupon_number }} %
              @else
              {{ number_format($cp->coupon_number,0,',','.') }} VND
              @endif
            </td>
            <td>
              <a onclick="return confirm('Bạn có chắc là muốn xóa mã giảm giá này không ?')" href="{{URL::to('delete-coupon/'.$cp->coupon_id)}}" class="active styling-edit" ui-toggle-class="">
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