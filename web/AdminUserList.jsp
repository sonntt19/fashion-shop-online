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
        <title>JSP Page</title>
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
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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
        
        
        <nav class="sb-topnav navbar navbar-expand navbar-light bg-light    ">
            <!-- Navbar Brand-->
            <a class="navbar-brand me-5 ti-joomla" href="home" style="padding-left: 2%">KingsMan</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <div class="collapse navbar-collapse ms-5" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item me-4">
                        <a class="nav-link active" aria-current="page" href="home">Trang chủ</a>
                    </li>
                    <li class="nav-item me-4">
                        <a class="nav-link" href="list">Sản Phẩm</a>
                    </li>
                    <li class="nav-item me-4">
                        <a class="nav-link" href="blog">Blog</a>
                    </li>
                    <li class="nav-item me-4">
                        <a class="nav-link" href="#">Contact</a>
                    </li>


                </ul>
                <!-- Navbar-->
                <form class="d-flex me-5" action="list">
                    <input class="form-control me-2" type="text" name ="key" placeholder="Tìm kiếm sản phẩm..." aria-label="Search" value="${key}" id="" required class="form-control">

                    <button class="btn btn-outline-danger" type="submit">Tìm</button>
                </form>




                <ul class="navbar-nav mb-2 mb-lg-0">
                    <c:if test="${sessionScope.us != null}">
                        <div class="btn-group">
                            <button type="button" class="btn btn-outline-dark dropdown-toggle py-2 px-4" data-bs-toggle="dropdown" aria-expanded="false">
                                Hello ${sessionScope.us.full_Name}
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" type="button" data-toggle="modal"  data-target="#userProfileModal">Thông tin cá nhân</a></li>
                                <li><a class="dropdown-item" href="#">Danh sách đơn hàng</a></li>
                                <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.us == null}">
                        <li class="nav-item">
                            <a><i type="button" class="ti-user btn btn-icon py-2 px-4" data-toggle="modal"  data-target="#loginModal"></i></a>
                        </li>
                    </c:if>
                    <!-- begin icon header -->

                    <li class="nav-item">
                        <a class="nav-link btn btn-icon py-2 px-4" href="carts" tabindex="-1" aria-disabled="true"><i class="ti-shopping-cart"></i></a>
                    </li>
                </ul>
        </nav>
        <div id="layoutSidenav">
            <%@include file="components/MKT-left-board.jsp" %>
            <div class="groundy" id="layoutSidenav_content">
                <main>
                    <div class="container-fluid rounded row" style="margin-top: 3% !important; margin-bottom: 1% !important">
                        <table class="table table-striped table-bordered" id="sortTable"  style="margin-top: 4%; background: #FFFFE0; ">
                            <thead  class="text-center">
                            <th>ID</th>
                            <th>Họ tên </th>
                            <th>Giới tính</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Vai trò</th>
                            <th>Trạng&nbsp;thái</th>
                            <th style="width: 12%">Tùy&nbsp;chọn&nbsp;</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${listUsers}" var="U">
                                    <tr class="text-center">
                                        <th scope="row">${U.user_Id}</th>
                                        <td>${U.full_Name}</td>
                                        
                                        <!--giới tính-->
                                        <c:if test="${U.gender == true}">
                                            <td style="text-align: center">Nam</td>
                                        </c:if>
                                        <c:if test="${U.gender == false}">
                                            <td style="text-align: center">Nữ</td>
                                        </c:if>
                                            
                                        <td>${U.email}</td>
                                        <td>${U.mobile}</td>
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
                                        <c:if test="${U.status == true}">
                                            <td><img class="circle" src="images/active.png"></td>
                                            </c:if>
                                            <c:if test="${U.status != true}">
                                            <td><img class="circle" src="images/inactive.png"></td>
                                            </c:if>
                                        <td style="width: 125px">
                                            <c:if test="${U.status == true}">
                                                <a class="btn btn-dark" href="update-status-user?status=0&userId=${U.user_Id}" role="button" title="Ẩn" style='font-size:10px'>
                                                    <i style='font-size:10px' class='fas far fa-eye-slash'>&#xf070;</i>
                                                </a>
                                            </c:if>
                                            <c:if test="${U.status != true}">
                                                <a class="btn btn-dark" href="update-status-user?status=1&userId=${U.user_Id}" role="button" title="Hiện" style='font-size:10px'>
                                                    <i style='font-size:10px' class='fas'>&#xf06e;</i>
                                                </a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                </main>
                <!-- Footer-->
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#sortTable').DataTable({
                    "language": {
                        "decimal": "",
                        "emptyTable": "Không có dữ liệu trong bản ghi",
                        "info": " Hiển thị <_START_> đến <_END_> trong _TOTAL_ người dùng",
                        "infoEmpty": "HIển thị 0 to 0 of 0 bản ghi",
                        "infoFiltered": "(kết quả từ _MAX_ tổng số bản ghi)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Hiển thị _MENU_ người dùng",
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


