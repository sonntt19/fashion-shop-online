/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Common;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Veetu
 */
@WebFilter(filterName = "MKTAuthorization", urlPatterns = {"/add-slider","/marketingproductlist", "/update_product", "/add_product", "/update-post", "/add-customer","/add-post", "/customer-detail", "/customer-list", "/load-customer", "/post-details", "/posts-list","/change-status","/change-status-customer","/status-feedback","/change-status-product","/feedback-detail","/feedback-list","/mkt-dashboard","/product-detail","/slider-detail","/slider-list","/update-customer","/update-false-slider","/update-slider","/update-true-slider"
})
public class MKTAuthorization implements Filter {
    

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("us");

        if (user != null && user.getRole_Id().equals("2")) {
            chain.doFilter(request, response);
            return;
        }
        req.setAttribute("notification", "Rất tiêc bạn không có quyền truy cập đường dẫn này!");
        request.getRequestDispatcher("index.jsp").forward(request, response);
       
        
    }

    /**
     * Return the filter configuration object for this filter.
     */

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {        
    }

    /**
     * Init method for this filter
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {        
        
    }

    /**
     * Return a String representation of this object.
     */
    
    
}

