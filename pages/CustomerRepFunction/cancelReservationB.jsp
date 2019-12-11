<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cancel Reservation</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempFour";
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection = DriverManager.getConnection(url, "Application", "JAAYS");
            Statement statement = conn.createStatement();
            String ticketNumber = request.getParameter("ticketNumber");
            
            String q = "SELECT t.class 
            FROM TicketFor t
            WHERE t.ticketNumber = ticketNumber";
            ResultSet rs = statement.executeQuery(q);
            if(rs.next()==false) {
                System.out.println("The ticket number does not exist in the database.")
            }
            else if  {
            
                } while (rs.next());
                %>
            }

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