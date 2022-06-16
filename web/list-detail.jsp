<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>

        <title>Shop Item - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="do/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="do/css/styles.css" rel="stylesheet" />
        <style>
            .marketing_feedback_margin{
                margin-left: 5%;
                margin-right: 5%
            }
            .marketing_feedbac_displayinline{
                display: inline;
            }
            textarea{
                width: 90%;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-top: 6px;
                margin-bottom: 16px;
                resize: vertical;
            }
        </style>
        <%@include file="components/javascript.jsp" %>
    </head>
    <body>
        <!-- Navigation-->
        <%@include file="components/header.jsp" %>
        <%@include file="components/account.jsp" %>

        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-5"><img class="card-img-top mb-5 mb-md-0" style="max-width: 450px" src="${product.image}" alt="..." /></div>
                    <div class="col-md-7">
                        <h1 class="">${product.name}</h1>
                        <div class="d-flex  small text-warning mb-2">
                            <div class="bi-star-fill " style="margin-right: 1%; size: 10px"></div>
                            <div class="bi-star-fill " style="margin-right: 1%"></div>
                            <div class="bi-star-fill " style="margin-right: 1%"></div>
                            <div class="bi-star-fill " style="margin-right: 1%"></div>
                            <div class="bi-star-fill " style="margin-right: 1%"></div>
                        </div>

                        <div class="fs-5 mb-4">
                            <div style="margin-bottom: 1.7%">
                                Giá gốc: 
                                <span class="text-decoration-line-through">${product.original_price}đ</span>
                            </div>
                            <div>
                                Giảm giá:
                                <span>${product.sale_price}đ</span>
                            </div>
                        </div>
                        <p class="lead">${product.brief_infor}</p>
                        <p class="lead">${product.desciption}</p>

                        <!-- Colder Product Detail-->
                        <!--                        <div class="pd-color">
                                                    <h6>Color</h6>
                                                    <div class="pd-color-choose">
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-black">
                                                            <label for="cc-black"></label>
                                                        </div>
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-yellow">
                                                            <label for="cc-yellow" class="cc-yellow"></label>
                                                        </div>
                                                        <div class="cc-item">
                                                            <input type="radio" id="cc-violet">
                                                            <label for="cc-violet" class="cc-violet"></label>
                                                        </div>
                                                    </div>
                                                </div>-->

                        <!-- Size Product Detail-->
                        <!--                        <div class="pd-size-choose">
                                                            <div class="sc-item">
                                                                <input type="color" class="form-control form-control-color" id="exampleColorInput" value="#563d7c" title="S">
                                                                <label for="sm-size">s</label>
                                                            </div>
                                                            <div class="sc-item">
                                                                <input type="radio" id="md-size">
                                                                <label for="md-size">m</label>
                                                            </div>
                                                            <div class="sc-item">
                                                                <input type="radio" id="lg-size">
                                                                <label for="lg-size">l</label>
                                                            </div>
                                                            <div class="sc-item">
                                                                <input type="radio" id="xl-size">
                                                                <label for="xl-size">xs</label>
                                                            </div>
                                                        </div>-->



                        <div class="d-flex">
                            <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <a class="btn btn-outline-dark flex-shrink-0" type="button" href="cart?productId=${product.id}">
                                <i class="bi-cart-fill me-1"></i>
                                Add to cart
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="ms-2 mb-4">Sản phẩm liên quan</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <c:forEach items="${listProduct}" var="p">
                        <div class="col mb-5">

                            <div class="card h-100">
                                <!-- Product image-->
                                <img class="card-img-top" src="${p.image}" alt="..." />
                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder">${p.name}</h5>
                                        <!-- Product price-->
                                        <div style="margin-bottom: 1.7%">
                                            Giá gốc: 
                                            <span class="text-decoration-line-through">${product.original_price}đ</span>
                                        </div>
                                        <div>
                                            Giảm giá:
                                            <span>${product.sale_price}đ</span>
                                        </div>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                                </div>
                            </div>

                        </div>
                    </c:forEach>

                </div>
            </div>
        </section>
        <!-- Feedback Form -->
        <div class="modal fade col-md-12" role="dialog" id="feedback">
            <div class="modal-dialog">
                <div class="modal-content" style="border-radius: 10px; margin-top: 60px;">
                    <div class="modal-header">
                        <h2 style="margin-left: 35%">Bình luận</h2>
                    </div>
                    <div class="modal-body">
                        <form action="feedback" method="post">
                            <input type="hidden" name="productId" value="${product.id}"/>
                            <input type="hidden" name="status" value="1"/>
                            <b>Viết bình luận:</b>&nbsp;&nbsp;
                            <div class="form-group">
                                <textarea name="subject" placeholder="Viết bình luận.." style="height:200px ; width: 460px"></textarea>
                            </div>
                            <b>Link ảnh phản hồi:</b>&nbsp;&nbsp;
                            <div class="form-group">
                                <input name="imageurl" type="text" class="form-control" style="border-radius: 100px;" required="">
                            </div>
                            <b>Đánh giá:</b>&nbsp;&nbsp;
                            <div class="form-group" >
                                <select style="border-radius: 100px;" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                    <option selected>Chọn số sao bạn dành cho KingsMan</option>
                                    <option name = "star" value="1">1</option>
                                    <option name = "star" value="2">2</option>
                                    <option name = "star" value="3">3</option>
                                    <option name = "star" value="3">4</option>
                                    <option name = "star" value="3">5</option>
                                </select>
                            </div>
                            <br>
                            <c:if test="${us == null}">
                                <center><button data-target="#loginModal" type="submit" class="btn btn-dark" style="padding-right: 130px;padding-left: 130px; border-radius: 100px;">Đăng nhập để bình luận</button></center>
                                </c:if>
                                <c:if test="${us != null}">
                                <center><button type="submit" class="btn btn-dark" style="padding-right: 160px;padding-left: 160px; border-radius: 100px;">Bình luận</button></center>
                                </c:if>
                        </form>
                        <br><br>
                    </div>
                </div>
            </div>
        </div>
        <!-- Feedback List -->
        <c:if test="${total == 0}">
            <h3 style="text-align: center; font-style: oblique;">Không có bình luận</h3>
        </c:if>             
        <c:forEach items="${listfeedbackbyproduct}" var="f">
            <div style="background-color:#f8f9fa;">
                <hr class="marketing_feedback_margin">
                <span><h2 class="marketing_feedback_margin marketing_feedbac_displayinline">${total} Đánh giá</h2></span>
                <span><h2 class="marketing_feedback_margin marketing_feedbac_displayinline">${f.rated_star}/5 <img style="height: 40px; width: 40px" src="images/images.png"></h2></span>
                <a data-toggle="modal" data-dismiss="modal" data-target="#feedback"><h2 class="marketing_feedback_margin marketing_feedbac_displayinline" style="color: blue">Viết nhận xét của bạn</h2></a>
                <hr class="marketing_feedback_margin">

                <span><h6 class="marketing_feedback_margin marketing_feedbac_displayinline"><b>${f.fullName} &nbsp &nbsp ${f.rated_star}/5</b>  <img style="height: 20px; width: 20px" src="images/images.png"></h6></span>
                <h6 class="marketing_feedback_margin">${f.feedback} <a href="delete-feedback?id=${f.id}">Xóa bình luận</a></h6>
                <h6 class="marketing_feedback_margin"><img style="height: 100px; width: 100px" src="${f.image}"></h6>
            </div>
        </c:forEach>
        <!-- Footer-->
        <%@include file="components/footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="do/js/scripts.js"></script>
    </body>
</html>
