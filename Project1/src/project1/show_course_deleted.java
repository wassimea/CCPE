package project1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

public class show_course_deleted
  extends HttpServlet
{
  private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

  public void init(ServletConfig config)
    throws ServletException
  {
    super.init(config);
  }

  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
    throws ServletException, IOException
  {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    out.println("<html>");
    out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
    out.println("<head><title>show_course_deleted</title></head>");
    request.getRequestDispatcher("link.html").include(request,response);
    out.println("<body>");
    out.println("<h2>Course susccessfully deleted.</h2>");
    out.println("</body></html>");
    out.close();
  }
}
