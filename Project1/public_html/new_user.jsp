<!DOCTYPE html>
    <head>
        <title>New User</title>
        <style type="text/css">
            #main-body {
                width: 500px;
                clear: both;
            }
            #main-body input {
                width: 100%;
                clear: both;
            }        
        </style>
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <script src="javascript/jquery-1.12.4.js"></script>
        <script src="javascript/jquery-ui.js"></script>
        <script>
            $( function() {
                $( "#datepicker" ).datepicker({
                    changeYear: true,
                    changeMonth: true
                });
            } );
        </script>
        
        <script type="text/javascript">
            $(document).ready(function() {
                var x_timer;    
                $("#username").keyup(function (e){
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function(){
                        check_username_ajax(user_name);
                    }, 1000);
                }); 
            
                function check_username_ajax(username){
                    $("#user-result").html('<img src="images/ajax-loader.gif" />');
                    $.post('username_checker', {'username':username}, function(data) {
                      $("#user-result").html(data);
                    });
                }
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function() {
                var x_timer;    
                $("#email").keyup(function (e){
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function(){
                        check_username_ajax(user_name);
                    }, 1000);
                }); 
            
                function check_username_ajax(username){
                    $("#email-result").html('<img src="images/ajax-loader.gif" />');
                    $.get('username_checker', {'email':username}, function(data) {
                      $("#email-result").html(data);
                    });
                }
            });
        </script>
        
    </head>
    <body>
        <div id='MainContainer'>
            <% request.getRequestDispatcher("link.html").include(request,response); %>
            <div id='main-body'>
                <h1>New User</h1>
                <form action='add_user' method='POST'>
                    <!--User Type:
                    <select name='user_type'>
                        <option value='admin'>admin</option>
                        <option value='instructor'>instructor</option>
                        <option value='student'>student</option>
                    </select><br><br>-->
                    First name:<input type='text' name='first_name'><br>
                    Last name:<input type='text' name='last_name'><br>
                    Username:<input id='username' type='text' name='username'><span id='user-result'></span><br>
                    Password:<input type='password' name='password'><br>
                    Phone:<input type='text' name='phone' ><br>
                    Date Of Birth:<input type='text' id='datepicker' name='date_of_birth'><br>
                    E-mail:<input type='text' id='email' name='email' placeholder='abc@example.com'><span id='email-result'></span><br>
                    <input type='submit' id='btnValidate' value='Submit'>
                </form>
            </div>
            <div id='footer'>
            </div>
        </div>
    </body>
</html>