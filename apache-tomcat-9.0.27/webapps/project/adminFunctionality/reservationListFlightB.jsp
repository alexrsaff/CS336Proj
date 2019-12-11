<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin: Generate Reservation List by Flight Number</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection = DriverManager.getConnection(url, "Application", "JAAYS");
            Statement statement = conn.createStatement();
            String airline = request.getParameter("airline");
            String flightnum = request.getParameter("flightnum");
            
            String q = "SELECT p.fname, p.lname, p.username, t4.seatNumber, b.time, b.date, t4.ticketNumber
            FROM Person p, Customer c, Buy b, TicketFor t4, Flight f 
            WHERE p.username = c.username 
            AND b.username = c.username 
            AND b.ticketNumber = t4.ticketNumber
            AND t4.flightNumber = f.flightNumber
            AND f.flightNumber = flightnum
            AND f.airlineID = airline";

            ResultSet rs = statement.executeQuery(q);
            if(rs.next()==false) {
                System.out.println("The airline or flight does not exist in the database.")
            }
            else {
            %>
            <table border="1">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                        <th>Seat Number</th>
                        <th>Time</th>
                        <th>Date</th>
                        <th>Ticket Number</th>
                    </tr>
                <%
                do {
                %>
                    <tr>
                        <td> <%= output.getString("fname") %></td>
                        <td> <%= output.getString("lname") %></td>
                        <td> <%= output.getString("username") %></td>
                        <td> <%= output.getString("seatNumber") %></td>
                        <td> <%= output.getString("time") %></td>
                        <td> <%= output.getString("date") %></td>
                        <td> <%= output.getString("ticketNumber") %></td>
                    </tr>
                <%
                } while (rs.next());
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