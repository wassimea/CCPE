<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<link rel='stylesheet' type='text/css' href='css/main.css'>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>select_course_for_applications</title>
  </head>
  <body>
  <div id = 'MainContainer'>
  <% request.getRequestDispatcher("link.html").include(request,response); %>
    <%@ page import = "project1.db_queries" %>
    <% db_queries c = new db_queries(); %>
    
    <%@ page import = "project1.Access" %>
    <%        
        // access control
        Access access = new Access();
        String user =  "";
        String method = "";
        session = request.getSession(false);
        
        user = (String)session.getAttribute("user-email");
        method = "manage_applications";
        
        if(user == null){
            out.println("Please login.");
            request.getRequestDispatcher("login.html").include(request, response);
        }            
        else if(!access.has_access(user, method)){
            out.println("You do not have permission to do that.<br>");
        }
        else{            
    %>
    
    <form action="edit_application" method="GET">
    
	<label>Select Course:</label><br>
      <select name="course_name" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0">
        <% for(int i = 0 ; i < c.getCourses().size() ; i++)
        {
          %><option value = '<%out.print(c.getCoursesWithCRN().get(i));%>'> <%out.print(c.getCoursesWithCRN().get(i));%> </option>
        <%}%>
      </select>
       <br>
       
       <div class="Button Button--start">
            <button type="submit"><span>Next</span></button>
          </div>
    </form>
    <% } %> <!-- magic -->
    </div>
  </body>
</html>