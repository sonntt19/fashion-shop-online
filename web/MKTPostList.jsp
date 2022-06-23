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
                    <button class="btn btn-outline-danger" type="submit">Search</button>
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
                    <div class="container rounded row" style="margin-top: 1% !important; margin-bottom: 1% !important">
                        <div class="col-md-2 text-center">
                            <a href="AddBlog.jsp"><button type="button" class="btn btn-danger " style="">Thêm</button></a>
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;"> Danh mục
                                <option >
                                    Danh mục
                                </option>
                                <option >
                                    Cũ Nhất
                                </option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;"> Sắp xếp
                                <option>
                                    Sắp xếp
                                </option>
                                <option >
                                    Cũ Nhất
                                </option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;"> Tác giả
                                <option >
                                    Tác giả
                                </option>
                                <option }>
                                    Cũ Nhất
                                </option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;"> Trạng thái
                                <option }>
                                    Trạng thái
                                </option>
                                <option }>
                                    Cũ Nhất
                                </option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <form class="input-search" action="list">
                                <div>
                                    <input type="text" name="key" value="${key}" placeholder="Tìm kiếm blog" class="filter-search__control" >
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="container rounded bg-white mt-5 mb-5">
                        <table class="table"  style="margin-top: 4%">
                            <thead  class="text-center">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Thumbnail</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Updated Date</th>
                                    <th scope="col">Brief info</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Option</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr  class="text-center">
                                    <th scope="row">1</th>
                                    <td><img src="https://media.coolmate.me/cdn-cgi/image/quality=80/uploads/June2022/hop-tac-thanh-cong.jpg" height="100px" width="100px"/></td>
                                    <td>Collab là gì ? Các lý do mà mô hình collab ngày càng trở nên thịnh hành</td>
                                    <td>Mặc đẹp</td>
                                    <td>Nguyễn Trí Trường Sơn</td>
                                    <td >20-10-2022</td>
                                    <td>Trong những năm gần đây, đa số chúng ta đều đã từng bắt gặp những thuật ngữ Collab trên nhiều phương tiện truyền thông khác nhau. Vậy Collab là gì? Hãy cùng theo chân Kingsman tìm hiểu nhé!</td>
                                    <td><img class="circle" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/284194527_1133976170487933_1085416752535542040_n.png?stp=dst-png_s206x206&_nc_cat=104&ccb=1-7&_nc_sid=aee45a&_nc_ohc=LoSyTq95ad0AX-c2B2i&_nc_oc=AQk9uWi9k6EdP_vHZSebMr1lrkjH9P5HJQup6yxMO1w_VhjYBu2FjL8CkTVqWEVs77VA-0J1fK6jeRP0IOj8GFzD&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVK5T0ZY16zjCGg2cRnX1q6SSr8rRYlmyzwy0f5Zwauj0w&oe=62DA523B"></td>
                                    <td>
                                        <a class="btn btn-danger" href="#" role="button">
                                            <i style='font-size:15px' class='fas'>&#xf044;</i>
                                        </a>
                                        <a class="btn btn-dark" href="#" role="button">
                                            <i style='font-size:15px' class='fas'>&#xf070;</i>
                                        </a>
                                    </td>
                                </tr>
                                <tr  class="text-center">
                                    <th scope="row">2</th>
                                    <td><img src="https://media.coolmate.me/cdn-cgi/image/quality=80/uploads/June2022/so-sanh-vai-modal-va-vai-tencel-2.jpg" height="100px" width="100px"/></td>
                                    <td>[So sánh] Vải Modal và vải Tencel: Nên chọn chất liệu nào?</td>
                                    <td>Mặc đẹp</td>
                                    <td>Nguyễn Trí Trường Sơn</td>
                                    <td >20-10-2022</td>
                                    <td>Vải Tencel và vải Modal ngày càng trở nên phổ biến hơn trong lĩnh vực thời trang.  Cùng Kingsman so sánh vải Model và vải Tencel ngay trong bài viết này nhé.</td>
                                    <td><img class="circle" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/286934964_765449398234277_7570486452980265407_n.png?stp=dst-png_s206x206&_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=WUdnYmBKFyEAX8HpdPo&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVIGfrkbJvS9ypiE_Iq3Ls7sx1XGXjrDNAVY_7kFNKgvFA&oe=62DB6924"></td>
                                    <td>
                                        <a class="btn btn-danger" href="#" role="button">
                                            <i style='font-size:15px' class='fas'>&#xf044;</i>
                                        </a>
                                        <a class="btn btn-dark" href="#" role="button">
                                            <i style='font-size:15px' class='fas'>&#xf06e;</i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


