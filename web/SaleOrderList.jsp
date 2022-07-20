<%-- 
    Document   : MKTOrderList
    Created on : Jun 29, 2022, 4:16:29 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>OrderList_Sale</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <%@include file="components/javascript.jsp" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script src="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"></script>
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
            .mtop {
                margin-top: 2%;
            }
            .title-order {
                display: flex;
                justify-content: center;
                color: red;
            }
            .tbborder {
                border: 2px solid black;
            }
            .sb-nav-fixed #layoutSidenav #layoutSidenav_content{
                justify-content: center;
            }


        </style>
    </head>
    <body>
        <%@include file="components/account.jsp" %>
        <%@include file="components/manager-header.jsp" %>

        <div id="layoutSidenav">
            <%@include file="components/sale-left-dashboard.jsp" %>
            <div class="groundy" id="layoutSidenav_content">

                <h2 class="mtop title-order" >Danh sách các đơn hàng</h2>
                <div class="container mtop" style="width:100%">
                    <table class="table table-striped table-bordered tbborder" id="sortTable">
                        <thead>
                            <tr>
                                <th>OrderID</th>
                                <th>Ngày&nbspmua&nbsphàng</th>
                                <th>Sản&nbspphẩm</th>
                                <th>Tổng&nbspchi&nbspphí</th>
                                <th>ID&nbsptài&nbspkhoản</th>
                                <th>Nhân&nbspviên&nbspsale</th>
                                <th>Tình&nbsptrạng</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items ="${OrderList}" var="c">
                                <tr>
                                    <td><a href="order-detail-sale?orderId=${c.orderID}">
                                            ${c.orderID}</a></td>
                                    <td>${c.date}</td>
                                    <c:if test="${c.countProduct != 0}">
                                        <td>${c.fullNameFirstProduct} và ${c.countProduct} sản phẩm khác</td>
                                    </c:if>
                                    <c:if test="${c.countProduct == 0}">
                                        <td>${c.fullNameFirstProduct}</td>
                                    </c:if>
                                    <td>${c.total_cost}</td>
                                    <td>${c.userId}</td>
                                    <td>${c.fullNameSaler}</td>

                                    <td>
                                        ${c.status_order_name}
                                    </td>







                                    <td>
                                        <c:if test="${c.status_order == 1}">
                                            <div class="row">
                                                <a href="update-successfull-order?order_id=${c.orderID}" class="btn btn-danger btn-lg active" role="button" aria-pressed="true" style="font-size: 12px">Giao Hàng thành công</a>
                                            </div>

                                        </c:if>
                                    </td>

                                </tr>

                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        
        <script>
            $(document).ready(function () {
                $('#sortTable').DataTable({
                    "language": {
                        "decimal": "",
                        "emptyTable": "No data available in table",
                        "info": " _START_ đến _END_ của _TOTAL_ bản ghi",
                        "infoEmpty": "HIển thị 0 to 0 of 0 bản ghi",
                        "infoFiltered": "(kết quả từ _MAX_ tổng số bản ghi)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Hiển thị _MENU_ bản ghi",
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
        
    </body>
</html>

