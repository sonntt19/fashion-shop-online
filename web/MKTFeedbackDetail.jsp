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
        <script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>
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
            <%@include file="components/MKT-left-board.jsp" %>
            <div class="groundy" id="layoutSidenav_content">
                <main>
                    <div class="container rounded bg-white mt-5 mb-5">
                        <form action="update-post" method="post" enctype="multipart/form-data">
                            <div class="row"  style="margin-top: 8%;">
                                <div class="p-4">

                                    <h1 class="text-center">Chi tiết Phản Hồi</h1>
                                </div>
                                <div class="col-md-5">
                                    <div class="p-3 py-5">
                                        <h4 style="text-align: center">Ảnh phản hồi</h4>
                                        <img src="${feedback.image}" style="max-width:100%;"/>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                </div>
                                <div class="col-md-6">
                                    <div class="p-3 py-5">
                                        <h4 style="text-align: center">Thông tin người phản hồi</h4>
                                        <div class="col-md-12" style="margin-bottom: 5px">Người phản hồi: <input type="text" class="form-control"  value="${feedback.fullName}" readonly ></div>
                                        <div class="col-md-12" style="margin-bottom: 5px">Email: <input  type="text" class="form-control" value="${feedback.email}" readonly/></div>  
                                        <div class="col-md-12" style="margin-bottom: 5px">Số điện thoại: <input  type="text" class="form-control" value="${feedback.phone}" readonly/></div> 
                                        <h4 style="text-align: center; margin-top: 20px">Chi tiết đánh giá</h4>
                                        <div style="margin-bottom: 8px">Số sao đánh giá:  
                                            <c:forEach var="i" begin="0" end="4">
                                                <c:if test="${(feedback.rated_star - i) >= 1}">
                                                    <div style="height:15px; width: 15px;" class="reviews-rating__star is-active"></div> 
                                                </c:if>
                                                <c:if test="${(feedback.rated_star - i) < 1 && (p.rated_star - i) > 0}">
                                                    <div style="height:15px; width: 15px;" class="reviews-rating__star is-active is-half"></div> 
                                                </c:if>
                                                <c:if test="${(feedback.rated_star - i) <= 0}">
                                                    <div style="height:15px; width: 15px;" class="reviews-rating__star"></div> 
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="col-md-12" style="margin-bottom: 5px">Tên sản phẩm: <input  type="text" class="form-control" value="${feedback.product_name}" readonly/></div> 

                                        <div class="col-md-12" style="margin-bottom: 5px">Phản hồi<input type="text" class="form-control" value="${feedback.feedback}"  readonly=""></div>
                                        <div class="col-md-12" style="margin-bottom: 10px">Ngày cập nhật<input type="date" class="form-control" value="${feedback.date}"  readonly=""></div>
                                        <div class="col-md-12" ">Trạng thái:&nbsp;
                                            <c:if test="${feedback.status == true}">
                                                <td><img style="height:13px; width: 13px;" class="circle" src="images/active.png">&nbsp;Hiện</td>
                                                </c:if>
                                                <c:if test="${feedback.status != true}">
                                                <td><img style="height:13px; width: 13px;" class="circle" src="images/inactive.png">&nbsp;Ẩn</td>
                                                </c:if>
                                        </div> 

                                    </div>

                                    <div class="mt-5 p-4 text-center">
                                        <a href="feedback-list"><button class="btn btn-outline-dark" type="button">Quay lại</button></a>
                                        
                                        <c:if test="${feedback.status == true}">
                                            <a  href="status-feedback?status=0&feedbackId=${feedback.id}"  title="Ẩn" style='font-size:10px'>
                                                <input class="btn btn-dark" value="Ẩn">
                                            </a>
                                        </c:if>
                                        <c:if test="${feedback.status != true}">
                                            <a href="status-feedback?status=1&feedbackId=${feedback.id}"  title="Hiện" style='font-size:10px'>
                                                <input class="btn btn-dark" value="Hiện">
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                        </form> 
                    </div>
                </main>
                <!-- Footer-->
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


