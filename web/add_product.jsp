<%-- 
    Document   : update_product
    Created on : Jun 15, 2022, 10:58:06 PM
    Author     : GanKPoet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./assets/css/styles.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
        <%@include file="components/account.jsp" %>
        <%@include file="components/manager-header.jsp" %>
        <div id="layoutSidenav">
            <%@include file="components/MKT-left-board.jsp" %>
            <div class="groundy" id="layoutSidenav_content">
                <main>
                    <div class="container-fluid rounded row" style="margin-top: 1% !important; margin-bottom: 1% !important">
                      <form action="add_product">
                            <input type="hidden"  name="id" value="${product.id}"/><br/>
                            <table style="background-color: window ; width: 60%; border-radius: 10px">
                                <tr>
                                    <td>Tên sản phẩm:</td>
                                    <td><input style="border-radius: 10px; width: 62%" type="text"  name="name" value="${product.name}"/><br/></td>
                                </tr>
                                <tr>
                                    <td>Địa chỉ ảnh:</td>
                                    <td><input v style="padding-left:8px" id="avatar" name="image" accept="image/png, image/jpeg"/><br/></td>
                                </tr>
                                <tr>
                                    <td>Giá gốc:</td>
                                    <td><input style=" border-radius: 10px;" type="text" name="original_price" /><br/></td>
                                </tr>
                                <tr>
                                    <td>Giá khuyến mãi:</td>
                                    <td><input style=" border-radius: 10px;" type="text" name="sale_price"/><br/></td>
                                </tr>
                                <tr>
                                    <td>Tiêu đề:</td>
                                    <td><input style="border-radius: 10px; width: 62%" type="text" name="brief_infor"/><br/></td>
                                </tr>
                                <tr>
                                    <td>Miêu tả :</td>
                                    <td>
                                        <textarea rows="3" cols="80" name="desciption"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Trạng thái:</td>
                                    <td>
                                        <input type="radio" name="status" value="True" checked />Hiện &nbsp;&nbsp;
                                        <input type="radio" name="status" value="False"   />Ẩn
                                    </td>
                                </tr>
                                <tr>
                                    <td>Số lượng:</td>
                                    <td style="padding-left: 2%;"><input style=" border-radius: 10px;" type="text" name="quantity"/><br/></td>
                                </tr>
                                <tr>
                                    <td style="padding-bottom: 2%">Danh mục:</td>
                                    <td style="padding-bottom: 2%">
                                        <select   name="categoryId" aria-label="Default select example" style="border-radius: 10px;">
                                            <c:forEach items="${sessionScope.listCategories}" var="list">
                                                <option value="${list.id}" ${list.id == product.category_id ? "Selected" : ""}>
                                                    ${list.name}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <br/><br/>
                            <a class="buy-now btn btn-danger" style="width: 7%; margin-left: 20%;margin-top:2% " href="marketingproductlist">Quay lại</a>
                            <button type="submit" class="btn btn-primary" style="width: 100px; margin-left: 75%">Thêm</button>
                        </form>
                </main>
            </div>
        </div>
    </body>
</html>
