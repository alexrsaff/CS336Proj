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

            q = "SELECT UN as username, MAX(revenue) as maxRevenue FROM(SELECT P.username AS un, SUM(IF(TF.class='first',F.firstClassFare,0) + IF(TF.class='economy',F.economyClassFare,0) + IF(TF.class='business',F.businessClassFare,0) + T.bookingFee) AS Revenue FROM Flight F LEFT JOIN TicketFor TF ON F.flightNumber = TF.flightNumber AND F.airlineID = TF.airlineID LEFT JOIN Ticket T ON TF.ticketNumber = T.ticketNumber RIGHT JOIN Buy B ON TF.ticketNumber = B.ticketNumber LEFT JOIN Person P ON B.username = P.username GROUP BY P.username) AS indvRev";

            ps = connection.prepareStatement(q);
            rs = ps.executeQuery();
            rs.next();
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