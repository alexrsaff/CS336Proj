<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
  <body>
    <%
    String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
	Connection connection = null;
    PreparedStatement preparedStatement = null;
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(url, "Application", "JAAYS");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
            String q = "SELECT * FROM Person p, Administrator a WHERE p.username = a.username AND p.username = ? AND p.password = ?";

            preparedStatement = connection.prepareStatement(q);

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet rs;
            rs = preparedStatement.executeQuery();
            if (!rs.next()) {
                out.println("u done fucked");
                out.println("Invalid username or password <a href='adminLogin.jsp'>try again</a>");
            }
            else {
                session.setAttribute("username", username);
                out.println("welcome " + username);
                out.println("<a href='logout.jsp'>Log out</a>");
                response.sendRedirect("loginSuccess.jsp");
            }
        }
        else {
            out.println("ah");
        }
    }

    catch(Exception e) {
        out.print("<p>Server Connection Error.</p>");
        e.printStackTrace();
    } 

    finally {
        try { preparedStatement.close(); } catch (Exception e) {}
        try { connection.close(); } catch (Exception e) {}
    }
    %>
  </body>
</html>