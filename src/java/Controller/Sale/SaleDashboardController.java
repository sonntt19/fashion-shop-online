/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Sale;

import dal.DateDAO;
import dal.OrderDao;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Chart;
import model.Date;
import model.User;

/**
 *
 * @author son22
 */
public class SaleDashboardController extends HttpServlet {

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
        OrderDao od = new OrderDao();
        DateDAO dd = new DateDAO();
        UserDAO ud = new UserDAO();

        Date date = dd.get7day();
        String start = date.getStart().toString();
        String end = date.getEnd().toString();
        String salerId = "!= -1";
        String start_raw = request.getParameter("start");
        String end_raw = request.getParameter("end");
        String salerId_raw = request.getParameter("salerId");
        if (start_raw != null) {
            start = start_raw;
            end = end_raw;
        }
        if(salerId_raw != null){
            salerId = "= "+salerId_raw;
        }

        int day = dd.CountDayByStartEnd(start, end);
        
        int totalOrder = od.getTotalOrder(salerId,start, end);
        int totalOrderSubmited = od.getTotalOrderSubmited(salerId,start, end);
        int totalOrderSuccesful = od.getTotalOrderSuccesful(salerId,start, end);
        int totalOrderCanceled = od.getTotalOrderCanceled(salerId,start, end);

        List<Chart> listChartOrder= od.getChartOrder(salerId,start,end, day);
        List<User> listSaler = ud.getAllSaler();

        request.setAttribute("listSaler", listSaler);
        request.setAttribute("listChartOrder", listChartOrder);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("total", totalOrder);
        request.setAttribute("totalSubmit", totalOrderSubmited);
        request.setAttribute("totalSucces", totalOrderSuccesful);
        request.setAttribute("totalCancel", totalOrderCanceled);
        request.setAttribute("salerId", salerId_raw);
        
        request.getRequestDispatcher("SaleDashboard.jsp").forward(request, response);
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
