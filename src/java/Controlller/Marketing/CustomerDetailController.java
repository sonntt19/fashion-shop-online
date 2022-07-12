/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlller.Marketing;

import dal.CustomerDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.User;

/**
 *
 * @author Veetu
 */
@WebServlet(name = "CustomerDetailController", urlPatterns = {"/customer-detail"})
public class CustomerDetailController extends HttpServlet {

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
        String cid = request.getParameter("customer_id");
        String cname = request.getParameter("customer_name");
        String cemail = request.getParameter("customer_email");
        String cmobile = request.getParameter("customer_mobile");
        String cdate = request.getParameter("updated_date");
        int userId = Integer.parseInt(cid);

        CustomerDAO dao = new CustomerDAO();
        if (!cmobile.matches("[0-9]*")) {
            request.setAttribute("notification", "Số điện thoại không hợp lệ");
            request.getRequestDispatcher("customer-list").forward(request, response);
        } else {
            //sua thanh cong
            dao.editCustomerProfile(cname, cemail, cmobile, userId, cdate);
            request.setAttribute("notification", "Chỉnh sửa thành công");
            request.getRequestDispatcher("customer-list").forward(request, response);
        }

        Customer u = dao.getCustomerById(cid);
        HttpSession session = request.getSession();
        session.setAttribute("customerDetail", u);
        response.sendRedirect("customer-list");
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
        processRequest(request, response);
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
