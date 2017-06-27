package project1;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

public class add_access_group extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException,
                                                           IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>New Access Group</title>");
        out.println("<link type='text/css' rel='stylesheet' href='css/main.css'>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div id='MainContainer'>");
        request.getRequestDispatcher("link.html").include(request,response);
        out.println("<h1>Add a new Access Group:</h1>");
        out.println("<form action='add_access_group' method='POST'>");
        out.println("<input type='text' name='access_group_to_add'>");
        out.println("<input type='submit' value='Add'>");
        out.println("");
        out.println("");
        out.println("</form>");
        out.println("</div></body></html>");
        out.close();
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out;
        out = response.getWriter();
        Access access = new Access();
        
        String access_group = "";
        access_group = request.getParameter("access_group_to_add");
        
        HttpSession session = request.getSession(false);
        String user = (String)session.getAttribute("user-email");
        String method = "manage_access_group";
        
        if(user == null){
            out.println("Please login first!");
            request.getRequestDispatcher("login.html").include(request, response);
        }
        else if(!access.has_access(user, method)){
            out.println("You do not have permission to do that!");
        }
        else{
            Log log = new Log();
            log.log("Added access group "+access_group, request, session);
            access.add_access_group(access_group);
            out.println("<html>");
            out.println("<head><title>Done</title>");
            out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='MainContainer'>");
            request.getRequestDispatcher("link.html").include(request,response);
            out.println("<h1>"+ access_group +" has been added!</h1><br>");
            out.println("<a href='add_access_group'><input type='button' value='Add another group'></a>");
            out.println("<a href='manage_access_group'><input type='button' value='Set access group users'></a>");
            out.println("<a href='access_index.jsp'><input type='button' value='Access Home page'></a>");
            out.println("</div>");
            out.println("</body></html>");
            out.close();
        }
        
    }
}
