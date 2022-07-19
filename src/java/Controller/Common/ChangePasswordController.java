/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Common;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author GanKPoet
 */
public class ChangePasswordController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePasswordController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePasswordController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        int userId = Integer.parseInt(request.getParameter("user_Id"));
        String old_pass = request.getParameter("old_pass");
        String new_pass1 = request.getParameter("new_pass1");
        String new_pass2 = request.getParameter("new_pass2");

        User user = new UserDAO().getUser(userId, old_pass);

        if (user == null) {
            request.setAttribute("notification", "Mật khẩu cũ sai");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (!new_pass1.equals(new_pass2)) {
            request.setAttribute("notification", "Mật khẩu mới hai lần nhập không giống nhau");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (new_pass1.length() <= 8 || new_pass1.length() >32) {
            request.setAttribute("notification", "Mật khẩu của bạn cần từ 8 đến 31 kí tự");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (new_pass1.equals(old_pass)) {
            request.setAttribute("notification", "Mật khẩu cũ và mới của bạn giống nhau");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            new UserDAO().changePassword(userId, new_pass1);
            request.setAttribute("notification", "Thay đổi mật khẩu thành công");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
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
