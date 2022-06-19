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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <style>
            .center form table tr td {
                font-size: 100%;
                padding-top: 2%;
                padding-left: 2%;
            }
            .center form table tr td input{
                font-size: 100%;
                border-radius: 20px;
            }
            table{
                margin-left: 20%;
            }
            body{
                background-image: url("images/slider/1.jpg");
                background-size: 100% 108%;
            }
        </style>
    </head>
    <body style="background-color: gainsboro">
        <div style="margin: 2% 2% 2% 2%;">
            <h2 style="text-align: center">Update Product</h2>
            <div class="center">
                <form action="update_product" method="post">
                    <input type="hidden"  name="id" value="${product.id}"/><br/>
                    <table style="background-color: window ; width: 60% ; border-radius: 10px">
                        <tr>
                            <td>Tên sản phẩm:</td>
                            <td><input type="text"  name="name" value="${product.name}"/><br/></td>
                        </tr>
                        <tr>
                            <td>Ảnh sản phẩm:</td>
                            <td><input style="padding-left:8px" type="file" id="avatar" name="image"/><img  src="${product.image}" height="50px" width="50px" alt=""><br/></td>
                        </tr>
                        <tr>
                            <td>Giá gốc:</td>
                            <td><input type="text" name="original_price" value="${product.original_price}"/><br/></td>
                        </tr>
                        <tr>
                            <td>Giá khuyến mãi:</td>
                            <td><input type="text" name="sale_price" value="${product.sale_price}"/><br/></td>
                        </tr>
                        <tr>
                            <td>Tiêu đề:</td>
                            <td><input type="text" name="brief_infor" value="${product.brief_infor}"/><br/></td>
                        </tr>
                        <tr>
                            <td>Miêu tả :</td>
                            <td>
                                <textarea rows="3" cols="80" name="desciption">${product.desciption}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Trạng thái:</td>
                            <td>
                                <input type="radio" name="status" value="True"  ${product.status == true ? "checked" : ""} />Hiện
                                <input type="radio" name="status" value="False"  ${product.status != true ? "checked" : ""} />Ẩn
                            </td>
                        </tr>
                        <tr>
                            <td>Số lượng:</td>
                            <td style="padding-left: 2%"><input type="text" name="quantity" value="${product.quantity}"/><br/></td>
                        </tr>
                        <tr>
                            <td style="padding-bottom: 2%">Danh mục:</td>
                            <td style="padding-bottom: 2%">
                                <c:forEach items="${sessionScope.listCategories}" var="list">
                                    <input type="radio" name="categoryId" value="${list.id}" ${list.id == product.category_id ? "checked" : ""} />${list.name}
                                </c:forEach>
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <a class="buy-now btn btn-danger ml-5" href="marketingproductlist">Back</a>
                    <button type="submit" class="btn btn-primary" style="width: 100px; margin-left: 75%">Save</button>
                </form>
            </div>

        </div>
    </body>
</html>
