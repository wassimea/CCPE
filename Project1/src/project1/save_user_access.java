package project1;
import java.io.IOException;

import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import project1.Access;
import project1.Log;

/*! =========================================================
 *
 *    By the power of Buddha
*
* =========================================================
*
 *
 *                       _oo0oo_
 *                      o8888888o
 *                      88" . "88
 *                      (| -_- |)
 *                      0\  =  /0
 *                    ___/`---'\___
 *                  .' \|     |// '.
 *                 / \|||  :  |||// \
 *                / _||||| -:- |||||- \
 *               |   | \  -  /// |   |
 *               | \_|  ''\---/''  |_/ |
 *               \  .-\__  '-'  ___/-. /
 *             ___'. .'  /--.--\  `. .'___
 *          ."" '<  `.___\_<|>_/___.' >' "".
 *         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
 *         \  \ `_.   \_ __\ /__ _/   .-` /  /
 *     =====`-.____`.___ \_____/___.-`___.-'=====
 *                       `=---='
 *
 *     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 *               Buddha Bless:  "No Bugs"
 *
 * ========================================================= */


public class save_user_access extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException,
                                                           IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>save_user_access</title></head>");
        out.println("<body>");
        out.println("</body></html>");
        out.close();
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException,
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        // prepare variables and objects
        PrintWriter out = response.getWriter();
      Access access = new Access();
      String access_group_to_manage = "";
      List<String> users_to_add = new ArrayList<String>();
      
      HttpSession session = request.getSession(false);
      String user = (String)session.getAttribute("user-email");
      String method = "manage_user_access";
      if(!access.has_access(user, method)){
          out.println("You do not have permission to do that!");
      }
      else{
          String[] users_temp = request.getParameterValues("users");
          if(users_temp != null){        
              users_to_add = Arrays.asList(users_temp);
              
              access_group_to_manage = request.getParameter("access_group_to_manage");
              
              access.remove_all_access_group_users(access_group_to_manage);
              access.add_users_to_access_group(users_to_add, access_group_to_manage);
          }
          else{
              access_group_to_manage = request.getParameter("access_group_to_manage");
              access.remove_all_access_group_users(access_group_to_manage);   
          }
          // output
          out.println("<html>");
          out.println("<head><title>Saved</title>");            
          out.println("<link type='text/css' rel='stylesheet' href='css/main.css'>");
          out.println("</head>");
          out.println("<body>");            
          out.println("<div id='MainContainer'>");
          request.getRequestDispatcher("link.html").include(request,response);
          out.println("<p>Settings for "+ access_group_to_manage +" have been saved!</p><br>");
          out.println("<a href='manage_user_access'><input type='button' value='Manage another group' name='manage'></a>");
          out.println("<a href='access_index.jsp'><input type='button' value='Access Home Page' name='home' value='Access Home Page'></a>");
          out.println("</div>");                
          out.println("</body></html>");
          out.close();
          
          Log log = new Log();
          log.log("Access group "+ access_group_to_manage +" users updated", request, session);
          
      }
        
    }
}
