<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin: Generate Reservation List by Username</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url, "Application", "JAAYS");
            Statement statement = conn.createStatement();
            String newValue = request.getParameter("username");
            
            String q = "SELECT t4.ticketNumber, t4.airlineID, t4.flightNumber, b.time, b.date, t4.class, t4.seatNumber, t4.meal FROM TicketFor t4, Buy b WHERE t4.ticketNumber=b.ticketNumber AND buy.username = newValue";

            ResultSet rs = statement.executeQuery(q);
            if(rs.next()==false) {
                System.out.println("The username does not exist in the database.");
            }
            else {
            %>
            <table border="1">
                    <tr>
                        <th>Ticket Number</th>
                        <th>Airline ID</th>
                        <th>Flight Number</th>
                        <th>Time</th>
                        <th>Date</th>
                        <th>Class</th>
                        <th>Seat Number</th>
                        <th>Meal</th>
                    </tr>
                <%
                while (rs.next()) {
                %>
                    <tr>
                        <td> <%= output.getString("ticketNumber") %></td>
                        <td> <%= output.getString("airlineID") %></td>
                        <td> <%= output.getString("flightNumber") %></td>
                        <td> <%= output.getString("time") %></td>
                        <td> <%= output.getString("date") %></td>
                        <td> <%= output.getString("class") %></td>
                        <td> <%= output.getString("seatNumber") %></td>
                        <td> <%= output.getString("meal") %></td>
                    </tr>
                <%
                } 
                %>
            }
        </table>
        </body>
        </html>
        <%
        output.close();
        statement.close();
        conn.close();
		} catch (Exception e) {
			out.print(e);
		}
    %>