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
import model.ChartStar;
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

        // set parameter
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

        // set chart blog 
        List<Chart> listChartBlogBar = bd.getChartBlogBar(start, day);
        List<Chart> listChartBlogArea = bd.getChartBlogArea(start, day);
        int maxListChartBlogBar = -1;
        for (Chart o : listChartBlogBar) {
            if (o.getValue() > maxListChartBlogBar) {
                maxListChartBlogBar = o.getValue();
            }
        }

        maxListChartBlogBar = (maxListChartBlogBar / 10 + 1) * 10;
        int maxListChartBlogArea = -1;
        for (Chart o : listChartBlogArea) {
            if (o.getValue() > maxListChartBlogArea) {
                maxListChartBlogArea = o.getValue();
            }
        }
        maxListChartBlogArea = (maxListChartBlogArea / 10 + 1) * 10;

        // set chart product
        List<Chart> listChartProductBar = pd.getChartProductBar(start, day);
        List<Chart> listChartProductArea = pd.getChartProductArea(start, day);
        int maxListChartProductBar = -1;
        for (Chart o : listChartProductBar) {
            if (o.getValue() > maxListChartProductBar) {
                maxListChartProductBar = o.getValue();
            }
        }

        maxListChartProductBar = (maxListChartProductBar / 10 + 1) * 10;
        int maxListChartProductArea = -1;
        for (Chart o : listChartProductArea) {
            if (o.getValue() > maxListChartProductArea) {
                maxListChartProductArea = o.getValue();
            }
        }
        maxListChartProductArea = (maxListChartProductArea / 10 + 1) * 10;

        // set chart customer
        List<Chart> listChartCustomerBar = cd.getChartCustomerBar(start, day);
        List<Chart> listChartCustomerArea = cd.getChartCustomerArea(start, day);
        int maxListChartCustomerBar = -1;
        for (Chart o : listChartCustomerBar) {
            if (o.getValue() > maxListChartCustomerBar) {
                maxListChartCustomerBar = o.getValue();
            }
        }

        maxListChartCustomerBar = (maxListChartCustomerBar / 10 + 1) * 10;
        int maxListChartCustomerArea = -1;
        for (Chart o : listChartCustomerArea) {
            if (o.getValue() > maxListChartCustomerArea) {
                maxListChartCustomerArea = o.getValue();
            }
        }
        maxListChartCustomerArea = (maxListChartCustomerArea / 10 + 1) * 10;
        
        // set chart feedback
        List<Chart> listChartFeedbackBar = fd.getChartFeedbackBar(start, day);
        List<Chart> listChartFeedbackArea = fd.getChartFeedbackArea(start, day);
        int maxListChartFeedbackBar = -1;
        for (Chart o : listChartFeedbackBar) {
            if (o.getValue() > maxListChartFeedbackBar) {
                maxListChartFeedbackBar = o.getValue();
            }
        }

        maxListChartFeedbackBar = (maxListChartFeedbackBar / 10 + 1) * 10;
        int maxListChartFeedbackArea = -1;
        for (Chart o : listChartFeedbackArea) {
            if (o.getValue() > maxListChartFeedbackArea) {
                maxListChartFeedbackArea = o.getValue();
            }
        }
        maxListChartFeedbackArea = (maxListChartFeedbackArea / 10 + 1) * 10;


        // set parameter blog chart request to jsp
        request.setAttribute("listChartBlogBar", listChartBlogBar);
        request.setAttribute("listChartBlogArea", listChartBlogArea);
        request.setAttribute("maxListChartBlogBar", maxListChartBlogBar);
        request.setAttribute("maxListChartBlogArea", maxListChartBlogArea);

        // set parameter product chart request to jsp
        request.setAttribute("listChartProductBar", listChartProductBar);
        request.setAttribute("listChartProductArea", listChartProductArea);
        request.setAttribute("maxListChartProductBar", maxListChartProductBar);
        request.setAttribute("maxListChartProductArea", maxListChartProductArea);

        // set parameter customer chart request to jsp
        request.setAttribute("listChartCustomerBar", listChartCustomerBar);
        request.setAttribute("listChartCustomerArea", listChartCustomerArea);
        request.setAttribute("maxListChartCustomerBar", maxListChartCustomerBar);
        request.setAttribute("maxListChartCustomerArea", maxListChartCustomerArea);
        
        // set parameter feedback chart request to jsp
        request.setAttribute("listChartFeedbackBar", listChartFeedbackBar);
        request.setAttribute("listChartFeedbackArea", listChartFeedbackArea);
        request.setAttribute("maxListChartFeedbackBar", maxListChartFeedbackBar);
        request.setAttribute("maxListChartFeedbackArea", maxListChartFeedbackArea);

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
