<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
    <body>
        <h2>Hello customer Representative</h2>

        <form method="post" action="custRepLoginB.jsp">
            <div class="container">
                <label for="uname"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="username" required>
        
                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>
                    
                <button onclick="location.href = 'custRepLoginB.jsp';" type="submit">Login</button>
            </div>
        </form>
    </body>
</html>