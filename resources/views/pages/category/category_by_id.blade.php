@extends('layout')
@section("content")
<div class="features_items"><!--features_items-->

<h2 class="title text-center">Danh mục {{$category_name}}</h2>

@foreach($category_by_id as $key => $item)
<div class="col-sm-4">
   
    <div class="product-image-wrapper">
        <a href="{{URL::to('chi-tiet-san-pham/'.$item->product_id)}}">
        <div class="single-products">
                <div class="productinfo text-center">
                    <img src="{{URL::to('public/upload/product/'.$item->product_image)}}" alt="" />
                    <h2>{{number_format($item->product_price)." đ"}}</h2>
                    <p>{{$item->product_name}}</p>
                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
                </div>
                
        </div>
        </a>
        <div class="choose">
            <ul class="nav nav-pills nav-justified">
                <li><a href="#"><i class="fa fa-plus-square"></i>Yêu thích</a></li>
                <li><a href="#"><i class="fa fa-plus-square"></i>Thêm so sánh</a></li>
            </ul>
        </div>
        
    </div>
</div>

@endforeach
</div><!--features_items-->

@endsection