package project1;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;


public class show_course
  extends HttpServlet
{
  private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
  //params for updating the WEEK_TIMES table
  
  String monday_start_hour;
  String monday_start_minute;
  String monday_end_hour;
  String monday_end_minute;
  
  String tuesday_start_hour;
  String tuesday_start_minute;
  String tuesday_end_hour;
  String tuesday_end_minute;
  
  String wednesday_start_hour;
  String wednesday_start_minute;
  String wednesday_end_hour;
  String wednesday_end_minute;
  
  String thursday_start_hour;
  String thursday_start_minute;
  String thursday_end_hour;
  String thursday_end_minute;
  
  String friday_start_hour;
  String friday_start_minute;
  String friday_end_hour;
  String friday_end_minute;
  
  String saturday_start_hour;
  String saturday_start_minute;
  String saturday_end_hour;
  String saturday_end_minute;
  
  String sunday_start_hour;
  String sunday_start_minute;
  String sunday_end_hour;
  String sunday_end_minute;
  
  String course_id = "";
  List<String> list_lecture_times_start = new ArrayList<String>();
  List<String> list_lecture_times_end = new ArrayList<String>();
  List<String> list_lecture_dates = new ArrayList<String>();
  List<String> list_lecture_dates_respective_days = new ArrayList<String>();
  String selected_course = "";
  HttpSession session;
  String user = "";

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
    Access access = new Access();
    session = request.getSession();
    String method = "create_course";
    
    user = (String)session.getAttribute("user-email");
    
    if(user == null){
        out.println("Please login first");
        request.getRequestDispatcher("login.html").include(request, response);
    }
    else if(access.has_access(user, method))
    {
      Connection con = connect_to_db();
      project1.db_queries query_object = new project1.db_queries();
        selected_course = request.getParameter("course");
        String course_instructor = "";
        String[] parts = selected_course.split(":");
        String course_crn = parts[0];
        try
        {
          List<String> list_all_instructors = new ArrayList<String>();
          list_all_instructors = query_object.getInstructors();
          String sql_main = "SELECT NAME,CRN,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,STATUS FROM COURSES WHERE STATUS != 'Deleted' AND CRN = " + course_crn;
          Statement stat1 = con.createStatement();
          ResultSet rs1 = stat1.executeQuery(sql_main);
          rs1.next();
          
          String sql_get_course_id_from_crn = "SELECT ID FROM COURSES WHERE CRN = " + course_crn;
          Statement stat0 = con.createStatement();
          ResultSet rs0 = stat0.executeQuery(sql_get_course_id_from_crn);
          rs0.next();
          course_id = rs0.getObject(1).toString();
          course_instructor = query_object.getInstructorFromID(rs1.getInt(10));
          
          out.println("<html>");
          out.println("<head><link rel='stylesheet' href='css/jquery-ui.css'>");
          out.println("<link rel='stylesheet' href='css/style.css'>");
          out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
          out.println("<script src='javascript/jquery-1.12.4.js'></script>");
          out.println("<script src='javascript/jquery-ui.js'></script>");
          out.println("<script src='javascript/delete_course.js'></script>");
          out.println("<script>\n" + 
          "    $( function() {\n" + 
          "      $( \".datepicker\" ).datepicker({\n" + 
          "        changeMonth: true,\n" + 
          "        changeYear: true\n" + 
          "      });\n" + 
          "    } );\n" + 
          "  </script>");
          out.println("<link type'text/css' rel='stylesheet' href='css/show_course.css'>");
          out.println("<title>Manage Course</title></head>");
          out.println("<body>");
          out.println("<div id='MainContainer'>");
          request.getRequestDispatcher("link.html").include(request,response);
          out.println("<div id='emmeye'>");
          out.println("<form action = 'show_course' method = 'POST'");
          
          out.println("<label>Course Name:</label><br>");
          out.println("<input type='text' size='25' name='course_name' value = '" + rs1.getObject(1).toString() + "'><br>");
          out.println("<input type='hidden' name= 'course_id' value = '" + course_id + "'><br>");
          
          out.println("<label>Course CRN:</label><br>");
          out.println("<input type='text' size='25' name='course_crn' value = '" + rs1.getObject(2).toString() + "'><br>");
          
          out.println("<label>Course number of lectures:</label><br>");
          out.println("<input type='text' size='25' name='course_number_of_lectures' value = '" + rs1.getObject(3).toString() + "'><br>");
          
          String[] parts2 = rs1.getObject(4).toString().split(" ");
          String fees_value = parts2[0];
          String fees_currency = parts2[1];
          out.println("<label>Course Fees:</label><br>");
          out.println("<input type='text' size='25' name='course_fees' value = '" + fees_value +"'>");
          out.println("<select name='course_currency' onmousedown='if(this.options.length>8){this.size=0;}'  onchange='this.size=0;' onblur='this.size=0;' size = '0'>");
          String usd_option = "<option value = 'USD'";
          String ll_option = "<option value = 'L.L'";
          if(fees_currency.contains("USD"))
          {
            usd_option = usd_option + " selected>USD</option>";
          }
          else
          {
            usd_option = usd_option + ">USD</option>";
          }
          if(fees_currency.contains("L.L"))
          {
            ll_option = ll_option + " selected>L.L</option>";
          }
          else
          {
            ll_option = ll_option + ">L.L</option>";
          }
          out.println(usd_option);
          out.println(ll_option);
          out.println("</select><br>");
          
          out.println("<label>Course Title:</label><br>");
          out.println("<input type='text' size='25' name='course_title' value = '" + rs1.getObject(5).toString() + "'><br>");
          
          out.println("<label>Course Description:</label><br>");
          out.println("<input type='text' size='25' name='course_description' value = '" + rs1.getObject(6).toString() + "'><br>");
          
          out.println("<label>Course Start Date:</label><br>");
          out.println("<input type='text' class='datepicker' name='course_start_date' value = '" + rs1.getObject(7).toString() + "'><br>");
          
          out.println("<label>Course Maximum Capacity:</label><br>");
          out.println("<input type='text' size='25' name='course_maximum_capacity' value = '" +rs1.getObject(8).toString() + "'><br>");
          
          out.println("<label>Course Registration Deadline:</label><br>");
          out.println("<input type='text' class='datepicker' name='course_registration_deadline' value = '" +rs1.getObject(9).toString() + "'><br>");
          
          out.println("<label>Course Instructor:</label><br>");
          out.println("<select name='course_instructor_full_name' onmousedown='if(this.options.length>8){this.size=0;}'  onchange='this.size=0;' onblur='this.size=0;' size = '0'>");
          for(int i = 0 ; i < list_all_instructors.size() ; i++)
          {
            String option = "<option value = '" + list_all_instructors.get(i) + "'";
            if(course_instructor.contains(list_all_instructors.get(i)))
            {
              option = option + " selected>" + list_all_instructors.get(i) + "</option>";
            }
            else
            {
              option = option + ">" + list_all_instructors.get(i) + "</option>";
            }
            out.println(option);
          }
          out.println("</select></br>");
          
          out.println("<label>Course Current Status:</label><br>");
          out.println("<select name='course_status' onmousedown='if(this.options.length>8){this.size=0;}'  onchange='this.size=0;' onblur='this.size=0;' size = '0'>");
          String status = rs1.getString(11);
          String pending_option = "<option value = 'Pending'";
          if(status.contains("Pending"))
          {
            pending_option = pending_option + " selected>Pending</option>";
          }
          else
          {
            pending_option = pending_option + ">Pending</option>";
          }
          String started_option = "<option value = 'Started'";
          if(status.contains("Started"))
          {
            started_option = started_option + " selected>Started</option>";
          }
          else
          {
            started_option = started_option + ">Started</option>";
          }
          String finished_option = "<option value = 'Finished'";
          if(status.contains("Finished"))
          {
            finished_option = finished_option + " selected>Finished</option>";
          }
          else
          {
            finished_option = finished_option + ">Finished</option>";
          }
          out.println(pending_option);
          out.println(started_option);
          out.println(finished_option);
          out.println("</select><br><br>");  
          
          List<String> list_lecture_days_numbers = new ArrayList<String>();
          String sql_get_lecture_days_numbers = "SELECT WEEK_DAY FROM WEEK_TIMES WHERE COURSE_ID_FK = " + course_id;
          Statement stat2 = con.createStatement();
          ResultSet rs2 = stat2.executeQuery(sql_get_lecture_days_numbers);
          while(rs2.next())
          {
            list_lecture_days_numbers.add(rs2.getObject(1).toString());
          }
          out.println("<div>");
          out.println("<table border = 1>");
          out.println("<tr>");
          String monday_header_checkbox = "<th colspan = '2'>Monday <input type = 'checkbox' name = 'monday_checkbox'";
          if(list_lecture_days_numbers.contains("1"))
            monday_header_checkbox = monday_header_checkbox + " checked></th>";
          else
            monday_header_checkbox = monday_header_checkbox + "></th>";
          out.println(monday_header_checkbox);
          
          String tuesday_header_checkbox = "<th colspan = '2'>Tuesday <input type = 'checkbox' name = 'tuesday_checkbox'";
          if(list_lecture_days_numbers.contains("2"))
            tuesday_header_checkbox = tuesday_header_checkbox + " checked></th>";
          else
            tuesday_header_checkbox = tuesday_header_checkbox + "></th>";
          out.println(tuesday_header_checkbox);
          
          String wednesday_header_checkbox = "<th colspan = '2'>wednesday <input type = 'checkbox' name = 'wednesday_checkbox'";
          if(list_lecture_days_numbers.contains("3"))
            wednesday_header_checkbox = wednesday_header_checkbox + " checked></th>";
          else
            wednesday_header_checkbox = wednesday_header_checkbox + "></th>";
          out.println(wednesday_header_checkbox);
          
          String thursday_header_checkbox = "<th colspan = '2'>thursday <input type = 'checkbox' name = 'thursday_checkbox'";
          if(list_lecture_days_numbers.contains("4"))
            thursday_header_checkbox = thursday_header_checkbox + " checked></th>";
          else
            thursday_header_checkbox = thursday_header_checkbox + "></th>";
          out.println(thursday_header_checkbox);
          
          String friday_header_checkbox = "<th colspan = '2'>friday <input type = 'checkbox' name = 'friday_checkbox'";
          if(list_lecture_days_numbers.contains("5"))
            friday_header_checkbox = friday_header_checkbox + " checked></th>";
          else
            friday_header_checkbox = friday_header_checkbox + "></th>";
          out.println(friday_header_checkbox);
          
          String saturday_header_checkbox = "<th colspan = '2'>saturday <input type = 'checkbox' name = 'saturday_checkbox'";
          if(list_lecture_days_numbers.contains("6"))
            saturday_header_checkbox = saturday_header_checkbox + " checked></th>";
          else
            saturday_header_checkbox = saturday_header_checkbox + "></th>";
          out.println(saturday_header_checkbox);
          
          String sunday_header_checkbox = "<th colspan = '2'>sunday <input type = 'checkbox' name = 'sunday_checkbox'";
          if(list_lecture_days_numbers.contains("0"))
            sunday_header_checkbox = sunday_header_checkbox + " checked></th>";
          else
            sunday_header_checkbox = sunday_header_checkbox + "></th>";
          out.println(sunday_header_checkbox);
          
          out.println("</tr>");
          out.println("<tr>");
          out.println("<th>From</th>");
          out.println("<th>To</th>");
          out.println("<th>From</th>");
          out.println("<th>To</th>");
          out.println("<th>From</th>");
          out.println("<th>To</th>");
          out.println("<th>From</th>");
          out.println("<th>To</th>");
          out.println("<th>From</th>");
          out.println("<th>To</th>");
          out.println("<th>From</th>");
          out.println("<th>To</th>");
          out.println("<th>From</th>");
          out.println("<th>To</th>");
          out.println("</tr>");
          out.println("<tr>");
          
          if(true)
          { 
            String get_time = "SELECT START_TIME,END_TIME FROM WEEK_TIMES WHERE COURSE_ID_FK = " + course_id + "AND WEEK_DAY = 1";
            Statement stat3 = con.createStatement();
            ResultSet result = stat3.executeQuery(get_time);
            String start_hour = "";
            String start_minute = "";
            String end_hour = "";
            String end_minute = "";
            if(result.next())
            {
              String[] start_parts = result.getObject(1).toString().split(":");
              start_hour = start_parts[0];
              start_minute = start_parts[1];     
              String[] end_parts = result.getObject(2).toString().split(":");
              end_hour = end_parts[0];
              end_minute = end_parts[1];
            }
            out.println("<td align = 'center'>");
            generate_select_hour(out,start_hour,"monday","start");
            out.println(":");
            generate_select_minute(out,start_minute,"monday","start");
            out.println("</td>");
            
            out.println("<td align = 'center'>");
            generate_select_hour(out,end_hour,"monday","end");
            out.println(":");
            generate_select_minute(out,end_minute,"monday","end");
            out.println("</td>");
          }
          if(true)
          {
            String get_time = "SELECT START_TIME,END_TIME FROM WEEK_TIMES WHERE COURSE_ID_FK = " + course_id + "AND WEEK_DAY = 2";
            Statement stat3 = con.createStatement();
            ResultSet result = stat3.executeQuery(get_time);
            String start_hour = "";
            String start_minute = "";
            String end_hour = "";
            String end_minute = "";
            if(result.next())
            {
              String[] start_parts = result.getObject(1).toString().split(":");
              start_hour = start_parts[0];
              start_minute = start_parts[1];     
              String[] end_parts = result.getObject(2).toString().split(":");
              end_hour = end_parts[0];
              end_minute = end_parts[1];
            }
            out.println("<td align = 'center'>");
            generate_select_hour(out,start_hour,"tuesday","start");
            out.println(":");
            generate_select_minute(out,start_minute,"tuesday","start");
            out.println("</td>");
            
            out.println("<td align = 'center'>");
            generate_select_hour(out,end_hour,"tuesday","end");
            out.println(":");
            generate_select_minute(out,end_minute,"tuesday","end");
            out.println("</td>");
          }
          if(true)
          {
            String get_time = "SELECT START_TIME,END_TIME FROM WEEK_TIMES WHERE COURSE_ID_FK = " + course_id + "AND WEEK_DAY = 3";
            Statement stat3 = con.createStatement();
            ResultSet result = stat3.executeQuery(get_time);
              String start_hour = "";
              String start_minute = "";
              String end_hour = "";
              String end_minute = "";
              if(result.next())
              {
                String[] start_parts = result.getObject(1).toString().split(":");
                start_hour = start_parts[0];
                start_minute = start_parts[1];     
                String[] end_parts = result.getObject(2).toString().split(":");
                end_hour = end_parts[0];
                end_minute = end_parts[1];
              }
            out.println("<td align = 'center'>");
            generate_select_hour(out,start_hour,"wednesday","start");
            out.println(":");
            generate_select_minute(out,start_minute,"wednesday","start");
            out.println("</td>");
            
            out.println("<td align = 'center'>");
            generate_select_hour(out,end_hour,"wednesday","end");
            out.println(":");
            generate_select_minute(out,end_minute,"wednesday","end");
            out.println("</td>");
          }
          if(true)
          {
            String get_time = "SELECT START_TIME,END_TIME FROM WEEK_TIMES WHERE COURSE_ID_FK = " + course_id + "AND WEEK_DAY = 4";
            Statement stat3 = con.createStatement();
            ResultSet result = stat3.executeQuery(get_time);
            String start_hour = "";
            String start_minute = "";
            String end_hour = "";
            String end_minute = "";
            if(result.next())
            {
              String[] start_parts = result.getObject(1).toString().split(":");
              start_hour = start_parts[0];
              start_minute = start_parts[1];     
              String[] end_parts = result.getObject(2).toString().split(":");
              end_hour = end_parts[0];
              end_minute = end_parts[1];
            }
            out.println("<td align = 'center'>");
            generate_select_hour(out,start_hour,"thursday","start");
            out.println(":");
            generate_select_minute(out,start_minute,"thursday","start");
            out.println("</td>");
            
            out.println("<td align = 'center'>");
            generate_select_hour(out,end_hour,"thursday","end");
            out.println(":");
            generate_select_minute(out,end_minute,"thursday","end");
            out.println("</td>");
          }
          if(true)
          {
            String get_time = "SELECT START_TIME,END_TIME FROM WEEK_TIMES WHERE COURSE_ID_FK = " + course_id + "AND WEEK_DAY = 5";
            Statement stat3 = con.createStatement();
            ResultSet result = stat3.executeQuery(get_time);
            String start_hour = "";
            String start_minute = "";
            String end_hour = "";
            String end_minute = "";
            if(result.next())
            {
              String[] start_parts = result.getObject(1).toString().split(":");
              start_hour = start_parts[0];
              start_minute = start_parts[1];     
              String[] end_parts = result.getObject(2).toString().split(":");
              end_hour = end_parts[0];
              end_minute = end_parts[1];
            }
            out.println("<td align = 'center'>");
            generate_select_hour(out,start_hour,"friday","start");
            out.println(":");
            generate_select_minute(out,start_minute,"friday","start");
            out.println("</td>");
            
            out.println("<td align = 'center'>");
            generate_select_hour(out,end_hour,"friday","end");
            out.println(":");
            generate_select_minute(out,end_minute,"friday","end");
            out.println("</td>");
            
          }
          if(true)
          {
            String get_time = "SELECT START_TIME,END_TIME FROM WEEK_TIMES WHERE COURSE_ID_FK = " + course_id + "AND WEEK_DAY = 6";
            Statement stat3 = con.createStatement();
            ResultSet result = stat3.executeQuery(get_time);
            String start_hour = "";
            String start_minute = "";
            String end_hour = "";
            String end_minute = "";
            if(result.next())
            {
              String[] start_parts = result.getObject(1).toString().split(":");
              start_hour = start_parts[0];
              start_minute = start_parts[1];     
              String[] end_parts = result.getObject(2).toString().split(":");
              end_hour = end_parts[0];
              end_minute = end_parts[1];
            }
            out.println("<td align = 'center'>");
            generate_select_hour(out,start_hour,"saturday","start");
            out.println(":");
            generate_select_minute(out,start_minute,"saturday","start");
            out.println("</td>");
            
            out.println("<td align = 'center'>");
            generate_select_hour(out,end_hour,"saturday","end");
            out.println(":");
            generate_select_minute(out,end_minute,"saturday","end");
            out.println("</td>");
          }
          if(true)
          {
            String get_time = "SELECT START_TIME,END_TIME FROM WEEK_TIMES WHERE COURSE_ID_FK = " + course_id + "AND WEEK_DAY = 0";
            Statement stat3 = con.createStatement();
            ResultSet result = stat3.executeQuery(get_time);
            String start_hour = "";
            String start_minute = "";
            String end_hour = "";
            String end_minute = "";
            if(result.next())
            {
              String[] start_parts = result.getObject(1).toString().split(":");
              start_hour = start_parts[0];
              start_minute = start_parts[1];     
              String[] end_parts = result.getObject(2).toString().split(":");
              end_hour = end_parts[0];
              end_minute = end_parts[1];
            }
            out.println("<td align = 'center'>");
            generate_select_hour(out,start_hour,"sunday","start");
            out.println(":");
            generate_select_minute(out,start_minute,"sunday","start");
            out.println("</td>");
            
            out.println("<td align = 'center'>");
            generate_select_hour(out,end_hour,"sunday","end");
            out.println(":");
            generate_select_minute(out,end_minute,"sunday","end");
            out.println("</td>");
          }
          out.println("</tr></table><br>");
          out.println("<div class=\"Button Button--start\"><button type = 'submit'><span>Update></button></div></form><br>");
          out.println("<a href='edit_application?course_name=" + selected_course + "'>Show student applications</a>");
          out.println("<div class='Button Button--start'><button type='button' id='delete_course' onclick='delete_course_fn(" + course_id + ")' ><span>Delete course</span></button></div>");
          out.println("</div></div>");
          out.println("</div></body></html>");
        }
        catch(Exception e)
        {
          out.println(e.toString());
        }
    }
  }
  
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
    throws ServletException, IOException
  {
    response.setContentType(CONTENT_TYPE);
    PrintWriter out = response.getWriter();
    Connection con = connect_to_db();
    
    //params for updating the COURSES table
    
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
    course_id = request.getParameter("course_id");
    
    //
    
    List<String> list_lecture_days = new ArrayList<String>();
    list_lecture_dates = new ArrayList<String>();
    monday_start_hour = request.getParameter("monday_start_hour");
    monday_start_minute = request.getParameter("monday_start_minute");
    tuesday_start_hour = request.getParameter("tuesday_start_hour");
    tuesday_start_minute = request.getParameter("tuesday_start_minute");
    wednesday_start_hour = request.getParameter("wednesday_start_hour");
    wednesday_start_minute = request.getParameter("wednesday_start_minute");
    thursday_start_hour = request.getParameter("thursday_start_hour");
    thursday_start_minute = request.getParameter("thursday_start_minute");
    friday_start_hour = request.getParameter("friday_start_hour");
    friday_start_minute = request.getParameter("friday_start_minute");
    saturday_start_hour = request.getParameter("saturday_start_hour");
    saturday_start_minute = request.getParameter("saturday_start_minute");
    sunday_start_hour = request.getParameter("sunday_start_hour");
    sunday_start_minute = request.getParameter("sunday_start_minute");
    monday_end_hour = request.getParameter("monday_end_hour");
    monday_end_minute = request.getParameter("monday_end_minute");
    tuesday_end_hour = request.getParameter("tuesday_end_hour");
    tuesday_end_minute = request.getParameter("tuesday_end_minute");
    wednesday_end_hour = request.getParameter("wednesday_end_hour");
    wednesday_end_minute = request.getParameter("wednesday_end_minute");
    thursday_end_hour = request.getParameter("thursday_end_hour");
    thursday_end_minute = request.getParameter("thursday_end_minute");
    friday_end_hour = request.getParameter("friday_end_hour");
    friday_end_minute = request.getParameter("friday_end_minute");
    saturday_end_hour = request.getParameter("saturday_end_hour");
    saturday_end_minute = request.getParameter("saturday_end_minute");
    sunday_end_hour = request.getParameter("sunday_end_hour");
    sunday_end_minute = request.getParameter("sunday_end_minute");
    
    String monday_checkbox = request.getParameter("monday_checkbox");
    String tuesday_checkbox = request.getParameter("tuesday_checkbox");
    String wednesday_checkbox = request.getParameter("wednesday_checkbox");
    String thursday_checkbox = request.getParameter("thursday_checkbox");
    String friday_checkbox = request.getParameter("friday_checkbox");
    String saturday_checkbox = request.getParameter("saturday_checkbox");
    String sunday_checkbox = request.getParameter("sunday_checkbox");
    String course_start_date_raw = course_start_date;
    
    
    out.println("<html>");
    out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
    out.println("<body>");
    out.println("<div id = 'MainContainer'>");
    request.getRequestDispatcher("link.html").include(request,response);
    try
    {
      String[] parts = course_instructor_full_name.split("-");
      String instructor_id= parts[0];
      course_instructor_id = instructor_id.replace("ID: ","");
      String sql_update_course = "UPDATE COURSES SET NAME = '" + course_name + "', NUMBER_OF_LECTURES = '" + course_number_of_lectures + "', FEES = '" + course_fees + "', TITLE = '" + course_title +"', DESCRIPTION = '" + course_description +"', START_DATE = '" + course_start_date + "', MAX_CAPACITY = '" + course_maximum_capacity + "', REGISTRATION_DEADLINE = '" + course_registration_deadline + "', INSTRUCTOR_ID_FK = '" + course_instructor_id + "', CRN = '" + course_crn +"', STATUS = '" + course_status + "' WHERE ID = " + course_id;
      Statement stat2 = con.createStatement();
      stat2.executeUpdate(sql_update_course);
      
      String sql_remove_from_week_times = "DELETE FROM WEEK_TIMES WHERE COURSE_ID_FK = " + course_id;
      Statement stat3 = con.createStatement();
      stat3.executeUpdate(sql_remove_from_week_times);
      
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
      Date startDate = formatter.parse(course_start_date_raw);
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
      add_to_db(list_lecture_dates,list_lecture_times_start,list_lecture_times_end,list_lecture_dates_respective_days);
      
      Log log = new Log();
      log.log("User " + user + " edited course " + selected_course , request, session);
      
      out.println("<p>Course successfully updated.</p>");
    }
    catch(Exception e)
    {
      out.println(e.toString());
    }
    
    out.println("</div></body>");
    out.println("</html>");
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
  
  public void generate_select_hour(PrintWriter out, String start_hour, String day, String start_or_end)
  {
    out.println("<select name ='" + day + "_"+ start_or_end +"_hour' onmousedown='if(this.options.length>8){this.size=0;}'  onchange='this.size=0;' onblur='this.size=0;' size = '0'> ");
    out.println("<option value ='null'></option>");
    for(int i = 1 ; i <= 24 ; i++)
    {
      String option = "<option value = '" + String.format("%02d",i) + "'";//>" + String.valueOf(i) + "</option>";
      if(String.format("%02d",i).equals(start_hour))
      {
        option = option + " selected>" + String.format("%02d",i) + "</option>";
      }
      else
      {
        option = option + ">" + String.format("%02d",i) + "</option>";
      }
      out.println(option);
    }
    out.println("</select>");
  }
  
  public void generate_select_minute(PrintWriter out, String start_minute, String day, String start_or_end)
  {
    out.println("<select name ='" + day + "_"+ start_or_end +"_minute' onmousedown='if(this.options.length>8){this.size=0;}'  onchange='this.size=0;' onblur='this.size=0;' size = '0'> ");
    out.println("<option value ='null'></option>");
    for(int i = 00 ; i < 60 ; i = i + 5)
    {
      String option = "<option value = '" + String.format("%02d",i) + "'";//>" + String.valueOf(i) + "</option>";
      if(String.format("%02d",i).equals(start_minute))
      {
        option = option + " selected>" + String.format("%02d",i) + "</option>";
      }
      else
      {
        option = option + ">" + String.format("%02d",i) + "</option>";
      }
      out.println(option); 
    }
    out.println("</select>");
  }
  
  void create_times_list(int day_index)
  {
      if(day_index == 0)
      {
        list_lecture_times_start.add(sunday_start_hour+ ":" + sunday_start_minute);
        list_lecture_times_end.add(sunday_end_hour+ ":" + sunday_end_minute);
      }
      else if(day_index == 1)
      {
        list_lecture_times_start.add(monday_start_hour+ ":" + monday_start_minute);
        list_lecture_times_end.add(monday_end_hour+ ":" + monday_end_minute);
      }
    else if(day_index == 2)
    {
      list_lecture_times_start.add(tuesday_start_hour+ ":" + tuesday_start_minute);
      list_lecture_times_end.add(tuesday_end_hour+ ":" + tuesday_end_minute);
    }
    else if(day_index == 3)
    {
      list_lecture_times_start.add(wednesday_start_hour+ ":" + wednesday_start_minute);
      list_lecture_times_end.add(wednesday_end_hour+ ":" + wednesday_end_minute);
    }
    else if(day_index == 4)
    {
      list_lecture_times_start.add(thursday_start_hour+ ":" + thursday_start_minute);
      list_lecture_times_end.add(thursday_end_hour+ ":" + thursday_end_minute);
    }
    else if(day_index == 5)
    {
      list_lecture_times_start.add(friday_start_hour+ ":" + friday_start_minute);
      list_lecture_times_end.add(friday_end_hour+ ":" + friday_end_minute);
    }
    else if(day_index == 6)
    {
      list_lecture_times_start.add(saturday_start_hour+ ":" + saturday_start_minute);
      list_lecture_times_end.add(saturday_end_hour+ ":" + saturday_end_minute);
    }
  }
  
  public void add_to_db(List<String> list_lecture_dates,List<String> list_lecture_times_start, List<String> list_lecture_times_end, List<String> list_lecture_dates_respective_days )
  {
    Connection con = connect_to_db();
    for(int i = 0 ; i < list_lecture_dates.size() ; i++)
    {
      String sql = "INSERT INTO WEEK_TIMES (LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) VALUES('" + list_lecture_dates.get(i) + "','" + list_lecture_times_start.get(i) + "','" + list_lecture_times_end.get(i) + "'," + course_id + ",'" +list_lecture_dates_respective_days.get(i) +"')";
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
}
