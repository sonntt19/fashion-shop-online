<%-- 
    Document   : MKT-left-board
    Created on : Jun 23, 2022, 8:55:56 PM
    Author     : son22
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Bảng điểu khiển</div>
                <a class="nav-link" href="mkt-dashboard">        
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Bảng điều khiển tiếp thị
                </a>
                <div class="sb-sidenav-menu-heading">Giao diện</div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Quản lý sản phẩm
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapse1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="marketingproductlist">Danh sách sản phẩm</a>
                        <a class="nav-link" href="add_product.jsp">Thêm mới sản phẩm</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapseLayouts">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Quản lý blog
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapse2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="posts-list">Danh sách blog</a>
                        <a class="nav-link" href="AddBlog.jsp">Thêm mới blog</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapseCustomer">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Quản lý khách hàng
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapse3" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="customer-list">Danh sách khách hàng</a>
                    </nav>
                </div>

                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapseCustomer">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Quản lý thanh trượt
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapse4" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="slider-list">Danh sách slider</a>
                        <a class="nav-link" href="MKTAddSlider.jsp">Thêm mới slider</a>
                    </nav>
                </div>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapseCustomer">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Quản lý phản hồi
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapse5" aria-labelledby="headingOne" data-bs-parent="#cutomerSetting">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="feedback-list">Danh sách phản hồi</a>
                    </nav>
                </div>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Đăng nhập bởi:</div>
            ${sessionScope.us.full_Name}
        </div>
    </nav>
</div>
