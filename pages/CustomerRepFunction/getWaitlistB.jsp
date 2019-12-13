<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <title>Check Waitlist of Flight</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");
            String flightNumber = request.getParameter("flightNumber");
            String airlineID = request.getParameter("airlineID");
            String q;
            PreparedStatement ps;
            ResultSet rs;
            q = "SELECT count(*) FROM Flight AS f, Airline AS a WHERE f.airlineID = a.airlineID AND f.flightNumber = ? AND a.airlineID = ?";
            
            ps = connection.prepareStatement(q);
            ps.setString(1, flightNumber);
            ps.setString(2, airlineID);
            
            rs = ps.executeQuery();
            rs.next();
            String cnt = rs.getString(1);
            if (!cnt.equals("0")){ //flight of airline exists
                q = "SELECT w.username FROM Waitlist w WHERE w.flightNumber = ? AND w.airlineID = ?";
                
                ps = connection.prepareStatement(q);
                ps.setString(1, flightNumber);
                ps.setString(2, airlineID);
                rs = ps.executeQuery();
                %>
                <table border="3" style=color:black cellspacing="2" cellpadding="2">
                    <tr style=color:pink>
                    <tr>
                        <TH width = 200px>Usernames on Waitlist:</Th>
                    </tr>
                <%

                while (rs.next()) {
                %>
                    <tr>
                        <td>
                            <%=rs.getString("w.username")%>
                        </td>

                    </tr>
                <%
                }
                out.println("<a href = 'manageInfo.jsp'>Return</a>");
            }
            else {
                out.println("The flight you're searching for does not exist, <a href = 'getWaitlist.jsp'>please try again.</a>");
            }
	    } catch (Exception e) {
			out.print(e);
		}
	    %>
    </body>
</html>