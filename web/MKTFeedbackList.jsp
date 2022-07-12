<%-- 
    Document   : MKTDashboard
    Created on : Jun 23, 2022, 7:56:23 AM
    Author     : Veetu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            .payment-method__item-name {
                font-size: 20px;
                padding-left: 20px;
            }

            .payment-method__item {
                display: flex;
                align-items: center;
                border: 1px solid #D9D9D9;
                border-radius: 16px;
                padding: 15px 20px;
                margin-bottom: 1rem;
            }



            .payment-method__item-icon-wrapper img {
                min-width: 100px;
                max-height: 100px;
                max-width: 100px;
                padding-left: 40px;
                image-rendering: -webkit-optimize-contrast;
            }
            .body_cartCompletion {
                font-family: sans-serif;
                background: linear-gradient(110deg, #fdfdbe 60%, #f9f86c 60%);
            }
            .groundy{
                font-family: sans-serif;
                background: linear-gradient(110deg, #fdfdbe 60%, #f9f86c 60%);
            }

            .circle {
                height: 10px;
                width: 10px;
                border: 50%;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="components/account.jsp" %>
        <nav class="sb-topnav navbar navbar-expand navbar-light bg-light    ">
            <!-- Navbar Brand-->
            <a class="navbar-brand me-5 ti-joomla" href="home" style="padding-left: 2%">KingsMan</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <div class="collapse navbar-collapse ms-5" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item me-4">
                        <a class="nav-link active" aria-current="page" href="home">Trang chủ</a>
                    </li>
                    <li class="nav-item me-4">
                        <a class="nav-link" href="list">Sản Phẩm</a>
                    </li>
                    <li class="nav-item me-4">
                        <a class="nav-link" href="blog">Blog</a>
                    </li>
                    <li class="nav-item me-4">
                        <a class="nav-link" href="#">Contact</a>
                    </li>


                </ul>
                <!-- Navbar-->
                <form class="d-flex me-5" action="list">
                    <input class="form-control me-2" type="text" name ="key" placeholder="Tìm kiếm sản phẩm..." aria-label="Search" value="${key}" id="" required class="form-control">

                    <button class="btn btn-outline-danger" type="submit">Tìm</button>
                </form>




                <ul class="navbar-nav mb-2 mb-lg-0">
                    <c:if test="${sessionScope.us != null}">
                        <div class="btn-group">
                            <button type="button" class="btn btn-outline-dark dropdown-toggle py-2 px-4" data-bs-toggle="dropdown" aria-expanded="false">
                                Hello ${sessionScope.us.full_Name}
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" type="button" data-toggle="modal"  data-target="#userProfileModal">Thông tin cá nhân</a></li>
                                <li><a class="dropdown-item" href="#">Danh sách đơn hàng</a></li>
                                <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.us == null}">
                        <li class="nav-item">
                            <a><i type="button" class="ti-user btn btn-icon py-2 px-4" data-toggle="modal"  data-target="#loginModal"></i></a>
                        </li>
                    </c:if>
                    <!-- begin icon header -->

                    <li class="nav-item">
                        <a class="nav-link btn btn-icon py-2 px-4" href="carts" tabindex="-1" aria-disabled="true"><i class="ti-shopping-cart"></i></a>
                    </li>
                </ul>
        </nav>
        <div id="layoutSidenav">
            <%@include file="components/MKT-left-board.jsp" %>
            <div class="groundy" id="layoutSidenav_content">
                <main>
                    <div class="container-fluid rounded row" style="margin-top: 1% !important; margin-bottom: 1% !important">
                        <div class="col-md-1">
                            <a href="#"><button type="button" class="btn btn-danger " style="">---------</button></a>
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new" style="width: 100%" aria-label="Default select example" onchange="location = this.value;">
                                <option value="posts-list?${historyKey}${historyValue}${historyType}${historyStatus}${historyAuthor}" ${categoryId == null ? "Selected" : ""}>
                                    Danh Mục
                                </option>
                                <c:forEach items="${sessionScope.listCategoryBlog}" var="c">
                                    <option value="posts-list?${historyKey}${historyValue}${historyType}${historyStatus}${historyAuthor}&categoryId=${c.categoryBlog_id}" ${categoryId == c.categoryBlog_id ? "Selected" : ""}>
                                        ${c.categoryBlog_name}
                                    </option>
                                </c:forEach>

                            </select>
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new float-left" style="width: 100%" aria-label="Default select example" onchange="location = this.value;"> Sắp xếp
                                <option value="posts-list?${historyKey}${historyValue}${historyStatus}${historyAuthor}${historyCategoryId}&type=desc" ${type == "desc" ? "Selected" : ""}>
                                    Mới Nhất
                                </option>
                                <option value="posts-list?${historyKey}${historyValue}${historyStatus}${historyAuthor}${historyCategoryId}" ${type == null ? "Selected" : ""}>
                                    Cũ Nhất
                                </option>

                            </select>
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new" style="width: 113%" aria-label="Default select example" onchange="location = this.value;">
                                <option value="posts-list?${historyKey}${historyValue}${historyStatus}${historyCategoryId}" ${authorId == null ? "Selected" : ""}>
                                    Tác giả
                                </option>
                                <c:forEach items="${sessionScope.listAuthor}" var="a">
                                    <option value="posts-list?${historyKey}${historyValue}${historyType}${historyStatus}${historyCategoryId}&authorId=${a.user_Id}" ${authorId == a.user_Id ? "Selected" : ""}>
                                        ${a.full_Name}
                                    </option>
                                </c:forEach>

                            </select>
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new float-right" aria-label="Default select example" onchange="location = this.value;"> Trạng thái
                                <option value="posts-list?${historyKey}${historyValue}${historyAuthor}${historyCategoryId}" ${status == null ? "Selected" : ""}>
                                    Trạng thái
                                </option>
                                <option value="posts-list?${historyKey}${historyValue}${historyAuthor}${historyCategoryId}&status=1" ${status == 1 ? "Selected" : ""}>
                                    Hiện
                                </option>
                                <option value="posts-list?${historyKey}${historyValue}${historyAuthor}${historyCategoryId}&status=0" ${status == 0 ? "Selected" : ""}>
                                    Ẩn
                                </option>

                            </select>
                        </div>
                        <div class="col-md-2 text-center">
                            <form action="feedback-list">
                                <input type="text" name="key" value="${key}" placeholder="Tìm kiếm" class="filter-search__control" >
                                <button type="submit" class="btn btn-outline-danger" href="#" role="button">
                                    <i style='font-size:15px' class='fas'>&#xf002;</i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="container rounded bg-white mt-5 mb-5" >
                        <table class="table"  style="margin-top: 4%">
                            <thead  class="text-center">
                            <th>ID</th>
                            <th>Ảnh đánh giá</th>
                            <th>Tên liên hệ</th>
                            <th>Sản phẩm</th>
                            <th>Số sao</th>
                            <th>Trạng&nbsp;thái</th>
                            <th style="width: 12%">Tùy&nbsp;chọn&nbsp;</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${listFeedback}" var="f">
                                    <tr  class="text-center">
                                        <th scope="row">${f.id}</th>
                                        <td><img src="${f.image}" height="140px" width="100px"/></td>
                                        <td>${f.fullName}</td>
                                        <td>${f.product_name}</td>
                                        <td lass="reviews-rating">
                                            <c:forEach var="i" begin="0" end="4">
                                                <c:if test="${(f.rated_star - i) >= 1}">
                                                    <div style="height:10px; width: 10px;" class="reviews-rating__star is-active"></div> 
                                                </c:if>
                                                <c:if test="${(f.rated_star - i) < 1 && (p.rated_star - i) > 0}">
                                                    <div style="height:10px; width: 10px;" class="reviews-rating__star is-active is-half"></div> 
                                                </c:if>
                                                <c:if test="${(f.rated_star - i) <= 0}">
                                                    <div style="height:10px; width: 10px;" class="reviews-rating__star"></div> 
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <c:if test="${f.status == true}">
                                            <td><img class="circle" src="images/active.png"></td>
                                            </c:if>
                                            <c:if test="${f.status != true}">
                                            <td><img class="circle" src="images/inactive.png"></td>
                                            </c:if>
                                        <td style="width: 125px">
                                            <a class="btn btn-danger" href="feedback-detail?feedbackId=${f.id}" role="button" title="Chi tiết" style='font-size:10px'>
                                                <i style='font-size:10px' class='fas'>&#xf044;</i>
                                            </a>
                                            <c:if test="${f.status == true}">
                                                <a class="btn btn-dark" href="status-feedback?status=0&feedbackId=${f.id}" role="button" title="Ẩn" style='font-size:10px'>
                                                    <i style='font-size:10px' class='fas far fa-eye-slash'>&#xf070;</i>
                                                </a>
                                            </c:if>
                                            <c:if test="${f.status != true}">
                                                <a class="btn btn-dark" href="status-feedback?status=1&feedbackId=${f.id}" role="button" title="Hiện" style='font-size:10px'>
                                                    <i style='font-size:10px' class='fas'>&#xf06e;</i>
                                                </a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="..." class="pagination">
                        <ul class="pagination">
                            <li class="page-item">
                                <a <c:if test="${page!=1}">                         
                                        href="feedback-list?page=${page-1}${historyKey}${historyValue}${historyType}${historyAuthor}${historyCategoryId}${historyStatus}"
                                    </c:if> class="page-link" aria-label="Previous">
                                    <span  aria-hidden="true">«</span>
                                </a>
                            </li>

                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${i==page ?"active" : ""}">
                                    <a class="page-link" href="feedback-list?page=${i}${historyKey}${historyValue}${historyType}${historyAuthor}${historyCategoryId}${historyStatus}">${i}</a>
                                </li>
                                </c:forEach>

                            <li class="page-item">
                                <a <c:if test="${page!=totalPage}">
                                        href="feedback-list?page=${page+1}${historyKey}${historyValue}${historyType}${historyAuthor}${historyCategoryId}${historyStatus}"
                                    </c:if> class="page-link" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </main>
                <!-- Footer-->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>

