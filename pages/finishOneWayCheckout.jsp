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

    String specialmeal = request.getParameter("specialMeal");

    out.println("<text>Your want to fly with airline: " + airlineBooked + "</text><br>");
    out.println("<text>On flight number: " + flightNumber + "</text><br>");
    out.println("<text>With class: " + classBooked + "</text><br>");

    String str = "SELECT MAX(ticketNumber) AS tnum FROM Ticket;";
    int newTicketNumber = 0;
    String seatNumber = "69A";
    float bookingfee = 75;

    try{

        Class.forName("com.mysql.jdbc.Driver"); 
        connection = DriverManager.getConnection(url, "Application", "JAAYS");
        preparedStatement = connection.prepareStatement(str);
        ResultSet rs;
        rs = preparedStatement.executeQuery();

        rs.next();
        String maxTnum = rs.getString("tnum");
        out.println("<text>" + maxTnum + "hello</text>");

        if(maxTnum != null && ! maxTnum.isEmpty()){
            out.println("<text>not empty</text><br>");
            //newTicketNumber = Integer.parseInt(maxTnum);
            //newTicketNumber++;
        } else{
            newTicketNumber = 1000;
        }

        //String for Ticket
        String strticket = "INSERT INTO Ticket VALUES(" + newTicketNumber + ", " + bookingfee + ", NOW());";

        //String for TicketFor
        String strticketfor = "INSERT INTO TicketFor(" + newTicketNumber + ", " + flightNumber + ", '" + airlineBooked + "', '" + specialmeal + "', '" + classBooked + "', '" + seatNumber + "');";

        //String for Buys
        String strbuys = "INSERT INTO Buys(NOW(), NOW(), " + newTicketNumber + ", '" + userid + "');";

        out.println("<text>" + strticket + "</text><br>");
        out.println("<text>" + strticketfor + "</text><br>");
        out.println("<text>" + strbuys + "</text><br>");

    } catch (Exception e) {
        out.print(e);
    }

    %>
    
    <br>
    <br>
</body>
</html>