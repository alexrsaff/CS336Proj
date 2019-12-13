<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <title>Cancel Reservation</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");
            int ticketNumber = Integer.parseInt(request.getParameter("ticketNumber"));
            String q;
            PreparedStatement ps;
            ResultSet rs;
            q = "SELECT class FROM TicketFor WHERE ticketNumber = ?";
            ps = connection.prepareStatement(q);
            ps.setInt(1,ticketNumber);
            rs = ps.executeQuery();
            rs.next();
            String c = rs.getString("class");
            int outcome = 0;
            if (c.equals("business") || c.equals("Business")){
                out.println("Your ticket is business class.");
                String query = "DELETE FROM TicketFor WHERE ticketNumber = ?";
                ps = connection.prepareStatement(query);
                ps.setInt(1,ticketNumber);
                outcome = ps.executeUpdate();
                int outcome2 = 0;
                if(outcome == 0){
                    out.println("Ticket Cancellation Failure");
                    return;
                }else{
                    String query2 = "DELETE FROM Buy WHERE ticketNumber = ?";
                    ps = connection.prepareStatement(query2);
                    ps.setInt(1,ticketNumber);
                    outcome2 = ps.executeUpdate();
                    int outcome3 = 0;
                    if(outcome2 == 0){
                        out.println("Deletion from Buy Failure");
                        return;
                    }else{
                        String query3 = "DELETE FROM Ticket WHERE ticketNumber = ?";
                        ps = connection.prepareStatement(query3);
                        ps.setInt(1,ticketNumber);
                        outcome3 = ps.executeUpdate();
                        if(outcome3 == 0){
                            out.println("Deletion from Ticket Failure");
                            return;
                        }else{
                            out.println("Your Ticket has been successfully cancelled.");
                            out.println("<a href='customerLogin.jsp'>Return to Login</a>");
                            return;
                        }
                    }
        
                }
            }else if(c.equals("first") || c.equals("First")){
                out.println("Your ticket is first class.");
                String query = "DELETE FROM TicketFor WHERE ticketNumber = ?";
                ps = connection.prepareStatement(query);
                ps.setInt(1,ticketNumber);
                outcome = ps.executeUpdate();
                int outcome2 = 0;
                if(outcome == 0){
                    out.println("Ticket Cancellation Failure");
                    return;
                }else{
                    String query2 = "DELETE FROM Buy WHERE ticketNumber = ?";
                    ps = connection.prepareStatement(query2);
                    ps.setInt(1,ticketNumber);
                    outcome2 = ps.executeUpdate();
                    int outcome3 = 0;
                    if(outcome2 == 0){
                        out.println("Deletion from Buy Failure");
                        return;
                    }else{
                        String query3 = "DELETE FROM Ticket WHERE ticketNumber = ?";
                        ps = connection.prepareStatement(query3);
                        ps.setInt(1,ticketNumber);
                        outcome3 = ps.executeUpdate();
                        if(outcome3 == 0){
                            out.println("Deleteion from Ticket Failure");
                            return;
                        }else{
                            out.println("Your Ticket has been successfully cancelled.");
                            out.println("<a href='customerLogin.jsp'>Return to Login</a>");
                            return;
                        }
                    }
                    

                }

                
            }else{
                out.println("Your ticket cannot be cancelled. Only business class or first class tickets may be cancelled.");
                out.println("Have a good day");
                
                out.println("<a href='cancelReservationF.jsp'>Return to Cancel Reservations</a>");
                return;
            }
            
	    } catch (Exception e) {
			out.print(e);
        }
        
	%>
    </body>
</html>