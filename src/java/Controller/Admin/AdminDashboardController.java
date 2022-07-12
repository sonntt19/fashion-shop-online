/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import dal.CategoryDAO;
import dal.CustomerDAO;
import dal.DateDAO;
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
import model.Category;
import model.Chart;
import model.ChartStar;
import model.Date;

/**
 *
 * @author son22
 */
public class AdminDashboardController extends HttpServlet {

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
        ProductDAO pd = new ProductDAO();
        CustomerDAO cd = new CustomerDAO();
        FeedbackDAO fd = new FeedbackDAO();
        CategoryDAO ctd = new CategoryDAO();
        OrderDao od = new OrderDao();
        DateDAO dd = new DateDAO();

        Date date = dd.get7day();
        String salerId = "!= -1";
        String start = date.getStart().toString();
        String end = date.getEnd().toString();
        String start_raw = request.getParameter("start");
        String end_raw = request.getParameter("end");
        if (start_raw != null) {
            start = start_raw;
            end = end_raw;
        }

        int day = dd.CountDayByStartEnd(start, end);

        int totalProduct = pd.getTotalProduct(end);
        int totalProduct1 = pd.getTotalProduct(1, end);
        int totalProduct2 = pd.getTotalProduct(2, end);
        int totalProduct3 = pd.getTotalProduct(3, end);
        int totalProduct4 = pd.getTotalProduct(4, end);

        List<Category> listCategoryProduct = ctd.getAllCategory();
        
        // set chart revenue
        List<Chart> listChartRevenueArea = od.getChartRevenueArea(salerId, start, day);
        int maxListChartRevenueArea = -1;
        for (Chart o : listChartRevenueArea) {
            if (o.getValue() > maxListChartRevenueArea) {
                maxListChartRevenueArea = o.getValue();
            }
        }
        maxListChartRevenueArea = (maxListChartRevenueArea / 1000000 + 1) * 1000000;
        
        // set chart customer
        List<Chart> listChartCustomer = cd.getChartCustomerArea(start, day);
        int maxListChartCustomerArea = -1;
        for (Chart o : listChartCustomer) {
            if (o.getValue() > maxListChartCustomerArea) {
                maxListChartCustomerArea = o.getValue();
            }
        }
        maxListChartCustomerArea = (maxListChartCustomerArea / 10 + 1) * 10;
        
        // set chart avg rated
        List<ChartStar> listChartAvgStar = fd.getChartAvgStar(start, day);

        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("totalProduct1", totalProduct1);
        request.setAttribute("totalProduct2", totalProduct2);
        request.setAttribute("totalProduct3", totalProduct3);
        request.setAttribute("totalProduct4", totalProduct4);
        
        
        request.setAttribute("listCategoryProduct", listCategoryProduct);
        
        request.setAttribute("listChartRevenueArea", listChartRevenueArea);
        request.setAttribute("maxListChartRevenueArea", maxListChartRevenueArea);
        
        request.setAttribute("listChartCustomer", listChartCustomer);
        request.setAttribute("maxListChartCustomerArea", maxListChartCustomerArea);
        
        request.setAttribute("listChartAvgStar", listChartAvgStar);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
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
