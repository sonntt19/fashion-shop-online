/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlller.Marketing;

import dal.BlogDAO;
import dal.CustomerDAO;
import dal.DateDAO;
import dal.FeedbackDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Chart;
import model.Date;

/**
 *
 * @author son22
 */
public class MKTDashboardController extends HttpServlet {

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
        BlogDAO bd = new BlogDAO();
        ProductDAO pd = new ProductDAO();
        CustomerDAO cd = new CustomerDAO();
        FeedbackDAO fd = new FeedbackDAO();
        DateDAO dd = new DateDAO();

        Date date = dd.get7day();
        String start = date.getStart().toString();
        String end = date.getEnd().toString();
        String start_raw = request.getParameter("start");
        String end_raw = request.getParameter("end");
        if (start_raw != null) {
            start = start_raw;
            end = end_raw;
        }

        int day = dd.CountDayByStartEnd(start, end);

        List<Chart> listChartBlog = bd.getChartBlog(start, day);
        List<Chart> listChartProduct = pd.getChartProduct(start, day);
        List<Chart> listChartCustomer = cd.getChartCustomer(start, day);
        List<Chart> listChartFeedback = fd.getChartFeedback(start, day);

        request.setAttribute("listChartBlog", listChartBlog);
        request.setAttribute("listChartProduct", listChartProduct);
        request.setAttribute("listChartCustomer", listChartCustomer);
        request.setAttribute("listChartFeedback", listChartFeedback);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.getRequestDispatcher("MKTDashboard.jsp").forward(request, response);
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
