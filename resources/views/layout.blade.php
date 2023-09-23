<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home</title>
    <link href="{{asset('public/frontend/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/font-awesome.min.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/prettyPhoto.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/price-range.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/animate.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/main.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/responsive.css')}}" rel="stylesheet">
    <link href="{{asset('public/frontend/css/sweetalert2.min.css')}}" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
<![endif]-->       
    <link rel="shortcut icon" href="{{('public/frontend/images/ico/favicon.ico')}}">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="{{('public/frontend/images/ico/apple-touch-icon-144-precomposed.png')}}">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="{{('public/frontend/images/ico/apple-touch-icon-114-precomposed.png')}}">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="{{('public/frontend/images/ico/apple-touch-icon-72-precomposed.png')}}">
    <link rel="apple-touch-icon-precomposed" href="{{('public/frontend/images/ico/apple-touch-icon-57-precomposed.png')}}">
</head><!--/head-->

<body>
    <header id="header"><!--header-->
        <div class="header_top"><!--header_top-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="contactinfo">
                            <ul class="nav nav-pills">
                                <li><a href="tel:0383848623"><i class="fa fa-phone"></i> 0383848623</a></li>
                                <li><a href="mailto:pxlphap@gmail.com"><i class="fa fa-envelope"></i> pxlphap@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="social-icons pull-right">
                            <ul class="nav navbar-nav">
                                <li><a href="https://facebook.com/phapbui135"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://twitter.com/phapbui135"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="https://instagram.com/phap1357"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header_top-->
        
        <div class="header-middle"><!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="logo pull-left">
                            <a href="{{URL::to('/trang-chu')}}"><img class="logo-50" src="{{asset('public/frontend/images/home/logo.png')}}" alt="" /></a>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="shop-menu pull-right">
                            <ul class="nav navbar-nav">
                                <?php 
                                $customer_id = Session::get('customer_id');
                                if ($customer_id != NULL) {
                                    echo '<li><a href="' . URL::to('/customer/' . $customer_id) . '"><i class="fa fa-user"></i> Tài Khoản</a></li>';
                                } else {
                                    echo '<li></li>';
                                }
                                ?>
                                
                                <li><a href="{{URL::to('/view-cart')}}"><i class="fa fa-shopping-cart"></i> Giỏ Hàng</a></li>
                                <?php 
                                $customer_id = Session::get('customer_id');
                                if ($customer_id != NULL) {
                                    echo '<li><a href="' . URL::to('/logout-checkout') . '"><i class="fa fa-lock"></i> Đăng Xuất</a></li>';
                                } else {
                                    echo '<li><a href="' . URL::to('/login-checkout') . '"><i class="fa fa-lock"></i> Đăng nhập</a></li>';
                                }
                                ?>

                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header-middle-->

        <div class="header-bottom"><!--header-bottom-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-8">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="mainmenu pull-left">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="{{URL::to('/trang-chu')}}" class="active">Trang chủ</a></li>
                                <li><a href="{{URL::to('/shop-information')}}">Cửa hàng</a></li> 
                                <li><a href="{{URL::to('/contact')}}">Liên hệ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <form action="{{URL::to('/tim-kiem')}}" method="POST">
                            {{ csrf_field() }}
                            <div class="search_box pull-right">
                                <input type="text" name="keywords_submit" placeholder="Search"/>
                                <input type="submit" class="btn btn-default" value="" name="search_item" style="width: 35px;height: 35px;">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->
    </header><!--/header-->
    
    <section id="slider"><!--slider-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#slider-carousel" data-slide-to="1"></li>
                            <li data-target="#slider-carousel" data-slide-to="2"></li>
                        </ol>
                        
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-sm-6">
                                    <h1><span>Hoa</span>-Mart</h1>
                                    <h2>Thực phẩm chất lượng trực tuyến ngay hôm nay!</h2>
                                    <p> Hãy đặt hàng sản phẩm sẽ được giao ngay đến tận nhà bạn.  </p>
                                    <a href="{{URL::to('/chi-tiet-san-pham/5')}}"  class="btn btn-default get">Mua sắm ngay</a>
                                </div>
                                <div class="col-sm-6">
                                    <img src="{{asset('public/frontend/images/home/fruit1.png')}}" class="girl img-responsive" alt="" />
                                    <img src="{{asset('public/frontend/images/home/pricing.png')}}"  class="pricing" alt="" />
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>F</span>-Mart</h1>
                                    <h2>Thực phẩm chất lượng trực tuyến ngay hôm nay!</h2>
                                    <p>Hãy đặt hàng sản phẩm sẽ được giao ngay đến tận nhà bạn.</p>
                                    <a href="{{URL::to('/chi-tiet-san-pham/5')}}"  class="btn btn-default get">Mua sắm ngay</a>
                                </div>
                                <div class="col-sm-6">
                                    <img src="{{asset('public/frontend/images/home/fruit2.png')}}" class="girl img-responsive" alt="" />
                                    <img src="{{asset('public/frontend/images/home/pricing.png')}}"  class="pricing" alt="" />
                                </div>
                            </div>
                            
                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>Hoa</span>-Mart</h1>
                                    <h2>Thực phẩm chất lượng trực tuyến ngay hôm nay!</h2>
                                    <p>Hãy đặt hàng sản phẩm sẽ được giao ngay đến tận nhà bạn.</p>
                                    <a href="{{URL::to('/chi-tiet-san-pham/5')}}"  class="btn btn-default get"> Mua sắm ngay </a>
                                </div>
                                <div class="col-sm-6">
                                    <img src="{{asset('public/frontend/images/home/fruit3.png')}}" class="girl img-responsive" alt="" />
                                    <img src="{{asset('public/frontend/images/home/pricing.png')}}" class="pricing" alt="" />
                                </div>
                            </div>
                            
                        </div>
                        <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>
                    
                </div>
            </div>
        </div>
    </section><!--/slider-->
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3 ">
                    @php
                    function getNumberOfProductsInCategory($category_id) {
                        return DB::table('tbl_product')
                        ->where('category_id', $category_id)
                        ->count();
                    }
                    function getNumberOfProductsInBrand($brand_id) {
                        return DB::table('tbl_product')
                        ->where('brand_id', $brand_id)
                        ->count();
                    }
                    @endphp
                    <div class="left-sidebar" style="margin-bottom: 80px;">
                        <div class="brands_products">
                            <h2>Danh mục sản phẩm</h2>
                            <div class="brands-name">
                                @if(isset($category) && !empty($category))
                                <ul class="nav nav-pills nav-stacked">
                                    @foreach($category as $key => $item)
                                    <li><a href="{{URL::to('/danh-muc/'.$item->category_id)}}"><span class="pull-right">({{ getNumberOfProductsInCategory($item->category_id) }})</span>{{$item->category_name}}</a></li>
                                    @endforeach
                                </ul>
                                @else
                                <p>Không có dữ liệu danh mục.</p>
                                @endif
                            </div>
                        </div>

                        <div class="brands_products" style="margin-top: 50px;">
                            <!--brands_products-->
                            <h2>Xuất xứ</h2>
                            <div class="brands-name">
                                @if(isset($brand) && !empty($brand))
                                <ul class="nav nav-pills nav-stacked">
                                    @foreach($brand as $key => $item)
                                    <li><a href="{{URL::to('/xuat-xu/'.$item->brand_id)}}"><span class="pull-right">({{ getNumberOfProductsInBrand($item->brand_id) }})</span>{{$item->brand_name}}</a></li>
                                    @endforeach
                                </ul>
                                @else
                                <p>Không có dữ liệu xuất xứ.</p>
                                @endif
                            </div>
                        </div>
                        <a href="{{URL::to('/chi-tiet-san-pham/42')}}" class="shipping text-center">
                            <img src="{{asset('public/frontend/images/home/shipping.jpg')}}" alt="" />
                        </a>

                    </div>
                    @yield('sidebar')   
                </div>
                <div class="col-sm-9 padding-right">
                    @yield('content')
                </div>
            </div>
        </div>
    </section>
    <footer id="footer"><!--Footer-->
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="companyinfo">
                            <h2><span>Hoa</span>-Mart</h2>
                            <p>Chào mừng bạn đến với shop thực phẩm HoaMart</p>
                        </div>
                    </div>
                    <div class="col-sm-7">

                    </div>
                    <div class="col-sm-3">
                        <div class="address">
                            <img src="{{asset('public/frontend/images/home/map.png')}}" alt="" />
                            <p>Ngõ 32 đường Phú Thái ngách 31 số nhà 41 thành phố Thái Nguyên</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <p class="pull-left">Cửa hàng thực phẩm đánh dấu bản quyền</p>
                    <p class="pull-right">Thiết kế bởi <span><a target="_blank" href="#">Nhóm 2 CLC</a></span></p>
                </div>
            </div>
        </div>

    </footer><!--/Footer-->



    <script src="{{asset('public/frontend/js/jquery.js')}}"></script>
    <script src="{{asset('public/frontend/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('public/frontend/js/jquery.scrollUp.min.js')}}"></script>
    <script src="{{asset('public/frontend/js/price-range.js')}}"></script>
    <script src="{{asset('public/frontend/js/jquery.prettyPhoto.js')}}"></script>
    <script src="{{asset('public/frontend/js/main.js')}}"></script>
    <script src="{{asset('public/frontend/js/sweetalert.js')}}"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
        $('#cart-form').on('submit', function (e) {
            e.preventDefault();

            $.ajax({
             
            type: 'POST',
            url: $(this).attr('action'),
            data: $(this).serialize(),
            success: function () {
                swal("Đã thêm vào giỏ hàng!");
            },
            });
        });
            $('.add-to-cart-button').on('click', function () {
                var $form = $(this).closest('form');
                var productID = $form.find('input[name="productID"]').val();
                var quantity = $form.find('input[name="quanlity"]').val();

                $.ajax({
                    type: 'POST',
                    url: $form.attr('action'),
                    data: {
                        "_token": $('input[name="_token"]').val(),
                        "productID": productID,
                        "quanlity": quantity
                    },
                    success: function () {
                        swal("Đã thêm vào giỏ hàng!");
                    },
                });
            });
            $("#coupon").keyup(function () {
                var couponCode = $("#coupon").val();
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: "POST",
                    url: "{{ URL::to('/checkc') }}",
                    data: { coupon: couponCode },
                    success: function (response) {
                        var total = parseFloat("{{ Cart::total(0) }}"); 
                        var couponValue = parseFloat(response.replace(/\D/g, ''));
                        var discountedTotal = total - couponValue; 
                        if (couponCode === "") {
                            $("#total").text("Tổng: " + total.toFixed(2) + " VND"); 
                        } else {
                            $("#total").text("Tổng: " + discountedTotal.toFixed(2) + " VND");
                        }
                        $("#coupon-result").html(response);
                    }
                });
            });
        });
    </script>
</body>
</html>

