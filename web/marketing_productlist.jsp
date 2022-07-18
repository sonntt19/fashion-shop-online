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
        <%@include file="components/manager-header.jsp" %>
        <div id="layoutSidenav">
            <%@include file="components/MKT-left-board.jsp" %>
            <div class="groundy" id="layoutSidenav_content">
                <main>
                    <div style="margin: 2%;">
                        <div class="row">
                            <div class="col-md-2 text-center bg-warning" style="border-radius: 10px">
                                <b style="font-size: 20px"><span style="color: red">Tổng số sản phẩm: ${total}</span> <br> <span style="color: green">Số sản phẩm hiển thị: ${PublishedProduct}</span></b>
                            </div>
                            <div class="col-md-2 text-center">
                                <a href="add_product.jsp"><button type="button" class="btn btn-danger " style="">Thêm sản phẩm</button></a>
                            </div>
                            
                            <div class="col-md-2 text-center">
                                <form class="input-search" action="marketingproductlist">
                                    <div>
                                        <input type="text" class="form-control" name="key" value="${key}" placeholder="Tìm kiếm sản phẩm" style="border-radius: 10px">
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-2 text-center">
                                <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;">
                                    <option value="marketingproductlist?${historyKey}${historyValue}${historyType}${historyStatus}" ${categoryId == 0 ? "Selected" : ""}>
                                        Tất Cả
                                    </option>
                                    <c:forEach items="${sessionScope.listCategories}" var="c">
                                        <option value="marketingproductlist?${historyKey}&categoryId=${c.id}${historyValue}${historyType}${historyStatus}" ${categoryId == c.id ? "Selected" : ""}>
                                            ${c.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-2 text-center">
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
                            <div class="col-md-2 text-center">
                                <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;">
                                    <option value="marketingproductlist?${historyKey}${historyCategoryId}${historyStatus}&type=desc" ${type eq "desc" ? "Selected" : ""}>
                                        Mới Nhất
                                    </option>
                                    <option value="marketingproductlist?${historyKey}${historyCategoryId}${historyStatus}" ${type == null ? "Selected" : ""}>
                                        Cũ Nhất
                                    </option> 
                                    <option value="marketingproductlist?${historyKey}${historyCategoryId}${historyStatus}&value=original_prices" ${value eq "original_prices" ? "Selected" : ""}>
                                        Giá tăng dần
                                    </option>
                                    <option value="marketingproductlist?${historyKey}${historyCategoryId}${historyStatus}&value=original_prices&type=desc" ${value eq "original_prices" && type eq "desc" ? "Selected" : ""}>
                                        Giá giảm dần
                                    </option> 
                                </select>
                            </div>
                            <div class="container rounded bg-white mt-5 mb-5" >
                                <table class="table text-center">
                                    <thead>
                                        <tr>

                                            <th>Mã sản phẩm</th>
                                            <th>Ảnh sản phẩm</th>
                                            <th>Danh mục sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giá gốc</th>
                                            <th>Gía khuyến mại</th>
                                            <th>Số lượng</th>
                                            <th>Trạng thái</th>
                                            <th>Tùy&nbsp;chọn&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listProduct}" var="p">
                                            <tr>
                                                <th>${p.id}</th>
                                                <td>
                                                    <a href="product-detail?product_id=${p.id}">
                                                        <img src="${p.image}" width="60px" alt="">
                                                    </a>
                                                </td>
                                                <td>
                                                    <c:forEach items="${sessionScope.listCategories}" var="c">
                                                        ${c.id == p.category_id?c.name:""}
                                                    </c:forEach>
                                                </td>
                                                <td class="text-left">${p.name}</td>
                                                <td>${p.original_price}</td>
                                                <td>${p.sale_price}</td>
                                                <td style="text-align: center">${p.quantity}</td>
                                                <c:if test="${p.status == true}">
                                                    <td><img class="circle" src="images/active.png"></td>
                                                    </c:if>
                                                    <c:if test="${p.status == false}">
                                                    <td><img class="circle" src="images/inactive.png"></td>
                                                    </c:if>
                                                <td style="width: 125px">
                                                    <a class="btn btn-danger" href="product-detail?product_id=${p.id}" role="button" style='font-size:10px'>
                                                        <i style='font-size:10px' class='fas'>&#xf044;</i>
                                                    </a>
                                                    <c:if test="${p.status == true}">
                                                        <a class="btn btn-dark" href="change-status-product?status=0&productId=${p.id}" role="button" style='font-size:10px'>
                                                            <i style='font-size:10px' class='fas far fa-eye-slash'>&#xf070;</i>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${p.status != true}">
                                                        <a class="btn btn-dark" href="change-status-product?status=1&productId=${p.id}" role="button" style='font-size:10px'>
                                                            <i style='font-size:10px' class='fas'>&#xf06e;</i>
                                                        </a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <nav aria-label="..." class="pagination">
                        <ul class="pagination">
                            <li class="page-item">
                                <a <c:if test="${page!=1}">                         
                                        href="marketingproductlist?page=${page-1}${historyKey}${historyCategoryId}${historyValue}${historyType}${historyStatus}"
                                    </c:if> class="page-link" aria-label="Previous">
                                    <span  aria-hidden="true">«</span>
                                </a>
                            </li>

                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${i==page ?"active" : ""}"><a class="page-link" href="marketingproductlist?page=${i}${historyStatus}${historyKey}${historyCategoryId}${historyValue}${historyType}">${i}</a></li>
                                </c:forEach>

                            <li class="page-item">
                                <a <c:if test="${page!=totalPage}">
                                        href="marketingproductlist?page=${page+1}${historyKey}${historyCategoryId}${historyValue}${historyType}${historyStatus}"
                                    </c:if> class="page-link" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </main>
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


