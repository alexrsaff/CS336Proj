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

            q = "SELECT a.airlineID, f.flightNumber, count(f.flightNumber) AS freq FROM Airline a INNER JOIN Flight f ON a.airlineID = f.airlineID GROUP BY a.airlineID, f.flightNumber ORDER BY freq DESC";

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
                    <td><%=rs.getString("a.airlineID")%></td>
                    <td><%=rs.getString("f.flightNumber")%></td>
                    <td><%=rs.getInt("freq")%></td>
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