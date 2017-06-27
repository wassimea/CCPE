package project1;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

public class save_access_group extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException,
                                                           IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>save_access_group</title></head>");
        out.println("<body>");
        out.println("</body></html>");
        out.close();
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        // prepare variables and objects
        PrintWriter out = response.getWriter();
        Access access = new Access();
        String access_group_to_manage = "";
        List<String> methods_to_add = new ArrayList<String>();
        
        HttpSession session = request.getSession(false);
        String user = (String)session.getAttribute("user-email");
        String method = "manage_access_group";
        
        if (!access.has_access(user, method)){
            out.println("You do not have permission to do that!");
        }
        else{
            
            String[] methods_temp = request.getParameterValues("methods");
            if(methods_temp != null){        
                methods_to_add = Arrays.asList(methods_temp);
                
                access_group_to_manage = request.getParameter("access_group_to_manage");
                
                access.remove_all_access_group_methods(access_group_to_manage);
                access.add_methods_to_access_group(methods_to_add, access_group_to_manage);
            }
            else{
                access_group_to_manage = request.getParameter("access_group_to_manage");
                access.remove_all_access_group_methods(access_group_to_manage);   
            }
            // output
            out.println("<html>");
            out.println("<head><title>Saved</title>");
            out.println("<link type='text/css' rel='stylesheet' href='css/main.css'>");
            out.println("</head>");
            out.println("<body>");            
            out.println("<div id='MainContainer'>");
            request.getRequestDispatcher("link.html").include(request,response);
            out.println("<h1>Settings for "+ access_group_to_manage +" have been saved!</h1><br>");
            out.println("<a href='manage_access_group'><input type='button' value='Manage another group' name='manage'></a>");
            out.println("<a href='access_index.jsp'><input type='button' value='Access Home Page' name='home'></a>");
            out.println("</div>");                
            out.println("</body></html>");
            out.close();
            
            Log log = new Log();
            log.log("Access group "+ access_group_to_manage +" saved", request, session);
            
        }
    }
}
