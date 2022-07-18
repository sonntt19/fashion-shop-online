<%-- 
    Document   : product
    Created on : May 30, 2022, 2:30:55 PM
    Author     : son22
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <%@include file="components/javascript.jsp" %>
        <title>JSP Page</title>
    </head>
    <body >

        <%@include file="components/header.jsp" %>
        <%@include file="components/account.jsp" %>
        <div  class="container-fluid" >
            <div class="row">
                <div class="col-md-10 col-sm-8">
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
                <div class="col-md-2 col-sm-4">
                    <div class="row">
                        <div id="wrapper" >
                            <div class="headline">
                                <div class="new-product">Sản phẩm mới nhất</div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="product-item">
                            <div class="product-top">

                                <div class="reviews-rating">
                                    <c:forEach var="i" begin="0" end="4">
                                        <c:if test="${(sessionScope.pNew.rated_star - i) >= 1}">
                                            <div class="reviews-rating__star is-active"></div> 
                                        </c:if>
                                        <c:if test="${(sessionScope.pNew.rated_star - i) < 1 && (sessionScope.pNew.rated_star - i) > 0}">
                                            <div class="reviews-rating__star is-active is-half"></div> 
                                        </c:if>
                                        <c:if test="${(sessionScope.pNew.rated_star - i) <= 0}">
                                            <div class="reviews-rating__star"></div> 
                                        </c:if>

                                    </c:forEach>
                                </div>
                                <a href="list-detail?productId=${sessionScope.pNew.id}&categoryId=${sessionScope.pNew.category_id}" class="product-thumb">
                                    <img src="${sessionScope.pNew.image}" alt="">

                                </a>
                                <a href="addcart?productId=${sessionScope.pNew.id}" class="buy-now" >Mua ngay</a>

                            </div>
                            <div class="product-infor">
                                <a href="" class="product-name">${sessionScope.pNew.name}</a>
                                <div class="product-price">
                                    <c:if test="${sessionScope.pNew.sale_price != 0}">
                                        ${sessionScope.pNew.sale_price}đ
                                        <del>${sessionScope.pNew.original_price}đ</del>
                                    </c:if>
                                    <c:if test="${sessionScope.pNew.sale_price == 0}">
                                        ${sessionScope.pNew.original_price}đ
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-4">
                <form class="input-search" action="list">
                    <div>
                        <input type="text" name="key" value="${key}" placeholder="Tìm kiếm sản phẩm..." class="filter-search__control" >
                        <button type="submit" class="button-search"></button>
                    </div>

                </form>
            </div>

            <div class="col-md-2">
                <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;" name="Sắp xếp">
                    <option value="list?${historyKey}${historyValue}${historyType}" ${categoryId == 0 ? "Selected" : ""}>
                        Tất Cả
                    </option>
                    <c:forEach items="${sessionScope.listCategories}" var="c">
                        <option value="list?${historyKey}&categoryId=${c.id}${historyValue}${historyType}" ${categoryId == c.id ? "Selected" : ""}>
                            ${c.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-2">
                <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;">
                    <option value="list?${historyKey}${historyCategoryId}&type=desc" ${type eq "desc" ? "Selected" : ""}>
                        Mới Nhất
                    </option>
                    <option value="list?${historyKey}${historyCategoryId}" ${type == null ? "Selected" : ""}>
                        Cũ Nhất
                    </option> 
                    <option value="list?${historyKey}${historyCategoryId}&value=original_prices" ${value eq "original_prices" ? "Selected" : ""}>
                        Giá tăng dần
                    </option>
                    <option value="list?${historyKey}${historyCategoryId}&value=original_prices&type=desc" ${value eq "original_prices" && type eq "desc" ? "Selected" : ""}>
                        Giá giảm dần
                    </option> 
                </select>
            </div>
            <div class="col-md-4 list">
                <h2>Danh Sách Sản Phẩm</h2>
            </div>
        </div>
        <hr>
        <div  class="container-fluid">
            <div class="row">
                <c:forEach items="${listProduct}" var="p">
                    <div class="col-lg-2 col-md-3 col-sm-6 product-down">
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
                                    <a href="list-detail?productId=${p.id}&categoryId=${p.category_id}" class="product-thumb">
                                        <img src="${p.image}"alt="">
                                    </a>
                                    <c:if test="${sessionScope.us == null}" >
                                        <a class="buy-now" data-toggle="modal"  data-target="#loginModal" style="color: white">Mua ngay</a>
                                    </c:if>
                                    <c:if test="${sessionScope.us != null}" >
                                        <a href="addcart?productId=${p.id}" class="buy-now" >Mua ngay</a>
                                    </c:if>
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
        <nav aria-label="..." class="pagination">
            <ul class="pagination">
                <li class="page-item">
                    <a <c:if test="${page!=1}">                         
                            href="list?page=${page-1}${historyKey}${historyCategoryId}${historyValue}${historyType}"
                        </c:if> class="page-link" aria-label="Previous">
                        <span  aria-hidden="true">«</span>
                    </a>
                </li>

                <c:forEach begin="1" end="${totalPage}" var="i">
                    <li class="page-item ${i==page ?"active" : ""}"><a class="page-link" href="list?page=${i}${historyKey}${historyCategoryId}${historyValue}${historyType}">${i}</a></li>
                    </c:forEach>

                <li class="page-item">
                    <a <c:if test="${page!=totalPage}">
                            href="list?page=${page+1}${historyKey}${historyCategoryId}${historyValue}${historyType}"
                        </c:if> class="page-link" aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </a>
                </li>
            </ul>
        </nav>
        <%@include file="components/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    </body>
</html>
