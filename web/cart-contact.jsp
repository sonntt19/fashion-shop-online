<%-- 
    Document   : cart-detail
    Created on : Jun 15, 2022, 8:42:40 AM
    Author     : dongh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">


        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <%@include file="components/javascript.jsp" %>
    </head>

    <style>
        body {
            background: #ddd;
            min-height: 100vh;
            vertical-align: middle;
            /*display: flex;*/
            font-family: sans-serif;
            font-size: 0.8rem;
            font-weight: bold;
        }

        .title {
            margin-bottom: 5vh;
        }

        .card {
            margin: auto;
            max-width: 950px;
            width: 90%;
            box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 1rem;
            border: transparent;
            min-width: 95%;
        }

        @media(max-width:767px) {
            .card {
                margin: 3vh auto;
            }
        }

        .cart {
            background-color: #fff;
            padding: 4vh 5vh;
            border-bottom-left-radius: 1rem;
            border-top-left-radius: 1rem;
        }

        @media(max-width:767px) {
            .cart {
                padding: 4vh;
                border-bottom-left-radius: unset;
                border-top-right-radius: 1rem;
            }
        }

        .summary {
            background-color: #ddd;
            border-top-right-radius: 1rem;
            border-bottom-right-radius: 1rem;
            padding: 4vh;
            color: rgb(65, 65, 65);
        }

        @media(max-width:767px) {
            .summary {
                border-top-right-radius: unset;
                border-bottom-left-radius: 1rem;
            }
        }

        .summary .col-2 {
            padding: 0;
        }

        .summary .col-10 {
            padding: 0;
        }

        .row {
            margin: 0;
        }

        .title b {
            font-size: 1.5rem;
        }

        .main {
            margin: 0;
            padding: 2vh 0;
            width: 100%;
        }

        .col-2,
        .col {
            padding: 0 1vh;
        }

        a {
            padding: 0 1vh;
        }

        .close {
            margin-left: auto;
            font-size: 0.7rem;
        }

        img {
            width: 3.5rem;
        }

        .back-to-shop {
            margin-top: 4.5rem;
        }

        h5 {
            margin-top: 4vh;
        }

        hr {
            margin-top: 1.25rem;
        }

        form {
            padding: 2vh 0;
        }

        select {
            border: 1px solid rgba(0, 0, 0, 0.137);
            padding: 1.5vh 1vh;
            margin-bottom: 4vh;
            outline: none;
            width: 100%;
            background-color: rgb(247, 247, 247);
        }

        .input-name input {
            border: 1px solid rgba(0, 0, 0, 0.137);
            padding: 1vh;
            margin-bottom: 4vh;
            outline: none;
            width: 100%;
            background-color: rgb(247, 247, 247);
        }

        input:focus::-webkit-input-placeholder {
            color: transparent;
        }

        .style-btn .btn {
            background-color: #000;
            border-color: #000;
            color: white;
            width: 100%;
            font-size: 0.7rem;
            margin-top: 4vh;
            padding: 1vh;
            border-radius: 0;
        }

        .btn:focus {
            box-shadow: none;
            outline: none;
            box-shadow: none;
            color: white;
            -webkit-box-shadow: none;
            -webkit-user-select: none;
            transition: none;
        }

        .btn:hover {
            color: white;
        }

        a {
            color: black;
        }

        a:hover {
            color: black;
            text-decoration: none;
        }

        #code {
            background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253), rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
            background-repeat: no-repeat;
            background-position-x: 95%;
            background-position-y: center;
        }
    </style>
    <%@include file="components/header.jsp" %>
    <%@include file="components/account.jsp" %>
    <body>

        <div class="card" style="margin-top: 10%; margin-bottom: 5%">
            <div class=" row">
                <div class="col-md-7 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col">
                                <h4><b>Sản phẩm</b></h4>
                            </div>
                            <!-- <div class="col align-self-center text-right text-muted">3 items</div> -->
                        </div>
                    </div>
                    <c:forEach items="${listCart}" var="c">
                    <div class="row border-top border-bottom">
                        <div class="row main align-items-center">
                            
                            <!--<div class="col-2"><img class="img-fluid" src="https://i.imgur.com/1GrakTl.jpg"></div>-->
                            <div class="col">
                                <div class="row">${c.product_id}</div>
                            </div>
                            <div class="col">
                                <div class="row">${c.product_name}</div>
                            </div>
                            <div class="col" style="text-align: center;">
                                <div class="text-muted">Số lượng: ${c.quantity}</div>
                            </div>
                            <div class="col" style="text-align: center;">${c.product_price}đ</div>
                        </div>
                    </div>
                    </c:forEach>

                    <div class="back-to-shop text-muted"><a href="carts">&leftarrow; Trở lại cửa hàng</a></div>
                </div>
                <div class="style-btn col-md-5 summary">
                    <div class="row">
                        <h4 class="cal"><b>Thông tin giao hàng</b></h4>
                        <div class="col align-self-center text-right text-muted">Hãy sửa các thông tin chính xác nhất</div>
                    </div>
                    <hr>
                    <form class="input-name" action="add-order">
                        <label for="fullname">Họ Tên</label>
                        <input id="fullname" type="text" name="fullname" value="${user.full_Name}">

                        <label for="phone">SỐ ĐIỆN THOẠI</label>
                        <input id="phone" type="text" name="phone" value="${user.mobile}">

                        <label for="address">ĐỊA CHỈ</label>
                        <input id="address" type="text" name="address" value="${user.address}">

                        <label for="note">GHI CHÚ</label>
                        <textarea id="note" class="form-control" name="note" style="background-color: rgb(247, 247, 247);"
                                  id="exampleFormControlTextarea1" rows="3"></textarea>
                    
                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                        <div class="col">TỔNG TIỀN</div>
                        <div class="col text-right">${sum}đ</div>
                        <input type="hidden" name="sum" value="${sum}">
                    </div>
                    <button type="submit" class="btn" style="font-size: 12px;">Gửi thông tin</button>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
</body>
</html>
