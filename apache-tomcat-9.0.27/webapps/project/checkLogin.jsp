<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
    <head>
        <title>Check Login</title>
    </head>

    <body>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection connection = DriverManager.getConnection(url, "Application", "JAAYS");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String q = "SELECT * FROM Person WHERE username = ? AND password = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(q);

        preparedStatement.setString(1, username);
        preparedStatement.setString(2, request.getParameter("password"));

        ResultSet rs;
        rs = preparedStatement.executeQuery();
        if (rs.next()) {
            session.setAttribute("username", username);
            out.println("welcome " + username);
            out.println("<a href='logout.jsp'>Log out</a>");
            response.sendRedirect("customerLogin.jsp");
        } else {
            out.println("Invalid password <a href='login.jsp'>try again</a>");
        }
    %>
    </body>
</html>