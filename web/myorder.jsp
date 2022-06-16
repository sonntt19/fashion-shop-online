<%-- 
    Document   : myorder
    Created on : Jun 13, 2022, 3:35:42 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <%@include file="components/javascript.jsp" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
        <style>
            .mtop {
                margin-top: 6%;
            }
            .title-order {
                display: flex;
                justify-content: center;
                color: red;
            }
        </style>
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <h2 class="mtop title-order" >Danh sách các đơn hàng</h2>
        <div class="container mtop" style="width:80%">
            <table class="table table-striped table-bordered" id="sortTable">
                <thead>
                    <tr>
                        <th>OrderID</th>
                        <th>Ngày mua hàng</th>
                        <th>Sản phẩm</th>
                        <th>Tổng chi phí</th>
                        <th>Tình trạng</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items ="${listMyOrder}" var="c">
                        <tr>
                            <td><a href="order-detail?orderId=${c.orderID}">
                                    ${c.orderID}</a></td>
                            <td>${c.date}</td>
                            <c:if test="${c.countProduct != 0}">
                                <td>${c.fullNameFirstProduct} và ${c.countProduct} sản phẩm khác</td>
                            </c:if>
                            <c:if test="${c.countProduct == 0}">
                                <td>${c.fullNameFirstProduct}</td>
                            </c:if>
                            <td>${c.total_cost}</td>
                            <td>${c.status_order_name}</td>
                            <td>
                                <c:if test="${c.status_order_name eq 'Submited'}">
                                    <div class="row">
                                        <a href="#" class="btn btn-primary btn-lg active" role="button" aria-pressed="true" >Thanh Toán</a>
                                        <a href="#" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true" >Hủy</a>
                                    </div>

                                </c:if></td>
                        </tr>

                    </c:forEach>

                </tbody>
            </table>
        </div>
        <div class="mtop"></div>
        <%@include file="components/footer.jsp" %>
        <script>
            $('#sortTable').DataTable();
        </script>
    </body>
</html>
