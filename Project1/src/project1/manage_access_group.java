package project1;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

public class manage_access_group extends HttpServlet {
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
        
        HttpSession session = request.getSession();
        String user = (String)session.getAttribute("user-email");
        String method = "manage_access_group";
        
        if (!access.has_access(user, method)){
            out.println("You do not have permission to do that!");
        }
        else{
            try{
                out = response.getWriter();
                out.println("<html>");
                out.println("<head><title>Manage Access Groups</title>");
                out.println("<link type='text/css' rel='stylesheet' href='css/main.css'>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div id='MainContainer'>");
                request.getRequestDispatcher("link.html").include(request,response);                
                out.println("<form action=\"manage_access_group\" method=\"POST\">");
                out.println("<h1>Manage Access Groups</h1>");
                            
                Log log = new Log();
                log.log("Manage Access Groups opened", request, session);
                            
                // we have to get the list of access groups and
                // then list them in a <select> tag
                List<String> access_groups = new ArrayList<String>();
                access_groups = access.get_access_groups();        
                out.println("<select name='access_group_to_manage'>");
                for(Iterator<String> i = access_groups.iterator(); i.hasNext(); ){
                    String access_group = i.next();
                    out.println("<option value='"+ access_group +"'>"+ access_group +"</option>");
                }
                out.println("</select>");
                out.println("<input type='submit' value='Next'>");
                out.println("</form>");
                out.println("</div>");
                out.println("</body></html>");
                out.close();
            }
            catch(Exception e){
                System.out.println(e);   
            }
        }
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        
        // first we prepare our variables
        Access access = new Access();
        
        // get access group name to manage
        String access_group_to_manage = request.getParameter("access_group_to_manage");
        
        // get all methods
        List<String> methods = new ArrayList<String>();
        methods = access.get_methods();
        out.println("<html>");
        out.println("<head><title>"+ access_group_to_manage +" access group</title>");
        out.println("<link type='text/css' rel='stylesheet' href='css/main.css'>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div id='MainContainer'>");
        request.getRequestDispatcher("link.html").include(request,response);
        out.println("<h1>Access Group: "+ access_group_to_manage +"</h1>");
        out.println("<b>All methods:</b><br>");
        out.println("<form action='save_access_group' method='POST'>");
        out.println("");
        access.generate_methods_list(out, response, request, access_group_to_manage); // generate method list with properly checked methods
        out.println("<br><input type='button' value='Delete access group'>");
        out.println("<input type='hidden' name='access_group_to_manage' value='"+ access_group_to_manage +"'>");
        out.println("<a href='add_method'><input type='button' value='Add method'></a>");
        out.println("<input type='submit' value='Save'>");
        out.println("");
        out.println("");
        out.println("</form></div></body></html>");
        
        out.close();
        //Access access = new Access();
        //access.generate_management_page(out, response, request);
    }
}
