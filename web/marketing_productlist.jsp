<%-- 
    Document   : MKTDashboard
    Created on : Jun 23, 2022, 7:56:23 AM
    Author     : Veetu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
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

            .table-sortable th {
                cursor: pointer;
            }

            .table-sortable .th-sort-asc::after {
                content: "\25b4";
            }

            .table-sortable .th-sort-desc::after {
                content: "\25be";
            }

            .table-sortable .th-sort-asc::after,
            .table-sortable .th-sort-desc::after {
                margin-left: 5px;
            }

            .table-sortable .th-sort-asc,
            .table-sortable .th-sort-desc {
                background: rgba(0, 0, 0, 0.1);
            }

        </style>
    </head>
    <body class="sb-nav-fixed">
        <!-- Notification Customer -->
        <c:if test="${notification !=null}">
            <div class="alert alert-warning alert-dismissible fade show" role="alert" style="position: fixed; z-index: 15 ; margin-left: 50%; margin-top: 4%">
                <strong>${notification}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
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
                <!-- Add Customer -->

                <div class="modal fade col-md-12" role="dialog" id="addCustomerModal" style="padding-right: 18px" >
                    <div class="modal-dialog">
                        <div class="modal-content" style="border-radius: 10px; margin-top: 180px;">
                            <div class="modal-header">
                                <h2 class="" id="registerModal" style="text-align:center; font-family: Arial"><b style="padding-left: 100px;">Thêm khách hàng</b></h2><br>
                            </div>

                            <div class="modal-body">
                                <section>
                                    <div class="container">
                                        <form action="add-customer" method="POST">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="name" placeholder="Họ và tên" name="fullName" style="border-radius: 100px; margin-bottom: 1rem;" required>
                                                    </div></div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="email" class="form-control" id="email" placeholder="Email" name="email" style="border-radius: 100px; margin-bottom: 1rem;" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="name" placeholder="Số điện thoại" name="mobile" style="border-radius: 100px; margin-bottom: 1rem;" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" id="name" placeholder="Địa chỉ" name="address" style="border-radius: 100px; margin-bottom: 1rem;" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-12" style="margin-bottom: 1rem;">
                                                    <div class="form-group" required>
                                                        Giới tính&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input class="" name="gender" type="radio" value="True" required/>&nbsp; Nam
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input class="" name="gender" type="radio" value="False" required/>&nbsp; Nữ
                                                    </div>
                                                    <div class="form-group" required>
                                                        Trạng thái&nbsp;&nbsp;&nbsp;
                                                        <input class="" name="status" type="radio" value="True" required/>&nbsp; Hiện
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input class="" name="status" type="radio" value="False" required/>&nbsp; Ẩn
                                                    </div>
                                                </div>
                                                <br><br><center><button type="submit" class="btn btn-dark" style="padding-right: 180px;padding-left: 180px; border-radius: 100px;">Thêm</button></center><br><br>
                                            </div>
                                        </form>
                                    </div>    
                                </section>
                            </div>
                        </div>
                    </div>
                </div> 
                <main>
                    <div style="margin: 2% 2% 2% 2%;  ">
                        <h2 class="marketing_productlist_displayinline" style="text-align: left";>Products List </h2> &nbsp;&nbsp;
                        <h5 class="marketing_productlist_displayinline"><a href="add_product.jsp" type="button" style="background-color: whitesmoke; border-radius: 5px; border-color: ghostwhite">Thêm sản phẩm mới</a></h5>
                        <h6 style="margin-top: 1%; margin-bottom: 1%">All(${total}) | <span style="color: blue">Published(${PublishedProduct})</span></h6>
                        <div class="row">
                            <div class="col-md-4">
                                <form class="input-search" action="marketingproductlist">
                                    <div>
                                        <input type="text" name="key" value="${key}" placeholder="Tìm kiếm sản phẩm..." class="filter-search__control" >
                                        <button type="submit" class="btn btn-outline-dark">
                                            <i style='font-size:15px' class='fas'>&#xf002;</i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-2">
                                <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;">
                                    <option value="marketingproductlist?${historyKey}${historyValue}${historyType}" ${categoryId == 0 ? "Selected" : ""}>
                                        Tất Cả
                                    </option>
                                    <c:forEach items="${sessionScope.listCategories}" var="c">
                                        <option value="marketingproductlist?${historyKey}&categoryId=${c.id}${historyValue}${historyType}" ${categoryId == c.id ? "Selected" : ""}>
                                            ${c.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;">
                                    <option value="marketingproductlist?${historyKey}${historyValue}${historyType}" ${categoryId == 0 ? "Selected" : ""}>
                                        Trạng thái
                                    </option>
                                    <option value="marketingproductlist?${historyKey}${historyCategoryId}&status=1" ${status eq "1" ? "Selected" : ""}>
                                        Hiện
                                    </option>
                                    <option value="marketingproductlist?${historyKey}${historyCategoryId}&status=0" ${status eq "0" ? "Selected" : ""}>
                                        Ẩn
                                    </option>
                                </select>
                            </div>     
                            <div class="col-md-2">
                                <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;">
                                    <option value="marketingproductlist?${historyKey}${historyCategoryId}&type=desc" ${type eq "desc" ? "Selected" : ""}>
                                        Mới Nhất
                                    </option>
                                    <option value="marketingproductlist?${historyKey}${historyCategoryId}" ${type == null ? "Selected" : ""}>
                                        Cũ Nhất
                                    </option> 
                                    <option value="marketingproductlist?${historyKey}${historyCategoryId}&value=original_prices" ${value eq "original_prices" ? "Selected" : ""}>
                                        Giá tăng dần
                                    </option>
                                    <option value="marketingproductlist?${historyKey}${historyCategoryId}&value=original_prices&type=desc" ${value eq "original_prices" && type eq "desc" ? "Selected" : ""}>
                                        Giá giảm dần
                                    </option> 
                                </select>
                            </div>
                            <table class="table " style="background-color: window ; margin-top: 1%">
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Ảnh</th>
                                        <th scope="col">Danh mục</th>
                                        <th scope="col"style="text-align: center">Tên sản phẩm</th>
                                        <th scope="col">Gía gốc</th>
                                        <th scope="col">Gía khuyến mại</th>
                                        <th scope="col" style="text-align: center">Số lượng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listProduct}" var="p">
                                        <tr>
                                            <th scope="row">${p.id}</th>
                                                <c:if test="${p.status == true}">
                                                <td>Hiện</td>
                                            </c:if>
                                            <c:if test="${p.status == false}">
                                                <td>Ẩn</td>
                                            </c:if>
                                            <td>
                                                <a href="update_product?product_id=${p.id}">
                                                    <img  src="${p.image}" height="50px" width="50px" alt="">
                                                </a>
                                            </td>
                                            <td>
                                                <c:forEach items="${sessionScope.listCategories}" var="c">
                                                    ${c.id == p.category_id?c.name:""}
                                                </c:forEach>
                                            </td>
                                            <td>${p.name}</td>
                                            <td>${p.original_price}</td>
                                            <td>${p.sale_price}</td>
                                            <td style="text-align: center">${p.quantity}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <nav aria-label="..." class="pagination">
                        <ul class="pagination">
                            <li class="page-item">
                                <a <c:if test="${page!=1}">                         
                                        href="marketingproductlist?page=${page-1}${historyKey}${historyCategoryId}${historyValue}${historyType}"
                                    </c:if> class="page-link" aria-label="Previous">
                                    <span  aria-hidden="true">«</span>
                                </a>
                            </li>

                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${i==page ?"active" : ""}"><a class="page-link" href="marketingproductlist?page=${i}${historyKey}${historyCategoryId}${historyValue}${historyType}">${i}</a></li>
                                </c:forEach>

                            <li class="page-item">
                                <a <c:if test="${page!=totalPage}">
                                        href="marketingproductlist?page=${page+1}${historyKey}${historyCategoryId}${historyValue}${historyType}"
                                    </c:if> class="page-link" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </main>
                <!-- Footer-->
                <%@include file="components/footer.jsp" %>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="js/tablesort.js"></script>
        <script src="js/customer-search.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


