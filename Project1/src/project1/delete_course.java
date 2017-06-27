package project1;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Statement;

import javax.servlet.*;
import javax.servlet.http.*;

public class delete_course
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
    
    String course_id = request.getParameter("course_id");
    System.out.println("it's: " + course_id);
    Connection con = connect_to_db();
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    try
    {
      String sql_delete_course = "UPDATE COURSES SET STATUS = 'Deleted' WHERE ID = " + course_id;
      String sql_delete_course_times = "DELETE FROM WEEK_TIMES WHERE COURSE_ID_FK = " + course_id;
      Statement stat1 = con.createStatement();
      Statement stat2 = con.createStatement();
      stat1.executeUpdate(sql_delete_course);
      stat2.executeUpdate(sql_delete_course_times);    
      response.sendRedirect("show_course_deleted");
      out.close();
    }
    catch(Exception e)
    {
      out.println(e.toString());
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
