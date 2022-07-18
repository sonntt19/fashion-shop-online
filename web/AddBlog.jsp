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
                        <form action="add-post" method="post" enctype="multipart/form-data" >
                            <div class="row"  style="margin-top: 8%;">
                                <div class="p-4">

                                    <h4 class="text-center">Thêm Bài Viết</h4>
                                </div>
                                <div class="col-md-8">
                                    <div class="p-3 py-5">
                                        <div class="col-md-12">Tiêu đề<input type="text" name="title" class="form-control" placeholder="Nhập tiêu đề" ></div>
                                        <div class="col-md-12">Thông tin rút gọn<textarea class="form-control" name="brief_infor"  rows="2" ></textarea></div>
                                        <div class="col-md-12">Nội dung

                                            <textarea cols="20" rows="40" id="editor" name="content"></textarea>


                                            <script>
                                                var editor = CKEDITOR.replace('editor');
                                                CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/ckfinder/');
                                            </script>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="p-3 py-5">
                                        <div class="row mt-16">
                                            <div class="col-md-12">Danh mục
                                                <select class="form-control" name="categoryId" aria-label="Default select example">
                                                    <c:forEach items="${sessionScope.listCategoryBlog}" var="c">
                                                        <option value="${c.categoryBlog_id}">
                                                            ${c.categoryBlog_name}
                                                        </option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                            <div class="col-md-12">Trạng thái
                                                <br/>
                                                <input name="status" type="radio" value="1" checked/>&nbsp;Hiện
                                                <input name="status" type="radio" value="0" />&nbsp;Ẩn
                                            </div>
                                            <div class="col-md-12">Hình thu nhỏ<input type="file" name="thumbnail" class="form-control" placeholder="Thumbnail">${img}</div>
                                            
                                        </div>

                                    </div>

                                </div>
                                <div class="mt-5 p-4 text-center">
                                    <a href="${historyUrl}"><button class="btn btn-outline-dark" type="button">Quay lại</button></a>
                                    <input class="btn btn-danger ml-5" type="submit" value="Thêm mới">
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


