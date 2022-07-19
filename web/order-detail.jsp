<%-- 
    Document   : order-detail
    Created on : Jun 14, 2022, 7:27:41 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <%@include file="components/javascript.jsp" %>
        <style>
            body {
                min-height: 100vh;
                background-size: cover;
                font-family: 'Lato', sans-serif;
                color: rgba(116, 116, 116, 0.667);
                background: linear-gradient(140deg , #fff , 50% , blue);    

            }
            .container-fluid-detail {
                margin-top: 200px ;
            }

            p {
                font-size: 14px;
                margin-bottom: 7px;

            }

            .small {
                letter-spacing: 0.5px !important;
            }

            .card-1 {
                box-shadow: 2px 2px 10px 0px rgb(190, 108, 170);
            }

            hr {
                background-color: rgba(248, 248, 248, 0.667);
            }


            .bold {
                font-weight: 500;
            }

            .change-color {
                color: #AB47BC !important;
            }

            .card-2 {
                box-shadow: 1px 1px 3px 0px rgb(112, 115, 139);

            }

            .fa-circle.active {
                font-size: 8px;
                color: #AB47BC;
            }

            .fa-circle {
                font-size: 8px;
                color: #aaa;
            }

            .rounded {
                border-radius: 2.25rem !important;
            }


            .progress-bar {
                background-color: #AB47BC !important;
            }


            .progress {
                height: 5px !important;
                margin-bottom: 0;
            }

            .invoice {
                position: relative;
                top: -70px;
            }

            .Glasses {
                position: relative;
                top: -12px !important;
            }

            .card-footer {
                background-color: #6c757d;
                color: #fff;
            }

            .cart-footer h2 {
                color: rgb(78, 0, 92);
                letter-spacing: 2px !important;
            }

            .display-3 {
                font-weight: 500 !important;
            }

            @media (max-width: 479px) {
                .invoice {
                    position: relative;
                    top: 7px;
                }

                .border-line {
                    border-right: 0px solid rgb(226, 206, 226) !important;
                }

            }

            @media (max-width: 700px) {

                .cart-footer h2 {
                    color: rgb(78, 0, 92);
                    font-size: 17px;
                }

                .display-3 {
                    font-size: 28px;
                    font-weight: 500 !important;
                }
            }

            .card-footer small {
                letter-spacing: 7px !important;
                font-size: 12px;
            }

            .border-line {
                border-right: 1px solid rgb(226, 206, 226)
            }
            
            .cus-fontsize {
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <%@include file="components/header.jsp" %>

        <div class="container-fluid-detail my-5  d-flex  justify-content-center" >
            <div class="card card-1">
                <div class="card-header bg-white">
                    <div class="media flex-sm-row flex-column-reverse justify-content-between  ">
                        <div class="col my-auto"> <h4 class="mb-0" style="display: flex; justify-content: center">Thanks for your orders</h4> </div>
                        <div class="col-auto text-center  my-auto pl-0 pt-sm-4"> <img class="img-fluid my-auto align-items-center mb-0 pt-3"  src="https://salt.tikicdn.com/ts/product%2F73%2F31%2F8f%2F0d2df2f2799036d45c6ed06b946d361e.png" width="115" height="115"> <p class="mb-4 pt-0 Glasses">Fashion For Everyone</p>  </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row justify-content-between mb-3">
                        <div class="col-auto"> <h6 class="color-1 mb-0 change-color">Receipt</h6> </div>
                        <div class="col-auto  "> <small>Order Id: 10</small> </div>
                    </div>
                    <c:forEach items = "${Order_Detail}" var="s">
                        <div class="row">
                            <div class="col">
                                <div class="card card-2">
                                    <div class="card-body">
                                        <div class="media">
                                            <div class="sq align-self-center "> <img class="img-fluid  my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src="${s.product_image}" width="135" height="135" /> </div>
                                            <div class="media-body my-auto text-right">
                                                <div class="row  my-auto flex-column flex-md-row">
                                                    <div class="col my-auto"> <small class="mb-0">${s.product_name}</small>  </div>
                                                    <div class="col-auto my-auto"> <h6 class="mb-0">${s.category_name}</h6></div>
                                                    <div class="col my-auto"> <h6 class="mb-0">Giá: ${s.product_price}</h6></div>
                                                    <div class="col my-auto"> <h6 class="mb-0">Số lượng: ${s.quantity}</h6></div>
                                                    <div class="col my-auto"> <h6 class="mb-0">Tổng chi phí: ${s.product_price*s.quantity}</h6></div> 

                                                </div>
                                            </div>
                                        </div>
                                        <hr class="my-3 ">
                                        <div class="row">
                                            <div>
                                                <a href="list-detail?productId=${s.product_id}&categoryId=${s.category_id}" class="btn btn-primary btn-lg active" role="button" aria-pressed="true" style="width: 49%">Đánh giá</a>
                                                <a href="addcart?productId=${s.product_id}" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true" style="width: 49%">Mua lại</a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:forEach items="${listMyOrderinDetail}" var="k">


                        <div class="row mt-4">
                            <div class="col">
                                <div class="row justify-content-between">
                                    <div class="flex-sm-col text-right col"><p class="mb-1 cus-fontsize"> <b>Thông tin</b></p> </div>
                                    <div class="flex-sm-col col-auto"><p class="mb-1 cus-fontsize">Người nhận</p></div>
                                </div>
                                <div class="row justify-content-between">
                                    <div class="col-auto"><p class="mb-1 text-dark cus-fontsize"><b>Order Details</b></p></div>
                                    <div class="flex-sm-col text-right col cus"> <p class="mb-1 cus-fontsize me-2"><b>Họ tên</b></p> </div>
                                    <div class="flex-sm-col col-auto"> <p class="mb-1 cus-fontsize">${k.fullName}</p> </div>
                                </div>
                                <div class="row justify-content-between">
                                    <div class="flex-sm-col text-right col"><p class="mb-1 cus-fontsize"> <b>Số điện thoại</b></p> </div>
                                    <div class="flex-sm-col col-auto"><p class="mb-1 cus-fontsize">${k.mobile}</p></div>
                                </div>
                                
                                <div class="row justify-content-between">
                                    <div class="flex-sm-col text-right col"><p class="mb-1 cus-fontsize me-5"><b>Địa chỉ</b></p></div>
                                    <div class="flex-sm-col col-auto"><p class="mb-1 cus-fontsize">${k.address}</p></div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="row invoice ">
                            <div class="col"><p class="mb-1 cus-fontsize"> OrderId: ${k.orderID}</p><p class="mb-1 cus-fontsize">Ngày mua hàng : ${k.date}</p></div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="jumbotron-fluid">
                            <div class="row justify-content-between ">
                                <div class="col-sm-auto col-auto my-auto"><img class="img-fluid my-auto align-self-center " src="https://salt.tikicdn.com/ts/product%2F73%2F31%2F8f%2F0d2df2f2799036d45c6ed06b946d361e.png" width="115" height="115"></div>
                                <div class="col-auto my-auto "><h2 class="mb-0 font-weight-bold">TOTAL PAID</h2></div>
                                <div class="col-auto my-auto ml-auto"><h1 class="display-3 ">${k.total_cost}đ</h1></div>
                            </div>
                            <div class="row mb-3 mt-3 mt-md-0">
                                <div class="col-auto border-line"> <small class="text-white">Cảm ơn vì</small></div>
                                <div class="col-auto border-line"> <small class="text-white">đã ủng hộ</small></div>
                                <div class="col-auto "><small class="text-white">Chúng tôi<3 </small> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <%@include file="components/footer.jsp" %>
    </body>
</html>
