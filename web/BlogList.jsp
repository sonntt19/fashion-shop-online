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
                    <div class="col-md-2">
                        <select class="dropdown-font-new" aria-label="Default select example">Sắp xếp
                            <option>
                                Mới Nhất&nbsp;
                            </option>
                            <option>
                                Cũ Nhất&nbsp;
                            </option>
                        </select>
                    </div>
                </div>
                <!-- Blog entries-->
                <div class="col-lg-9">
                    <!-- Featured blog post-->
                    <div class="card mb-4" style="border-radius: 25px;">
                        <a href="#!"><img class="card-img-top" style="border-radius: 25px 25px 0px 0px;" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
                        <div class="card-body">
                            <div class="small text-muted">January 1, 2022</div>
                            <h2 class="card-title">Featured Post Title</h2>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
                            <a class="btn btn-dark" href="BlogDetail.jsp">Read more →</a>
                        </div>
                    </div>
                </div>
                <!-- Nested row for non-featured blog posts-->
                <div class="row">
                    <c:forEach items="${listBlogList}" var="b">
                        <div class="col-lg-4">
                            <!-- Blog post-->
                            <div class="card mb-4"  style="border-radius: 25px;">
                                <a href="blogDetail?blog_id=${b.blog_id}&categoryBlog_id=${b.categoryBlog_id}"><img class="card-img-top" style="border-radius: 25px 25px 0px 0px;" src="${b.thumbnail}" alt="..." /></a>
                                <div class="card-body">
                                    <div class="small text-muted">${b.updated_date}</div>
                                    <a class="" style="text-decoration: none" href="blogDetail?blog_id=${b.blog_id}&categoryBlog_id=${b.categoryBlog_id}"><h2 class="card-title h4" style="color: black">${b.title}</h2></a>
                                    <p class="card-text">${b.brief_infor}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Pagination-->
                <nav aria-label="Pagination">
                    <hr class="my-0  bg-dark" />
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1">Previous</a>
                            </li>
                            <li class="page-item bg-dark"><a class="page-link" href="#">1</a></li>
                            <li class="page-item bg-dark"><a class="page-link" href="#">2</a></li>
                            <li class="page-item bg-dark"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
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

