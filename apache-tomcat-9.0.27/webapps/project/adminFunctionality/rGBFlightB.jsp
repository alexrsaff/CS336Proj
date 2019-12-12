<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <title>Admin: Find Revenue Generated By</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");

            String flightNumber = request.getParameter("flightNumber");
            String airline = request.getParameter("airline");
            String q;
            PreparedStatement ps;
            ResultSet rs;

            q = "SELECT count(*) FROM Flight f, Airline a WHERE f.airlineID = a.airlineID AND f.flightNumber = ? AND a.airline = ?";
            
            ps = connection.prepareStatement(q);
            ps.setString(1, flightNumber);
            ps.setString(2, airline);
            
            rs = ps.executeQuery();
            rs.next();
            String cnt = rs.getString(1);

            if (!cnt.equals("0")){ //flight of airline exists
                q = "SELECT f.flightNumber, t.bookingFee FROM Flight f, TicketFor tf, Ticket t WHERE f.flightNumber = tf.flightNumber AND tf.ticketNumber = t.ticketNumber AND f.flightNumber = ? f.airlineID = ?";
                
                ps = connection.prepareStatement(q);
                ps.setString(1, flightNumber);
                ps.setString(2, airline);

                rs = ps.executeQuery();
                %>
                <table>
                    <tr>
                        <td width = 200px>Flight Number</td>
                        <td width = 500px>Amount of Each Ticket</td>
                    </tr>
                <%
                while (rs.next()) {
                %>
                    <tr>
                        <td>
                            <%=rs.getString("f.flightNumber")%>
                        </td>
                        <td>
                            <%=rs.getFloat("t.bookingFee")%>
                        </td>
                    </tr>
                <%
                }
                q = "SELECT SUM(t.bookingFee) FROM Flight f, TicketFor tf, Ticket t WHERE f.flightNumber = tf.flightNumber AND tf.ticketNumber = t.ticketNumber AND f.flightNumber = ? AND f.airlineID = ?";
                ps = connection.prepareStatement(q);
                ps.setString(1, flightNumber);
                ps.setString(2, airline);
                rs = ps.executeQuery();
                %>
                    <tr padding = 10px 0px 0px>
                        <td>Total Sales:</td>
                        <td><%=rs.getFloat("SUM(t.bookingFee)")%></td>
                    </tr>
                </table>
                <%
            }
            else {
                out.println("The flight you're searching for does not exist, <a href = 'rGBFlight.jsp'>please try again.</a>");
            }
	    } catch (Exception e) {
			out.print(e);
		}
	    %>
    </body>
</html>