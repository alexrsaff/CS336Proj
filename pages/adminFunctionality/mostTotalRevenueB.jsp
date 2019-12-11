<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <title>Admin: Most Active Flights</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");

            String q;
            PreparedStatement ps;
            ResultSet rs;

            q = "SELECT p.username, sum(t.bookingFee) AS revenue
            FROM Person p INNER JOIN Buy b ON p.username=b.username
            INNER JOIN Ticket t on b.ticketNumber=t.ticketNumber
            ORDER BY revenue DESC";

            <!-- old -->
            SELECT c.username, f.flightNumber, count(f.flightNumber) AS freq 
            FROM Airline a INNER JOIN Flight f ON a.airlineID = f.airlineID 
            GROUP BY a.airlineID, f.flightNumber ORDER BY freq DESC;
            




            ps = connection.prepareStatement(q);
            rs = ps.executeQuery();

            %>
            <table>
                <tr>
                    <td width = 300px>Customer</td>
                    <td width = 300px>Revenue Generated</td>
                </tr>
            <%
            while (rs.next()) {
            %>
                <tr>
                    <td><%=rs.getString("__________")%></td>
                    <td><%=rs.getString("_________")%></td>
                </tr>
            <%
            }
            %>
            </table>
            <br>
            <%

            out.println("<a href = 'adminNavigation.jsp'>back to navigation</a>");
	    } catch (Exception e) {
			out.print(e);
		}
	%>
    </body>
</html>