<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : BlogList
    Created on : Jun 7, 2022, 5:22:43 PM
    Author     : Veetu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-tfo-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>?</title>
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
        <!-- Page header with logo and tagline-->
        <!--Slider-->
        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" >
                <div class="carousel-indicators">

                    <c:forEach items="${sessionScope.listSlider_HomePageAll}" var="s" >
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${s.id -1}" class="${s.id == sessionScope.sliderFirst.id ? "active" : ""}" aria-current="${s.id == sliderFirst.id ? "true" : ""}" aria-label="Slide ${s.id}"></button>
                    </c:forEach>
                </div>

                <div class="carousel-inner">

                    <c:forEach items="${sessionScope.listSlider_HomePageAll}" var="s" >
                        <div class="carousel-item ${s.id == sessionScope.sliderFirst.id ? "active" : ""}">
                            <img src="${s.slider_image}" class="d-block w-100" alt="...">
                        </div> 

                    </c:forEach>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- Page content-->
        <div class="container" style="padding-top: 12px">
            <div class="row">
                <!-- Side widgets-->
                <div class="col-lg-3">
                    <!-- Search widget-->
                    <%@include file="components/blogFeature.jsp" %>
                    <div class="col-mb-4">
                        <select class="dropdown-font-new" aria-label="Default select example" onchange="location = this.value;"> Tất cả
                            <option value="blog?${historyKey}${historyCategoryId}&type=desc" ${type eq "desc" ? "Selected" : ""}>
                                Mới Nhất
                            </option>
                            <option value="blog?${historyKey}${historyCategoryId}" ${type == null ? "Selected" : ""}>
                                Cũ Nhất
                            </option>
                        </select>
                    </div>
                </div>
                <!-- Blog entries-->
                <div class="col-lg-9">
                    <!-- Featured blog post-->
                    <div class="card mb-4" style="border-radius: 25px;">
                        <a href="blogDetail?blog_id=${newBlog.blog_id}&categoryBlog_id=${bnewBlog.categoryBlog_id}">
                            <img class="card-img-top" style="border-radius: 25px 25px 0px 0px;" src="${newBlog.thumbnail}" alt="..." />
                        </a>
                        <div class="card-body">
                            <div class="small text-muted">${newBlog.updated_date}</div>
                            <a style="text-decoration: none" href="blogDetail?blog_id=${newBlog.blog_id}&categoryBlog_id=${bnewBlog.categoryBlog_id}">
                                <h2 class="card-title"  style="color: black">${newBlog.title}</h2>
                            </a>
                            <p class="card-text">${newBlog.brief_infor}</p>
                        </div>
                    </div>
                </div>
                <!-- Nested row for non-featured blog posts-->
                <div class="row">
                    <c:forEach items="${listBlogList}" var="b">
                        <div class="col-lg-4">
                            <!-- Blog post-->
                            <div class="card mb-4"  style="border-radius: 25px;">
                                <a href="blogDetail?blog_id=${b.blog_id}&categoryBlog_id=${b.categoryBlog_id}"><img class="card-img-top" style="border-radius: 25px 25px 0px 0px; max-width: 100%" src="${b.thumbnail}" alt="..." /></a>
                                <div class="card-body">

                                    <div class="small text-muted">
                                        <c:forEach items="${sessionScope.listCategoryBlog}" var="c">${b.categoryBlog_id == listBlogById.categoryBlog_id ? c.categoryBlog_name:""}
                                        </c:forEach> | ${b.updated_date}
                                    </div>


                                    <a class="" style="text-decoration: none" href="blogDetail?blog_id=${b.blog_id}&categoryBlog_id=${b.categoryBlog_id}"><h2 class="card-title h4" style="color: black">${b.title}</h2></a>
                                    <p class="card-text">${b.brief_infor}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Pagination-->
                <nav aria-label="..." class="pagination">
                    <ul class="pagination">
                        <li class="page-item">
                            <a <c:if  test="${page!=1}">                         
                                    href="blog?page=${page-1}${historyKey}${historyCategoryId}${historyValue}${historyType}"
                                </c:if> class="page-link" aria-label="Previous">
                                <span  aria-hidden="true" >«</span>
                            </a>
                        </li>

                        <c:forEach begin="1" end="${totalPage}" var="i">
                            <li class="page-item ${i==page ?"active" : ""}"><a class="page-link" href="blog?page=${i}${historyKey}${historyCategoryId}${historyValue}${historyType}">${i}</a></li>
                            </c:forEach>

                        <li class="page-item">
                            <a <c:if test="${page!=totalPage}">
                                    href="blog?page=${page+1}${historyKey}${historyCategoryId}${historyValue}${historyType}"
                                </c:if> class="page-link" aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </li>
                    </ul>
                </nav>

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

