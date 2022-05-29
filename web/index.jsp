<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <style>
            #slider {
                background: url('./assets/img/slider/slider_img2.webp') top center / cover no-repeat;
            }
        </style>
    </head>
    <body>
        <div id="main">
        <div id="header">
            <!-- Begin logo -->
            <div class="logo-shop">
                    <i class="logo-icon ti-joomla">KingsMan</i>
            </div>

            <!-- Begin nav -->
            <ul id="nav">
                <li><a href="">Trang chủ</a></li>
                <li><a href="">Blog</a></li>
                <li><a href="">Sản phẩm</a></li>
                <li><a href="">Liên hệ</a></li>
                <li>
                    <a href="">
                        More
                        <i class="nav-arround-down ti-angle-down"></i>
                    </a>
                    <ul class="subnav">
                        <li><a href="">About us</a></li>
                        <li><a href="">Login</a></li>
                        <li><a href="">Sign up</a></li>
                    </ul>
                </li>
            </ul>

             <!-- begin icon header -->
                 <div class="btn-icon">
                    <a><i class="header-icon ti-shopping-cart"></i></a>
                </div>

                <div class="btn-icon">
                    <a><i class="header-icon ti-user"></i></a>
                </div>

                <div class="btn-icon">
                    <a href="#"><i class="header-icon ti-search"></i></a>
                </div>
                

                

        </div>

        <!-- Slider -->
        <div id="slider">
            <div class="text-content">
                <div class="text-description">
                    Miễn phí vận chuyển cho đơn hàng từ 99k
                </div>
                <div class="text-description">
                    60 ngày đổi trả vì bất kỳ lý do gì
                </div>
                <div class="text-description">
                    Đến tận nơi nhận hàng trả trong 24 giờ
                </div>
            </div>
        </div>

        <!-- Content -->
        <div id="content">
            <div class="content-section background-product">

                <!-- Base Product -->
                <h2 class="section-heading">Trang phục cơ bản</h2>
                <div class="product-list">
                    <div class="product-item">
                        <p class="product-name">Áo dài tay</p>
                        <img src="./assets/img/ProductExample/ProductEx1.jpg" alt="Name" class="product-img">
                    </div>

                    <div class="product-item">
                        <p class="product-name">Áo ngắn tay</p>
                        <img src="./assets/img/ProductExample/ProductEx2.jpg" alt="Name" class="product-img">
                    </div>

                    <div class="product-item">
                        <p class="product-name">Quần đùi</p>
                        <img src="./assets/img/ProductExample/ProductEx3.jpg" alt="Name" class="product-img">
                    </div>

                    <div class="product-item">
                        <p class="product-name">Quần lót nam</p>
                        <img src="./assets/img/ProductExample/ProductEx4.jpg" alt="Name" class="product-img">
                    </div>

                    

                    <div class="clear"></div>
                </div> 
            </div>


            <div class="content-Category-section background-product">

                <!-- Product list -->
                <h2 class="section-heading">Những sản phẩm đa dạng</h2>
                <div class="category-list">
                    <a href=""><div class="category-item category-img" style="background: url('./assets/img/categoryImg/categoryImg1.jpg') 
                                                                                top center / cover no-repeat">
                        <div class="category-content">Đồ mặc trong</div>
                    </div></a>

                    <a href=""><div class="category-item category-img" style="background: url('./assets/img/categoryImg/categoryImg2.jpg') 
                                                                                top center / cover no-repeat">
                        <div class="category-content">Đồ mặc ngoài</div>
                    </div></a>

                    <a href=""><div class="category-item category-img" style="background: url('./assets/img/categoryImg/categoryImg3.jpg') 
                                                                                top center / cover no-repeat">
                        <div class="category-content">Đồ thể thao</div>
                    </div></a>

                    <a href=""><div class="category-item category-img" style="background: url('./assets/img/categoryImg/categoryImg4.jpg') 
                                                                                top center / cover no-repeat">
                        <div class="category-content">Tất cả</div>
                    </div></a>

                    

                    

                    <div class="clear"></div>
                </div> 
            </div>
            <!-- Blog -->
            <div class="blog-section">
                <div class="content-section">
                    <h2 class="section-heading text-white">Chúng tôi luôn mang đến những công nghệ hiện đại nhất</h2>
                    <p class="section-sub-heading text-white">Công nghệ Việt cho người Việt</p>
                
                    <!-- Places -->
                    <div class="blog-list">
                        <div class="blog-item">
                            <img src="./assets/img/blog/blogImage3.png" alt="" class="blog-img">
                            <div class="blog-body">
                                <h3 class="blog-heading">Dòng sản phẩm công nghệ EXCOOL</h3>
                                <p class="blog-desc">Excool là dòng sản phẩm công nghệ mới với mục tiêu đem tới các sản phẩm đa tính năng như nhẹ, bền, dễ chăm sóc, không nhăn cùng nhiều tính năng vượt trội khác. </p>
                                <a href="#" class="place-buy-btn">Tìm hiểu thêm</a>
                        </div>
                        </div>
                        <div class="blog-item">
                            <img src="./assets/img/blog/blogImage2.png" alt="" class="blog-img">
                            <div class="blog-body">
                                <h3 class="blog-heading">Coolmate’s CLEAN DENIM</h3>
                                <p class="blog-desc">Chiếc quần Jeans này chính là sản phẩm đầu tiên Coolmate theo hướng Thời trang bền vững, từ nguồn gốc sợi Regenarative Cotton</p>
                                <a href="#" class="place-buy-btn">Tìm hiểu thêm</a>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>



        
        </div>

        <!-- Contact-section -->
            <div class="content-section">
                <h2 class="section-heading">Liên lạc với chúng tôi</h2>
                <p class="section-sub-heading">Nếu bạn muốn trở thành một người đàn ông thực thụ</p>

                <div class="row contact-content">
                    <div class="col col-half contact-info">
                        <p><i class="ti-location-pin"></i>Tran Duy Hung, Ha Noi</p>
                        <p><i class="ti-mobile"></i>Phone:+0879 112 113</p>
                        <p><i class="ti-email"></i>Email:Sondbrr123@gmail.com</p>
                    </div>
                    <div class="col col-half contact-form">
                        <form action="">
                            <div class="row">
                                <div class="col col-half">
                                    <input type="text" name="" placeholder="Name" id="" required class="form-control">
                                </div>
                                <div class="col col-half">
                                    <input type="email" name="" placeholder="Email" id="" required class="form-control">
                                </div>
                                <div class="clear"></div>
                            </div>
                            <div class="row mt-8">
                                <div class="col col-full">
                                    <input  type="text" name="" placeholder="Message" id="" required class="form-control">
                                </div>
                            </div>
                            <input class="form-submit-btn mt-16" type="submit" value="Send">
                            
                        </form>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!-- End Contact -->

            <div class="map-section">
                <img src="./assets/img/map.jpg" alt="Map">
            </div>

        </div>
        <div id="footer">
            <div id="footer">
            <div class="social-list">
                <a href=""><i class="ti-facebook"></i></a>
                <a href=""><i class="ti-instagram"></i></a>
                <a href=""><i class="ti-youtube"></i></a>
                <a href=""><i class="ti-pinterest"></i></a>
                <a href=""><i class="ti-twitter"></i></a>
                <a href=""><i class="ti-linkedin"></i></a>
            </div>
            <p class="copyright">Powered by <a href="">KingsMan</a></p>
        </div>
        </div>
        

    </div>
    </body>
</html>