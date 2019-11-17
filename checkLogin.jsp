<%@ page import ="java.io.*,java.util.*,java.sql.*" %>
<html>
    <head>
        <title>Check Login</title>
    </head>

    <body>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(
            "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com", 
            "Application", "JAAYS");

        String username = request.getParameter("user_name");   
        String password = request.getParameter("password");
        Statement st = connnection.createStatement();

        ResultSet rs;
        rs = st.executeQuery("
            select * from users 
            where username='" + username + "' 
            and password='" + password + "'");
        if (rs.next()) {
            session.setAttribute("user", username); // the username will be stored in the session
            out.println("welcome " + username);
            out.println("<a href='logout.jsp'>Log out</a>");
            <!-- response.sendRedirect("success.jsp"); -->
        } else {
            out.println("Invalid password <a href='login.jsp'>try again</a>");
        }
    %>
    </body>
</html>