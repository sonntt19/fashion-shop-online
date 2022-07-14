<%-- 
    Document   : cartCompletion
    Created on : Jun 6, 2022, 11:14:20 PM
    Author     : Veetu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <%@include file="components/javascript.jsp" %>
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
            
        </style>
    </head>

    <body class="body_cartCompletion">
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
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/281103381_572772191136174_5043690562183957345_n.png?stp=dst-png_p403x403&_nc_cat=103&ccb=1-7&_nc_sid=aee45a&_nc_ohc=SHXfgrEkR6YAX8rLGa2&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLf1edsa4TKOCOHM4R13P6-AG71EWKtZpR2cnUFLFz2rg&oe=62CE835A"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/284198292_430091582030313_1529983423096271495_n.png?stp=dst-png_p403x403&_nc_cat=103&ccb=1-7&_nc_sid=aee45a&_nc_ohc=TgeHA7Qd8voAX-74JNP&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVI-9lz3mV6QIvgtDvi2U-tHEGyuqwkIPklT19j29I8ISg&oe=62CE1F48"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/287474850_778593683475541_7296785382901230432_n.png?stp=dst-png_p403x403&_nc_cat=106&ccb=1-7&_nc_sid=aee45a&_nc_ohc=EOc_QfWmxjgAX_Nh0qi&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKMkb1_aoS08fCj0ztuSe3yNDRtHDMJlcOmgbU4XJbFAA&oe=62D0678F"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/283319196_543053710647140_1105032203347863278_n.png?stp=dst-png_p403x403&_nc_cat=105&ccb=1-7&_nc_sid=aee45a&_nc_ohc=xMoC-Fnh9dcAX-fiVrc&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKIRC9omVQreMYESdw9dvWl9vhVAQVAJsxo13nvIWOZPg&oe=62CF5980"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/287087315_5313627355391945_6198632885411833144_n.png?stp=dst-png_p403x403&_nc_cat=108&ccb=1-7&_nc_sid=aee45a&_nc_ohc=Ukh2Qq7duIEAX8iYhnr&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVIrOG_IxV1wpfzaVxeRKK25J1P_wL1DLGdcmO-ucScOxw&oe=62D1BB00"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/287383768_811511143566541_3865021228267425040_n.png?stp=dst-png_p403x403&_nc_cat=102&ccb=1-7&_nc_sid=aee45a&_nc_ohc=G8gspLaZ0HUAX8xbs1X&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVI_NCqrwark1LfJentZt2y0f3q96jhZkBGynsH88Th8Gg&oe=62CF16B0"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/286011017_332638679050828_5929123093364563275_n.png?stp=dst-png_p403x403&_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=cnNi-PehGDkAX88L77G&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVJlNIaYdUGR1B6O57YgJvgFUghyM2My3jqDQSimcZ8d2g&oe=62D05CA4"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/287312536_385748573587985_2824862564058126039_n.png?stp=dst-png_p403x403&_nc_cat=101&ccb=1-7&_nc_sid=aee45a&_nc_ohc=bNRr5ETb6p8AX-A8Lw_&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVI-D55w8h5IJKaIE6vSU5HAZetYNcbIeov7S2gTEvg1QA&oe=62CF8E48"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/286738980_409636731178352_7125508349303436336_n.png?stp=dst-png_p403x403&_nc_cat=100&ccb=1-7&_nc_sid=aee45a&_nc_ohc=DyvtIPr--JMAX8Cj6cn&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLxnA4rJFTKNrLBkcFJGntWRNbki3jApH3hRo5q_aFE8A&oe=62D0B8D1"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/285472660_384382830422531_2021670615556203146_n.png?stp=dst-png_p403x403&_nc_cat=100&ccb=1-7&_nc_sid=aee45a&_nc_ohc=agoBDaFbkewAX-4Mxuo&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVIwUjDSTiUa4BzaJ8gZWYyxIYek_ZjlgjC_T07SIVfAEg&oe=62D15727"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/286104556_3227152560865219_4302589231321677374_n.png?stp=dst-png_p403x403&_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=lg5O45Fg5N4AX_rQhkl&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLhKtfqrA0ZwgvXw1er-EAEcWPRvWNl2JeIxF6ZdtmgLw&oe=62D001FC"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/284620995_546087100573139_7857771663807796897_n.png?stp=dst-png_p403x403&_nc_cat=101&ccb=1-7&_nc_sid=aee45a&_nc_ohc=azaof46x9usAX_nHwjV&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVJ7AcfYXvotTnfrWl_aeCpsOI-_sssCS4dwVTJbYVAuDg&oe=62D07D9E"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/286431165_5346772748677057_8465141157597209564_n.png?stp=dst-png_p403x403&_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=HtbhjfDGQ84AX-VGNgC&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVK61GyRh3fm-ZEsm-UlFUxUAPOHD7ycoH9W3rJxdM2Vfw&oe=62D0CFBF"><br><br>
                        <img style="max-width: 100%; padding-bottom: 2%" src="https://scontent.xx.fbcdn.net/v/t1.15752-9/282166213_1892366127641016_5614138133000995956_n.png?stp=dst-png_p403x403&_nc_cat=107&ccb=1-7&_nc_sid=aee45a&_nc_ohc=NllW7QYjFcIAX8jG0lU&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLE2o5FQ6RwO4Oc1Bd_O2FGLx77nPMAe2sH2rYHoVmTHw&oe=62CF9064">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Hướng dẫn thanh toán bằng video -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="min-width: 50%">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Hướng dẫn thanh toán bằng video</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <video style="max-width: 100%;" src="https://sandbox.vnpayment.vn/apis/assets/images/Gioi-thieu-CTT-VNPAY.mp4" controls></video>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dark" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row" style="margin-top: 9%;">
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
        <!-- Footer-->
        <%@include file="components/footer.jsp" %>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>

</html>