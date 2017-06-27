
package project1;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
import java.sql.SQLException;
 
import java.sql.Statement;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
public class db_queries
{
  public List<String> getInstructors()
  {
    List<String> return_list = new ArrayList<String>();
    Connection con = connect_to_db();
    String sql = "SELECT INSTRUCTORS.ID,PEOPLE.FIRST_NAME,PEOPLE.LAST_NAME FROM PEOPLE,INSTRUCTORS WHERE PEOPLE.ID = INSTRUCTORS.PERSON_ID_FK ";
    try
    {
      Statement stat = con.createStatement();
      ResultSet rs = stat.executeQuery(sql);
      while(rs.next())
      {
        return_list.add("ID: " + rs.getObject(1).toString() + " - " + rs.getObject(2).toString() + " " + rs.getObject(3).toString());
      }
      return return_list;
    }
    catch(SQLException e)
    {
      System.out.println(e.toString());
      return null;
    }
  }
  
  public String getInstructorFromID(int id)
  {
    Connection con = connect_to_db();
    String sql = "SELECT INSTRUCTORS.ID,PEOPLE.FIRST_NAME,PEOPLE.LAST_NAME FROM PEOPLE,INSTRUCTORS WHERE PEOPLE.ID = INSTRUCTORS.PERSON_ID_FK AND INSTRUCTORS.ID = " + id;
    try
    {
      Statement stat = con.createStatement();
      ResultSet rs = stat.executeQuery(sql);
      rs.next();
      String return_string = "ID: " + rs.getObject(1).toString() + " - " + rs.getObject(2).toString() + " " + rs.getObject(3).toString();
      return return_string;
    }
    catch(SQLException e)
    {
      System.out.println(e.toString());
      return null;
    }
  }
  
  
  public List<String> getCourses()
  {
    List<String> return_list = new ArrayList<String>();
    Connection con = connect_to_db();
    String sql = "SELECT NAME FROM COURSES WHERE STATUS != 'Deleted'";
    try
    {
      Statement stat = con.createStatement();
      ResultSet rs = stat.executeQuery(sql);
      while(rs.next())
      {
        return_list.add(rs.getObject(1).toString());
      }
      return return_list;
    }
    catch(SQLException e)
    {
      System.out.println(e.toString());
      return null;
    }
  }
  
  public List<String> getCoursesWithCRN()
  {
    List<String> return_list = new ArrayList<String>();
    Connection con = connect_to_db();
    String sql = "SELECT CRN,NAME FROM COURSES WHERE STATUS != 'Deleted'";
    try
    {
      Statement stat = con.createStatement();
      ResultSet rs = stat.executeQuery(sql);
      while(rs.next())
      {
        return_list.add(rs.getObject(1).toString() + ": " + rs.getObject(2).toString());
      }
      return return_list;
    }
    catch(SQLException e)
    {
      System.out.println(e.toString());
      return null;
    }
  }
  
  public List<String> get_available_courses()
  {
    Calendar cal = Calendar.getInstance();
    Date today = new Date();
    String current_day = String.valueOf(cal.get(Calendar.DATE));
    String current_month = String.valueOf(today.getMonth() + 1);
    String current_year = String.valueOf(cal.get(Calendar.YEAR));
    String today_date_string = current_month + "/" + current_day + "/" + current_year;
    List<String> return_list = new ArrayList<String>();
    Connection con = connect_to_db();
    String sql = "SELECT NAME,REGISTRATION_DEADLINE FROM COURSES WHERE STATUS != 'Deleted'";
    try
    {
      Statement stat = con.createStatement();
      ResultSet rs = stat.executeQuery(sql);
      SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
      while(rs.next())
      {
        String deadline = rs.getObject(2).toString();
        try
        {
          Date deadline_date = formatter.parse(deadline);
          Date today_date = formatter.parse(today_date_string);
          if(today_date.before(deadline_date))
          {
            return_list.add(rs.getObject(1).toString());
          }
        }
        catch(Exception e)
        {
          System.out.println(e.toString());
        }
      }
      return return_list;
    }
    catch(SQLException e)
    {
      System.out.println(e.toString());
      return null;
    }
  }
  
  public List<String> getPaymentMethods()
  {
    List<String> return_list = new ArrayList<String>();
    Connection con = connect_to_db();
    String sql = "SELECT NAME FROM PAYMENT_METHODS";
    try
    {
      Statement stat = con.createStatement();
      ResultSet rs = stat.executeQuery(sql);
      while(rs.next())
      {
        return_list.add(rs.getObject(1).toString());
      }
      return return_list;
    }
    catch(SQLException e)
    {
      System.out.println(e.toString());
      return null;
    }
  }
  
  public String get_person_id(String username)
  {
    String return_id = "";
    Connection con = connect_to_db();
    String sql = "SELECT ID FROM PEOPLE WHERE USERNAME = '" + username + "'";
    try
    {
      Statement stat = con.createStatement();
      ResultSet rs = stat.executeQuery(sql);
      rs.next();
      return_id = rs.getObject(1).toString();
      return return_id;
    }
    catch(SQLException e)
    {
      System.out.println(e.toString());
      return null;
    }
  }
  
  public String get_student_id_from_person_id(String person_id)
  {
    String return_id = "";
    Connection con = connect_to_db();
    String sql = "SELECT ID FROM STUDENTS WHERE PERSON_ID_FK =" + person_id;
    try
    {
      Statement stat = con.createStatement();
      ResultSet rs = stat.executeQuery(sql);
      rs.next();
      return_id = rs.getObject(1).toString();
      return return_id;
    }
    catch(SQLException e)
    {
      System.out.println(e.toString());
      return null;
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
