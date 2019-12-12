<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <title>Admin: Most Total Revenue</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");

            String q;
            PreparedStatement ps;
            ResultSet rs;

            q = "SELECT un as username, MAX(revenue) as maxRevenue FROM(SELECT p.username AS un, SUM(f.firstClassFare + f.economyClassFare + f.businessClassFare + t.bookingFee) AS revenue FROM Flight f LEFT JOIN TicketFor tf ON f.flightNumber = tf.flightNumber AND f.airlineID = tf.airlineID LEFT JOIN Ticket t ON tf.ticketNumber = t.ticketNumber RIGHT JOIN Buy b ON tf.ticketNumber = b.ticketNumber LEFT JOIN Person p ON b.username = p.username GROUP BY p.username HAVING p.username IS NOT NULL) AS indvRev;";
            ps = connection.prepareStatement(q);
            rs = ps.executeQuery();

            %>
            <table>
                <tr>
                    <td width = 300px>Customer</td>
                    <td width = 300px>Revenue Generated</td>
                </tr>
                <tr>
                    <td><%=rs.getString("username")%></td>
                    <td><%=rs.getString("maxRevenue")%></td>
                </tr>
            </table>
            <br>
            <input type="button" onclick="window.location.href='../adminFunctionality/adminNavigation.jsp'" value="Back to admin navigation page">
            <%
	    } catch (Exception e) {
			out.print(e);
		}
	%>
    </body>
</html>