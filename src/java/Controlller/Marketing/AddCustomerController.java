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
import model.Customer;
import model.User;

/**
 *
 * @author Veetu
 */
@WebServlet(name = "AddCustomerController", urlPatterns = {"/add-customer"})
public class AddCustomerController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String customer_name = request.getParameter("fullName");
        String customer_email = request.getParameter("email");
        String customer_mobile = request.getParameter("mobile");
        String updated_date = request.getParameter("updated_date");

        CustomerDAO dao = new CustomerDAO();
        Customer u = dao.checkCustomerExist(customer_email);
        if (!customer_mobile.matches("[0-9]*")) {
            request.setAttribute("notification", "Số điện thoại không hợp lệ");
            request.getRequestDispatcher("customer-list").forward(request, response);
        } else if (u == null) {
            //dang ky thanh cong
            dao.addCustomer(customer_name, customer_email, customer_mobile, updated_date);
            request.setAttribute("notification", "Thêm khách hàng thành công");
            request.getRequestDispatcher("customer-list").forward(request, response);
        } else {
            request.setAttribute("notification", "Email đã tồn tại");
            request.getRequestDispatcher("customer-list").forward(request, response);
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
