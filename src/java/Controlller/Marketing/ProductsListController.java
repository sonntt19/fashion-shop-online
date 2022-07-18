/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlller.Marketing;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Category;
import model.Product;

/**
 *
 * @author GanKPoet
 */
public class ProductsListController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            final int PAGE_SIZE = 8;  // Set total product each page
            HttpSession session = request.getSession();
            CategoryDAO c = new CategoryDAO();
            ProductDAO p = new ProductDAO();
            
            int Total = p.getTotalProduct();
            int PublishedProduct = p.getTotalPublishedProduct();
            String status_raw = request.getParameter("status");
            String status = "!= -1";
            if (status_raw != null) {
                status = "= " + status_raw;
            }
           
            // Set page
            int page = 1;
            String strPage = request.getParameter("page");
            if (strPage != null) {
                page = Integer.parseInt(strPage);
            }

            // Set key for search 
            String searchKey = "";
            String strSearchKey = request.getParameter("key");
            if (strSearchKey != null) {
                searchKey = strSearchKey;
            }

            // Set category
            String categoryId = "!= -1";
            String strCategoryId = request.getParameter("categoryId");
            if (strCategoryId != null) {
                categoryId = "= " + strCategoryId;
            }

            // Set sort 
            String value = "update_date";
            String type = "";
            String strType = request.getParameter("type");
            String strValue = request.getParameter("value");
            if (strType != null) {
                type = strType;
            }
            if (strValue != null) {
                value = strValue;
            }
            
            // Set total page 
            int totalProduct = p.getTotalProduct(searchKey, categoryId, status);
            int totalPage = totalProduct / PAGE_SIZE;
            if (totalProduct % PAGE_SIZE != 0) {
                totalPage += 1;
            }

            // Get list product, category 
            List<Product> listProduct = p.getProductWithPaging(page, PAGE_SIZE, searchKey, categoryId, type, value, status);
            List<Category> l = c.getAllCategory();
            
            // Set param request to jsp page
            session.setAttribute("listCategories", l);
            session.setAttribute("listProduct", listProduct);
            String history = "marketingproductlist?page=" + page;
            if (strSearchKey != null) {
                history = history + "&key=" + strSearchKey;
                request.setAttribute("historyKey", "&key=" + strSearchKey);
                request.setAttribute("key", strSearchKey);
            }
            if (strCategoryId != null) {
                history = history + "&categoryId=" + strCategoryId;
                request.setAttribute("historyCategoryId", "&categoryId=" + strCategoryId);
                request.setAttribute("categoryId", strCategoryId);
            }
            if (strValue != null) {
                 history = history + "&value=" + strValue;
                request.setAttribute("historyValue", "&value=" + strValue);
                request.setAttribute("value", strValue);
            }
            if (strType != null) {
                 history = history + "&type=" + strType;
                request.setAttribute("historyType", "&type=" + strType);
                request.setAttribute("type", strType);
            }    
            if (status_raw != null) {
                 history = history + "&status=" + status_raw;
                request.setAttribute("historyStatus", "&status=" + status_raw);
                request.setAttribute("status", status_raw);
            }
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
            session.setAttribute("historyUrl", history);
            
            // Request
            request.setAttribute("total", Total);
            request.setAttribute("PublishedProduct", PublishedProduct);
            request.getRequestDispatcher("marketing_productlist.jsp").forward(request, response);
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
