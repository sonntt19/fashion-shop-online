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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Veetu
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

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
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String gender = request.getParameter("gender");

        if (!password.equals(repassword)) {
            request.setAttribute("notification", "Nhập lại mật khẩu không giống nhau");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            UserDAO dao = new UserDAO();
            User u = dao.checkUserExist(email);
            if (!mobile.matches("[0-9]*")) {
                request.setAttribute("notification", "Your Mobile Invalid");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if (password.length() <= 8 || password.length() > 32) {
                request.setAttribute("notification", "Your New Password less than 8 character or long than 32 characters");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if (u == null) {
                //dang ky thanh cong
                dao.register(fullName, password, gender, email, mobile);
                request.setAttribute("notification", "Đăng kí thành công");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("notification", "Email đã tồn tại");
                request.getRequestDispatcher("index.jsp").forward(request, response);
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
