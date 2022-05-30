<%-- 
    Document   : product
    Created on : May 30, 2022, 2:30:55 PM
    Author     : son22
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <style>
            #wrapper{
                margin: 0 auto;
            }
            h3{
                padding: 10px 20px;
                color: black;
                font-size: 18px;
                text-transform: uppercase;
                border: 1px solid gainsboro;
                display: inline-block;
                font-weight: 600;
            }
            .headline{
                text-align: center;
            }
            .product-infor a{
                text-decoration: none;
            }
            .product-name{
                color: black;
                padding: 3px 0px;
                font-weight: bold;
            }
            .product-price{
                color: #ff3102;
                padding: 2px 0px;
                margin-right: 14px;
            }
            .product-top a{
                display: block;
            }
            .product-top{
                position: relative;
                overflow: hidden;
            }
            .product-top:hover a.buy-now{
                bottom: 0px;
            }
            .product-top:hover a img{
                filter: opacity(80%);
            }
            .product-top .buy-now{
                text-transform: uppercase;
                text-decoration: none;
                text-align: center;
                background-color: #446084;
                color: white;
                padding: 10px 0px;
                position: absolute;
                width: 100%;
                bottom: -44px;
                transition: 0.25s ease-in-out;
                opacity: 0.85;
            }
            del{
                color: #c4c4c4;
                float: right;
            }
            .reviews-rating {
                text-decoration: none;
                position: absolute;
                top: 0;
                padding: 0px 10px;
            }
            .reviews-rating__star{
                width: 8px;
                height: 8px;
                margin: 0 2px;
                background-image: url(images/star-none.svg);
                display: inline-block;
            }
            .is-active{
                background-image: url(images/star.svg);
            }
            .is-half{
                background-image: url(images/star-half.svg);
            }

        </style>
        <%@include file="components/header.jsp" %>
        <div  class="container-fluid" style="margin-top: 65px">
            <div class="row">
                <div class="col-md-10">
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
                </div>
                <div class="col-md-2">
                    <div class="row">
                        <div id="wrapper" >
                            <div class="headline">
                                <h3>Sản phẩm mới nhất</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="product-item">
                            <div class="product-top">
                                
                                   <div class="reviews-rating">
                                    <div class="reviews-rating__star is-active"></div> 
                                    <div class="reviews-rating__star is-active"></div>
                                    <div class="reviews-rating__star is-active"></div> 
                                    <div class="reviews-rating__star is-half"></div> 
                                    <div class="reviews-rating__star "></div> 
                                </div>
                                <a href="" class="product-thumb">
                                    <img src="https://media.coolmate.me/cdn-cgi/image/width=450,height=663,quality=100/uploads/April2022/polo-anti-trang_76.jpg" height="365px" alt="">
                                    
                                </a>
                                <a href="" class="buy-now" >Mua ngay</a>

                            </div>
                            <div class="product-infor">
                                <a href="" class="product-name">Áo polo nam công nghệ khử mùi Anti-Smell</a>
                                <div class="product-price">100.000đ  <del>200.000đ</del></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <hr>
    </body>
</html>
