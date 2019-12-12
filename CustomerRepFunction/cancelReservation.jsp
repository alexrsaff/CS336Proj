<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <title>Cancel Reservation</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");
            String username = request.getParameter("username");
            String q;
            PreparedStatement ps;
            ResultSet rs;
            q = "SELECT ticketNumber FROM Buy WHERE username = ?";
            
            ps = connection.prepareStatement(q);
            ps.setString(1, username);
            
            rs = ps.executeQuery();
            if (rs.next()){ //customer has bought tickets
                q = "SELECT ticketNumber FROM Buy WHERE username = ?";
                
                ps = connection.prepareStatement(q);
                ps.setString(1, username);
                rs = ps.executeQuery();
                %>
                <table>
                    <tr>
                        <td width = 200px>Ticket Number</td>
                    </tr>
                <%
                while (rs.next()) {
                %>
                    <tr>
                        <td>
                            <%=rs.getString("ticketNumber")%>
                        </td>
                    </tr>
                <%
                }
            }
            else {
                out.println("You have no reservations to cancel. <a href = 'login.jsp'>Back to Login.</a>");
            }
	    } catch (Exception e) {
			out.print(e);
		}
	    %>
    </body>
</html>