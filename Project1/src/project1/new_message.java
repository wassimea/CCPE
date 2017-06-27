package project1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

public class new_message extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException,
                                                           IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        String sender = "";
        HttpSession session = request.getSession(false);
        if(session == null){
            out.println("Please login first!");
            request.getRequestDispatcher("login.html").include(request, response);
        }
        else{
            sender = (String)session.getAttribute("user-email");            
            out.println("<html>");
            out.println("<head><title>new_message</title>");
            out.println("<link href='css/main.css' rel='stylesheet' type='text/css'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='MainContainer'>");
            request.getRequestDispatcher("link.html").include(request,response);
            out.println("<h1>New message</h1>");
            out.println("<form action='send_message' method='POST'>");
            out.println("<input type='hidden' value='"+ sender +"' name='sender'>");
            out.println("To:<input type='text' name='receivers'></br>");
            out.println("Subject:<input type='text' name='subject'></br>");
            out.println("Message:<br><textarea maxlength='299' name='message' rows='6' cols='80'></textarea><br>");
            out.println("<input type='submit' value='Send'>");
            out.println("</form>");
            out.println("</div>");
            out.println("</body></html>");
            
            Log log = new Log();
            log.log("Opened a new message", request, session);
            
        }
        out.close();
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>new_message</title></head>");
        out.println("<body>");
        out.println("</body></html>");
        out.close();
    }
}
