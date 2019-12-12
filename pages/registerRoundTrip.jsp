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
    
    String airlineBooked = request.getParameter("airlineBooked");
    String flightNumber = request.getParameter("flightNumberBooked");
    String classBooked = request.getParameter("classBooked");

    out.println("<text>" + airlineBooked + "</text>");
    out.println("<text>" + flightNumber + "</text>");
    out.println("<text>" + classBooked + "</text>");

    session.setAttribute("airline", airlineBooked);
    session.setAttribute("flightNumber", flightNumber);
    session.setAttribute("classBooked", classBooked);

    %>
    
    <br>
    <br>

    <form method="post" action="searchRoundTripback.jsp">
        <input type="submit" value="Click here to book trip back">
    </form>


</body>
</html>