<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <title>Admin: Most Active Flights</title>
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

            q = "SELECT f.airlineID, f.flightNumber, count(tf.ticketNumber) AS freq FROM TicketFor tf LEFT JOIN Flight f ON f.flightNumber = tf.flightNumber AND f.airlineID = tf.airlineID GROUP BY f.flightNumber ORDER BY freq DESC";

            ps = connection.prepareStatement(q);
            rs = ps.executeQuery();

            %>
            <table>
                <tr>
                    <td width = 300px>Airline</td>
                    <td width = 300px>Flight Number</td>
                    <td width = 300px>Tickets Sold</td>
                </tr>
            <%
            while (rs.next()) {
            %>
                <tr>
                    <td><%=rs.getString("airlineID")%></td>
                    <td><%=rs.getString("flightNumber")%></td>
                    <td><%=rs.getString("freq")%></td>
                </tr>
            <%
            }
            %>
            </table>
            <br>
            <%
	    } catch (Exception e) {
			out.print(e);
		}
	%>
    </body><br>
    <input type="button" onclick="window.location.href='../adminFunctionality/adminNavigation.jsp'" value="Back to admin navigation page">
</html>