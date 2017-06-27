<!DOCTYPE html>
    <head>
        <title>Access Home</title>
        <link type="text/css" rel="stylesheet" href="css/mailbox.css">
        <link type="text/css" rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <div id='MainContainer'>
            <% request.getRequestDispatcher("link.html").include(request,response); %>
            <div id='main-body'>
                <h1>Access Home page</h1>
                <table class="container">
                    <tr>
                        <td><a href='manage_user_access'>Manage User access</a></td>
                        <td><a href='manage_access_group'>Manage Access Groups</a></td>
                    </tr>
                    <tr>
                        <td><a href='add_access_group'>Add an Access Group</a></td>
                        <td><a href='new_user.jsp'>Add New User</a></td>
                    </tr>
                </table>
            </div>
            <div id='footer'>
            </div>
        </div>
    </body>
</html>