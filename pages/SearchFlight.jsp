<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>

<%
	String userid = (String)session.getAttribute("username");
	session.setAttribute("username", userid);
	out.println("<h2>" + "Welcome "+ userid + "</h2>");
%>

<body>
	<p>
	Please Select a Trip Type below (*Required):
    </p>
    
	<br> <br>
	<form method="post" action="searchOneWay.jsp">
		<button type="submit">One Way</button> 
    </form>
    
    <br>
    <form method="post" action="searchRoundTrip.jsp">
		<button type="submit">Round Trip</button> 
	</form>
</body>
</html>