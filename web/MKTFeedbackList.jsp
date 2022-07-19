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
        <title>JSP Page</title>
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
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <%@include file="components/javascript.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
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
                    <div class="container-fluid rounded row" style="margin-top: 3% !important; margin-bottom: 1% !important">
                        <table class="table table-striped table-bordered" id="sortTable"  style="margin-top: 4%; background: #FFFFE0; ">
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

                </main>
                <!-- Footer-->

            </div>
            <script>
                $(document).ready(function () {
                    $('#sortTable').DataTable({
                        "language": {
                            "decimal": "",
                            "emptyTable": "Không có dữ liệu trong bản ghi",
                            "info": " Hiển thị <_START_> đến <_END_> trong _TOTAL_ đánh giá",
                            "infoEmpty": "HIển thị 0 to 0 of 0 bản ghi",
                            "infoFiltered": "(kết quả từ _MAX_ tổng số bản ghi)",
                            "infoPostFix": "",
                            "thousands": ",",
                            "lengthMenu": "Hiển thị _MENU_ đánh giá",
                            "loadingRecords": "Loading...",
                            "processing": "",
                            "search": "Tìm kiếm:",
                            "zeroRecords": "Không tìm thấy kết quả nào",
                            "paginate": {
                                "first": "F",
                                "last": "L",
                                "next": "Sau",
                                "previous": "Trước"
                            },
                            "aria": {
                                "sortAscending": ": activate to sort column ascending",
                                "sortDescending": ": activate to sort column descending"
                            }
                        }
                    });
                });
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
            <script src="js/datatables-simple-demo.js"></script>

    </body>
</html>


