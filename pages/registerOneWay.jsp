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
    session.setAttribute("airlineBooked", airlineBooked);
    session.setAttribute("flightNumberBooked", flightNumber);
    session.setAttribute("classBooked", classBooked);

    out.println("<text>Your want to fly with airline: " + airlineBooked + "</text><br>");
    out.println("<text>On flight number: " + flightNumber + "</text><br>");
    out.println("<text>With class: " + classBooked + "</text><br>");

    String str = "SELECT f.airlineID, f.flightNumber, f.domInt, f.departTime, f.departDate, f.arriveTime, f.arriveDate, d.airportID, a.airportID as arriveairportID, f.economyClassFare, f.businessClassFare, f.firstClassFare FROM Flight as f, Departs as d, Arrives as a WHERE f.flightNumber=d.flightNumber AND f.flightNumber=a.flightNumber AND f.airlineID=d.airlineID AND f.airlineID=a.airlineID";
    String strconcat = " AND f.airlineID = ('" + airlineBooked + "')";
    String strconcat2 = " AND f.flightNumber = ('" + flightNumber + "')";
    str = str + strconcat + strconcat2 + ";";

    try{

        Class.forName("com.mysql.jdbc.Driver"); 
        connection = DriverManager.getConnection(url, "Application", "JAAYS");
        preparedStatement = connection.prepareStatement(str);
        ResultSet rs;
        rs = preparedStatement.executeQuery();
        if (rs.next()) {
            //Must check that the occupancy of the flight is okay
            //Must edit all the tables and add the person for ticket and stuff like that
            out.println("<a href='oneWayCheckout.jsp'>Proceed to checkout</a>");
        } else {
            out.println("No such flight exists. <a href='searchOneWay.jsp'>Please try again.</a>");
        }
    } catch (Exception e) {
        out.print(e);
    }

    %>
    
    <br>
    <br>
</body>
</html>