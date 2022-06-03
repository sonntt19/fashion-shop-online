<%-- 
    Document   : newjsp
    Created on : Jun 2, 2022, 10:32:59 PM
    Author     : GanKPoet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
"<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "<head>\n"
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <h3 style=\"color: blue;\">Xin chào ${sessionScope.us.full_Name}.</h3>\n"
                + "    <div>Chúng tôi nhận được yêu cầu đặt lại mật khẩu của bạn tại http://localhost:11969/fashion-shop-online/home.
                        Nếu bạn không yêu cầu, bạn có thể bỏ qua email này. Nếu thực sự bạn quên mật khẩu, hãy click ngay vào nút bên trên hoặc copy đường link này vào trình duyệt để KingsMan đặt lại mật khẩu cho tài khoản của bạn.</div>\n"
                + "    <div>Mật khẩu cũ của bạn là : ${sessionScope.us.password}</div>\n"
                + "    <div>Hi vọng bạn sẽ không quên mật khẩu của mình, nhưng nếu có quên thì chúng tôi rất sẵn sàng hỗ trợ bạn</div>\n"
                + "    <h3 style=\"color: blue;\">Trân trọng cảm ơn quý khách !</h3>\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
