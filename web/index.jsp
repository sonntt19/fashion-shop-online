<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <body>
        <div id="main">
            <div style="margin-top: 22px"></div>
            <%@include file="components/header.jsp" %>
            <!-- Login -->

            <div class="modal fade col-md-12" role="dialog" id="loginModal">
                <div class="modal-dialog">
                    <div class="modal-content" style="border-radius: 10px; margin-top: 258px;">
                        <div class="modal-header">
                            <h2 class="" id="loginModal" style="text-align:center; font-family: Arial"><b style="padding-left: 150px;">Đăng Nhập</b></h2><br>
                        </div>
                        <div class="modal-body">
                            <form action="login" method="post">
                                ${mess}
                                <div class="form-group">
                                    <input name="email" type="email" class="form-control" id="email" placeholder="Email của bạn"style="border-radius: 100px;" required="">
                                </div>
                                <div class="form-group">
                                    <input name="pass" type="password" class="form-control" id="pwd" placeholder="Mật khẩu"style="border-radius: 100px;" required>
                                </div>
                                <input type="checkbox" style="height:15px;width:15px; ">&nbsp;Nhớ mật khẩu
                                <br><br>
                                <center><button type="submit" class="btn btn-dark" style="padding-right: 193px;padding-left: 193px; border-radius: 100px;">Đăng nhập</button></center>
                            </form>
                            <br><br>
                            <a type="button" data-toggle="modal" data-dismiss="modal" onclick="Changepass_openForm()" style="float:right; text-decoration: none; border-radius: 100px;">Quên Mật Khẩu</a>
                            <a type="button" data-toggle="modal" data-dismiss="modal" data-target="#registerModal" style="float:left; text-decoration: none; border-radius: 100px;">Đăng ký tài khoản mới</a>
                        </div>
                    </div>
                </div>
            </div> 

            <!-- Register -->

            <div class="modal fade col-md-12" role="dialog" id="registerModal" style="padding-right: 18px" >
                <div class="modal-dialog">
                    <div class="modal-content" style="border-radius: 10px; margin-top: 180px;">
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
                                                    Giới tính&nbsp;&nbsp;&nbsp;
                                                    <input class="" name="gender" type="radio" value="Nam" />&nbsp; Nam
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input class="" name="gender" type="radio" value="Nữ" />&nbsp; Nữ
                                                </div>
                                            </div>
                                            <br><br><center><button type="submit" class="btn btn-dark" style="padding-right: 190px;padding-left: 190px; border-radius: 100px;">Đăng ký</button></center><br><br>
                                        </div>
                                    </form>
                                    <a type="button" data-toggle="modal" data-dismiss="modal" data-target="#loginModal" style="padding-left: 150px; text-decoration: none; border-radius: 100px;">Quay lại đăng nhập</a> 
                            </section>
                        </div>
                    </div>
                </div>
            </div> 

            <!-- Change Password -->
            <div  class=  "changepassword_form-popup" id="changepassword_Form" >
                <form action="ChangePassword" method="POST" class="changepassword_form-container"style ="box-shadow: 5px 10px 5px gray">
                    <i style="margin-left:560px;margin-top: 10px;font-size:20px;color: gray" class="fa fa-close" onclick="Changepass_closeForm()"></i>
                    <h1 style="text-align: center">Thay đổi mật khẩu</h1>
                    <h4 style="color: red">${new_pass2}</h4>
                    <input type="hidden" name="userId" value="${user.id}"/>
                    <label for="psw">
                        <b>Nhập mật khẩu cũ</b>&nbsp;&nbsp;
                        <i onclick="changeTypeOll_Pass()" class="fa fa-eye icon"></i>
                    </label>
                    <h4 style="color: red">${old_pass2}</h4>
                    <input class="changepassword_bd_rd" id="changepassword_Input1" type="password" placeholder="Mật khẩu cũ" name="old_pass" required>
                    <label for="psw">
                        <b>Nhập mật khẩu mới</b>&nbsp;&nbsp;
                        <i onclick="changeTypeNew_Pass1()" class="fa fa-eye icon"></i>
                    </label>
                    <input class="changepassword_bd_rd" id="changepassword_Input2" type="password" placeholder="Mật khẩu mới" class="fa fa-eye" name="new_pass1" required>
                    <label for="psw">
                        <b>Nhập lại mật khẩu mới</b>&nbsp;&nbsp;
                        <i onclick="changeTypeNew_Pass2()" class="fa fa-eye icon"></i>
                    </label>
                    <input class="changepassword_bd_rd" id="changepassword_Input3" type="password" placeholder="Nhập lại mật khẩu mới" name="new_pass2" required>
                    <button type="submit" class="changepassword_btn">Cập nhật mật khẩu</button>
                </form>
            </div>

            <!--Slider-->
           
            
                <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" >
                        <div class="carousel-indicators">
                            
                            <c:forEach items="${listSlider_HomePageAll}" var="s" >
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${s.id -1}" class="${s.id == sliderFirst.id ? "active" : ""}" aria-current="${s.id == sliderFirst.id ? "true" : ""}" aria-label="Slide ${s.id}"></button>
                            </c:forEach>
                        </div>
                        <div class="carousel-inner">

                            <c:forEach items="${listSlider_HomePageAll}" var="s" >
                                <div class="carousel-item ${s.id == sliderFirst.id ? "active" : ""}">
                                    <img src="${s.slider_image}" class="d-block w-100" alt="...">
                                </div> 

                            </c:forEach>
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

                        <!-- blog list hot -->
                        <div class="blog-list">

                            <c:forEach items="${listBlog_HomePage}" var="C">
                                <div class="blog-item">
                                    <img src="${C.thumbnail}" alt="" class="blog-img">
                                    <div class="blog-body">
                                        <h3 class="blog-heading">${C.title}</h3>
                                        <p class="blog-desc">${C.brief_info}</p>
                                        <a href="#" class="place-buy-btn">Tìm hiểu thêm</a>
                                    </div>
                                </div>
                            </c:forEach>

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
            <%@include file="components/footer.jsp" %>


        </div>

        <!--JS Change Password -->       
        <script>
            function Changepass_openForm() {
                document.getElementById("changepassword_Form").style.display = "block";
            }

            function Changepass_closeForm() {
                document.getElementById("changepassword_Form").style.display = "none";
                document.body.style.backgroundColor = "rgba(0,0,0,0)";
            }
            function changeTypeOll_Pass() {
                var x = document.getElementById("changepassword_Input1");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
            function changeTypeNew_Pass1() {
                var x = document.getElementById("changepassword_Input2");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
            function changeTypeNew_Pass2() {
                var x = document.getElementById("changepassword_Input3");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>
    </body>

</html>