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
                font-size: 20px;
                padding: 1%;
                margin: 0;
                box-sizing: border-box;
            }
            input[type="date"] {
                font-size: 20px;
                border-radius: 5px;
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
            <%@include file="components/MKT-left-board.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4 text-center mb-4">Bảng điều khiển tiếp thị</h1>
                        <div class="dateFromTo">
                            <form action="mkt-dashboard">
                                Từ: 
                                <input class="" type="date" id="start" name="start" value="${start}">
                                Đến: 
                                <input type="date" id="end" name="end" value="${end}">
                                <input class="ml-4 btn btn-danger" type="submit" value="Thống kê"/>
                            </form>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header mb-4 nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseThongkebaidang" aria-expanded="false" aria-controls="collapseThongkebaidang">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Thống kê bài đăng
                                    </div>
                                    <div id="collapseThongkebaidang" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting" class="collapse card-body">
                                        <div class="row">
                                            <div class="col-xl-6">

                                                <div class="card-body"><canvas id="myBarChart-1" width="100%" height="40"></canvas></div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="card-body"><canvas id="myAreaChart-1" width="100%" height="40"></canvas></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header mb-4 nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseThongkesanpham" aria-expanded="false" aria-controls="collapseThongkesanpham">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Thống kê sản phẩm
                                    </div>
                                    <div id="collapseThongkesanpham" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting" class="collapse card-body">
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
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header mb-4 nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseThongkekhachhang" aria-expanded="false" aria-controls="collapseThongkekhachhang">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Thống kê khách hàng
                                    </div>
                                    <div id="collapseThongkekhachhang" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting" class="collapse card-body">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <div class="card-body"><canvas id="myBarChart-3" width="100%" height="40"></canvas></div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="card-body"><canvas id="myAreaChart-3" width="100%" height="40"></canvas></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-xl-12">
                                <div class="card mb-4">
                                    <div class="card-header mb-4 nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseThongkephanhoi" aria-expanded="false" aria-controls="collapseThongkephanhoi">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Thống kê phản hồi
                                    </div>
                                    <div id="collapseThongkephanhoi" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting" class="collapse card-body">
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <div class="card-body"><canvas id="myBarChart-4" width="100%" height="40"></canvas></div>
                                            </div>
                                            <div class="col-xl-6">
                                                <div class="card-body"><canvas id="myAreaChart-4" width="100%" height="40"></canvas></div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <!-- Footer-->
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script >
            // Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
// Area Chart Example
            var ctx1 = document.getElementById("myAreaChart-1");
            var myLineChart = new Chart(ctx1, {
            type: 'line',
                    data: {
                    labels: [<c:forEach  items="${listChartBlogArea}" var="blog" > "${blog.date}",</c:forEach>],
                            datasets: [{
                            label: "Bài Đăng",
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
                                    data: [<c:forEach  items="${listChartBlogArea}" var="blog" > "${blog.value}",</c:forEach>],
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
                                    max: ${maxListChartBlogArea},
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
            var ctx2 = document.getElementById("myAreaChart-2");
            var myLineChart = new Chart(ctx2, {
            type: 'line',
                    data: {
                    labels: [<c:forEach  items="${listChartProductArea}" var="product" > "${product.date}",</c:forEach>],
                            datasets: [{
                            label: "Sản Phẩm",
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
                                    data: [<c:forEach  items="${listChartProductArea}" var="product" > "${product.value}",</c:forEach>],
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
                                    max: ${maxListChartProductArea},
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
            var ctx3 = document.getElementById("myAreaChart-3");
            var myLineChart = new Chart(ctx3, {
            type: 'line',
                    data: {
                    labels: [<c:forEach  items="${listChartCustomerArea}" var="customer" > "${customer.date}",</c:forEach>],
                            datasets: [{
                            label: "Khách Hàng",
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
                                    data: [<c:forEach  items="${listChartCustomerArea}" var="customer" > "${customer.value}",</c:forEach>],
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
                                    max: ${maxListChartCustomerArea},
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
            var ctx4 = document.getElementById("myAreaChart-4");
            var myLineChart = new Chart(ctx4, {
            type: 'line',
                    data: {
                    labels: [<c:forEach  items="${listChartFeedbackArea}" var="feedback" > "${feedback.date}",</c:forEach>],
                            datasets: [{
                            label: "Phản hồi",
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
                                    data: [<c:forEach  items="${listChartFeedbackArea}" var="feedback" > "${feedback.value}",</c:forEach>],
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
                                    max: ${maxListChartFeedbackArea},
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
        <script>
            /// Set new default font family and font color to mimic Bootstrap's default styling
            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
            Chart.defaults.global.defaultFontColor = '#292b2c';
            // Bar Chart Example
            var ctx1 = document.getElementById("myBarChart-1");
            var myLineChart = new Chart(ctx1, {
            type: 'bar',
                    data: {
                    labels: [<c:forEach  items="${listChartBlogBar}" var="product" > "${product.date}",</c:forEach>],
                            datasets: [{
                            label: "Bài Đăng",
                                    backgroundColor: "rgba(2,117,216,1)",
                                    borderColor: "rgba(2,117,216,1)",
                                    data: [<c:forEach  items="${listChartBlogBar}" var="product" > "${product.value}",</c:forEach>],
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
                                    max: ${maxListChartBlogBar},
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
                    labels: [<c:forEach  items="${listChartProductBar}" var="product" > "${product.date}",</c:forEach>],
                            datasets: [{
                            label: "Sản Phẩm",
                                    backgroundColor: "rgba(2,117,216,1)",
                                    borderColor: "rgba(2,117,216,1)",
                                    data: [<c:forEach  items="${listChartProductBar}" var="product" > "${product.value}",</c:forEach>],
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
                                    max: ${maxListChartProductBar},
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
            var ctx3 = document.getElementById("myBarChart-3");
            var myLineChart = new Chart(ctx3, {
            type: 'bar',
                    data: {
                    labels: [<c:forEach  items="${listChartCustomerBar}" var="customer" > "${customer.date}",</c:forEach>],
                            datasets: [{
                            label: "Khách Hàng",
                                    backgroundColor: "rgba(2,117,216,1)",
                                    borderColor: "rgba(2,117,216,1)",
                                    data: [<c:forEach  items="${listChartCustomerBar}" var="customer" > "${customer.value}",</c:forEach>],
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
                                    max: ${maxListChartCustomerBar},
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
            var ctx4 = document.getElementById("myBarChart-4");
            var myLineChart = new Chart(ctx4, {
            type: 'bar',
                    data: {
                    labels: [<c:forEach  items="${listChartFeedbackBar}" var="feedback" > "${feedback.date}",</c:forEach>],
                            datasets: [{
                            label: "Phản Hồi",
                                    backgroundColor: "rgba(2,117,216,1)",
                                    borderColor: "rgba(2,117,216,1)",
                                    data: [<c:forEach  items="${listChartFeedbackBar}" var="feedback" > "${feedback.value}",</c:forEach>],
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
                                    max: ${maxListChartFeedbackBar},
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
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


