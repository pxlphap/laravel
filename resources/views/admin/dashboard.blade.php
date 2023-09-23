<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Visitors Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link rel="stylesheet" href="{{asset('public/backend/css/bootstrap.min.css')}}" >
    <!-- //bootstrap-css -->
    <!-- Custom CSS -->
    <link href="{{asset('public/backend/css/style.css')}}" rel='stylesheet' type='text/css' />
    <link href="{{asset('public/backend/css/style-responsive.css')}}" rel="stylesheet"/>
    <!-- font CSS -->
    <link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="{{asset('public/backend/css/font.css')}}" type="text/css"/>
    <link href="{{asset('public/backend/css/font-awesome.css')}}" rel="stylesheet"> 
    <link rel="stylesheet" href="{{asset('public/backend/css/morris.css')}}" type="text/css"/>
    <!-- calendar -->
    <link rel="stylesheet" href="{{asset('public/backend/css/monthly.css')}}">
    <!-- //calendar -->
    <!-- //font-awesome icons -->
    <script src="{{asset('public/backend/js/jquery2.0.3.min.js')}}"></script>
    <script src="{{asset('public/backend/js/raphael-min.js')}}"></script>
    <script src="{{asset('public/backend/js/morris.js')}}"></script>
</head>
<body>
    <section id="container">
        <!--header start-->
        <header class="header fixed-top clearfix">
            <!--logo start-->
            <div class="brand">
                <a href="{{URL::to('/trang-chu')}}" class="logo">
                    Admin
                </a>
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars"></div>
                </div>
            </div>
            <!--logo end-->
            
            <div class="top-nav clearfix">
                <!--search & user info start-->
                <ul class="nav pull-right top-menu">
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="{{asset('public/backend/images/2.png')}}">
                            <span class="username">
                                <?php
                                $name = Session::get('name');
                                if($name){
                                    echo $name;
                                }
                                else{
                                    echo 'Admin';
                                }
                                ?>
                            </span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <li><a href="{{URL::to('/login')}}"><i class="fa fa-key"></i> Đăng Xuất</a></li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->

                </ul>
                <!--search & user info end-->
            </div>
        </header>
        <!--header end-->
        <!--sidebar start-->
        <aside>
            <div id="sidebar" class="nav-collapse">
                <!-- sidebar menu start-->
                <div class="leftside-navigation">
                    <ul class="sidebar-menu" id="nav-accordion">
                        <li>
                            <a class="active" href="{{URL::to('/dashboard')}}">
                                <i class="fa fa-dashboard"></i>
                                <span>Tổng Quan</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-book"></i>
                                <span>Danh Mục Sản Phẩm</span>
                            </a>
                            <ul class="sub">
                                <li><a href="{{URL::to('/add-category')}}">Thêm</a></li>
                                <li><a href="{{URL::to('/all-category')}}">Liệt Kê</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-book"></i>
                                <span>Xuất xứ</span>
                            </a>
                            <ul class="sub">
                                <li><a href="{{URL::to('/add-brand')}}">Thêm</a></li>
                                <li><a href="{{URL::to('/all-brand')}}">Liệt Kê</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-book"></i>
                                <span>Sản Phẩm</span>
                            </a>
                            <ul class="sub">
                                <li><a href="{{URL::to('/add-product')}}">Thêm</a></li>
                                <li><a href="{{URL::to('/all-product')}}">Liệt Kê</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="{{URL::to('/manage-order')}}">
                                <i class="fa fa-pencil"></i>
                                <span>Quản lý đơn hàng</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-pencil"></i>
                                <span>Nhân Viên</span>
                            </a>
                            <ul class="sub">
                                <li><a href="{{URL::to('/add-nv')}}">Thêm</a></li>
                                <li><a href="{{URL::to('/all-nv')}}">Liệt Kê</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="{{URL::to('/all-customer')}}">
                                <i class="fa fa-pencil"></i>
                                <span>Danh sách khách hàng</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-pencil"></i>
                                Mã giảm giá
                            </a>
                            <ul class="sub">
                                <li><a href="{{URL::to('/add-coupon')}}">Thêm Mã giảm giá</a></li>
                                <li><a href="{{URL::to('/all-coupon')}}">Liệt kê Mã giảm giá</a></li>
                            </ul>
                        </li>
                        <li class="sub-menu">
                            <a href="{{URL::to('/all-contact')}}">
                                <i class="fa fa-pencil"></i>
                                <span>Danh sách liên hệ</span>
                            </a>
                        </li>
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-pencil"></i>
                                Thống kê
                            </a>
                            <ul class="sub">
                                <li><a href="{{URL::to('/thong-ke-san-pham')}}">Thống kê sản phẩm</a></li>
                                <li><a href="{{URL::to('/thong-ke-doanh-thu')}}">Thống kê doanh thu</a></li>
                            </ul>
                        </li>
                    </ul>            
                </div>
                <!-- sidebar menu end-->
            </div>
        </aside>
        <!--sidebar end-->
        <!--main content start-->
        <section id="main-content">
            <section class="wrapper">
                @yield('admin_content')
            </section>
            <!-- footer -->
           
            <!-- / footer -->
        </section>
        <!--main content end-->
    </section>
    <script src="{{asset('public/backend/js/bootstrap.js')}}"></script>
    <script src="{{asset('public/backend/js/jquery.dcjqaccordion.2.7.js')}}"></script>
    <script src="{{asset('public/backend/js/scripts.js')}}"></script>
    <script src="{{asset('public/backend/js/jquery.slimscroll.js')}}"></script>
    <script src="{{asset('public/backend/js/jquery.nicescroll.js')}}"></script>
    <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="js/flot-chart/excanvas.min.js"></script><![endif]-->
        <script src="{{asset('public/backend/js/jquery.scrollTo.js')}}"></script>
        <!-- morris JavaScript -->	
        <script>
         $(document).ready(function() {
          
            jQuery('.small-graph-box').hover(function() {
                jQuery(this).find('.box-button').fadeIn('fast');
            }, function() {
                jQuery(this).find('.box-button').fadeOut('fast');
            });
            jQuery('.small-graph-box .box-close').click(function() {
                jQuery(this).closest('.small-graph-box').fadeOut(200);
                return false;
            });

            function gd(year, day, month) {
               return new Date(year, month - 1, day).getTime();
           }
       });
   </script>
   <!-- calendar -->
   <script type="text/javascript" src="{{asset('public/backend/js/monthly.js')}}"></script>
   <script type="text/javascript">
      $(window).load( function() {

       $('#mycalendar').monthly({
        mode: 'event',
    });

       $('#mycalendar2').monthly({
        mode: 'picker',
        target: '#mytarget',
        setWidth: '250px',
        startHidden: true,
        showTrigger: '#mytarget',
        stylePast: true,
        disablePast: true
    });

       switch(window.location.protocol) {
       case 'http:':
       case 'https:':
		// running on a server, should be good.
          break;
      case 'file:':
          alert('Just a heads-up, events will not work when run locally.');
      }

  });
</script>
<!-- //calendar -->
</body>
</html>
