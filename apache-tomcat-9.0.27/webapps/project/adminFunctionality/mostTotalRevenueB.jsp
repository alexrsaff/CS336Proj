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
            FROM Buy b LEFT JOIN Person p ON b.username = p.username
            LEFT JOIN Ticket t ON b.ticketNumber = t.ticketNumber
            GROUP BY p.username
            ORDER BY revenue DESC";

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
                    <td><%=rs.getString("username")%></td>
                    <td><%=rs.getString("revenue")%></td>
                </tr>
            <%
            }
            %>
            </table>
            <br>
            <%

            rs.close();
        ps.close();
        connection.close();

            out.println("<a href = 'adminNavigation.jsp'>back to navigation</a>");
	    } catch (Exception e) {
			out.print(e);
		}
	%>
    </body>
</html>