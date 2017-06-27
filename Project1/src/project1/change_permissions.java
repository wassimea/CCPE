package project1;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

public class change_permissions extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException,
                                                           IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        Access access = new Access();
        access.generate_management_page(out, response, request);
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        String username = "";
        String access_group = "";
        PrintWriter out = response.getWriter();
        Access access = new Access();
        
        username = request.getParameter("username");
        access_group = request.getParameter("access_group");
        
        HttpSession session = request.getSession(false);
        String user = (String)session.getAttribute("user-email");
        String method = "manage_user_access";
        
        if(user == null){
            out.println("Please login first!");
            request.getRequestDispatcher("login.html").include(request, response);
        }
        else if(!access.has_access(user, method)){
            out.println("You do not have permission to do that!");
        }
        else {
            
            // System.out.println("user: "+ username +" access_group="+ access_group +"");
            access.set_access_group(username, access_group);
            
            Log log = new Log();
            log.log("Added "+ username +" to "+access_group, request, session);
            
            response.sendRedirect(request.getRequestURI());
        }
    }
}
