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
                                                        <input type="date" class="form-control" id="name" placeholder="Ngày mua hàng" name="updated_date" style="border-radius: 100px; margin-bottom: 1rem;" required>
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
                    <div class="container rounded row" style="margin-top: 1% !important; margin-bottom: 1% !important">
                        <div class="col-md-4 text-center">
                            <a type="button" data-toggle="modal" data-dismiss="modal" data-target="#addCustomerModal"><button type="button" class="btn btn-dark " style="">Thêm</button></a>
                        </div>
                        <div class="col-md-5">
                            <div>
                                <input type="text" id="myInput" onkeyup='tableSearch()' placeholder="Tìm kiếm khách hàng" class="filter-search__control" >
                            </div>
                        </div>
                    </div>
                    <div class="container rounded bg-white mt-5 mb-5">
                        <table class="table table-sortable" id="myTable">
                            <thead  class="text-center">
                                <tr>    
                                    <th scope="col">ID</th>
                                    <th scope="col">Họ và tên</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Số điện thoại</th>
                                    <th scope="col">Ngày mua hàng</th>
                                    <th scope="col">Tùy Chọn</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listCustomer}" var="o">
                                    <tr  class="text-center">
                                        <th scope="row">${o.customer_id}</th>
                                        <td>${o.customer_name}</td>
                                        <td>${o.customer_email}</td>
                                        <td>${o.customer_mobile}</td>
                                        <td>${o.updated_date}</td>
                                        <td>
                                            <a class="btn btn-dark" href="load-customer?cid=${o.customer_id}" role="button"><i class="fa-solid fa-pen-to-square">&#xf070;</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1">Trước</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Sau</a>
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


