<%-- 
    Document   : cartCompletion
    Created on : Jun 6, 2022, 11:14:20 PM
    Author     : Veetu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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





            body {
                font-family: sans-serif;
                background: linear-gradient(110deg, #fdfdbe 60%, #f9f86c 60%);
            }
        </style>
    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <%@include file="components/account.jsp" %>

        <!-- Hướng dẫn thanh toán -->
        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Hướng dẫn thanh toán</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Hướng dẫn thanh toán bằng video -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Hướng dẫn thanh toán
                            nhưng là video</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <video style="max-width: 100%;" src="https://sandbox.vnpayment.vn/apis/assets/images/Gioi-thieu-CTT-VNPAY.mp4" controls></video>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div class="col-md-6 border-right">
                    <div class="p-3 py-5">
                        <div class="col-md-12 text-center" style="">
                            <img style="width: 40%;" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/282163047_1691161041268801_1675030521340105010_n.png?stp=dst-png_p403x403&_nc_cat=107&ccb=1-7&_nc_sid=aee45a&_nc_ohc=EzBEmSJJ0ioAX-BjHCG&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKQ9lzUi4EGvoiL3Kg8IywIKaanIc0I4k-FdMXuQ_ySoQ&oe=62C48B4D">
                        </div><br>
                        <div class="col-md-12">
                            <h3>Cảm ơn vì đã đặt hàng</h3>
                        </div><br>
                        <div class="col-md-12">
                            <h6><i>Chúng tôi sẽ gửi cho bạn một email xác nhận đơn hàng <br> với thông tin chi tiết và hướng dẫn thanh toán</i></h6>
                        </div><br>
                        <button type="button" class="btn btn-dark mt-3" data-toggle="modal" data-target="#exampleModalLong">
                            Hướng dẫn thanh toán
                        </button>
                        <button type="button" class="btn btn-light btn-outline-dark mt-3" data-toggle="modal"
                                data-target="#exampleModalCenter">
                            Hướng dẫn thanh toán bằng video
                        </button>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h3 class="text-right">Hình thức thanh toán</h3>
                        </div>
                        <div class="radio-buttons">
                            <div>
                                <form>
                                    <label class="payment-method__item">
                                        <span class="payment-method__item-custom-checkbox custom-radio">
                                            <input type="radio" id="payment-COD" name="payment-method" value="COD">
                                            <span class="checkmark">
                                            </span>
                                        </span>
                                        <span class="payment-method__item-icon-wrapper"><img
                                                src="https://www.coolmate.me/images/COD.svg"></span>
                                        <span class="payment-method__item-name">COD <br>Thanh toán khi nhận hàng
                                        </span>
                                    </label>
                                    <label class="payment-method__item">
                                        <span class="payment-method__item-custom-checkbox custom-radio">
                                            <input type="radio" id="payment-momo" name="payment-method" value="momo">
                                            <span class="checkmark"></span>
                                        </span>
                                        <span class="payment-method__item-icon-wrapper"><img
                                                src="https://www.coolmate.me/images/momo-icon.png" alt="MOMO"></span>
                                        <span class="payment-method__item-name">MOMO</span></label>
                                    <label class="payment-method__item">
                                        <span class="payment-method__item-custom-checkbox custom-radio">
                                            <input type="radio" id="payment-vnpay" name="payment-method" value="vnpay">
                                            <span class="checkmark"> </span>
                                        </span>
                                        <span class="payment-method__item-icon-wrapper">
                                            <img src="https://www.coolmate.me/images/vnpay.png">
                                        </span>
                                        <span class="payment-method__item-name">
                                            Thẻ ATM / Internet Banking<br>Thẻ tín dụng (Credit card) / Thẻ ghi nợ (Debit
                                            card)<br>VNPay QR
                                        </span>
                                    </label>
                                    <div class="mt-5 text-center"><button class="btn btn-primary" type="submit">Thanh
                                            toán</button></div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="components/footer.jsp" %>
</body>

</html>