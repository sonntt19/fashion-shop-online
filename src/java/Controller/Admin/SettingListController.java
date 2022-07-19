/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Admin;

import dal.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Setting;
import model.TypeSetting;

/**
 *
 * @author son22
 */
public class SettingListController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            final int PAGE_SIZE = 6;  // Set total product each page
            SettingDAO sd = new SettingDAO();
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
            String typeId = "!= -1";
            String strTypeId = request.getParameter("typeId");
            if (strTypeId != null) {
                typeId = "= " + strTypeId;
            }

            // Set sort 
            String value = "type";
            String type = "";
            String strType = request.getParameter("type");
            String strValue = request.getParameter("value");
            if (strType != null) {
                type = strType;
            }
            if (strValue != null) {
                value = strValue;
            }

            // Set status
            String status = "!= -1";
            String strStatus = request.getParameter("status");
            if (strStatus != null) {
                status = "= " + strStatus;
            }


            // Set total page 
            int totalSetting = sd.getTotalSetting(searchKey, typeId, status);
            int totalPage = totalSetting / PAGE_SIZE;
            if (totalSetting % PAGE_SIZE != 0) {
                totalPage += 1;
            }

            // Get list product, new, category, slider
            List<Setting> listSetting = sd.getSettingWithPaging(page, PAGE_SIZE, searchKey, typeId, type, value, status);
            List<TypeSetting> listTypeSetting = sd.getAllSettingType();
            session.setAttribute("listTypeSetting", listTypeSetting);

            // Set param request to jsp page
            String history = "setting-list?page=" + page;
            if (strSearchKey != null) {
                history = history + "&key=" + strSearchKey;
                request.setAttribute("historyKey", "&key=" + strSearchKey);
                request.setAttribute("key", strSearchKey);
            }
            if (strTypeId != null) {
                history = history + "&typeId=" + strTypeId;
                request.setAttribute("historyTypeId", "&typeId=" + strTypeId);
                request.setAttribute("typeId", strTypeId);
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
            if (strStatus != null) {
                history = history + "&status=" + strStatus;
                request.setAttribute("historyStatus", "&status=" + strStatus);
                request.setAttribute("status", strStatus);
            }
            
            request.setAttribute("listSetting", listSetting);
            request.setAttribute("page", page);
            request.setAttribute("totalPage", totalPage);
            session.setAttribute("historyUrl", history);

            // Request
            request.getRequestDispatcher("AdminSettingList.jsp").forward(request, response);
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
