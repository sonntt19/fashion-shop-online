/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Public;

import dal.CartDAO;
import dal.OrderDao;
import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import model.User;

/**
 *
 * @author dongh
 */
public class AddToOrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods
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
            /* TODO output your page here. You may use following sample code. */
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String note = request.getParameter("note");
            int sum = Integer.parseInt(request.getParameter("sum"));

            CartDAO c = new CartDAO();
            OrderDao od = new OrderDao();
            OrderDetailDAO odd = new OrderDetailDAO();
            
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("us");
            int user_id = u.getUser_Id();
            int order_id = od.createNewOrder(sum, fullname, phone, address, user_id, note);
            List<Cart> listCart = c.getAllCartByUserId(user_id);
            odd.addCartToOrder(listCart, order_id);
            
            request.setAttribute("fullname", fullname);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            
            request.getRequestDispatcher("checkout").forward(request, response);
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
