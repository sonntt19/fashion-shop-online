/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlller.Marketing;

import dal.ProductDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import model.Product;

/**
 *
 * @author son22
 */
public class AddProductController extends HttpServlet {

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
        ProductDAO p = new ProductDAO();
        HttpSession session = request.getSession();

        String name = request.getParameter("name");
        String desciption = request.getParameter("desciption");
        String brief_infor = request.getParameter("brief_infor");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int original_price = Integer.parseInt(request.getParameter("original_price"));
        int sale_price = Integer.parseInt(request.getParameter("sale_price"));
        String imageUrl = "images/product/" + request.getParameter("image");

        int categoryId = Integer.parseInt(request.getParameter("categoryId"));

        int new_id = p.addNewProduct(name, desciption, brief_infor, quantity, status, original_price, sale_price, categoryId);
        p.AddImageProduct(new_id, imageUrl);
        response.sendRedirect("marketingproductlist");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url_thumbnail = "images/product/";

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

// Configure a repository (to ensure a secure temp location is used)
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(repository);

// Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");

        try {
            // Parse the request
            List<FileItem> items = upload.parseRequest(request);
            // Process the uploaded items
            Iterator<FileItem> iter = items.iterator();
            HashMap<String, String> fields = new HashMap<>();
            while (iter.hasNext()) {
                FileItem item = iter.next();

                if (item.isFormField()) {
                    fields.put(item.getFieldName(), item.getString("UTF-8"));

                } else {
                    String filename = item.getName();
                    if (filename == null || filename.equals("")) {
                        break;
                    } else {
                        Path path = Paths.get(filename);
                        String storePath = servletContext.getRealPath("../../web/images/product");
                        File uploadFile = new File(storePath + "/" + path.getFileName());
                        item.write(uploadFile);
                        url_thumbnail += filename;
                    }

                }
            }
            
            ProductDAO p = new ProductDAO();
            String name = fields.get("name");
            String desciption = fields.get("desciption");
            String brief_infor = fields.get("brief_infor");
            boolean status = Boolean.parseBoolean(fields.get("status"));
            int quantity = Integer.parseInt(fields.get("quantity"));
            int original_price = Integer.parseInt(fields.get("original_price"));
            int sale_price = Integer.parseInt(fields.get("sale_price"));

            int categoryId = Integer.parseInt(fields.get("categoryId"));

            int new_id = p.addNewProduct(name, desciption, brief_infor, quantity, status, original_price, sale_price, categoryId);
            p.AddImageProduct(new_id, url_thumbnail);
            response.sendRedirect("marketingproductlist");
        } catch (FileUploadException ex) {

        } catch (Exception ex) {

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
