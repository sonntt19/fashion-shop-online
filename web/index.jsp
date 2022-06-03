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
        
    </head>
    <body>
        <div id="main">

            <%@include file="components/header.jsp" %>
            <%@include file="components/account.jsp" %>
            <!--Slider-->


            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" >
                    <div class="carousel-indicators">

                        <c:forEach items="${sessionScope.listSlider_HomePageAll}" var="s" >
                            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${s.id -1}" class="${s.id == sessionScope.sliderFirst.id ? "active" : ""}" aria-current="${s.id == sliderFirst.id ? "true" : ""}" aria-label="Slide ${s.id}"></button>
                        </c:forEach>
                    </div>

                    <div class="carousel-inner">

                        <c:forEach items="${sessionScope.listSlider_HomePageAll}" var="s" >
                            <div class="carousel-item ${s.id == sessionScope.sliderFirst.id ? "active" : ""}">
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



            <!-- Content -->
            <div id="content">
                <div class="content-section background-product" style="width: 1500px">


                <!-- Base Product -->
                <h2 class="section-heading">Trang phục cơ bản</h2>
                <div  class="container-fluid">
                    <div class="row">
                        <c:forEach items="${sessionScope.list4product}" var="p">
                            <div class="col-md-2 product-down">
                                <div class="row">
                                    <div class="product-item">
                                        <div class="product-top">

                                                <div class="reviews-rating">

                                                    <c:forEach var="i" begin="0" end="4">
                                                        <c:if test="${(p.rated_star - i) >= 1}">
                                                            <div class="reviews-rating__star is-active"></div> 
                                                        </c:if>
                                                        <c:if test="${(p.rated_star - i) < 1 && (p.rated_star - i) > 0}">
                                                            <div class="reviews-rating__star is-active is-half"></div> 
                                                        </c:if>
                                                        <c:if test="${(p.rated_star - i) <= 0}">
                                                            <div class="reviews-rating__star"></div> 
                                                        </c:if>

                                                    </c:forEach>

                                                </div>
                                                <a href="" class="product-thumb">
                                                    <img src="${p.image}" height="365px" width="230px" alt="">

                                                </a>
                                                <a href="" class="buy-now" >Mua ngay</a>

                                            </div>
                                            <div class="product-infor">
                                                <a href="" class="product-name">${p.name}</a>
                                                <div class="product-price">
                                                    <c:if test="${p.sale_price != 0}">
                                                        ${p.sale_price}đ
                                                        <del>${p.original_price}đ</del>
                                                    </c:if>
                                                    <c:if test="${p.sale_price == 0}">
                                                        ${p.original_price}đ
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>


                <div class="content-Category-section background-product"><!--

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

                        <c:forEach items="${sessionScope.listBlog_HomePage}" var="C">
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


                <!-- End Contact -->




            </div>
            <%@include file="components/footer.jsp" %>



        </div>

     

    </body>

</html>