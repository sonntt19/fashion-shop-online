<%-- 
    Document   : BlogDetail
    Created on : Jun 7, 2022, 5:23:29 PM
    Author     : Veetu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog Post - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <%@include file="components/javascript.jsp" %>
    </head>
    <body>
        <!-- Responsive navbar-->
        <%@include file="components/header.jsp" %>
        <%@include file="components/account.jsp" %>
        <!-- Page content-->
            <div class="container mt-5" style="padding-top: 5%;">
            <div class="row">
                <!-- Side widgets-->
                <div class="col-lg-3">
                    <!-- Search widget-->
                    <%@include file="components/blogFeature.jsp" %>
                </div>
                <div class="col-lg-9">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            
                            <h1 class="fw-bolder mb-1">Graphene là gì? Những ứng dụng tuyệt vời của graphene trong cuộc sống</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">Posted on 01/09/2001 by Nguyễn Trí Trường Sơn
                                </div>
                           
                            </header>
                        <!-- Preview image figure-->
                        <figure class="mb-4"><img class="img-fluid rounded" src="images/slider/1.jpg" style="min-width: 100%" alt="..." /></figure>
                        <!-- Post content-->
                        <section class="mb-5">
                            <p class="fs-5 mb-4">${content}</p>
                        </section>
                    </article>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <%@include file="components/footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>

