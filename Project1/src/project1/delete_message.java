package project1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;


public class delete_message extends HttpServlet {
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
        out.println("<head><title>delete_message</title></head>");
        out.println("<body>");
        out.println("</body></html>");
        out.close();
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        
        String message_id = "";
        message_id = request.getParameter("message_id");
        
        HttpSession session = request.getSession();
        Access access = new Access();
        String user = (String)session.getAttribute("user-email");
        
        if(user == null){
            out.println("Please login first!");
            request.getRequestDispatcher("login.html").include(request, response);
        }
        else{
            MailboxManagement mailboxmgmt = new MailboxManagement();
            mailboxmgmt.delete_message(message_id);
            Log log = new Log();
            log.log("Message deleted", request, session);
        }
        
        out.close();
    }
}
