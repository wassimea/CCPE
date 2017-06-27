package project1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

public class add_user extends HttpServlet {
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
        out.println("<head><title>add_user</title></head>");
        out.println("<body>");
        out.println("</body></html>");
        out.close();
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        String first_name = "";
        String last_name = "";
        String user = "";
        String password = "";
        String phone = "";
        String date_of_birth = "";
        String email = "";
        String user_type = "";
        
        first_name = request.getParameter("first_name");
        last_name = request.getParameter("last_name");
        user = request.getParameter("username");
        password = request.getParameter("password");
        phone = request.getParameter("phone");
        date_of_birth = request.getParameter("date_of_birth");
        email = request.getParameter("email");
        user_type = request.getParameter("user_type");
        
        Access access = new Access();
        
        if(access.user_exists(user, "username")){
            out.println("Username already exists!");
            request.getRequestDispatcher("new_user.jsp").include(request, response);
        }
        else if(access.user_exists(email, "email")){
            out.println("Email already exists!");
            request.getRequestDispatcher("new_user.jsp").include(request, response);
        }
        else{
            String password_hash = "-1";
            password_hash = access.password_hash(password);
            
            access.add_user(first_name, last_name, phone, email, user, password_hash, date_of_birth, user_type);
            
            HttpSession session = request.getSession(false);
            Log log = new Log();
            log.log("New user added ("+user+")", request, session);
            
            out.println("<html>");
            out.println("<head><title>User added</title>");
            out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
            out.println("</head>");            
            out.println("<body>");
            out.println("<div id='MainContainer'>");
            request.getRequestDispatcher("link.html").include(request,response);
            out.println("<User successfully added>");
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>First Name: </th>");
            out.println("<td>"+ first_name +"</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<th>Last Name: </th>");
            out.println("<td>"+ last_name +"</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<th>Username: </th>");
            out.println("<td>"+ user +"</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<th>Password Hash: </th>");
            out.println("<td>"+ password_hash +"</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<th>Date Of Birth: </th>");
            out.println("<td>"+ date_of_birth +"</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<th>E-mail:</th>");
            out.println("<td>"+ email +"</td>");
            out.println("</tr>");
            out.println("<tr>");
            out.println("<th>Phone: </th>");
            out.println("<td>"+ phone +"</td>");
            out.println("</tr>");
            out.println("");
            out.println("</table><br>");
            out.println("<a href='login.html'>Login</a>");
            out.println("</div>");
            out.println("</body></html>");
            out.close();
        }
    }
}
