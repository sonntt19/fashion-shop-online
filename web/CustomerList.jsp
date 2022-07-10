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
                                                        <input type="text" class="form-control" id="name" placeholder="Địa chỉ" name="address" style="border-radius: 100px; margin-bottom: 1rem;" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-12" style="margin-bottom: 1rem;">
                                                    <div class="form-group" required>
                                                        Giới tính&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input class="" name="gender" type="radio" value="True" required/>&nbsp; Nam
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input class="" name="gender" type="radio" value="False" required/>&nbsp; Nữ
                                                    </div>
                                                    <div class="form-group" required>
                                                        Trạng thái&nbsp;&nbsp;&nbsp;
                                                        <input class="" name="status" type="radio" value="True" required/>&nbsp; Hiện
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input class="" name="status" type="radio" value="False" required/>&nbsp; Ẩn
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
                                    <th scope="col">Giới Tính</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Số điện thoại</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Tùy Chọn</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listCustomer}" var="o">
                                    <tr  class="text-center">
                                        <th scope="row">${o.user_Id}</th>
                                        <td>${o.full_Name}</td>
                                        <c:if test="${o.gender == true}"><td>Nam</td></c:if>
                                        <c:if test="${o.gender == false}"><td>Nữ</td></c:if>
                                        <td>${o.email}</td>
                                        <td>${o.mobile}</td>
                                        <c:if test="${o.status == true}"><td style="color: white">1<img class="circle" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/284194527_1133976170487933_1085416752535542040_n.png?stp=dst-png_s206x206&_nc_cat=104&ccb=1-7&_nc_sid=aee45a&_nc_ohc=LoSyTq95ad0AX-c2B2i&_nc_oc=AQk9uWi9k6EdP_vHZSebMr1lrkjH9P5HJQup6yxMO1w_VhjYBu2FjL8CkTVqWEVs77VA-0J1fK6jeRP0IOj8GFzD&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVK5T0ZY16zjCGg2cRnX1q6SSr8rRYlmyzwy0f5Zwauj0w&oe=62DA523B"></td>
                                            </c:if>
                                            <c:if test="${o.status == false}"><td style="color: white">2<img class="circle" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/286934964_765449398234277_7570486452980265407_n.png?stp=dst-png_s206x206&_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=WUdnYmBKFyEAX8HpdPo&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVIGfrkbJvS9ypiE_Iq3Ls7sx1XGXjrDNAVY_7kFNKgvFA&oe=62DB6924"></td>
                                            </c:if>
                                        <td>
                                            <a class="btn btn-dark" href="load-customer?cid=${o.user_Id}" role="button"><i class="fa-solid fa-pen-to-square">&#xf070;</i></a>
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
                <!-- Footer-->
                <%@include file="components/footer.jsp" %>
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


