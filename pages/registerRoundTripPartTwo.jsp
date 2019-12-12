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
    
    //Second plane information
    String airlineBooked = request.getParameter("airlineBooked");
    String flightNumber = request.getParameter("flightNumberBooked");
    String classBooked = request.getParameter("classBooked");
    session.setAttribute("airlineBooked", airlineBooked);
    session.setAttribute("flightNumberBooked", flightNumber);
    session.setAttribute("classBooked", classBooked);

    //First plane information
    String firsttripAirline = (String)session.getAttribute("firstairlineBooked");
    String firsttripNumber = (String)session.getAttribute("firstflightNumberBooked");
    session.setAttribute("firstairlineBooked", firsttripAirline);
    session.setAttribute("firstflightNumberBooked", firsttripNumber);
    String firstclassBooked = (String)session.getAttribute("firstclassBooked");
    session.setAttribute("firstclassBooked", firstclassBooked);


    out.println("<text>You searched for: " + airlineBooked + ", </text><br>");
    out.println("<text>" + flightNumber + ", </text><br>");
    out.println("<text>" + classBooked + "</text><br>");

    out.println("<text> First flight: " + firsttripAirline + ", </text><br>");
    out.println("<text>" + firsttripNumber + ", </text><br>");
    out.println("<text>" + firstclassBooked + "</text><br>");




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
            out.println("<br><a href='roundTripCheckout.jsp'>Proceed to Checkout</a>");
        } else {
            out.println("<br>No such flight #2 exists. <a href='searchRoundTripback.jsp'>Please try again.</a>");
        }
    } catch (Exception e) {
        out.print(e);
    }


    %>
    
    <br>
    <br>

</body>
</html>