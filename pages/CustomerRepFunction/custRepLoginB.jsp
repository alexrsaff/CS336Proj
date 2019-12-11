<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
  <body>
    <%
    String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempFour";
	Connection connection = null;
    PreparedStatement preparedStatement = null;
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(url, "Application", "JAAYS");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
            String q = "SELECT * FROM Person p, CustomerRep c WHERE p.username = c.username AND p.username = ? AND c.password = ?";
            preparedStatement = connection.prepareStatement(q);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs;
            rs = preparedStatement.executeQuery();
            if (!rs.next()) {
                out.println("Lol Good Try");
                out.println("Invalid username or password <a href='custRepLogin.jsp'>try again</a>");
            }
            else {
                session.setAttribute("username", username);
                out.println("welcome " + username);
                out.println("<a href='logout.jsp'>Log out</a>");
                response.sendRedirect("manageInfo.jsp");
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