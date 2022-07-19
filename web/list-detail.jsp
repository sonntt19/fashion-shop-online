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
            [type="checkbox"]:checked,
            [type="checkbox"]:not(:checked),
            [type="radio"]:checked,
            [type="radio"]:not(:checked){
                position: absolute;
                left: -9999px;
                width: 0;
                height: 0;
                visibility: hidden;
            }



            .checkbox-size:checked + label,
            .checkbox-size:not(:checked) + label{
                position: relative;
                display: inline-block;
                padding: 1%;
                width: 10%;
                font-size: 14px;
                margin-left: 5px;
                margin-right: 5px;
                margin-bottom: 10px;
                text-align: center;
                border-radius: 4px;
                cursor: pointer;
                color: white;
                -webkit-transition: all 300ms linear;
                transition: all 300ms linear; 
            }
            .checkbox-size:not(:checked) + label{
                background-color: white;
                border: 1px solid black;
                color: black;
            }

            .checkbox-size:not(:checked) + label:hover{
                box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
            }
            .checkbox-size:checked + label::before,
            .checkbox-size:not(:checked) + label::before{
                position: absolute;
                content: '';
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                border-radius: 4px;
                background-color: black;
                z-index: -1;
            }

            [type="checkbox"]:checked,
            [type="checkbox"]:not(:checked),
            [type="radio"]:checked,
            [type="radio"]:not(:checked){
                position: absolute;
                left: -9999px;
                width: 0;
                height: 0;
                visibility: hidden;
            }
            .checkbox-color:checked + label,
            .checkbox-color:not(:checked) + label{
                position: relative;
                display: inline-block;
                padding: 4%;
                width: 4%;
                font-size: 14px;
                text-align: center;
                border-radius: 50%;
                cursor: pointer;
                color: black;
                border: 3px solid black;
                -webkit-transition: all 300ms linear;
                transition: all 300ms linear; 
            }
            .checkbox-color:not(:checked) + label{
                border: 3px solid white;
                border-radius: 50%;
            }

            .checkbox-color:not(:checked) + label:hover{
                box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
            }
            .checkbox-color:checked + label::before,
            .checkbox-color:not(:checked) + label::before{
                position: absolute;
                content: '';
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                border-radius: 50%;
                background-color: black;
                z-index: -1;
            }

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


            .countProduct{
                position: absolute;
                display: flex;
                border: 1px solid black;
                border-radius: 45px;
            }
            input[type="number"]{
                text-align: center;
                font-size: 20px;
                border: none;
                color: #202030;
            }
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button{
                -webkit-appearance: none;
                margin: 0;
            }
            button{
                color: black;
                background-color: #ffffff;
                border: none;
                font-size: 20px;
                cursor: pointer;
            }
            #decrement{
                padding: 5px 0px 5px 15px;
                border-radius: 45px 0 0 45px;
                cursor: pointer;
                font-size: 20px;
            }
            #increment{
                padding: 5px 15px 5px 0px;
                border-radius: 0 45px 45px 0;
                cursor: pointer;
                font-size: 20px;
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
                        <form action="addcart" id="addcart" method="GET">


                            <h1 class="">${product.name}</h1>
                            <div class="d-flex  small text-warning mb-2">


                                <c:forEach var="i" begin="0" end="4">
                                    <c:if test="${(product.rated_star - i) >= 1}">
                                        <div class="reviews-rating__star is-active"></div> 
                                    </c:if>
                                    <c:if test="${(product.rated_star - i) < 1 && (product.rated_star - i) > 0}">
                                        <div class="reviews-rating__star is-active is-half"></div> 
                                    </c:if>
                                    <c:if test="${(product.rated_star - i) <= 0}">
                                        <div class="reviews-rating__star"></div> 
                                    </c:if>

                                </c:forEach>


                            </div>

                            <div class="fs-5 mb-4">
                                <c:if test="${product.sale_price == 0 || product.sale_price == null}">
                                    <div style="margin-bottom: 1.7%">
                                        Giá gốc: 
                                        <span >${product.original_price}đ</span>
                                    </div>
                                </c:if>
                                <c:if test="${product.sale_price != 0}">
                                    <div style="margin-bottom: 1.7%">
                                        Giá gốc: 
                                        <span class="text-decoration-line-through">${product.original_price}đ</span>
                                    </div>
                                    <div>
                                        Giảm giá:
                                        <span>${product.sale_price}đ</span>
                                    </div>
                                </c:if>
                            </div>
                            <h6>Miêu tả ngắn gọn: </h6>
                            <div class="mb-5">${product.brief_infor}</div>
<!--                            <div class="pd-color">
                                <h6>Màu sắc: </h6>
                                <div class="row">
                                    <div class="col-12 pb-5">
                                        <input class="checkbox-color" type="radio" name="color" id="color-1" value="1" checked="">
                                        <label class="for-checkbox-color" for="color-1" style="background-color: black"></label>

                                        <input class="checkbox-color" type="radio" name="color" id="color-2" value="2">
                                        <label class="for-checkbox-color" for="color-2" style="background-color: blue"></label>

                                        <input class="checkbox-color" type="radio" name="color" id="color-3" value="3">
                                        <label class="for-checkbox-color" for="color-3" style="background-color: red"></label>

                                        <input class="checkbox-color" type="radio" name="color" id="color-4" value="4">
                                        <label class="for-checkbox-color" for="color-4" style="background-color: yellow"></label>

                                        <input class="checkbox-color" type="radio" name="color" id="color-5" value="5">
                                        <label class="for-checkbox-color" for="color-5" style="background-color: green"></label>

                                        <input class="checkbox-color" type="radio" name="color" id="color-6" value="6">
                                        <label class="for-checkbox-color" for="color-6" style="background-color: purple"></label>

                                    </div>
                                </div>
                            </div>

                            <h6>Kích thước Áo/Quần....:  </h6>
                            <div class="row">
                                <div class="col-12 pb-5">
                                    <input class="checkbox-size" type="radio" name="size" id="size-1" checked="" value="1">
                                    <label class="for-checkbox-size" for="size-1">S</label>

                                    <input class="checkbox-size" type="radio" name="size" id="size-2">
                                    <label class="for-checkbox-size" for="size-2">M</label>

                                    <input class="checkbox-size" type="radio" name="size" id="size-3">
                                    <label class="for-checkbox-size" for="size-3">L</label>

                                    <input class="checkbox-size" type="radio" name="size" id="size-4">
                                    <label class="for-checkbox-size" for="size-4">XL</label>

                                    <input class="checkbox-size" type="radio" name="size" id="size-5">
                                    <label class="for-checkbox-size" for="size-5">2XL</label>

                                    <input class="checkbox-size" type="radio" name="size" id="tsize-6">
                                    <label class="for-checkbox-size" for="size-6">3XL</label>
                                </div>
                            </div>-->
                            <div class="row">
                                <div class="countProduct col-lg-3" style="margin-left: 3%">
                                    <div id="decrement" onclick="stepper(this)"><b>-</b></div>
                                    <input type="number" name="quantity" min="1" max="100" step="1" value="1" id="my-input" readonly>
                                    <input type="hidden" name="productId" value="${product.id}" />
                                    <div id="increment" onclick="stepper(this)"><b>+</b></div>
                                </div>
                                <div class="col-lg-6">
                                    <input class="btn btn-outline-dark" type="submit" style="font-size: 20px" value="Thêm vào giỏ hàng">                                     
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 align-items-center" style="padding-top: 10%">
                    <p class="lead">${product.brief_infor}</p>
                    <p class="lead">${product.desciption}</p>
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
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="list-detail?productId=${p.id}&categoryId=${p.category_id}">Xem chi tiết</a></div>
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
                        <form action="feedback">
                            <input type="hidden" name="productId" value="${product.id}"/>
                            <b>Viết bình luận:</b>&nbsp;&nbsp;
                            <div class="form-group">
                                <textarea name="subject" placeholder="Viết bình luận.." style="height:200px ; width: 460px"></textarea>
                            </div>
                            <b>Ảnh phản hồi:</b>&nbsp;&nbsp;
                            <div class="form-group">
                                <input name="imageurl" type="file" class="form-control" style="border-radius: 100px;" required="">
                            </div>
                            <b>Đánh giá:</b>&nbsp;&nbsp;
                            <div class="form-group" >
                                <select name = "star" style="border-radius: 100px;" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                    <option selected>Chọn số sao bạn dành cho KingsMan</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </div>
                            <br>


                            <center><button type="submit" class="btn btn-dark" style="padding-right: 160px;padding-left: 160px; border-radius: 100px;">Bình luận</button></center>

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
        <div style="background-color:#f8f9fa;">
            <hr class="marketing_feedback_margin">
            <span><h2 class="marketing_feedback_margin marketing_feedbac_displayinline">${total} Đánh giá</h2></span>
            <span><h2 class="marketing_feedback_margin marketing_feedbac_displayinline">${Math.round(avg * 1000) / 1000}/5 <img style="height: 40px; width: 40px" src="images/images.png"></h2></span>
                    <c:if test="${accept.orderID != null}">
                <a data-toggle="modal" data-dismiss="modal" data-target="#feedback">
                    <h2 class="marketing_feedback_margin marketing_feedbac_displayinline" style="color: blue">
                        Viết nhận xét của bạn
                    </h2>
                </a>
            </c:if>
            <hr class="marketing_feedback_margin">
            <div  class="container-fluid">
                <div class="row">
                    <c:forEach items="${listfeedbackbyproduct}" var="f">
                        <div class="col-sm-6">
                            <span>
                                <h6 class="marketing_feedback_margin marketing_feedbac_displayinline">
                                    <c:forEach var="i" begin="0" end="4">
                                        <c:if test="${(f.rated_star - i) >= 1}">
                                            <div class="reviews-rating__star is-active"></div> 
                                        </c:if>
                                        <c:if test="${(f.rated_star - i) < 1 && (f.rated_star - i) > 0}">
                                            <div class="reviews-rating__star is-active is-half"></div> 
                                        </c:if>
                                        <c:if test="${(f.rated_star - i) <= 0}">
                                            <div class="reviews-rating__star"></div> 
                                        </c:if>
                                    </c:forEach>
                                    <br/>
                                    <b class="marketing_feedback_margin">${f.fullName}</b>
                                </h6>
                            </span>

                            <h6 class="marketing_feedback_margin mt-2">${f.feedback}
                                <c:if test="${f.user_id == sessionScope.us.user_Id}">
                                    <a href="delete-feedback?id=${f.id}" class="float-right btn btn-outline-danger">Xóa</a>
                                </c:if>
                            </h6>
                            <h6 class="marketing_feedback_margin"><img style="height: 100px; width: 100px" src="${f.image}"></h6>
                            <span class="reviews-listing__date marketing_feedback_margin">
                                ${f.date}
                            </span>
                            <hr class="marketing_feedback_margin">

                        </div>
                    </c:forEach>
                </div>
            </div>
            <!-- Footer-->
            <%@include file="components/footer.jsp" %>
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="do/js/scripts.js"></script>
            <script>
                                        const myInput = document.getElementById("my-input");
                                        function stepper(btn) {
                                            let id = btn.getAttribute("id");
                                            let min = myInput.getAttribute("min");
                                            let max = myInput.getAttribute("max");
                                            let step = myInput.getAttribute("step");
                                            let val = myInput.getAttribute("value");
                                            let calcStep = (id == "increment") ? (step * 1) : (step * -1);
                                            let newValue = parseInt(val) + calcStep;

                                            if (newValue >= min && newValue <= max) {
                                                myInput.setAttribute("value", newValue);
                                            }
                                        }
            </script>
    </body>
</html>
