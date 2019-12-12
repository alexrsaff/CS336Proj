<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>

<%
    String userid = (String)session.getAttribute("username");
    session.setAttribute("username", userid);
    out.println("<h2>" + "Welcome "+ userid + "</h2>");
%>

<body>

	<%
    String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    String airlineBooked = (String)session.getAttribute("airlineBooked");
    String flightNumber = (String)session.getAttribute("flightNumberBooked");
    String classBooked = (String)session.getAttribute("classBooked");
    session.setAttribute("airlineBooked", airlineBooked);
    session.setAttribute("flightNumberBooked", flightNumber);
    session.setAttribute("classBooked", classBooked);

    %>

    <form method="post" action="finishOneWayCheckout.jsp">
        <text>Enter your special meal preferences (if any): </text>
        <input type="text" name="specialMeal"><br>
        <input type="submit" value="Finish!">
    </form>
    
    <br>
    <br>
</body>
</html>