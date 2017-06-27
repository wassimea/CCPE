package project1;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

public class delete_application
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
    try
    {
      List<String> list_application_statuses = new ArrayList<String>();
      list_application_statuses.add("");
      list_application_statuses.add("Paid");
      list_application_statuses.add("Done");
      list_application_statuses.add("Submitted");
      
      String application_id = request.getParameter("application_id");
      String course_id = request.getParameter("course_id");
      
      String sql = "DELETE FROM APPLICATIONS WHERE ID = " + application_id;
      
      Connection con = connect_to_db();
      Statement stat = con.createStatement();
      stat.executeUpdate(sql);
      
      response.setContentType(CONTENT_TYPE);
      PrintWriter out = response.getWriter();
      
      String sql_get_applications = "SELECT APPLICATIONS.ID,STUDENTS.ID,PEOPLE.FIRST_NAME,PEOPLE.LAST_NAME,PEOPLE.USERNAME,APPLICATIONS.SUBMISSION_DATE,PAYMENT_METHODS.NAME,APPLICATIONS.STATUS FROM STUDENTS,PEOPLE,APPLICATIONS,PAYMENT_METHODS WHERE APPLICATIONS.STUDENT_ID_FK = STUDENTS.ID AND STUDENTS.PERSON_ID_FK = PEOPLE.ID AND APPLICATIONS.PAYMENT_METHOD_ID_FK = PAYMENT_METHODS.ID AND APPLICATIONS.COURSE_ID_FK = " + course_id;
      Statement stat2 = con.createStatement();
      ResultSet rs2 = stat2.executeQuery(sql_get_applications);
      
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
        out.println("<td><button type='button' id='delete' onclick='delete_applications("+rs2.getObject(1).toString()+"," + course_id + ")' >Delete</button>");
        out.println("</tr>");
      }
      out.println("</table>");
      out.println("</div>");
      out.close();
    }
    catch (Exception e)
    {
      System.out.println(e.toString());
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
