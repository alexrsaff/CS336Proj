<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
    
<body>
<%
    String userid = (String)session.getAttribute("username");
    out.println("<h2>" + "Welcome "+ userid + "</h2>");
    session.setAttribute("username", userid);
%>

<p>Select what you would like to do:</p>

<button onclick="location.href = 'SearchFlight.jsp';" type="submit">Search Flight</button>
<button onclick="location.href = 'viewReservations.jsp';" type="submit">View Reservations</button>
<h1></h1>
<button onclick="location.href = 'logout.jsp';" type="submit">Logout</button>

</body>
</html>