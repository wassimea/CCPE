package project1;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

public class add_method extends HttpServlet {
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
        out.println("<head><title>New method</title>");
        out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
        out.println("</head>");
        out.println("<div id='MainContainer'>");
        request.getRequestDispatcher("link.html").include(request,response);
        out.println("<body>");
        out.println("<b>Add a new method:</b>");
        out.println("<form action='add_method' method='POST'>");
        out.println("<input type='text' name='method_to_add'>");
        out.println("<input type='submit' value='Add'>");
        out.println("</form>");
        out.println("</div>");
        out.println("</body></html>");
        out.close();
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        Access access = new Access();
        String method_to_add = "";
        
        HttpSession session = request.getSession(false);
        String user = (String)session.getAttribute("user-email");
        String method = "add_method";        
        if(user == null){
            out.println("Please login first!");
            request.getRequestDispatcher("login.html").include(request, response);
        }
        else if(!access.has_access(user, method)){
            out.println("You do not have permission to do that!");
        }
        else{
        
            method_to_add = request.getParameter("method_to_add");
            if(method_to_add != null){ 
                access.add_method(method_to_add);
                Log log = new Log();
                log.log("Added method "+method_to_add, request, session);
            }            
            out.println("<html>");
            out.println("<head><title>add_method</title>");
            out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='MainContainer'>");
            request.getRequestDispatcher("link.html").include(request,response);
            out.println("<b>Method "+ method_to_add +" have been added!</b><br>");
            out.println("<a href='add_method'><input type='button' value='input'></a>");
            out.println("<a href='manage_access_group'><input type='button' value='input'></a>");
            out.println("<a href='access_index.jsp'><input type='button' value='input'></a>");
            out.println("</div>");
            out.println("</body></html>");
            out.close();
        }
    }
}
