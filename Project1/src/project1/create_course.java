
package project1;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
import java.sql.Statement;
 
import javax.servlet.*;
import javax.servlet.http.*;
 
public class create_course
  extends HttpServlet
{
  private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
 
  public void init(ServletConfig config)
    throws ServletException
  {
    super.init(config);
  }
 
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
    throws ServletException, IOException
  {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    
    Access access = new Access();
    HttpSession session = request.getSession();
    String user = "";
    String method = "create_course";
    
    user = (String)session.getAttribute("user-email");
    
    if(user == null){
        out.println("Please login first");
        request.getRequestDispatcher("login.html").include(request, response);
    }
    else if(access.has_access(user, method)){
        
        out.println("<html>");
        out.println("<head><title>Servlet1</title></head>");
        out.println("<body>");
        String course_name = request.getParameter("course_name");
        String course_number_of_lectures = request.getParameter("course_number_of_lectures");
        String course_fees = request.getParameter("course_fees") + " " + request.getParameter("course_currency");
        String course_title = request.getParameter("course_title");
        String course_description = request.getParameter("course_description");
        String course_start_date = request.getParameter("course_start_date").toString();
        String course_maximum_capacity = request.getParameter("course_maximum_capacity");
        String course_registration_deadline = request.getParameter("course_registration_deadline").toString();
        String course_instructor_full_name = request.getParameter("course_instructor_full_name");
        String course_status = request.getParameter("course_status");
        String course_instructor_id = "";
        String course_crn = request.getParameter("course_crn");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ccpe","ccpe");   
            String[] parts = course_instructor_full_name.split("-");
            String instructor_id= parts[0];
            course_instructor_id = instructor_id.replace("ID: ","");
          System.out.println(course_start_date);
          course_start_date = course_start_date.replace('/', '-');
          
            String sql = "INSERT INTO COURSES (NAME,CRN,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,STATUS) VALUES('" + course_name + "','" + course_crn+ "','"+ course_number_of_lectures + "','" + course_fees + "','" + course_title + "','" + course_description + "','" + course_start_date + "','" + course_maximum_capacity + "','" + course_registration_deadline + "'," + course_instructor_id + ",'" + course_status + "')";
            out.println("<p>" + sql + "</p>");
            PreparedStatement  stat;
            String generatedColumns[] = { "ID" };
            stat = con.prepareStatement(sql, generatedColumns);
            stat.executeUpdate();
            ResultSet rs = stat.getGeneratedKeys();
            rs.next();
            response.sendRedirect("manage_lecture_times1.jsp?course_id=" + rs.getInt(1) + "&course_number_of_lectures=" + course_number_of_lectures + "&course_start_date=" + course_start_date);
          Log log = new Log();
          log.log("User" + user + " created  course " + course_name + " with CRN " + course_crn, request, session);
        }
        catch(Exception e){out.println(e.getMessage());}
        out.println("</body></html>");
        out.close();
    }
    else{
        out.println("You do not have permission.");
        out.println("<a href='home.jsp'>< Back to home</a>");
    }
  }
}
