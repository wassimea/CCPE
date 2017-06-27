package project1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

public class mailbox extends HttpServlet {
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
        if(session.getAttribute("user-email") == null){
            out.println("Please login first!");
            request.getRequestDispatcher("login.html").include(request, response);
        }
        else{
            
            Log log = new Log();
            log.log("Mailbox opened", request, session);
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Mailbox</title>");
            out.println("<link href='css/main.css' rel='stylesheet' type='text/css'>");
            out.println("<link href='css/mailbox.css' rel='stylesheet' type='text/css'>");
            out.println("<link href='css/button.css' rel='stylesheet' type='text/css'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='MainContainer'>");
            request.getRequestDispatcher("link.html").include(request,response);
            out.println("<h1>Mailbox</h1>");
            // out.println("<a href='new_message'>New Message</a>");
            out.println("<div class=\"Button Button--start\"><button onclick=\"window.location.href='new_message'\" id=\"ComposeButton\"><span>Compose</span></button></div>");
            out.println("<h2>Inbox:</h2>");
            
            MailboxManagement mailbox = new MailboxManagement();
            out.println("");
            mailbox.generate_messages(out, request, response, session);
            out.println("<script src=\"javascript/jquery.js\"></script>");
            out.println("<script src=\"javascript/jquery-1.12.4.js\"></script>");
            out.println("<script src=\"javascript/jquery-ui.js\"></script>");
            out.println("<script src='javascript/delete_message.js'></script>");
            out.println("</div>");
            out.println("</body></html>");
        }
        out.close();
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Mailbox</title></head>");
        out.println("<body>");        
        out.println("</body></html>");
        out.close();
    }
}
