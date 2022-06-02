<%-- 
    Document   : header
    Created on : May 30, 2022, 2:32:51 PM
    Author     : son22
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="header">
    <!-- Begin logo -->
    <div class="logo-shop">
        <i class="logo-icon ti-joomla">KingsMan</i>
    </div>

    <!-- Begin nav -->
    <ul id="nav">
        <li><a href="">Trang chủ</a></li>
        <li><a href="">Blog</a></li>
        <li><a href="">Sản phẩm</a></li>
        <li><a href="">Liên hệ</a></li>
        <li>
            <a href="">
                More
                <i class="nav-arround-down ti-angle-down"></i>    
            </a>

            <ul class="subnav">
                <li><a href="">About us</a></li>
                <li><a href="">Login</a></li>
                <li><a href="">Sign up</a></li>
            </ul>
        </li> 
        <li>
            <form class="form-search">
                <li><input type="text" name="" placeholder="new fashion" id="" required class="form-control"> </li>
                <li><input class="header-search-btn" type="submit" value="Tìm kiếm"></li>
            </form>
        </li>



    </ul>

    <!-- begin icon header -->
    <div class="btn-icon">
        <a><i class="header-icon ti-shopping-cart"></i></a>
    </div>
    <!-- Button Login -->
    <c:if test="${sessionScope.us != null}">
        <div class="btn-group">
            <button type="button" class="btn btn-outline-light dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
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
        <div class="btn-icon">
            <a><i type="button" class="header-icon ti-user" data-toggle="modal"  data-target="#loginModal"></i></a>
        </div>
    </c:if>


    <div class="btn-icon">
        <a href="#"><i class="header-icon ti-search"></i></a>
    </div>
</div>
