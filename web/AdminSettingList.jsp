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
            <%@include file="components/admin-left-dashboard.jsp" %>
            <div class="groundy" id="layoutSidenav_content">
                <main>
                    <div class="container-fluid rounded row" style="margin-top: 1% !important; margin-bottom: 1% !important">
                        <div class="col-md-1">
                            <a href="AddSetting.jsp"><button type="button" class="btn btn-danger " style="">Thêm</button></a>
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new" style="width: 100%" aria-label="Default select example" onchange="location = this.value;">
                                <option value="setting-list?${historyKey}${historyValue}${historyType}${historyStatus}" ${typeId == null ? "Selected" : ""}>
                                    Phân loại
                                </option>
                                <c:forEach items="${sessionScope.listTypeSetting}" var="c">
                                    <option value="setting-list?${historyKey}${historyValue}${historyType}${historyStatus}&typeId=${c.id}" ${typeId == c.id ? "Selected" : ""}>
                                        ${c.name}
                                    </option>
                                </c:forEach>

                            </select>
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new float-left" style="width: 100%" aria-label="Default select example" onchange="location = this.value;"> Sắp xếp
                                <option value="setting-list?${historyKey}${historyStatus}${historyTypeId}&type=desc&value=setting_id" ${type == "desc" && value == "setting_id" ? "Selected" : ""}>
                                    ID giảm dần
                                </option>
                                <option value="setting-list?${historyKey}${historyStatus}${historyTypeId}&value=setting_id" ${type == null && value == "setting_id" ? "Selected" : ""}>
                                    ID tăng dần
                                </option>
                                <option value="setting-list?${historyKey}${historyStatus}${historyTypeId}&type=desc&value=value" ${type == "desc" && value == "value" ? "Selected" : ""}>
                                    Giá trị giảm dần
                                </option>
                                <option value="setting-list?${historyKey}${historyStatus}${historyTypeId}&value=value" ${type == null && value == "value" ? "Selected" : ""}>
                                    Giá trị tăng dần
                                </option>
                                <option value="setting-list?${historyKey}${historyStatus}${historyTypeId}&type=desc" ${type == "desc" && value == null ? "Selected" : ""}>
                                    Loại giảm dần
                                </option>
                                <option value="setting-list?${historyKey}${historyStatus}${historyTypeId}" ${type == null && value == null ? "Selected" : ""}>
                                    Loại tăng dần
                                </option>
                                

                            </select>
                        </div>
                        <div class="col-md-2">
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new float-right" aria-label="Default select example" onchange="location = this.value;"> Trạng thái
                                <option value="setting-list?${historyKey}${historyValue}${historyTypeId}" ${status == null ? "Selected" : ""}>
                                    Trạng thái
                                </option>
                                <option value="setting-list?${historyKey}${historyValue}${historyTypeId}&status=1" ${status == 1 ? "Selected" : ""}>
                                    Hiện
                                </option>
                                <option value="setting-list?${historyKey}${historyValue}${historyTypeId}&status=0" ${status == 0 ? "Selected" : ""}>
                                    Ẩn
                                </option>

                            </select>
                        </div>
                        <div class="col-md-2 text-center">
                            <form action="setting-list">
                                <input type="text" name="key" value="${key}" placeholder="Tìm kiếm giá trị" class="filter-search__control" >
                                <button type="submit" class="btn btn-outline-danger" href="#" role="button">
                                    <i style='font-size:15px' class='fas'>&#xf002;</i>
                                </button>
                            </form>
                        </div>
                    </div>
                    <div class="container rounded bg-white mt-5 mb-5" >
                        <table class="table"  style="margin-top: 4%">
                            <thead  class="text-center">
                            <th>ID</th>
                            <th>Loại</th>
                            <th>Thứ tự</th>
                            <th>Giá trị</th>
                            <th>Trạng&nbsp;thái</th>
                            <th style="width: 12%">Tùy&nbsp;chọn&nbsp;</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${listSetting}" var="s">
                                    <tr class="text-center">
                                        <td scope="row">${s.setting_id}</td>
                                        
                                        <td>
                                            <c:forEach items="${sessionScope.listTypeSetting}" var="c">
                                                ${s.type == c.id ? c.name : ""}
                                            </c:forEach>
                                        </td>
                                        <td>${s.order}</td>
                                        <td >${s.value}</td>
                                        <c:if test="${s.status == true}">
                                            <td><img class="circle" src="images/active.png"></td>
                                            </c:if>
                                            <c:if test="${s.status != true}">
                                            <td><img class="circle" src="images/inactive.png"></td>
                                        </c:if>
                                        <td style="width: 125px">
                                            <a class="btn btn-danger" href="setting-details?setting_id=${s.setting_id}" role="button" style='font-size:10px'>
                                                <i style='font-size:10px' class='fas'>&#xf044;</i>
                                            </a>
                                           
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="..." class="pagination">
                        <ul class="pagination">
                            <li class="page-item">
                                <a <c:if test="${page!=1}">                         
                                        href="setting-list?page=${page-1}${historyKey}${historyValue}${historyType}${historyTypeId}${historyStatus}"
                                    </c:if> class="page-link" aria-label="Previous">
                                    <span  aria-hidden="true">«</span>
                                </a>
                            </li>

                            <c:forEach begin="1" end="${totalPage}" var="i">
                                <li class="page-item ${i==page ?"active" : ""}"><a class="page-link" href="setting-list?page=${i}${historyKey}${historyValue}${historyType}${historyTypeId}${historyStatus}">${i}</a></li>
                                </c:forEach>

                            <li class="page-item">
                                <a <c:if test="${page!=totalPage}">
                                        href="setting-list?page=${page+1}${historyKey}${historyValue}${historyType}${historyTypeId}${historyStatus}"
                                    </c:if> class="page-link" aria-label="Next">
                                    <span aria-hidden="true">»</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </main>
                <!-- Footer-->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


