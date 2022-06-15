<%-- 
    Document   : blogfeature
    Created on : Jun 9, 2022, 11:28:33 PM
    Author     : Veetu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="card mb-5" style="border-radius: 25px;">
    <form>
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Tìm kiếm" aria-label="Enter search term..." aria-describedby="button-search" style="border-radius: 25px 0px 0px 25px"/>
            <button class="btn btn-dark" id="button-search" type="submit" style="border-radius: 0px 25px 25px 0px">Tìm kiếm</button>
        </div>
    </form>
</div>
<!-- Categories widget-->
<div class="card mb-4" style="border-radius: 25px;">
    <div class="list-group bg-dark" style="border-radius: 25px; padding-bottom: 18px">
        <div href="#" class="list-group-item list-group-item-action bg-dark btn-dark active"  style="border-radius: 25px 25px 0px 0px">
            Danh mục
        </div>
        <c:forEach items="${listCategoryBlog}" var="o">
            <a href="categoryBlog?categoryBlog_id=${o.categoryBlog_id}" class="list-group-item list-group-item-action" style="${tag == o.categoryBlog_id ? "background-color: #fffc6c; font-weight: bold;":""}">${o.categoryBlog_name}</a>
        </c:forEach>
    </div>
</div>
