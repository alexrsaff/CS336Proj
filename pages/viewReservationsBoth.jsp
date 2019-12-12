<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
    <head>
        <title>View Reservations Security Login Check</title>
    </head>
    <body>
        <h1>View Your Reservations:</h1>
            <%
            String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
            Connection conn = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection(url, "Application", "JAAYS");
                String username = request.getParameter("username");
                PreparedStatement ps;
                ResultSet rs;
                String q;
                String dt;
                dt = "SELECT NOW()";
                
                q = "SELECT count(*) FROM Person p, Customer c, Buy b, TicketFor t4, Flight f WHERE p.username = c.username AND b.username = c.username AND b.ticketNumber = t4.ticketNumber AND t4.flightNumber = f.flightNumber AND f.flightNumber = ? AND f.airlineID = ?";
                ps = conn.prepareStatement(q);
                ps.setString(1,flightnum);
                ps.setString(2,airline);
    
                rs = ps.executeQuery();
                rs.next();
    
                String cnt = rs.getString(1);
    
                if(!cnt.equals("0")) {
                    q = "SELECT p.fname, p.lname, p.username, t4.seatNumber, b.time, b.date, t4.ticketNumber FROM Person p, Customer c, Buy b, TicketFor t4, Flight f WHERE p.username = c.username AND b.username = c.username AND b.ticketNumber = t4.ticketNumber AND t4.flightNumber = f.flightNumber AND f.flightNumber = ? AND f.airlineID = ?";
                    ps = conn.prepareStatement(q);
                    rs = ps.executeQuery();
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
                    while(rs.next()) {
                    %>
                    <tr>
                        <td> <%= rs.getString("fname") %></td>
                        <td> <%= rs.getString("lname") %></td>
                        <td> <%= rs.getString("username") %></td>
                        <td> <%= rs.getString("seatNumber") %></td>
                        <td> <%= rs.getString("time") %></td>
                        <td> <%= rs.getString("date") %></td>
                        <td> <%= rs.getString("ticketNumber") %></td>
                    </tr>
                </table>
                    <%
                    }
                }
                else{
                    out.println("The airline or flight does not exist in the database.");
                }
                %>        
            </body>
            </html>
            <%
            rs.close();
            conn.close();
            } catch (Exception e) {
                out.print(e);
            }
        %>
