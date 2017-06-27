<!DOCTYPE html>
    <head>
        <title>Home</title>
        <link rel='stylesheet' type='text/css' href='css/slideshow.css'>
        <link rel='stylesheet' type='text/css' href='css/main.css'>
    </head>    
    <body>
        <div id='MainContainer'>
            <% request.getRequestDispatcher("link.html").include(request,response); %>
            <%@ page import="project1.Access" %>
            <h1>Welcome<%
             
                Access access = new Access();
                String username = (String)session.getAttribute("user-email");
                
                if(username == null){
                    
                }
                else{
                    String full_name = access.get_full_name(username);
                    out.println(", " + full_name);
                }
            %>
            </h1>
            <div class="container">
              <ul id="slides">
                <li class="slide showing"><img style="height:100%;width:100%;" src="images/4240412-people.jpg"></li>
                <li class="slide"><img style="height:100%;width:100%;" src="images/computer-animation.jpg"></li>
                <li class="slide"><img style="height:100%;width:100%;" src="images/minions.jpg"></li>
              </ul>
              <div class="buttons">
                <button class="controls" id="previous">&lt;</button>
            
                <button class="controls" id="pause">&#10074;&#10074;</button>
            
                <button class="controls" id="next">&gt;</button>
              </div>
            </div>
            
            <div id='UpcomingCoursesContainer'>
                
            </div>
            <div id='NewsContainer'>
                
            </div>
            <% request.getRequestDispatcher("footer.jsp").include(request,response); %>
        </div>
        <script src='javascript/slideshow.js'></script>
    </body>
</html>