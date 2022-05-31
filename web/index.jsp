sta<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <style>

            #slider {
                background: url('./assets/img/slider/slider_img2.webp') top center / cover no-repeat;
            }
        </style>
    </head>
    <body>
        <div id="main">
            <%@include file="components/header.jsp" %>
            <!-- Login -->

            <div class="modal fade" role="dialog" id="loginModal">
                <div class="modal-dialog">
                    <div class="modal-content" style="border-radius: 10px; margin-top: 258px;">
                        <div class="modal-header">
                            <h2 class="" id="loginModal" style="text-align:center; font-family: Arial"><b style="padding-left: 150px;">Đăng Nhập</b></h2><br>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="email" class="form-control" id="email" placeholder="Email/SĐT của bạn" name="email" style="border-radius: 100px;">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="pwd" placeholder="Mật khẩu" name="pswd" style="border-radius: 100px;">
                            </div>
                            <input type="checkbox" style="height:15px;width:15px; ">&nbsp;Remember Me
                            <br><br>
                            <center><button type="submit" class="btn btn-dark" style="padding-right: 193px;padding-left: 193px; border-radius: 100px;">Đăng nhập</button></center>
                            <br><br>
                            <a href="#" style="float:right; text-decoration: none; border-radius: 100px;">Quên Mật Khẩu</a>
                            <a type="button" data-toggle="modal" data-target="#registerModal" style="float:left; text-decoration: none; border-radius: 100px;">Đăng ký tài khoản mới</a>
                        </div>
                    </div>
                </div>
            </div> 

            <!-- Register -->

            <div class="modal fade" role="dialog" id="registerModal" style="padding-right: 18px" >
                <div class="modal-dialog">
                    <div class="modal-content" style="border-radius: 10px; margin-top: 258px;">
                        <div class="modal-header">
                            <h2 class="" id="registerModal" style="text-align:center; font-family: Arial"><b style="padding-left: 100px;">Đăng ký tài khoản</b></h2><br>
                        </div>

                        <div class="modal-body">
                            <section>
                                <div class="container">
                                    <form action="#">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="name" placeholder="Họ và tên" name="name" style="border-radius: 100px;" required>
                                                </div></div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="email" class="form-control" id="email" placeholder="Email" name="email" style="border-radius: 100px;" required>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="name" placeholder="Số điện thoại" name="mobile" style="border-radius: 100px;" required>
                                                </div></div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="name" placeholder="Tên tài khoản" name="user" style="border-radius: 100px;" required>
                                                </div></div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" id="pwd" placeholder="Mật khẩu" name="pswd" style="border-radius: 100px;" required>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" id="pwd" placeholder="Nhập lại mật khẩu" name="rpswd" style="border-radius: 100px;" required>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    Giới tính                                                      
                                                    <input class="" name="gender" type="radio" value="Nam" /> Nam
                                                    <input class="" name="gender" type="radio" value="Nữ" /> Nữ
                                                </div>
                                            </div>
                                            <br><br><center><button type="submit" class="btn btn-dark" style="padding-right: 187px;padding-left: 187px; margin-left:16px; border-radius: 100px;">Đăng ký</button></center><br><br>
                                        </div>
                                    </form> 
                            </section>
                        </div>
                    </div>
                </div>
            </div> 

            <!--         Slider 
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
                    </div>-->
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://media.coolmate.me/cdn-cgi/image/width=1920,quality=100/uploads/May2022/Hero-Excool-Website.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://media.coolmate.me/cdn-cgi/image/width=1920,quality=100/uploads/May2022/34KIDSDAY---Website.jpg" class="d-block w-100" alt="...">

                    </div>
                    <div class="carousel-item">
                        <img src="https://media.coolmate.me/cdn-cgi/image/width=1920,quality=100/uploads/May2022/Hero-banner-CleanVN_42.png" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
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


            </div>

            <div id="footer">
                <<<<<<< HEAD:web/index.jsp


                =======





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




            <div>

                >>>>>>> 04bb11ff38c68cec2d0125e4328478aa056c67dc:web/assets/index.jsp
                <div class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7448.27256631781!2d105.53745830000003!3d21.027232300000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1653919437201!5m2!1svi!2s" 
                            width=90% height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>

                <div class="info-footer">
                    <div class="content-footer">
                        <h2>Địa chỉ liên hệ</h2>
                        <p class="mt-40">HUB Hà Nội: Số 103, Đường Vạn Phúc, Phường Vạn Phúc, Quận Hà Đông, TP. Hà Nội</p>
                        <p class="mt-40">HUB Tp HCM: Lầu 1, Số 163 Trần Trọng Cung, Phường Tân Thuận Đông, Quận 7, Tp. Hồ Chí Minh</p>
                    </div>

                    <div class="feedback-footer">
                        <h2 class="mt-40">COOLMATE lắng nghe bạn!</h2>
                        <p>Chúng tôi luôn trân trọng và mong đợi nhận được mọi ý kiến đóng góp từ khách hàng để có thể nâng cấp trải nghiệm dịch vụ và sản phẩm tốt hơn nữa</p>
                        <input class="form-feedback-btn mt-16" type="submit" value="gửi ý kiến">
                        <br>
                        <br>
                        <br>
                        <div class="contact-info">
                            <p><i class="ti-location-pin"></i>Tran Duy Hung, Ha Noi</p>
                            <p><i class="ti-mobile"></i>Phone:+0879 112 113</p>
                            <p><i class="ti-email"></i>Email:Sondbrr123@gmail.com</p>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>


            </div>


        </div>



    </body>
</html>