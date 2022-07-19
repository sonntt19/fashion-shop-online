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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.UpdateCustomer;
import model.User;

/**
 *
 * @author Veetu
 */
@WebServlet(name = "UpdateCustomerController", urlPatterns = {"/update-customer"})
public class UpdateCustomerController extends HttpServlet {

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
        int cid = Integer.parseInt(request.getParameter("customer_id"));
        String cname = request.getParameter("customer_name");
        String cemail = request.getParameter("customer_email");
        String cmobile = request.getParameter("customer_mobile");

        CustomerDAO cus = new CustomerDAO();
        UserDAO ud = new UserDAO();

        //sua thanh cong
        Customer c = cus.checkCustomer(cemail, cmobile, cid);
        if (c != null) {
            request.setAttribute("notification", "Khách hàng đã tồn tại");
            request.getRequestDispatcher("customer-detail?cid=" + cid).forward(request, response);
        } else {
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("us");
            cus.updateCustomer(cname, cemail, cmobile, cid);
            cus.updateHistory(cid, cemail, cname, cmobile, u.getUser_Id());

            response.sendRedirect("customer-detail?cid=" + cid);
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
