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

</body>
</html>