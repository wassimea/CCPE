package project1;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;


public class save_role extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException,
                                                           IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        
        Access access = new Access();
        String role_to_manage = "";
        List<String> users_to_add = new ArrayList<String>();
        List<String> user_ids_removed_from_role = new ArrayList<String>();
        HttpSession session = request.getSession(false);
        String user = (String)session.getAttribute("user-email");
        String method = "manage_roles";
        
        if (!access.has_access(user, method)){
            out.println("You do not have permission to do that!");
        }
        else{
            String[] users_temp = request.getParameterValues("users");
            if(users_temp != null){
                // normal conditions
                users_to_add = Arrays.asList(users_temp);
                role_to_manage = request.getParameter("role_to_manage");
                user_ids_removed_from_role = access.get_user_ids_removed_from_role(users_to_add, role_to_manage);
            }
            else{
                // all users removed
                role_to_manage = request.getParameter("role_to_manage");
                user_ids_removed_from_role = access.get_user_ids();
            }
            if(true){           
                if(role_to_manage.contains("STUDENTS")){
                    if(access.users_have_applications(user_ids_removed_from_role)){
                        // output
                        out.println("<html>");
                        out.println("<head><title>Confirmation</title>");
                        out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<div id='MainContainer'>");
                        request.getRequestDispatcher("link.html").include(request,response);
                        out.println("<h2>The following applications associated to the removed student will be deleted. Do you wish to continue?</h2><br>");
                        access.generate_user_applications(user_ids_removed_from_role, out);
                        out.println("<form action='save_role' method='POST'>");
                        
                        access.generate_hidden_data(users_temp, role_to_manage, out);
                        
                        out.println("<a href='manage_roles'><input type='button' value='Manage another role'></a>");
                        out.println("<a href=''><input type='submit' value='Continue'></a>");
                        out.println("</form>");
                        out.println("</div>");                
                        out.println("</body></html>"); 
                    }
                    else{
                        // output
                        out.println("<html>");
                        out.println("<head><title>Confirmation</title>");
                        out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<div id='MainContainer'>");
                        request.getRequestDispatcher("link.html").include(request,response);
                        out.println("<h2>Are you sure you want to save changes?</h2><br>");
                        out.println("<form action='save_role' method='POST'>");   
                        
                        access.generate_hidden_data(users_temp, role_to_manage, out);
                                             
                        out.println("<a href='manage_roles'><input type='button' value='Manage another role'></a>");
                        out.println("<a href=''><input type='submit' value='Continue'></a>");
                        out.println("</form>");
                        out.println("</div>");                
                        out.println("</body></html>");
                    }
                }
                else if(role_to_manage.contains("INSTRUCTORS")){
                    if(access.users_have_courses(user_ids_removed_from_role)){
                        // output
                        out.println("<html>");
                        out.println("<head><title>Confirmation</title>");
                        out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<div id='MainContainer'>");
                        request.getRequestDispatcher("link.html").include(request,response);
                        out.println("<h2>The following courses associated to the removed instructor will be deleted. Do you wish to continue?</h2><br>");
                        access.generate_instructors_courses(user_ids_removed_from_role, out);
                        out.println("<form action='save_role' method='POST'>");
                        
                        access.generate_hidden_data(users_temp, role_to_manage, out);
                        
                        out.println("<a href='manage_roles'><input type='button' value='Manage another role'></a>");
                        out.println("<a href=''><input type='submit' value='Continue'></a>");
                        out.println("</form>");
                        out.println("</div>");                
                        out.println("</body></html>"); 
                    }
                    else{
                        // output
                        out.println("<html>");
                        out.println("<head><title>Confirmation</title>");
                        out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<div id='MainContainer'>");
                        request.getRequestDispatcher("link.html").include(request,response);
                        out.println("<h2>Are you sure you want to save changes?</h2><br>");
                        out.println("<form action='save_role' method='POST'>");
                        
                        access.generate_hidden_data(users_temp, role_to_manage, out);
                        
                        out.println("<a href='manage_roles'><input type='button' value='Manage another role'></a>");
                        out.println("<a href=''><input type='submit' value='Continue'></a>");
                        out.println("</form>");
                        out.println("</div>");                
                        out.println("</body></html>");
                    }
                }
                else{
                    // output
                    
                    out.println("<html>");
                    out.println("<head><title>Confirmation</title>");
                    out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div id='MainContainer'>");
                    request.getRequestDispatcher("link.html").include(request,response);
                    out.println("<h2>Are you sure you want to save changes?</h2><br>");
                    out.println("<form action='save_role' method='POST'>");
                        
                    access.generate_hidden_data(users_temp, role_to_manage, out);
                        
                    out.println("<a href='manage_roles'><input type='button' value='Manage another role'></a>");
                    out.println("<a href=''><input type='submit' value='Continue'></a>");
                    out.println("</form>");
                    out.println("</div>");                
                    out.println("</body></html>");
                }
            }    
            else {
                // here the user removed everyone from role
                role_to_manage = request.getParameter("role_to_manage");
                if(role_to_manage.contains("STUDENTS")){
                    
                }
                else if(role_to_manage.contains("INSTRUCTORS")){
                    
                }
                else{
                    // output
                    out.println("<html>");
                    out.println("<head><title>Confirmation</title>");
                    out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<div id='MainContainer'>");
                    request.getRequestDispatcher("link.html").include(request,response);
                    out.println("<h2>Are you sure you want to save changes?</h2><br>");
                    out.println("<form action='save_role' method='POST'>");
                        
                    access.generate_hidden_data(users_temp, role_to_manage, out);
                        
                    out.println("<a href='manage_roles'><input type='button' value='Manage another role'></a>");
                    out.println("<a href=''><input type='submit' value='Cotinue'></a>");
                    out.println("</form>");
                    out.println("</div>");                
                    out.println("</body></html>");
                }
            }
        }        
        
        out.close();
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        
        Access access = new Access();
        String role_to_manage = "";
        List<String> users_to_add = new ArrayList<String>();
        
        HttpSession session = request.getSession(false);
        String user = (String)session.getAttribute("user-email");
        String method = "manage_roles";
        
        if (!access.has_access(user, method)){
            out.println("You do not have permission to do that!");
        }
        else{
            
            String[] users_temp = request.getParameterValues("users");
            if(users_temp != null){        
                
                users_to_add = Arrays.asList(users_temp);
                role_to_manage = request.getParameter("role_to_manage");
                List<String> user_ids_removed_from_role = new ArrayList<String>();
                
                user_ids_removed_from_role = access.get_user_ids_removed_from_role(users_to_add, role_to_manage);
                
                if(access.users_have_applications(user_ids_removed_from_role)){
                    access.delete_applications_of_user_ids(user_ids_removed_from_role);
                }
                else if(access.users_have_courses(user_ids_removed_from_role)){
                    access.delete_courses_of_instructors(user_ids_removed_from_role);
                }
                access.remove_role_users_by_id(role_to_manage, user_ids_removed_from_role);
                access.remove_users_from_all_roles_by_id(user_ids_removed_from_role);
                // access.remove_all_role_users(role_to_manage);
                // access.remove_users_from_all_roles(users_to_add);
                access.add_users_to_role(users_to_add, role_to_manage);
                
            }
            else{
                role_to_manage = request.getParameter("role_to_manage");
                access.remove_all_role_users(role_to_manage);
                if(role_to_manage.contains("STUDENTS")){
                    access.delete_applications_of_user_ids(access.get_user_ids());
                }
                else if(role_to_manage.contains("INSTRUCTORS")){
                    access.delete_courses_of_instructors(access.get_user_ids());   
                }
                else{
                    // do nothing   
                }
            }
            // output
            out.println("<html>");
            out.println("<head><title>Saved</title>");
            out.println("<link rel='stylesheet' type='text/css' href='css/main.css'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='MainContainer'>");
            request.getRequestDispatcher("link.html").include(request,response);
            out.println("<h2>Settings for "+ role_to_manage +" have been saved!</h2><br>");
            out.println("<a href='manage_roles'><input type='button' value='Manage another role' name='manage'></a>");
            out.println("<a href='home.jsp'><input type='button' value='Return home' name='home'></a>");
            out.println("</div>");                
            out.println("</body></html>");
            out.close();
            
            Log log = new Log();
            log.log("Role "+ role_to_manage +" saved", request, session);            
        }        
        out.close();
    }
}
