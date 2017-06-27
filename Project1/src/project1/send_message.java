package project1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

public class send_message extends HttpServlet {
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
        out.println("<head><title>send_message</title></head>");
        out.println("<body>");
        out.println("</body></html>");
        out.close();
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        
        String sender, receivers, subject, message = "";
        sender = request.getParameter("sender");
        receivers = request.getParameter("receivers");
        subject = request.getParameter("subject");
        message = request.getParameter("message");
        
        Messages messages = new Messages();
        messages.send_message(sender, receivers, message, subject);
                
        out.println("<html>");
        out.println("<head><title>send_message</title>");
        out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div id='MainContainer'>");
        request.getRequestDispatcher("link.html").include(request,response);
        out.println("<h1>Message sent successfully</h1>");
        out.println("<h3>Recepients:</h3>");
        out.println("<ul>");
        String[] receiver_list = receivers.split(";");
        for(int i = 0 ; i < receiver_list.length ; i++){
            out.println("<li>"+ receiver_list[i] +"</li>");
            
            // logging here because there can be multiple receivers
            HttpSession session = request.getSession(false);
            Log log = new Log();
            log.log("Message sent to "+receiver_list[i], request, session);
        }
        out.println("</ul>");
        out.println("<br><a href='mailbox'>< Back to Mailbox</a>");
        out.println("</div>");
        out.println("</body></html>");
        out.close();               
    }
}
