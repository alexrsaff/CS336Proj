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
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(url, "Application", "JAAYS");
            String newValue = request.getParameter("username");
            PreparedStatement ps;
            ResultSet rs;
            
            System.out.println("test 1");

            String q = "SELECT t4.ticketNumber, t4.airlineID, t4.flightNumber, b.time, b.date, t4.class, t4.seatNumber, t4.meal FROM TicketFor t4, Buy b WHERE t4.ticketNumber=b.ticketNumber AND b.username = ?";
            ps = conn.prepareStatement(q);
            ps.setString(1,newValue);

            System.out.println("test 2");
            System.out.println(q);

            rs = ps.executeQuery();
            rs.next();
            //ResultSet rs = statement.executeQuery(q);
            System.out.println("test 3");

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
                        <td> <%= rs.getString("ticketNumber") %></td>
                        <td> <%= rs.getString("airlineID") %></td>
                        <td> <%= rs.getString("flightNumber") %></td>
                        <td> <%= rs.getString("time") %></td>
                        <td> <%= rs.getString("date") %></td>
                        <td> <%= rs.getString("class") %></td>
                        <td> <%= rs.getString("seatNumber") %></td>
                        <td> <%= rs.getString("meal") %></td>
                    </tr>
                <%
                } 
            } %>
        </table>
        </body>
        </html>
        <%
        rs.close();
        conn.close();
		} catch (Exception e) {
			System.out.print(e);
		}
    %>