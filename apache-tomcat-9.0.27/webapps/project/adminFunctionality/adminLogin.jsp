<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
    <head>
        <h1>hi, admin!</h1>
    </head>

    <body>
        <h2>hewo admin :3</h2>

        <form method="post" action="checkAdminLogin.jsp">
            <div class="container">
                <label for="uname"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="username" required>
        
                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>
                    
                <button onclick="location.href = 'checkAdminLogin.jsp';" type="submit">Login</button>
            </div>
        </form>
    </body>
</html>