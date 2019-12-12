<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
  <body>
    <%
    String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
	Connection connection = null;
    PreparedStatement preparedStatement = null;
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection(url, "Application", "JAAYS");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
            String q = "SELECT * FROM Person AS p, CustomerRep AS c WHERE p.username = c.username AND p.username = ? AND p.password = ?";
            preparedStatement = connection.prepareStatement(q);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs;
            rs = preparedStatement.executeQuery();

            if (rs.next()) {                
                response.sendRedirect("manageInfo.jsp");
            }
            else {
                out.println("Invalid username or password <a href='custRepLogin.jsp'>try again</a>");
            }
        }
        else {
            out.println("Enter username or password");
        }
    }
    catch(Exception e) {
        e.printStackTrace();
    } 
    finally {
        try { preparedStatement.close(); } catch (Exception e) {}
        try { connection.close(); } catch (Exception e) {}
    }
    %>
  </body>
</html>