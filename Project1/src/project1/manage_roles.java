package project1;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;


public class manage_roles extends HttpServlet {
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
        String method = "manage_roles";
        
        if(user == null){
            out.println("Please login first!");
            request.getRequestDispatcher("login.html").include(request, response);
        }
        else if (!access.has_access(user, method)){
            out.println("You do not have permission to do that!");
        }
        else{
            try{
                out = response.getWriter();
                out.println("<html>");
                out.println("<head><title>Manage Roles</title>");
                out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div id='MainContainer'>");
                request.getRequestDispatcher("link.html").include(request,response);
                out.println("<form action=\"manage_roles\" method=\"POST\">");
                out.println("<h2>Manage Roles</h2>");
                            
                Log log = new Log();
                log.log("Manage Roles opened", request, session);
                            
                // we have to get the list of access groups and
                // then list them in a <select> tag
                List<String> roles = new ArrayList<String>();
                roles = access.get_roles();        
                out.println("<select name='role_to_manage'>");
                for(Iterator<String> i = roles.iterator(); i.hasNext(); ){
                    String role = i.next();
                    out.println("<option value='"+ role +"'>"+ role +"</option>");
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
        String role_to_manage = request.getParameter("role_to_manage");
        
        // get all methods
        List<String> methods = new ArrayList<String>();
        methods = access.get_methods();
        out.println("<html>");
        out.println("<head><title>"+ role_to_manage +" access group</title>");
        out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div id='MainContainer'>");
        request.getRequestDispatcher("link.html").include(request,response);
        out.println("<h2>Role: "+ role_to_manage +"</h2>");
        out.println("<b>All users:</b><br>");
        out.println("<form action='save_role' method='GET'>");
        out.println("");
        access.generate_users(out, response, request, role_to_manage); // generate method list with properly checked methods
        out.println("<input type='hidden' name='role_to_manage' value='"+ role_to_manage +"'>");
        out.println("<input type='submit' onclick=\"\" value='Save'>");
        out.println("");
        out.println("");
        out.println("</form></div></body></html>");
        
        out.close();
    }
}
