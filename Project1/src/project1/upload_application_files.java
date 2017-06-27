
package project1;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.*;
import javax.servlet.http.*;
 
public class upload_application_files
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
    out.println("<head><title>upload_application_files</title></head>");
    out.println("<body>");
    out.println("<p>The servlet has received a GET. This is the reply.</p>");
    out.println("</body></html>");
    out.close();
  }
 
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
    throws ServletException, IOException
  {
    String file = request.getParameter("upload");
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    out.println("<html>");
    out.println("<head><title>upload_application_files</title></head>");
    out.println("<body>");
    out.println("<p>The servlet has received a POST. This is the reply.</p>");
    out.println("<p>File:" + file + "</p>");
    out.println("</body></html>");
    out.close();
  }
}
