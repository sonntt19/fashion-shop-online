<%-- 
    Document   : footer
    Created on : May 30, 2022, 8:50:43 PM
    Author     : son22
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="footer">

    <!-- Feedback Form -->
    <div class="modal fade col-md-12" role="dialog" id="feedback_common">
        <div class="modal-dialog">
            <div class="modal-content" style="border-radius: 10px; margin-top: 60px;">
                <div class="modal-header">
                    <h2 style="margin-left: 35%">Bình luận</h2>
                </div>
                <div class="modal-body">
                    <form action="feedback_common">
                        <b>Viết bình luận:</b>&nbsp;&nbsp;
                        <div class="form-group">
                            <textarea name="subject" placeholder="Viết bình luận.." style="height:200px ; width: 460px"></textarea>
                        </div>
                        <b>Ảnh phản hồi:</b>&nbsp;&nbsp;
                        <div class="form-group">
                            <input name="imageurl" type="file" class="form-control" style="border-radius: 100px;" required="">
                        </div>
                        <b>Đánh giá:</b>&nbsp;&nbsp;
                        <div class="form-group" >
                            <select name = "star" style="border-radius: 100px;" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                <option selected>Chọn số sao bạn dành cho KingsMan</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <br>


                        <center><button type="submit" class="btn btn-dark" style="padding-right: 160px;padding-left: 160px; border-radius: 100px;">Bình luận</button></center>

                    </form>
                    <br><br>
                </div>
            </div>
        </div>
    </div>
    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d7448.27256631781!2d105.53745830000003!3d21.027232300000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1svi!2s!4v1653919437201!5m2!1svi!2s" 
                width=90% height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>

    <div class="info-footer">
        <div class="content-footer">
            <h2>Địa chỉ liên hệ</h2>
            <p class="mt-40">HUB Hà Nội: Hoalaclink03, thôn Vân Lôi, xã Bình Yên, huyện Thạch Thất, TP. Hà Nội</p>
        </div>

        <div class="feedback-footer">
            <h2 class="mt-40">KingsMan lắng nghe bạn!</h2>
            <p>Chúng tôi luôn trân trọng và mong đợi nhận được mọi ý kiến đóng góp từ khách hàng để có thể nâng cấp trải nghiệm dịch vụ và sản phẩm tốt hơn nữa</p>
            <a data-toggle="modal" data-dismiss="modal" data-target="#feedback_common"><input class="Button-Feedback mt-16" type="submit" value="Gửi ý kiến"></a> 
            <br>
            <br>
            <br>
            <div class="contact-info">
                <p><i class="ti-location-pin"></i>Tran Duy Hung, Ha Noi</p>
                <p><i class="ti-mobile"></i>Phone:+0879 112 113</p>
                <p><i class="ti-email"></i>Sondbrr123@gmail.com</p>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>


</div>
