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
            .dateFromTo {
                font-size: 17px;
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
            <%@include file="components/sale-left-dashboard.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4 text-center mb-4">Bảng điều khiển bán hàng</h1>
                        <div class="row mb-2 dateFromTo">
                            <div class="col-xl-6">
                                <form action="sale-dashboard">
                                    Từ: 
                                    <input class="" type="date" id="start" name="start" value="${start}">
                                    Đến: 
                                    <input type="date" id="end" name="end" value="${end}">
                                    <input type="hidden" name="salerId" value="${salerId}"/>
                                    <input class="ml-4 btn btn-danger" type="submit" value="Thống kê"/>
                                </form>
                            </div>
                            <div class="col-xl-3">

                            </div>
                            <div class="col-xl-3">
                                <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;"> Tất cả
                                    <option value="sale-dashboard?$start=${start}&end=${end}" ${salerId == null ? "Selected" : ""}>
                                        Tất cả
                                    </option>
                                    <c:forEach items="${listSaler}" var="s">
                                        <option value="sale-dashboard?start=${start}&end=${end}&salerId=${s.user_Id}" ${salerId == s.user_Id ? "Selected" : ""}>
                                            ${s.full_Name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header mb-4 nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseThongkedonhang" aria-expanded="false" aria-controls="collapseThongkedonhang">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Thống kê đơn hàng
                                    </div>
                                    <div id="collapseThongkedonhang" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting" class="collapse card-body">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <div class="card-body"><canvas id="myBarChart-1" width="100%" height="40"></canvas></div>
                                            </div>
                                            <div class="col-xl-6">
                                                <h4 class="text-center mt-4">Tổng số ${total} đơn đặt hàng</h4>
                                                <div class="card-body"><canvas id="myPieChartOrder" width="100%" height="40"></canvas></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header mb-4 nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseThongkedoanhthu" aria-expanded="false" aria-controls="collapseThongkedoanhthu">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Thống kê doanh thu
                                    </div>
                                    <div id="collapseThongkedoanhthu" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting" class="collapse card-body">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <div class="card-body"><canvas id="myBarChart-2" width="100%" height="40"></canvas></div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="card-body"><canvas id="myAreaChart-2" width="100%" height="40"></canvas></div>
                                            </div>
                                        </div>
                                    </div>
                                        
                                    </div>
                                </div>                       
                            </div>
                        </div>
                </main>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script>
                                    /// Set new default font family and font color to mimic Bootstrap's default styling
                                    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                                    Chart.defaults.global.defaultFontColor = '#292b2c';
// Bar Chart Example
                                    var ctx1 = document.getElementById("myBarChart-1");
                                    var myLineChart = new Chart(ctx1, {
                                    type: 'bar',
                                            data: {
                                            labels: [<c:forEach  items="${listChartOrderBar}" var="order" > "${order.date}",</c:forEach>],
                                                    datasets: [{
                                                    label: "Đơn Hàng",
                                                            backgroundColor: "rgba(2,117,216,1)",
                                                            borderColor: "rgba(2,117,216,1)",
                                                            data: [<c:forEach  items="${listChartOrderBar}" var="order" > "${order.value}",</c:forEach>],
                                                    }],
                                            },
                                            options: {
                                            scales: {
                                            xAxes: [{
                                            time: {
                                            unit: 'month'
                                            },
                                                    gridLines: {
                                                    display: false
                                                    },
                                                    ticks: {
                                                    maxTicksLimit: 6
                                                    }
                                            }],
                                                    yAxes: [{
                                                    ticks: {
                                                    min: 0,
                                                            max: ${maxListChartOderBar},
                                                            maxTicksLimit: 5
                                                    },
                                                            gridLines: {
                                                            display: true
                                                            }
                                                    }],
                                            },
                                                    legend: {
                                                    display: false
                                                    }
                                            }
                                    });
                                    var ctx2 = document.getElementById("myBarChart-2");
                                    var myLineChart = new Chart(ctx2, {
                                    type: 'bar',
                                            data: {
                                            labels: [<c:forEach  items="${listChartRevenueBar}" var="revenue" > "${revenue.date}",</c:forEach>],
                                                    datasets: [{
                                                    label: "Doanh Thu",
                                                            backgroundColor: "rgba(2,117,216,1)",
                                                            borderColor: "rgba(2,117,216,1)",
                                                            data: [<c:forEach  items="${listChartRevenueBar}" var="revenue" > "${revenue.value}",</c:forEach>],
                                                    }],
                                            },
                                            options: {
                                            scales: {
                                            xAxes: [{
                                            time: {
                                            unit: 'month'
                                            },
                                                    gridLines: {
                                                    display: false
                                                    },
                                                    ticks: {
                                                    maxTicksLimit: 6
                                                    }
                                            }],
                                                    yAxes: [{
                                                    ticks: {
                                                    min: 0,
                                                            max: ${maxListChartRevenueBar},
                                                            maxTicksLimit: 5
                                                    },
                                                            gridLines: {
                                                            display: true
                                                            }
                                                    }],
                                            },
                                                    legend: {
                                                    display: false
                                                    }
                                            }
                                    });
        </script>
        <script>
            // Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
            // Pie Chart Example
            var ctx = document.getElementById("myPieChartOrder");
            var myPieChart = new Chart(ctx, {
            type: 'polarArea',
                    data: {
                    labels: [
                            'Đã hủy',
                            'Thành công',
                            'Đã gửi'
                    ],
                            datasets: [{
                            label: 'My First Dataset',
                                    data: [${totalCancel}, ${totalSucces}, ${totalSubmit}],
                                    backgroundColor: [
                                            'rgb(255, 99, 132)',
                                            'rgb(75, 192, 192)',
                                            'rgb(255, 205, 86)'
                                    ]
                            }]
                    },
                    options: {}
            });
        </script>
        <script >
            // Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
// Area Chart Example
            var ctx1 = document.getElementById("myAreaChart-2");
            var myLineChart = new Chart(ctx1, {
            type: 'line',
                    data: {
                    labels: [<c:forEach  items="${listChartRevenueArea}" var="revenue" > "${revenue.date}",</c:forEach>],
                            datasets: [{
                            label: "Doanh Thu",
                                    lineTension: 0.3,
                                    backgroundColor: "rgba(2,117,216,0.2)",
                                    borderColor: "rgba(2,117,216,1)",
                                    pointRadius: 5,
                                    pointBackgroundColor: "rgba(2,117,216,1)",
                                    pointBorderColor: "rgba(255,255,255,0.8)",
                                    pointHoverRadius: 5,
                                    pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                    pointHitRadius: 50,
                                    pointBorderWidth: 2,
                                    data: [<c:forEach  items="${listChartRevenueArea}" var="revenue" > "${revenue.value}",</c:forEach>],
                            }],
                    },
                    options: {
                    scales: {
                    xAxes: [{
                    time: {
                    unit: 'date'
                    },
                            gridLines: {
                            display: false
                            },
                            ticks: {
                            maxTicksLimit: 7
                            }
                    }],
                            yAxes: [{
                            ticks: {
                            min: 0,
                                    max: ${maxListChartRevenueArea},
                                    maxTicksLimit: 5
                            },
                                    gridLines: {
                                    color: "rgba(0, 0, 0, .125)",
                                    }
                            }],
                    },
                            legend: {
                            display: false
                            }
                    }
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>

