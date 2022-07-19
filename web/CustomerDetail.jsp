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
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="components/account.jsp" %>
        <%@include file="components/manager-header.jsp" %>
        <div id="layoutSidenav">
            <%@include file="components/MKT-left-board.jsp" %>
            <div class="groundy" id="layoutSidenav_content">
                <main>
                    <div class="container rounded bg-white mt-5 mb-5">

                        <div class="row ">
                            <div class="col-md-5">
                                <form action="update-customer">
                                    <h4 class="text-center font-weight-bold" style="margin-top: 4%">Chỉnh sửa khách hàng</h4>
                                    <div class="p-3 py-5">
                                        <div class="row mt-16">
                                            <div class="col-md-6">ID<input name="customer_id" type="text" class="form-control" placeholder="ID" value="${customerDetail.customer_id}" style="margin-bottom: 1rem;" readonly=""></div>
                                            <div class="col-md-6">Họ và tên<input name="customer_name" type="text" class="form-control" placeholder="Họ và tên" value="${customerDetail.customer_name}" style="margin-bottom: 1rem;" required=""></div>
                                            <div class="col-md-6">Email<input name="customer_email" type="text" class="form-control" placeholder="Email" value="${customerDetail.customer_email}" style="margin-bottom: 1rem; "required=""></div>
                                            <div class="col-md-6">Số điện thoại<input name="customer_mobile" type="text" class="form-control" placeholder="Số điện thoại" value="${customerDetail.customer_mobile}" style="margin-bottom: 1rem;" required=""></div>
                                        </div>
                                        <div class="mt-5 p-4 text-center"><button class="btn btn-dark" type="submit">Lưu</button></div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-7">
                                <h4 class="text-center font-weight-bold" style="margin-top: 4%">Lịch sử chỉnh sửa</h4>
                                <div class="p-3 py-5">
                                    <table class="table text-center">
                                        <thead>
                                            <tr>
                                                <th>Ngày cập nhật</th>
                                                <th>Người cập nhật</th>
                                                <th>Họ và tên</th>
                                                <th>Enail</th>
                                                <th>Số điện thoại</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listUpdate}" var="lu">
                                                <tr>
                                                    <td style="text-align: center">${lu.update_date}</td>
                                                    <td style="text-align: center">${lu.update_by}</td>
                                                    <td style="text-align: center">${lu.customer_name}</td>
                                                    <td style="text-align: center">${lu.customer_email}</td>
                                                    <td style="text-align: center">${lu.customer_mobile}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


