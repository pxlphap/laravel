@extends('layout')
@section('content')
<div class="features_items"><!--features_items-->
    <h2 class="title text-center">Kết quả tìm kiếm</h2>
    @foreach($search_product as $key => $item)
    <div class="col-sm-4">
        <div class="product-image-wrapper">
            <div class="single-products">
                <div class="productinfo text-center">

                    <img src="{{URL::to('public/upload/product/'.$item->product_image)}}" alt="" />
                    <h2>{{number_format($item->product_price)." đ"}}</h2>
                    <h3><a href="{{URL::to('/chi-tiet-san-pham/'.$item->product_id)}}">{{$item->product_name}}</a></h3>
                </div>
            </div>
        </div>
    </div>
    @endforeach
</div>

@endsection