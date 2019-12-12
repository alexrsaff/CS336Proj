<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>

<%
	//String userid = (String)session.getAttribute("username");
	//session.setAttribute("username", userid);
	//out.println("<h2>" + "Welcome "+ userid + "</h2>");
%>

<body>
	<p>
	Please select a reservation to make for the user:
    </p>
    
	<br>
	<form method="post" action="makeOneWay.jsp">
		<button type="submit">One Way</button> 
    </form>
    
    <br>
    <form method="post" action="makeRoundTrip.jsp">
		<button type="submit">Round Trip</button> 
	</form>
</body>
</html>