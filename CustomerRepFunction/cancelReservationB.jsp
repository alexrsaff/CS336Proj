<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cancel Reservation</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection = DriverManager.getConnection(url, "Application", "JAAYS");
            Statement statement = conn.createStatement();
            PreparedStatement ps;
            String ticketNumber = request.getParameter("ticketNumber");
            String query = "SELECT t.class FROM TicketFor AS t WHERE t.ticketNumber = ?";
            ps = connection.prepareStatement(query);
            ps.setString(1, ticketNumber);
            ResultSet rs = ps.executeQuery();
            String class;
            if(rs.next()==false) {
                System.out.println("The ticket number does not exist in the database.")
            }else{
                class = rs.getString(1);

            }
            if (class.equals("business") || class.equals("first")){
                String q = "DELETE FROM TicketFor WHERE ticketNumber = ?"
                String q2 = "DELETE FROM Ticket WHERE ticketNumber = ?"
                ps = connection.prepareStatement(q);
                ps.setString(1,ticketNumber);
                rs = ps.executeQuery();
                ps = connection.prepareStatement(q2);
                ps.setString(1,ticketNumber);
                rs = ps.executeQuery();
                out.prinln("Reservation Cancelled");
                return;

            }else{
                out.println("You cannot cancel this reservation. Only Business and First Class reservations may be cancelled.")
                out.println("<a href='login.jsp'>Return to Login</a>")"

            }
             

        </body>
        </html>
        <%
        output.close();
        conn.close();
		} catch (Exception e) {
			out.print(e);
        }
        
	%>