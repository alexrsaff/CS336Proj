<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cancel Reservation</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection = DriverManager.getConnection(url, "Application", "JAAYS");
            Statement statement = conn.createStatement();
            String newValue = request.getParameter("username");
            
            String q = "SELECT b.ticketNumber 
            FROM Buy b
            WHERE b.username = newValue";
            ResultSet rs = statement.executeQuery(q);
            if(rs.next()==false) {
                System.out.println("The username does not exist in the database.")
            }
            else {
            %>
            <table border="1">
                    <tr>
                        <th>Ticket Number</th>
                    </tr>
                <%
                do {
                %>
                    <tr>
                        <td> <%= output.getString("ticketNumber") %></td>
                    </tr>
                <%
                } while (rs.next());
                %>
            }
        </table>
        <h1>Enter Ticket Number</h1>
        <form action = "cancelReservationB.jsp" method = "POST">
            <input type="text" name="ticketNumber" placeholder="Enter the ticket number" required maxlength="10">
            <br>
            <input type="submit" value="Submit"/>
            <br>
            <a href='login.jsp'>Return to login</a>
        </form>
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