
package project1;
 
import java.io.IOException;
 
import java.io.PrintWriter;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
import java.text.DateFormat;
import java.text.SimpleDateFormat;
 
import java.util.ArrayList;
import java.util.Arrays;
 
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
 
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
 
public class manage_lecture_times extends HttpServlet
{
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
    String monday_from_hour;
    String monday_from_minute;
    String tuesday_from_hour;
    String tuesday_from_minute;
    String wednesday_from_hour;
    String wednesday_from_minute;
    String thursday_from_hour;
    String thursday_from_minute;
    String friday_from_hour;
    String friday_from_minute;
    String saturday_from_hour;
    String saturday_from_minute;
    String sunday_from_hour;
    String sunday_from_minute;
    String monday_to_hour;
    String monday_to_minute;
    String tuesday_to_hour;
    String tuesday_to_minute;
    String wednesday_to_hour;
    String wednesday_to_minute;
    String thursday_to_hour;
    String thursday_to_minute;
    String friday_to_hour;
    String friday_to_minute;
    String saturday_to_hour ;
    String saturday_to_minute;
    String sunday_to_hour;
    String sunday_to_minute;
    List<String> list_lecture_times_from = new ArrayList<String>();
    List<String> list_lecture_times_to = new ArrayList<String>();
    List<String> list_lecture_dates = new ArrayList<String>();
    List<String> list_lecture_dates_respective_days = new ArrayList<String>();
    String user = "";
    String course_id;
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
    }
 
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException,
                                                           IOException
    {
        try
        {
            HttpSession session = request.getSession();
              user = (String)session.getAttribute("user-email");
            List<String> list_lecture_days = new ArrayList<String>();
            list_lecture_dates = new ArrayList<String>();
            monday_from_hour = request.getParameter("monday_from_hour");
            monday_from_minute = request.getParameter("monday_from_minute");
            tuesday_from_hour = request.getParameter("tuesday_from_hour");
            tuesday_from_minute = request.getParameter("tuesday_from_minute");
            wednesday_from_hour = request.getParameter("wednesday_from_hour");
            wednesday_from_minute = request.getParameter("wednesday_from_minute");
            thursday_from_hour = request.getParameter("thursday_from_hour");
            thursday_from_minute = request.getParameter("thursday_from_minute");
            friday_from_hour = request.getParameter("friday_from_hour");
            friday_from_minute = request.getParameter("friday_from_minute");
            saturday_from_hour = request.getParameter("saturday_from_hour");
            saturday_from_minute = request.getParameter("saturday_from_minute");
            sunday_from_hour = request.getParameter("sunday_from_hour");
            sunday_from_minute = request.getParameter("sunday_from_minute");
            monday_to_hour = request.getParameter("monday_to_hour");
            monday_to_minute = request.getParameter("monday_to_minute");
            tuesday_to_hour = request.getParameter("tuesday_to_hour");
            tuesday_to_minute = request.getParameter("tuesday_to_minute");
            wednesday_to_hour = request.getParameter("wednesday_to_hour");
            wednesday_to_minute = request.getParameter("wednesday_to_minute");
            thursday_to_hour = request.getParameter("thursday_to_hour");
            thursday_to_minute = request.getParameter("thursday_to_minute");
            friday_to_hour = request.getParameter("friday_to_hour");
            friday_to_minute = request.getParameter("friday_to_minute");
            saturday_to_hour = request.getParameter("saturday_to_hour");
            saturday_to_minute = request.getParameter("saturday_to_minute");
            sunday_to_hour = request.getParameter("sunday_to_hour");
            sunday_to_minute = request.getParameter("sunday_to_minute");
            
            String monday_checkbox = request.getParameter("monday_checkbox");
            String tuesday_checkbox = request.getParameter("tuesday_checkbox");
            String wednesday_checkbox = request.getParameter("wednesday_checkbox");
            String thursday_checkbox = request.getParameter("thursday_checkbox");
            String friday_checkbox = request.getParameter("friday_checkbox");
            String saturday_checkbox = request.getParameter("saturday_checkbox");
            String sunday_checkbox = request.getParameter("sunday_checkbox");
           
            course_id = request.getParameter("course_id");
            String course_number_of_lectures = request.getParameter("course_number_of_lectures");
            String course_start_date = request.getParameter("course_start_date");
            response.setContentType(CONTENT_TYPE);
           
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
            out.println("<head><title>manage_lecture_times</title>");
            request.getRequestDispatcher("link.html").include(request,response);
            out.println("</head>");
            out.println("<body>");
            out.println("<div id = 'MainContainer'>");
          
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ccpe","ccpe");                    
 
            if (monday_checkbox != null && monday_checkbox.contains("on"))
            {
                  list_lecture_days.add("1");
            }
            if(tuesday_checkbox != null && tuesday_checkbox.contains("on"))
            {
                    list_lecture_days.add("2");
            }
            if(wednesday_checkbox != null && wednesday_checkbox.contains("on")) {
                    list_lecture_days.add("3");
            }
            if(thursday_checkbox != null && thursday_checkbox.contains("on"))
            {
                    list_lecture_days.add("4");
            }
            if(friday_checkbox != null && friday_checkbox.contains("on"))
            {
                    list_lecture_days.add("5");
            }
            if(saturday_checkbox != null && saturday_checkbox.contains("on"))
            {
                    list_lecture_days.add("6");
            }
            if(sunday_checkbox != null && sunday_checkbox.contains("on"))
            {
                    list_lecture_days.add("0");
            }
               
            SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
            Date startDate = formatter.parse(course_start_date);
            Date endDate = formatter.parse("30-12-2999");
            Calendar start = Calendar.getInstance();
            start.setTime(startDate);
            Calendar end = Calendar.getInstance();
            end.setTime(endDate);
            int count = 0;
            Calendar c = Calendar.getInstance();
         
            for (Date date = start.getTime(); start.before(end) && count < Integer.parseInt(course_number_of_lectures); start.add(Calendar.DATE, 1), date = start.getTime())
            {
                if(list_lecture_days.contains(String.valueOf(date.getDay())))
                {
                    c.setTime(date);
                    String date_to_add = String.valueOf(c.get(Calendar.DATE)) + "-" + String.valueOf(date.getMonth() + 1) + "-" + String.valueOf(c.get(Calendar.YEAR));
                    create_times_list(date.getDay());
                    list_lecture_dates.add(date_to_add);
                    list_lecture_dates_respective_days.add(String.valueOf(date.getDay()));
                    count++;
                }
             }
            add_to_db(list_lecture_dates,list_lecture_times_from,list_lecture_times_to,list_lecture_dates_respective_days);
            out.println("<p>Course successfully created.</div></body></html>");
            out.close();
          
          String sql_get_course_name = "SELECT NAME FROM COURSES WHERE COURSE_ID = " + course_id;
          Statement stateit = con.createStatement();
          ResultSet res = stateit.executeQuery(sql_get_course_name);
          res.next();
              Log log = new Log();
              log.log("User " + user + " set the lecture times of course " + res.getObject(1).toString() , request, session);
          
            }
        
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    void create_times_list(int day_index)
    {
        if(day_index == 0)
        {
          list_lecture_times_from.add(sunday_from_hour+ ":" + sunday_from_minute);
          list_lecture_times_to.add(sunday_to_hour+ ":" + sunday_to_minute);
        }
        else if(day_index == 1)
        {
          list_lecture_times_from.add(monday_from_hour+ ":" + monday_from_minute);
          list_lecture_times_to.add(monday_to_hour+ ":" + monday_to_minute);
        }
      else if(day_index == 2)
      {
        list_lecture_times_from.add(tuesday_from_hour+ ":" + tuesday_from_minute);
        list_lecture_times_to.add(tuesday_to_hour+ ":" + tuesday_to_minute);
      }
      else if(day_index == 3)
      {
        list_lecture_times_from.add(wednesday_from_hour+ ":" + wednesday_from_minute);
        list_lecture_times_to.add(wednesday_to_hour+ ":" + wednesday_to_minute);
      }
      else if(day_index == 4)
      {
        list_lecture_times_from.add(thursday_from_hour+ ":" + thursday_from_minute);
        list_lecture_times_to.add(thursday_to_hour+ ":" + thursday_to_minute);
      }
      else if(day_index == 5)
      {
        list_lecture_times_from.add(friday_from_hour+ ":" + friday_from_minute);
        list_lecture_times_to.add(friday_to_hour+ ":" + friday_to_minute);
      }
      else if(day_index == 6)
      {
        list_lecture_times_from.add(saturday_from_hour+ ":" + saturday_from_minute);
        list_lecture_times_to.add(saturday_to_hour+ ":" + saturday_to_minute);
      }
    }
   
    public void add_to_db(List<String> list_lecture_dates,List<String> list_lecture_times_from, List<String> list_lecture_times_to, List<String> list_lecture_dates_respective_days )
    {
      Connection con = connect_to_db();
      for(int i = 0 ; i < list_lecture_dates.size() ; i++)
      {
        String sql = "INSERT INTO WEEK_TIMES (LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) VALUES('" + list_lecture_dates.get(i) + "','" + list_lecture_times_from.get(i) + "','" + list_lecture_times_to.get(i) + "'," + course_id + ",'" +list_lecture_dates_respective_days.get(i) +"')";
        try
        {
          Statement stat = con.createStatement();
          stat.executeUpdate(sql);
        }
        catch(SQLException e)
        {
          System.out.println(e.toString());
        }
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
