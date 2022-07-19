    Document   : product
    Created on : May 30, 2022, 2:30:55 PM
    Author     : son22
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <%@include file="components/javascript.jsp" %>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }

            .table-responsive {
                margin: 30px 0;
            }

            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
            }

            .table-title {
                padding-bottom: 15px;
                background: black;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }

            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }

            .table-title .btn {
                color: #566787;
                float: right;
                font-size: 13px;
                background: #fff;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }

            .table-title .btn:hover,
            .table-title .btn:focus {
                color: #566787;
                background: #f2f2f2;
            }

            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }

            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }

            table.table tr th,
            table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }

            table.table tr th:first-child {
                width: 60px;
            }

            table.table tr th:last-child {
                width: 100px;
            }

            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }

            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }

            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }

            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }

            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }

            table.table td a:hover {
                color: #2196F3;
            }

            table.table td a.settings {
                color: #2196F3;
            }

            table.table td a.delete {
                color: #F44336;
            }

            table.table td i {
                font-size: 19px;
            }

            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }

            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }

            .text-success {
                color: #10c469;
            }

            .text-info {
                color: #62c9e8;
            }

            .text-warning {
                color: #FFC107;
            }

            .text-danger {
                color: #ff5b5b;
            }

            .pagination {
                float: right;
                margin: 0 0 5px;
            }

            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }

            .pagination li a:hover {
                color: #666;
            }

            .pagination li.active a,
            .pagination li.active a.page-link {
                background: #03A9F4;
            }

            .pagination li.active a:hover {
                background: #0397d6;
            }

            .pagination li.disabled i {
                color: #ccc;
            }

            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }

            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body >

        <%@include file="components/header.jsp" %>
        <%@include file="components/account.jsp" %>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <h4 class="mb-5 text-secondary">Thêm Người Dùng</h4>
                            <div class="row">
                                <!--                                <div class="mb-3 col-md-12">
                                                                    <label>Image Avatar<span class="text-danger">*</span></label>
                                                                    <input id="file-upload" class="form-control" type="file" name="photo"/>
                                <c:if test="${not empty ErrCreateMsg[0]}" >
                                    <div class="alert alert-danger" role="alert">
                                    ${ErrCreateMsg[0]}
                                </div>
                                </c:if>
                            </div>-->
                                <form action="create-user">
                                    <div class="mb-3 col-md-12">
                                        <label for="fullname">Họ tên<span class="text-danger">*</span></label>
                                        <input id="fullname" type="text" name="fname" class="form-control" placeholder="Nhập họ tên">
                                    </div>
                                    <div class="mb-3 col-md-12">
                                        <label for="pass">Mật khẩu<span class="text-danger">*</span></label>
                                        <input id="pass" type="password" name="password" class="form-control" placeholder="Nhập mật khẩu">
                                    </div>
                                    <div class="mb-3 col-md-12">
                                        <label for="Email">Email<span class="text-danger">*</span></label>
                                        <input id="Email" type="text" name="email" class="form-control" placeholder="Nhập email">
                                    </div>
                                    <div class="mb-3 col-md-12">
                                        <label for="phone">Số điện thoại<span class="text-danger">*</span></label>
                                        <input id="phone" type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại">
                                    </div>
                                    <div class="mb-3 col-md-12">
                                        <label for="address" >Địa chỉ<span class="text-danger">*</span></label>
                                        <input id="address" type="text" name="address" class="form-control" placeholder="Nhập địa chỉ">
                                    </div>


                                    <div class="mb-3 col-md-12 input-group " style="margin-top: 35px">
                                        <label class="input-group-text" for="inputGroupSelect01" style="">Giới tính</label>
                                        <select name="sex_id" class="form-select" id="inputGroupSelect01">
                                            <option value="True">Nam</option> 
                                            <option value="False">Nữ</option>
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-12 input-group "  style="margin-top: 35px">
                                        <label class="input-group-text" for="inputGroupSelect02">Vai trò</label>

                                        <select name="role_id" class="form-select" id="inputGroupSelect02">
                                            <c:forEach items="${listRole}" var="lr">
                                                <option value="${lr.role_id}">${lr.role_name}</option>
                                            </c:forEach>

                                        </select>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Lưu</button>
                                    </div>


                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="container-lg" style="margin-top: 100px">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2> <b>User Management</b></h2>
                            </div>
                            <div class="col-sm-7">
                                <a href="#" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="material-icons">&#xE147;</i> 
                                    <span>Thêm người dùng mới</span></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Tên</th>
                                <th style="text-align: center">Giới Tính</th>
                                <th style="text-align: center">Trạng thái</th>
                                <th style="text-align: center">Vai trò</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listUsers}" var="U">
                                <tr>
                                    <td>${U.user_Id}</td>
                                    <td name="fullname"><a href="#" style="color: black">${U.full_Name}</a></td>

                                    <!--gender-->
                                    <c:if test="${U.gender == true}">
                                        <td style="text-align: center">Nam</td>
                                    </c:if>
                                    <c:if test="${U.gender == false}">
                                        <td style="text-align: center">Nữ</td>
                                    </c:if>

                                    <!--status-->
                                    <c:if test="${U.status == 1}">
                                        <td style="text-align: center"><span class="status text-success">&bull;</span>Active</td>
                                    </c:if> 
                                    <c:if test="${U.status == 0}">
                                        <td style="text-align: center"><span class="status text-warning">&bull;</span>Inactive</td>
                                    </c:if>

                                    <!--role-->
                                    <c:if test="${U.role_Id == 1}">
                                        <td style="text-align: center">Customer</td>
                                    </c:if>
                                    <c:if test="${U.role_Id == 2}">
                                        <td style="text-align: center">Marketing</td>
                                    </c:if>
                                    <c:if test="${U.role_Id == 3}">
                                        <td style="text-align: center">Sale</td>
                                    </c:if>
                                    <c:if test="${U.role_Id == 4}">
                                        <td style="text-align: center">Sale manager</td>
                                    </c:if>
                                    <c:if test="${U.role_Id == 5}">
                                        <td style="text-align: center">admin</td>
                                    </c:if>
                                    

                                    <td>
                                        <a href="#" class="settings" title="Chi tiết Người Dùng" data-toggle="tooltip"><i
                                                class="material-icons">&#xE8B8;</i></a>
<!--                                                <a>delete-user?userId=${U.user_Id} </a>    -->
                                        <a href="update-status-user?userId=${U.user_Id}" class="delete" title="Xóa" data-toggle="tooltip"><i
                                                class="material-icons">&#xE5C9;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
<!--                    <div class="clearfix">
                        <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                        <ul class="pagination">
                            <li class="page-item disabled"><a href="#">Previous</a></li>
                            <li class="page-item"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item active"><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div>-->
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    </body>
</html>
