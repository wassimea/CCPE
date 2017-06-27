
package project1;
 
import java.io.IOException;
import java.io.PrintWriter;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import java.sql.Statement;
 
import java.util.Calendar;

import java.io.File;

import java.sql.PreparedStatement;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
 
public class force_add
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
    String method = "apply_for_course";
    
    user = (String)session.getAttribute("user-email");
    
    if(user == null){
      out.println("Please login first");
      request.getRequestDispatcher("login.html").include(request, response);
    }
    else if(access.has_access(user, method)){
    db_queries db_class = new db_queries();
    String user_id = "";
    user_id = db_class.get_person_id(user);
    
        out.println("<html>");
        out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
        out.println("<head><title>edit_application</title>");  
        out.println("</head>");
        out.println("<body>");
        out.println("<div id = 'MainContainer'>");
        request.getRequestDispatcher("link.html").include(request,response);
        String aplication_student_id = "";
        String application_course_name = "";
        String application_course_id = "";
        String application_payment_method_name= "";
        String application_payment_method_id = "";
        String application_submission_date= "";
        List<String> list_directories = new ArrayList<String>();
        String current_application_id = "";
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();
    
            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
 
            try {
                // Parse the request
                List /* FileItem */ items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext())
                {
                    FileItem item = (FileItem) iterator.next();
                    if (!item.isFormField())
                    {
                        String fileName = item.getName();        
                        String root = getServletContext().getRealPath("/");
                        File path = new File("/oracle/jdev_user_home/Uploads");
                        if (!path.exists())
                        {
                            boolean status = path.mkdirs();
                        }
                        System.out.println("fileName:" + fileName);
                        File uploadedFile = new File(path + "/" + fileName);
                        item.write(uploadedFile);
                        list_directories.add("/oracle/jdev_user_home/Uploads/" + fileName);
                    }
                  else
                    {
                      String name = item.getFieldName();//text1
                      if(name.equalsIgnoreCase("application_student_id"))
                      {
                        aplication_student_id = item.getString();
                      }
                      else if(name.equalsIgnoreCase("application_course_name"))
                      {
                        application_course_name = item.getString();
                      }
                      else if(name.equalsIgnoreCase("application_payment_method_name"))
                      {
                        application_payment_method_name = item.getString();
                      }
                    }
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try
        {
          Connection con = connect_to_db();
         
          String sql_get_course_id = "SELECT ID FROM COURSES WHERE NAME = '" +  application_course_name + "'";
          Statement stat1 = con.createStatement();
          ResultSet rs1 = stat1.executeQuery(sql_get_course_id);
          rs1.next();
          application_course_id = rs1.getObject(1).toString();
          String sql_get_payment_method_id = "SELECT ID FROM PAYMENT_METHODS WHERE NAME = '" +  application_payment_method_name + "'";
          Statement stat2 = con.createStatement();
          ResultSet rs2 = stat2.executeQuery(sql_get_payment_method_id);
          rs2.next();
          application_payment_method_id = rs2.getObject(1).toString();
         
         
          Calendar cal = Calendar.getInstance();
          application_submission_date = cal.getTime().toString();
         
          String sql = "INSERT INTO APPLICATIONS (STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) VALUES(" + aplication_student_id + "," + application_course_id + ",'Submitted','" + application_submission_date + "'," + application_payment_method_id +")";
          try
          {
            PreparedStatement  stat;
            String generatedColumns[] = { "ID" };
            stat = con.prepareStatement(sql, generatedColumns);
            stat.executeUpdate();
            ResultSet rs = stat.getGeneratedKeys();
            rs.next();
            current_application_id = String.valueOf(rs.getInt(1));
            
            for(int x = 0 ; x < list_directories.size() ; x++)
            {
              String sql2 = "INSERT INTO APPLICATION_UPLOADS (APPLICATION_ID_FK,DIRECTORY) VALUES (" + current_application_id + ",'" + list_directories.get(x) + "')";
              Statement state = con.createStatement();
              state.executeUpdate(sql2);
            }
              out.println("<br><br><p>Application Successfully submitted.</p></div></body></html>");
              
          }
          catch(SQLException e)
          {
            out.println(e.toString());
          }
          out.close();
        }
        catch(Exception e)
        {
          out.println(e.toString());
        }
        
      Log log = new Log();
      log.log("User " + user + " added student " + aplication_student_id +" by force to course" + application_course_name, request, session);
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
