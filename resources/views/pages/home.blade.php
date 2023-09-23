@extends('layout')
@section('content')
<div class="features_items" style="margin-bottom: 80px;"><!--features_items-->
    <h2 class="title text-center">Sản Phẩm Mới</h2>
    @foreach($all_product as $key => $item)
    <div class="col-sm-4">
        <div class="product-image-wrapper">
            <div class="single-products">
                <div class="productinfo text-center">
                    <img src="{{URL::to('public/upload/product/'.$item->product_image)}}" alt="" />
                    @if($item->quantity > 0)
                    <h4 class="product_status" style="margin-top: 20px;">Còn hàng ({{$item->quantity}})</h4>
                    @else
                    <h4 class="product_status" style="margin-top: 20px;">Hết hàng</h4>
                    @endif
                    <h2>{{number_format($item->product_price)." đ"}}</h2>
                    <h3><a href="{{URL::to('/chi-tiet-san-pham/'.$item->product_id)}}">{{$item->product_name}}</a></h3>
                    <form class="cart-form-home" action="{{ URL::to('/save-cart') }}" method="POST">
                        {{ csrf_field() }}
                        <input type="hidden" name="productID" value="{{ $item->product_id }}" />
                        <input type="number" name="quanlity" value="1" min="1" style="display: none;" />
                        <button type="button" class="btn btn-fefault cart add-to-cart-button" >
                            <i class="fa fa-shopping-cart"></i>
                            Thêm vào giỏ hàng
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    @endforeach
</div><!--features_items-->


@endsection