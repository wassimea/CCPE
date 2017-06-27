package project1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;


public class access_index extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException,
                                                           IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        Access access = new Access();
        String user = (String)session.getAttribute("user-email");
        String method = "access_index";
        
        if(user == null){
            out.println("Please login first!");
            request.getRequestDispatcher("login.html").include(request, response);
        }
        else if(!access.has_access(user, method)){
            out.println("You do not have permission to do that!");
        }
        else{
            Log log = new Log();
            log.log("Opened Access Index", request, session);
            request.getRequestDispatcher("access_index.jsp").include(request, response);
        }
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>access_index</title></head>");
        out.println("<body>");
        out.println("</body></html>");
        out.close();
    }
}
