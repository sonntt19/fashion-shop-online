/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Public;

import dal.CartDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Product;
import model.User;

/**
 *
 * @author dongh
 */
public class AddToCartController extends HttpServlet {

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
        String productId_raw = request.getParameter("productId");
        int product_id = Integer.parseInt(productId_raw);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("us");
        int user_id = u.getUser_Id();   
        CartDAO cd = new CartDAO();
        Cart c = cd.checkCart(user_id, product_id);
        int quantity = 1;
        String quantity_raw = request.getParameter("quantity");
        if(quantity_raw != null){
            quantity = Integer.parseInt(quantity_raw);
        }
        int total_cost;
        if (c == null) {
            ProductDAO pd = new ProductDAO();
            Product p = pd.getProductById(product_id);
            int price = p.getOriginal_price();
            if (p.getSale_price() != 0) {
                price = p.getSale_price();
            }
            total_cost = quantity * price;
            cd.addToCart(product_id, p.getName(), price, quantity, total_cost, user_id);
        } else {
                quantity += c.getQuantity();
            total_cost = quantity * c.getProduct_price();
            cd.addQuantityCartProduct(product_id, quantity, total_cost, user_id);
        }
        String historyUrl = (String) session.getAttribute("historyUrl");
        response.sendRedirect(historyUrl);

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
