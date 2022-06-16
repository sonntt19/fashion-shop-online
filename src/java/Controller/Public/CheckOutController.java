/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Public;

import com.vnpay.common.Config;
import dal.CartDAO;
import dal.CustomerDAO;
import dal.OrderDao;
import dal.OrderDetailDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.Order;
import model.OrderDetail;
import model.SendMailOK;
import model.User;

/**
 *
 * @author son22
 */
public class CheckOutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String method = request.getParameter("payment-method");

            if (method.equalsIgnoreCase("vnpay")) {
                int id = Integer.parseInt(request.getParameter("order_id"));
                int total_cost = Integer.parseInt(request.getParameter("total_cost"));
                String vnp_Version = "2.0.0";
                String vnp_Command = "pay";
                String vnp_OrderInfo = "Thanh toan don hang " + id;
                String orderType = "billpayment";
                String vnp_TxnRef = id + "";
                String vnp_IpAddr = Config.getIpAddress(request);
                String vnp_TmnCode = Config.vnp_TmnCode;

                int amount = Math.round(total_cost) * 100;
                Map<String, String> vnp_Params = new HashMap<>();
                vnp_Params.put("vnp_Version", vnp_Version);
                vnp_Params.put("vnp_Command", vnp_Command);
                vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
                vnp_Params.put("vnp_Amount", String.valueOf(amount));
                vnp_Params.put("vnp_CurrCode", "VND");
                String bank_code = "";
                if (bank_code != null && bank_code.isEmpty()) {
                    vnp_Params.put("vnp_BankCode", bank_code);
                }
                vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
                vnp_Params.put("vnp_OrderType", orderType);

                String locate = "vi";
                if (locate != null && !locate.isEmpty()) {
                    vnp_Params.put("vnp_Locale", locate);
                } else {
                    vnp_Params.put("vnp_Locale", "vn");
                }
                vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
                vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                Date dt = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                String dateString = formatter.format(dt);
                String vnp_CreateDate = dateString;
                String vnp_TransDate = vnp_CreateDate;
                vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                //Build data to hash and querystring
                List fieldNames = new ArrayList(vnp_Params.keySet());
                Collections.sort(fieldNames);
                StringBuilder hashData = new StringBuilder();
                StringBuilder query = new StringBuilder();
                Iterator itr = fieldNames.iterator();
                while (itr.hasNext()) {
                    String fieldName = (String) itr.next();
                    String fieldValue = (String) vnp_Params.get(fieldName);
                    if ((fieldValue != null) && (fieldValue.length() > 0)) {
                        //Build hash data
                        hashData.append(fieldName);
                        hashData.append('=');
                        hashData.append(fieldValue);
                        //Build query
                        query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                        query.append('=');
                        query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                        if (itr.hasNext()) {
                            query.append('&');
                            hashData.append('&');
                        }
                    }
                }
                String queryUrl = query.toString();
                String vnp_SecureHash = Config.Sha256(Config.vnp_HashSecret + hashData.toString());
                queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
                String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
                request.setAttribute("code", "00");
                request.setAttribute("message", "success");
                request.setAttribute("data", paymentUrl);
                OrderDao od = new OrderDao();
                od.updateStatusOrder(id, 2);
                response.sendRedirect(paymentUrl);
            } else {
                response.sendRedirect("home");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        CartDAO cd = new CartDAO();
        OrderDao od = new OrderDao();
        OrderDetailDAO odd = new OrderDetailDAO();
        ProductDAO pd = new ProductDAO();
        CustomerDAO cus = new CustomerDAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("us");
        int user_id = u.getUser_Id();
        cd.deleteCartByUserId(user_id);
        Order o = od.getOrderNew(user_id);
        od.updateStatusOrder(o.getOrderID(), 1);
        List<OrderDetail> listOrderDetail = odd.getAllByOderId(o.getOrderID());
        pd.updateQuantityProduct(listOrderDetail);
        Customer c = cus.checkCustomer(o.getFullName(), u.getEmail(), o.getMobile());
        if (c == null) {
            cus.storedNewCustomer(o.getFullName(), u.getEmail(), o.getMobile());
        }
        request.setAttribute("order_id", o.getOrderID());
        request.setAttribute("total_cost", o.getTotal_cost());

        String email = u.getEmail();

        try {
            String smtpServer = "smtp.gmail.com";
            String to = email;
            String from = "khangdthe151162@fpt.edu.vn";
            String subject = "Checkout For Order\n";
            String body
                    = "<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "    <head>\n"
                    + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                    + "        <title>JSP Page</title>\n"
                    + "    </head>\n"
                    + "    <body>\n"
                    + "    <td>\n"
                    + "        <table style=\"border-spacing:0;border-collapse:collapse;width:100%;margin:40px 0 20px\">\n"
                    + "            <tbody>\n"
                    + "                <tr>\n"
                    + "                    <td>\n"
                    + "            <center>\n"
                    + "                <table\n"
                    + "                    style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\n"
                    + "                    <tbody>\n"
                    + "                        <tr>\n"
                    + "                            <td>\n"
                    + "                                <table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\n"
                    + "                                    <tbody>\n"
                    + "                                        <tr>\n"
                    + "                                            <td>\n"
                    + "\n"
                    + "                                                <h1\n"
                    + "                                                    style=\"font-weight:normal;margin:0;font-size:30px;color:#333\">\n"
                    + "                                                    <a href=\"https://thevapeclub.vn\"\n"
                    + "                                                       style=\"font-size:30px;text-decoration:none;color:#333\"\n"
                    + "                                                       target=\"_blank\"\n"
                    + "                                                       data-saferedirecturl=\"https://www.google.com/url?q=https://thevapeclub.vn&amp;source=gmail&amp;ust=1655483413010000&amp;usg=AOvVaw3mqQmYH-B0jekACwJJY5LC\">Kingsman</a>\n"
                    + "                                                </h1>\n"
                    + "\n"
                    + "                                            </td>\n"
                    + "                                            <td\n"
                    + "                                                style=\"text-transform:uppercase;font-size:14px;text-align:right;color:#999\">\n"
                    + "                                                <span style=\"font-size:16px\">\n"
                    + "                                                    Đơn hàng TVC-144564\n"
                    + "                                                </span>\n"
                    + "                                            </td>\n"
                    + "                                        </tr>\n"
                    + "                                    </tbody>\n"
                    + "                                </table>\n"
                    + "                            </td>\n"
                    + "                        </tr>\n"
                    + "                    </tbody>\n"
                    + "                </table>\n"
                    + "            </center>\n"
                    + "    </td>\n"
                    + "</tr>\n"
                    + "</tbody>\n"
                    + "</table>\n"
                    + "<table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\n"
                    + "    <tbody>\n"
                    + "        <tr>\n"
                    + "            <td style=\"padding-bottom:40px\">\n"
                    + "    <center>\n"
                    + "        <table\n"
                    + "            style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\n"
                    + "            <tbody>\n"
                    + "                <tr>\n"
                    + "                    <td>\n"
                    + "                        <h2 style=\"font-weight:normal;margin:0;font-size:24px;margin-bottom:10px\">\n"
                    + "                            Cám ơn bạn đã mua hàng!\n"
                    + "                        </h2>\n"
                    + "                        <p style=\"margin:0;color:#777;line-height:150%;font-size:16px\">\n"
                    + "                            Xin chào Khang, Chúng tôi đã nhận được đặt hàng của bạn và đã sẵn sàng để\n"
                    + "                            vận chuyển. Chúng tôi sẽ thông báo cho bạn khi đơn hàng được gửi đi.\n"
                    + "                        </p>\n"
                    + "\n"
                    + "                        <table\n"
                    + "                            style=\"border-spacing:0;border-collapse:collapse;width:100%;margin-top:20px\">\n"
                    + "                            <tbody>\n"
                    + "                                <tr>\n"
                    + "                                    <td>\n"
                    + "                                        <table\n"
                    + "                                            style=\"border-spacing:0;border-collapse:collapse;float:left;margin-right:15px\">\n"
                    + "                                            <tbody>\n"
                    + "                                                <tr>\n"
                    + "                                                    <td\n"
                    + "                                                        style=\"text-align:center;padding:20px 25px;border-radius:4px; background:#1666a2\">\n"
                    + "                                                        <a href=\"https://thevapeclub.vn/account/orders/3ef26b22e8af44548d6198e5f323371c\"\n"
                    + "                                                           style=\"font-size:16px;text-decoration:none;color:#fff\"\n"
                    + "                                                           target=\"_blank\">Xem đơn hàng</a>\n"
                    + "                                                    </td>\n"
                    + "                                                </tr>\n"
                    + "                                            </tbody>\n"
                    + "                                        </table>\n"
                    + "\n"
                    + "                                        <table\n"
                    + "                                            style=\"border-spacing:0;border-collapse:collapse;margin-top:19px\">\n"
                    + "                                            <tbody>\n"
                    + "                                                <tr>\n"
                    + "                                                    <td>\n"
                    + "                                                        <a href=\"https://thevapeclub.vn\"\n"
                    + "                                                           style=\"font-size:16px;text-decoration:none;color:#1666a2\"\n"
                    + "                                                           target=\"_blank\"><span\n"
                    + "                                                                style=\"font-size:16px;color:#999;display:inline-block;margin-right:10px\">hoặc</span>\n"
                    + "                                                            Đến cửa hàng của chúng tôi</a>\n"
                    + "                                                    </td>\n"
                    + "                                                </tr>\n"
                    + "                                            </tbody>\n"
                    + "                                        </table>\n"
                    + "                                    </td>\n"
                    + "                                </tr>\n"
                    + "                            </tbody>\n"
                    + "                        </table>\n"
                    + "                    </td>\n"
                    + "                </tr>\n"
                    + "            </tbody>\n"
                    + "        </table>\n"
                    + "    </center>\n"
                    + "</td>\n"
                    + "</tr>\n"
                    + "</tbody>\n"
                    + "</table>\n"
                    + "<table style=\"border-spacing:0;border-collapse:collapse;width:100%;border-top:1px solid #e5e5e5\">\n"
                    + "    <tbody>\n"
                    + "        <tr>\n"
                    + "            <td style=\"padding:40px 0\">\n"
                    + "    <center>\n"
                    + "        <h3 style=\"font-weight:normal;margin:0;font-size:20px;margin-bottom:25px\">\n"
                    + "            Hướng dẫn mua hàng\n"
                    + "        </h3>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/281103381_572772191136174_5043690562183957345_n.png?stp=dst-png_p403x403&_nc_cat=103&ccb=1-7&_nc_sid=aee45a&_nc_ohc=SHXfgrEkR6YAX8rLGa2&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLf1edsa4TKOCOHM4R13P6-AG71EWKtZpR2cnUFLFz2rg&oe=62CE835A\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/284198292_430091582030313_1529983423096271495_n.png?stp=dst-png_p403x403&_nc_cat=103&ccb=1-7&_nc_sid=aee45a&_nc_ohc=TgeHA7Qd8voAX-74JNP&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVI-9lz3mV6QIvgtDvi2U-tHEGyuqwkIPklT19j29I8ISg&oe=62CE1F48\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/287474850_778593683475541_7296785382901230432_n.png?stp=dst-png_p403x403&_nc_cat=106&ccb=1-7&_nc_sid=aee45a&_nc_ohc=EOc_QfWmxjgAX_Nh0qi&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKMkb1_aoS08fCj0ztuSe3yNDRtHDMJlcOmgbU4XJbFAA&oe=62D0678F\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/283319196_543053710647140_1105032203347863278_n.png?stp=dst-png_p403x403&_nc_cat=105&ccb=1-7&_nc_sid=aee45a&_nc_ohc=xMoC-Fnh9dcAX-fiVrc&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVKIRC9omVQreMYESdw9dvWl9vhVAQVAJsxo13nvIWOZPg&oe=62CF5980\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/287087315_5313627355391945_6198632885411833144_n.png?stp=dst-png_p403x403&_nc_cat=108&ccb=1-7&_nc_sid=aee45a&_nc_ohc=Ukh2Qq7duIEAX8iYhnr&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVIrOG_IxV1wpfzaVxeRKK25J1P_wL1DLGdcmO-ucScOxw&oe=62D1BB00\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/287383768_811511143566541_3865021228267425040_n.png?stp=dst-png_p403x403&_nc_cat=102&ccb=1-7&_nc_sid=aee45a&_nc_ohc=G8gspLaZ0HUAX8xbs1X&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVI_NCqrwark1LfJentZt2y0f3q96jhZkBGynsH88Th8Gg&oe=62CF16B0\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/286011017_332638679050828_5929123093364563275_n.png?stp=dst-png_p403x403&_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=cnNi-PehGDkAX88L77G&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVJlNIaYdUGR1B6O57YgJvgFUghyM2My3jqDQSimcZ8d2g&oe=62D05CA4\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/287312536_385748573587985_2824862564058126039_n.png?stp=dst-png_p403x403&_nc_cat=101&ccb=1-7&_nc_sid=aee45a&_nc_ohc=bNRr5ETb6p8AX-A8Lw_&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVI-D55w8h5IJKaIE6vSU5HAZetYNcbIeov7S2gTEvg1QA&oe=62CF8E48\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/286738980_409636731178352_7125508349303436336_n.png?stp=dst-png_p403x403&_nc_cat=100&ccb=1-7&_nc_sid=aee45a&_nc_ohc=DyvtIPr--JMAX8Cj6cn&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLxnA4rJFTKNrLBkcFJGntWRNbki3jApH3hRo5q_aFE8A&oe=62D0B8D1\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/285472660_384382830422531_2021670615556203146_n.png?stp=dst-png_p403x403&_nc_cat=100&ccb=1-7&_nc_sid=aee45a&_nc_ohc=agoBDaFbkewAX-4Mxuo&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVIwUjDSTiUa4BzaJ8gZWYyxIYek_ZjlgjC_T07SIVfAEg&oe=62D15727\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/286104556_3227152560865219_4302589231321677374_n.png?stp=dst-png_p403x403&_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=lg5O45Fg5N4AX_rQhkl&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLhKtfqrA0ZwgvXw1er-EAEcWPRvWNl2JeIxF6ZdtmgLw&oe=62D001FC\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/284620995_546087100573139_7857771663807796897_n.png?stp=dst-png_p403x403&_nc_cat=101&ccb=1-7&_nc_sid=aee45a&_nc_ohc=azaof46x9usAX_nHwjV&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVJ7AcfYXvotTnfrWl_aeCpsOI-_sssCS4dwVTJbYVAuDg&oe=62D07D9E\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/286431165_5346772748677057_8465141157597209564_n.png?stp=dst-png_p403x403&_nc_cat=110&ccb=1-7&_nc_sid=aee45a&_nc_ohc=HtbhjfDGQ84AX-VGNgC&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVK61GyRh3fm-ZEsm-UlFUxUAPOHD7ycoH9W3rJxdM2Vfw&oe=62D0CFBF\"><br><br>\n"
                    + "        <img style=\"max-width: 100%; padding-bottom: 2%\" src=\"https://scontent.xx.fbcdn.net/v/t1.15752-9/282166213_1892366127641016_5614138133000995956_n.png?stp=dst-png_p403x403&_nc_cat=107&ccb=1-7&_nc_sid=aee45a&_nc_ohc=NllW7QYjFcIAX8jG0lU&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_AVLE2o5FQ6RwO4Oc1Bd_O2FGLx77nPMAe2sH2rYHoVmTHw&oe=62CF9064\">\n"
                    + "        <h3 style=\"font-weight:normal;margin:0;font-size:20px;margin-bottom:25px\">\n"
                    + "            Bạn có thể thanh toán tại nhà bằng phương thức thanh toán COD\n"
                    + "        </h3>\n"
                    + "    </center>\n"
                    + "</td>\n"
                    + "</tr>\n"
                    + "</tbody>\n"
                    + "</table>\n"
                    + "<table style=\"border-spacing:0;border-collapse:collapse;width:100%;border-top:1px solid #e5e5e5\">\n"
                    + "    <tbody>\n"
                    + "        <tr>\n"
                    + "            <td style=\"padding:40px 0\">\n"
                    + "    <center>\n"
                    + "        <table\n"
                    + "            style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\n"
                    + "            <tbody>\n"
                    + "                <tr>\n"
                    + "                    <td>\n"
                    + "                        <h3 style=\"font-weight:normal;margin:0;font-size:20px;margin-bottom:25px\">\n"
                    + "                            Thông tin khách hàng\n"
                    + "                        </h3>\n"
                    + "                    </td>\n"
                    + "                </tr>\n"
                    + "            </tbody>\n"
                    + "        </table>\n"
                    + "        <table\n"
                    + "            style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\n"
                    + "            <tbody>\n"
                    + "                <tr>\n"
                    + "                    <td>\n"
                    + "                        <table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\n"
                    + "                            <tbody>\n"
                    + "                                <tr>\n"
                    + "                                    <td style=\"padding-bottom:40px;width:50%\">\n"
                    + "                                        <h4\n"
                    + "                                            style=\"font-weight:500;margin:0;font-size:16px;color:#555;margin-bottom:5px\">\n"
                    + "                                            Địa chỉ giao hàng\n"
                    + "                                        </h4>\n"
                    + "                                        <p style=\"margin:0;color:#777;line-height:150%;font-size:16px\">\n"
                    + "                                            Đỗ Trung Khang<br>\n"
                    + "                                            Đối diện trường THPT Hai Bà Trưng Thạch Thất, xã Tân Xã\n"
                    + "                                            <br>Huyện\n"
                    + "                                            Thạch Thất, Hà Nội\n"
                    + "                                        </p>\n"
                    + "                                    </td>\n"
                    + "\n"
                    + "\n"
                    + "                                    <td style=\"padding-bottom:40px;width:50%\">\n"
                    + "                                        <h4\n"
                    + "                                            style=\"font-weight:500;margin:0;font-size:16px;color:#555;margin-bottom:5px\">\n"
                    + "                                            Địa chỉ thanh toán\n"
                    + "                                        </h4>\n"
                    + "                                        <p style=\"margin:0;color:#777;line-height:150%;font-size:16px\">\n"
                    + "                                            Đỗ Trung Khang<br>\n"
                    + "                                            Đối diện trường THPT Hai Bà Trưng Thạch Thất, xã Tân Xã\n"
                    + "                                            <br>Huyện Thạch Thất, Hà Nội\n"
                    + "                                        </p>\n"
                    + "                                    </td>\n"
                    + "\n"
                    + "                                </tr>\n"
                    + "                            </tbody>\n"
                    + "                        </table>\n"
                    + "                        <table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\n"
                    + "                            <tbody>\n"
                    + "                                <tr>\n"
                    + "                                    <td style=\"padding-bottom:40px;width:50%\">\n"
                    + "                                        <h4\n"
                    + "                                            style=\"font-weight:500;margin:0;font-size:16px;color:#555;margin-bottom:5px\">\n"
                    + "                                            Phương\n"
                    + "                                            thức\n"
                    + "                                            vận\n"
                    + "                                            chuyển\n"
                    + "                                        </h4>\n"
                    + "\n"
                    + "                                        <p style=\"margin:0;color:#777;line-height:150%;font-size:16px\">\n"
                    + "                                            Ship\n"
                    + "                                            trong\n"
                    + "                                            48\n"
                    + "                                            tiếng\n"
                    + "                                        </p>\n"
                    + "\n"
                    + "                                    </td>\n"
                    + "                                    <td style=\"padding-bottom:40px;width:50%\">\n"
                    + "                                        <h4\n"
                    + "                                            style=\"font-weight:500;margin:0;font-size:16px;color:#555;margin-bottom:5px\">\n"
                    + "                                            Phương\n"
                    + "                                            thức\n"
                    + "                                            thanh\n"
                    + "                                            toán\n"
                    + "                                        </h4>\n"
                    + "                                        <p style=\"margin:0;color:#777;line-height:150%;font-size:16px\">\n"
                    + "                                            Thanh\n"
                    + "                                            toán\n"
                    + "                                            khi\n"
                    + "                                            giao\n"
                    + "                                            hàng\n"
                    + "                                            (COD)\n"
                    + "                                        </p>\n"
                    + "                                    </td>\n"
                    + "                                </tr>\n"
                    + "                            </tbody>\n"
                    + "                        </table>\n"
                    + "                    </td>\n"
                    + "                </tr>\n"
                    + "            </tbody>\n"
                    + "        </table>\n"
                    + "    </center>\n"
                    + "</td>\n"
                    + "</tr>\n"
                    + "</tbody>\n"
                    + "</table>\n"
                    + "<table style=\"border-spacing:0;border-collapse:collapse;width:100%;border-top:1px solid #e5e5e5\">\n"
                    + "    <tbody>\n"
                    + "        <tr>\n"
                    + "            <td style=\"padding:35px 0\">\n"
                    + "    <center>\n"
                    + "        <table\n"
                    + "            style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\n"
                    + "            <tbody>\n"
                    + "                <tr>\n"
                    + "                    <td style=\"\">\n"
                    + "                        <p style=\"margin:0;color:#999;line-height:150%;font-size:14px\">\n"
                    + "                            Nếu\n"
                    + "                            bạn\n"
                    + "                            có\n"
                    + "                            bất\n"
                    + "                            cứ\n"
                    + "                            câu\n"
                    + "                            hỏi\n"
                    + "                            nào,\n"
                    + "                            đừng\n"
                    + "                            ngần\n"
                    + "                            ngại\n"
                    + "                            liên\n"
                    + "                            lạc\n"
                    + "                            với\n"
                    + "                            chúng\n"
                    + "                            tôi\n"
                    + "                            tại\n"
                    + "                            <a href=\"mailto:thevapeclub@helix.com.vn\"\n"
                    + "                               style=\"font-size:14px;text-decoration:none;color:#1666a2\"\n"
                    + "                               target=\"_blank\">thevapeclub@helix.com.vn</a>\n"
                    + "                        </p>\n"
                    + "                    </td>\n"
                    + "                </tr>\n"
                    + "            </tbody>\n"
                    + "        </table>\n"
                    + "    </center>\n"
                    + "</td>\n"
                    + "</tr>\n"
                    + "</tbody>\n"
                    + "</table>\n"
                    + "<img src=\"https://ci4.googleusercontent.com/proxy/AkPYSwbfCTPpa9UY2iemTt-8uuNCxd9wMi-MxiDXCwCclRn4IrvavPQy53Rok8pDmYePvpYw7glbcjctupZqDJjD9WVBMoR1vQ=s0-d-e1-ft#http://hstatic.net/0/0/global/notifications/spacer.png\"\n"
                    + "     height=\"0\" style=\"min-width:600px;height:0\" class=\"CToWUd\">\n"
                    + "</body>\n"
                    + "</html>";
            String password = "khang0974421459";
            SendMailOK.send(smtpServer, to, from, password, subject, body);

        } catch (Exception ex) {
            System.out.println("Usage: " + ex.getMessage());
        }
        request.setAttribute("notification", "Hãy kiểm tra hòm thư của bạn");

        request.getRequestDispatcher("cartCompletion.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
