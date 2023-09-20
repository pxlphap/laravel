@extends('layout')
@section("content")
@foreach($detail_product as $key => $value)
<div class="product-details"><!--product-details-->
    <div class="col-sm-6">
        <div class="view-product">
            <img src="{{URL::to('public/upload/product/'.$value->product_image)}}" alt="" />
        </div>
    </div>
    <div class="col-sm-6">
        <div class="product-information"><!--/product-information-->
            <h2>{{$value->product_name}}</h2>
            <p>Mã sản phẩm: {{$value->product_id}}</p>
            <img src="{{URL::to('public/frontend/images/product-details/rating.png')}}" alt="" />
            <form action="{{URL::to('/save-cart')}}" method="POST">
                {{ csrf_field() }}
                <span>
                    <span>{{number_format($value->product_price).' VND'}}</span>
                </span>
                <span class="soluong">
                    <label>Số lượng:</label>
                    <input name="productID" type="hidden" value="{{ $value->product_id }}"/>
                    <input name="quanlity" type="number" value="1" min="1"/>
                    <button type="submit" class="btn btn-fefault cart add-to-cart-button">
                        <i class="fa fa-shopping-cart"></i>
                        Thêm vào giỏ hàng
                    </button>
                </span>
            </form>
            <p><b>Trạng thái:</b> Còn hàng</p>
            <p><b>Danh mục:</b> {{$value->category_name}}</p>
            <p><b>Xuất xứ:</b> {{$value->brand_name}}</p>
            <div class="fb-share-button" 
            data-href="" 
            data-layout="button_count" data-size="small">
            <div class="share-meta">
                <a target="_blank" href="https://www.facebook.com/sharer/" class="fb-xfbml-parse-ignore share">
                    <i class="fa fa-facebook" aria-hidden="true"></i>
                </a>
                <a target="_blank" href="https://www.instagram.com/sharer/" class="fb-xfbml-parse-ignore share">
                    <i class="fa fa-instagram" aria-hidden="true"></i>
                </a>
            </div>

        </div>
        <div class="fb-like" data-href="" data-width="" data-layout="standard" data-action="like" data-size="small" data-share="false"></div>
    </div><!--/product-information-->
</div>
</div><!--/product-details-->
<div class="category-tab shop-details-tab"><!--category-tab-->
    <div class="col-sm-12">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#details" data-toggle="tab">Mô tả sản phẩm</a></li>
            <li><a href="#companyprofile" data-toggle="tab">Chi tiết sản phẩm</a></li>
            <li><a href="#reviews" data-toggle="tab">Đánh giá (5)</a></li>
        </ul>
    </div>
    <div class="tab-content">
        <div class="tab-pane fade  active in" id="details" >
            <div class="col-sm-12">
                <p class="padding-0-20">{!!$value->product_desc!!}</p>
            </div>
            
        </div>
        
        <div class="tab-pane fade" id="companyprofile" >
            <div class="col-sm-12">
                <p class="padding-0-20">{!!$value->product_content!!}</p>
                
            </div>
            
        </div>
        
        
        <div class="tab-pane fade" id="reviews" >
            <div class="col-sm-12">
                <ul>
                    <li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                    <li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
                    <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
                </ul>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                <p><b>Write Your Review</b></p>
                
                <form action="#">
                    <span>
                        <input type="text" placeholder="Your Name"/>
                        <input type="email" placeholder="Email Address"/>
                    </span>
                    <textarea name="" ></textarea>
                    <b>Rating: </b> <img src="{{URL::to('public/frontend/images/product-details/rating.png')}}" alt="" />
                    <button type="button" class="btn btn-default pull-right">
                        Submit
                    </button>
                </form>
            </div>
        </div>
        
    </div>
</div><!--/category-tab-->

@endforeach

<div class="recommended_items"><!--recommended_items-->
    <h2 class="title text-center">Sản phẩm liên quan</h2>
    
    <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">

            <div class="item_active">
                @foreach($related_product as $key => $value)
                <div class="col-sm-4">
                    <div class="product-image-wrapper">
                        <a href="{{URL::to('/chi-tiet-san-pham/'.$value->product_id)}}">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="{{ URL::to('public/upload/product/' . $value->product_image) }}" alt="" />
                                    <h2>{{ $value->product_name }}</h2>
                                    <p>{{ $value->product_price }} VND</p>
                                    <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Thêm giỏ hàng</a>
                                </div>

                            </div>
                        </a>
                    </div>
                </div>
                @endforeach
            </div>

            
        </div>
        <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
            <i class="fa fa-angle-left"></i>
        </a>
        <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
            <i class="fa fa-angle-right"></i>
        </a>			
    </div>
</div><!--/recommended_items-->


@endsection