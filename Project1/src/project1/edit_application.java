
package project1;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
 
import javax.servlet.*;
import javax.servlet.http.*;
 
public class edit_application
  extends HttpServlet
{
  private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
  String course_id = "";
  String user = "";
  String course_name;
 
  public void init(ServletConfig config)
    throws ServletException
  {
    super.init(config);
  }
 
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
    throws ServletException, IOException
  {
    List<String> list_application_statuses = new ArrayList<String>();
    response.setContentType(CONTENT_TYPE);
    course_name = request.getParameter("course_name");
    String[] parts = course_name.split(":");
    String course_crn = parts[0];
    PrintWriter out = response.getWriter();
   
      Access access = new Access();
      HttpSession session = request.getSession();
      
      String method = "manage_applications";
      
      user = (String)session.getAttribute("user-email");
      
      if(user == null){
          out.println("Please login first");
          request.getRequestDispatcher("login.html").include(request, response);
      }
      else if(access.has_access(user, method)){
        try
        {
          Connection con = connect_to_db();
         
          String sql_get_course_id = "SELECT ID FROM COURSES WHERE CRN = '" +  course_crn + "'";
          Statement stat1 = con.createStatement();
          ResultSet rs1 = stat1.executeQuery(sql_get_course_id);
          rs1.next();
          course_id = rs1.getObject(1).toString();
         
          String sql_get_application_statuses = "SELECT NAME FROM APPLICATION_STATUSES";
          Statement stat3 = con.createStatement();
          ResultSet rs3 = stat3.executeQuery(sql_get_application_statuses);
          while(rs3.next())
          {
            list_application_statuses.add(rs3.getObject(1).toString());
          }
         
          
          String sql_get_applications = "SELECT APPLICATIONS.ID,STUDENTS.ID,PEOPLE.FIRST_NAME,PEOPLE.LAST_NAME,PEOPLE.USERNAME,APPLICATIONS.SUBMISSION_DATE,PAYMENT_METHODS.NAME,APPLICATIONS.STATUS FROM STUDENTS,PEOPLE,APPLICATIONS,PAYMENT_METHODS WHERE APPLICATIONS.STUDENT_ID_FK = STUDENTS.ID AND STUDENTS.PERSON_ID_FK = PEOPLE.ID AND APPLICATIONS.PAYMENT_METHOD_ID_FK = PAYMENT_METHODS.ID AND APPLICATIONS.COURSE_ID_FK = " + course_id;
          Statement stat2 = con.createStatement();
          ResultSet rs2 = stat2.executeQuery(sql_get_applications);
         
          out.println("<!DOCTYPE html>");
          out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
          
          out.println("<head><title>edit_application</title>");
          
          out.println("<script src='javascript/edit_application.js'></script>");
          out.println("<script src=\"javascript/jquery-1.12.4.js\"></script>\n" + "<script src=\"javascript/jquery-ui.js\"></script>");
          out.println("</head>");
          out.println("<body>");
          
          out.println("<div id = 'MainContainer'>");
          request.getRequestDispatcher("link.html").include(request,response);
          
          out.println("<input type='radio' name = 'show_radio' id='show_all_checkbox' onclick='show_all_students(" + course_id + ")' >");
          out.println("Show all applications");
          
          out.println("<input type='radio' name = 'show_radio' id='show_registered_checkbox' onclick='show_registered_students(" + course_id + ")' >");
          out.println("Show complete applications only");
                 
          out.println("<input type='radio' name = 'show_radio' id='show_submitted_checkbox' onclick='show_submitted_students(" + course_id + ")' >");
          out.println("Show submitted applications only");
          
          out.println("<input type='radio' name = 'show_radio' id='show_paid_checkbox' onclick='show_paid_students(" + course_id + ")' >");
          out.println("Show paid applications only");   
          
          out.println("<form action = 'edit_application' method = 'POST'>");
          out.println("<br>");
          out.println("<div id='ResultTable' >");
          out.println("<table border='1'>");
          out.println("<th>Student ID</th>");
          out.println("<th>First Name</th>");
          out.println("<th>Last Name</th>");
          out.println("<th>Username</th>");
          out.println("<th>Submission Date</th>");
          out.println("<th>Payment Method</th>");
          out.println("<th>Application Status</th>");
          out.println("<th>Delete</th>");
          while(rs2.next())
          {
            if(!rs2.getObject(8).toString().contains("Deleted"))
            {
              out.println("<tr>");
              out.println("<td>"+rs2.getObject(2).toString() + "</td>");
              out.println("<td>"+rs2.getObject(3).toString() + "</td>");
              out.println("<td>"+rs2.getObject(4).toString() + "</td>");
              out.println("<td>"+rs2.getObject(5).toString() + "</td>");
              out.println("<td>"+rs2.getObject(6).toString() + "</td>");
              out.println("<td>"+rs2.getObject(7).toString() + "</td>");
              out.println("<td>");
              out.println("<select name = 'select_;" + rs2.getObject(1).toString() + "' value = '" + rs2.getObject(8).toString() + "'>");
             
                for(int k = 0 ; k < list_application_statuses.size() ; k++)
                { 
                  String option = "<option value = '" + list_application_statuses.get(k) + "'";//>" + list_application_statuses.get(k) + "</option>";
                  if(list_application_statuses.get(k).contains(rs2.getObject(8).toString()))
                  {
                    option = option + " selected>";
                  }
                  else
                  {
                    option = option + ">";
                  }
                  out.println(option + list_application_statuses.get(k) + "</option>");
                }
              out.println("</select></td>");  
              out.println("<td><div class='Button Button--start'><button type='button' id='delete' onclick='delete_applications("+rs2.getObject(1).toString()+"," + course_id + ")' ><span>Delete</span></button></div>");
              out.println("</tr>");
            }
          }
          out.println("</table>");
          out.println("</div>");
          out.println("<br>");
          out.println("<div class='Button Button--start'>");
          out.println("<button type='submit'><span>Update</span></button>");
          out.println("</div>");
          out.println("</form>");
          
          String sql_get_all_count = "SELECT COUNT(*) FROM APPLICATIONS WHERE STATUS != 'Deleted' AND COURSE_ID_FK = "+ course_id;
          Statement state_all = con.createStatement();
          ResultSet result_all = state_all.executeQuery(sql_get_all_count);
          result_all.next();
          int all_count = result_all.getInt(1);
          out.println("<p>Total number of applications: " + all_count + "</p>");
          
          String sql_get_submitted_count = "SELECT COUNT(*) FROM APPLICATIONS WHERE STATUS = 'Submitted' AND COURSE_ID_FK = "+ course_id;
          Statement state_submitted = con.createStatement();
          ResultSet result_submitted = state_submitted.executeQuery(sql_get_submitted_count);
          result_submitted.next();
          int submitted_count = result_submitted.getInt(1);
          out.println("<p>Total number of submitted applications: " + submitted_count + "</p>");
          
          String sql_get_paid_count = "SELECT COUNT(*) FROM APPLICATIONS WHERE STATUS = 'Paid' AND COURSE_ID_FK = "+ course_id;
          Statement state_paid = con.createStatement();
          ResultSet result_paid = state_paid.executeQuery(sql_get_paid_count);
          result_paid.next();
          int paid_count = result_paid.getInt(1);
          out.println("<p>Total number of paid applications: " + paid_count + "</p>");
          
          String sql_get_completed_count = "SELECT COUNT(*) FROM APPLICATIONS WHERE STATUS = 'Done' AND COURSE_ID_FK = "+ course_id;
          Statement state_completed = con.createStatement();
          ResultSet result_completed = state_completed.executeQuery(sql_get_completed_count);
          result_completed.next();
          int completed_count = result_completed.getInt(1);
          out.println("<p>Total number of complete applications: " + completed_count + "</p>");
          
          out.println("<br>");
          
          String sql_get_course_capacity = "SELECT MAX_CAPACITY FROM COURSES WHERE ID = "+ course_id;
          Statement state_capacity = con.createStatement();
          ResultSet result_capacity = state_capacity.executeQuery(sql_get_course_capacity);
          result_capacity.next();
          out.println("<p>Course maximum capacity: " + result_capacity.getObject(1).toString());
          
          out.println("</div>");
          out.println("</body></html>");
          out.close();
        }
        catch(Exception e)
        {
          System.out.println(e.toString());
        }
      }
      else{
          out.println("You do not have permission.");
          out.println("<a href='home.jsp'>< Back to home</a>");
      }
  }
 
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
    throws ServletException, IOException
  {
    List<String> list_course_application_ids = new ArrayList<String>();
    response.setContentType(CONTENT_TYPE);
    Connection con = connect_to_db();
    PrintWriter out = response.getWriter();
    
    Access access = new Access();
    HttpSession session = request.getSession();
    String user = "";
    String method = "manage_applications";
    
    user = (String)session.getAttribute("user-email");
    
    if(user == null){
      out.println("Please login first");
      request.getRequestDispatcher("login.html").include(request, response);
    }
    else if(access.has_access(user, method)){ 
        out.println("<html>");
        out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
        out.println("<head><title>edit_application</title></head>");
        out.println("<body>");
        out.println("<div id = 'MainContainer'>");
        request.getRequestDispatcher("link.html").include(request,response);
        try
        {
          
          String sql_get_application_course_ids = "SELECT ID FROM APPLICATIONS WHERE COURSE_ID_FK = " + course_id;
          Statement stat1 = con.createStatement();
          ResultSet rs1 = stat1.executeQuery(sql_get_application_course_ids);
          while(rs1.next())
          {
            list_course_application_ids.add(rs1.getObject(1).toString());
          }
          for(int i = 0 ; i< list_course_application_ids.size() ; i++)
          { 
            String status = request.getParameter("select_;" + list_course_application_ids.get(i));
            if(status != null)
            {
              String sql_update = "UPDATE APPLICATIONS SET STATUS = '" + status + "' WHERE ID = " + list_course_application_ids.get(i);
              Statement stat2 = con.createStatement();
              stat2.executeUpdate(sql_update);
            }
          }
          
                                                                    
        }
        catch(Exception e)
        {
          System.out.println(e.toString());
        }
        out.println("<p>Applications successfully updated.</div></body></html>");
        out.close();
        Log log = new Log();
        log.log("User " + user + " updated application statuses of course " + course_name, request, session);
    }
    else{
        out.println("You do not have permission.");
        out.println("<a href='home.jsp'>< Back to home</a>");
    }
    
  }
 
  public Connection connect_to_db()
  {
    try
    {
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ccpe","ccpe");
      return con;
    }
    catch(SQLException e)
    {
      System.out.println(e.toString());
      return null;
    }
  }
}
