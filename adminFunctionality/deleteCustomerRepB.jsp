<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
            <title>Admin: Delete Customer Representative</title>
        </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs;
        int outcome = 0;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");
            String username = request.getParameter("username");

            String q1 = "SELECT count(*) FROM Person p, CustomerRep cr WHERE p.username = cr.username AND p.username = ?";

            ps = connection.prepareStatement(q1);
            ps.setString(1, username);

            rs = ps.executeQuery();
            rs.next();
            String cnt = rs.getString(1);

            if(cnt.equals("1")) {
                String q2 = "DELETE FROM CustomerRep WHERE username = ?";

                ps = connection.prepareStatement(q2);
                ps.setString(1, username);

                outcome = ps.executeUpdate();

                out.println("Deleted from CustomerRep.");

                outcome = 0;
                String q3 = "DELETE FROM Person WHERE username = ?";

                ps = connection.prepareStatement(q3);
                ps.setString(1, username);

                outcome = ps.executeUpdate();

                out.println("Deleted from Person.");
            }
            else {
                out.println("The username does not exist, <a href='deleteCustomerRep.jsp'>please try again.</a>");
            }
		} catch (Exception e) {
			out.print(e);
		}
    %>
    <input type="button" onclick="window.location.href='../project/login.jsp'" value="Back to admin navigation page">

    </body>
</html>