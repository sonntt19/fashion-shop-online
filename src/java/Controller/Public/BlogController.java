/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Public;

import dal.BlogDAO;
import dal.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Blog;
import model.CategoryBlog;

/**
 *
 * @author Veetu
 */
@WebServlet(name = "BlogController", urlPatterns = {"/blog"})
public class BlogController extends HttpServlet {

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
        HttpSession session = request.getSession();
        final int PAGE_SIZE = 6;  // Set total product each page
        BlogDAO bd = new BlogDAO();
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
        String value = "updated_date";
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
        int totalBlog = bd.getTotalBlog(searchKey, categoryId);
        int totalPage = totalBlog / PAGE_SIZE;
        if (totalBlog % PAGE_SIZE != 0) {
            totalPage += 1;
        }

        // Get list product, new, category, slider
        List<Blog> listBlog = bd.getBlogWithPaging(page, PAGE_SIZE, searchKey, categoryId, type, value);
        List<CategoryBlog> listCategoryBlog_BlogList = new CategoryDAO().getAllCategoryBlog();
        session.setAttribute("listCategoryBlog", listCategoryBlog_BlogList);
        Blog newBlog = bd.getBlogNew();
        session.setAttribute("newBlog", newBlog);
        
       

        // Set param request to jsp page
        session.setAttribute("listBlogList", listBlog);
        session.setAttribute("historyUrl", "blog");
        String history = "blog?page=" + page;
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
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        session.setAttribute("historyUrl", history);

        // Request


        request.getRequestDispatcher("BlogList.jsp").forward(request, response);
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
