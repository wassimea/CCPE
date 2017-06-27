<html>
<link rel='stylesheet' type='text/css' href='css/main.css'>
<head>
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
            method = "apply_for_course";
            
            if(user == null){
                out.println("Please login.");
                request.getRequestDispatcher("login.html").include(request, response);
            }            
            else if(!access.has_access(user, method)){
                out.println("You do not have permission to do that.<br>");
            }
            else{            
        %>
        
    <form action="application" method="POST" enctype="multipart/form-data">
    
	  <label>Select Course:</label><br>

      <select name="application_course_name" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0">
        <% for(int i = 0 ; i < c.get_available_courses().size() ; i++)
        {
          %><option value = '<%out.print(c.get_available_courses().get(i));%>'> <%out.print(c.get_available_courses().get(i));%> </option>
        <%}%>
      </select>
	<br>

	<label>Enter Payment Method:</label><br>

      <select name="application_payment_method_name" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0">
        <% for(int i = 0 ; i < c.getPaymentMethods().size() ; i++)
        {
          %><option value = '<%out.print(c.getPaymentMethods().get(i));%>'> <%out.print(c.getPaymentMethods().get(i));%> </option>
        <%}%>
      </select>
	<br>
        <fieldset>
        <legend>Upload File</legend>
            <label for="fileName">Select File: </label>
            <input id="fileName" type="file" name="fileName" size="30" multiple="multiple"/><br/>            
    </fieldset>
    
    <div class="Button Button--start">
     <button type="submit"><span>Submit</span></button>
     </div>
    </form>
    <% } %> <!-- magic -->
    </div>
  </body>

</html>


