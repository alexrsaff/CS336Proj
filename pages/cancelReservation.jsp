<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cancel Reservation</title>
    </head>
    <body>
        <%
        PreparedStatement psa = null;
        Connection connection = null;
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");
            String q;
            ResultSet rs;
            String username = request.getParameter("username");
            
            q = "SELECT b.ticketNumber FROM Buy AS b WHERE b.username = ?";
            psa = connection.prepareStatement(q);
            psa.setString(1,username);
            rs = psa.executeQuery();
            if(rs.next()==false) {
                System.out.println("The username does not exist in the database.");
            }
            else {
            %>
            <table border="2">
                    <tr>
                        <th>Ticket Number</th>
                    </tr>
                <%
                do {
                %>
                    <tr>
                        <td> <%= rs.getString("ticketNumber") %></td>
                    </tr>
                <%
                } while (rs.next());
                %>
            }
        </table>
        <p>Enter Ticket Number</p>
        <form action = "cancelReservationB.jsp" method = "POST">
            <input type="text" name="ticketNumber" placeholder="Enter the ticket number" required maxlength="10">
            <br>
            <input type="submit" value="Submit"/>
            <br>
            <a href='customerLogin.jsp'>Return to login</a>
        </form>
        </body>
        </html>
        <%
        connection.close();
    }
		} catch (Exception e) {
			out.print(e);
        }
        
	%>