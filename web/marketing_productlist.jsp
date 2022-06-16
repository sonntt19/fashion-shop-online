<%-- 
    Document   : marketing_productlist
    Created on : Jun 7, 2022, 7:42:34 AM
    Author     : GanKPoet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .marketing_productlist_displayinline{
                display: inline;
            }
        </style>
    </head>
    <body style="background-color: gainsboro">
        <%@include file="components/header.jsp" %>
        <div style="height: 60px"></div>
        <div style="margin: 2% 2% 2% 2%;  ">
            <h2 class="marketing_productlist_displayinline" style="text-align: left";>Products List </h2> &nbsp;&nbsp;
            <h5 class="marketing_productlist_displayinline"><a href="add_product.jsp" type="button" style="background-color: whitesmoke; border-radius: 5px; border-color: ghostwhite">Thêm sản phẩm mới</a></h5>
            <h6 style="margin-top: 1%; margin-bottom: 1%">All(0) | <span style="color: blue">Published(0)</span></h6>
            <div class="row">
                <div class="col-md-4">
                    <form class="input-search" action="marketingproductlist">
                        <div>
                            <input type="text" name="key" value="${key}" placeholder="Tìm kiếm sản phẩm..." class="filter-search__control" >
                            <button type="submit" class="button-search"></button>
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
                        <option>
                            Hiện
                        </option>
                        <option>
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
<button type="button" class="btn btn-primary" style="width: 100px; margin-left: 90%">Save</button>
</div>
</body>
</html>
