/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Public;

import dal.FeedbackDAO;
import dal.OrderDao;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Feedback;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author dongh
 */
public class ListDetailController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            /* TODO output your page here. You may use following sample code. */
            int productId = Integer.parseInt(request.getParameter("productId"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            User u = (User) session.getAttribute("us");

            Product product = new ProductDAO().getProductById(productId);
            FeedbackDAO fed = new FeedbackDAO();
            OrderDao od = new OrderDao();
            Order accept = null;
            int Total = fed.getTotalFeedback(productId);
            if (u != null) {
                accept = od.checkProductOrderByUser(u.getUser_Id(), productId);
            }

            List<Feedback> listfeedbackbyproduct = fed.getAllFeedbackByProductId(productId);
            
            List<Product> listProduct = new ProductDAO().getProductTop4Category(productId, categoryId);
            double avg = new ProductDAO().getRatedProduct(productId);

            request.setAttribute("listfeedbackbyproduct", listfeedbackbyproduct);
            request.setAttribute("total", Total);
            request.setAttribute("listProduct", listProduct);
            request.setAttribute("product", product);
            request.setAttribute("avg", avg);
            request.setAttribute("accept", accept);
            session.setAttribute("historyUrl", "list-detail?productId=" + productId + "&categoryId=" + categoryId);
            request.getRequestDispatcher("list-detail.jsp").forward(request, response);
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
