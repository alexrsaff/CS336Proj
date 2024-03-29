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
    //userid = "sg";
    session.setAttribute("username", userid);
    out.println("<h2>" + "Welcome "+ userid + "</h2>");
%>

<body>

	<%
    String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    //Second plane information
    String airlineBooked = (String)session.getAttribute("airlineBooked");
    String flightNumber = (String)session.getAttribute("flightNumberBooked");
    String classBooked = (String)session.getAttribute("classBooked");
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

    String specialmeal = request.getParameter("specialMeal");
    if (specialmeal.isEmpty()){
        specialmeal = "none";
    }

    out.println("<text>Information for flight 1: </text><br>");
    out.println("<text>You have successfully purchased your " + firsttripAirline + "flight.</text><br>");
    out.println("<text>On flight number: " + firsttripNumber + "</text><br>");
    out.println("<text>With class: " + firstclassBooked + "</text><br><br>");

    out.println("<text>Information for flight 2 (back home): </text><br>");
    out.println("<text>You have successfully purchased your " + airlineBooked + "flight.</text><br>");
    out.println("<text>On flight number: " + flightNumber + "</text><br>");
    out.println("<text>With class: " + classBooked + "</text><br><br>");


    String str = "SELECT MAX(ticketNumber) AS tnum FROM Ticket;";
    int newTicketNumber = 0;
    //String seatNumber = "69A";
    float bookingfee = 75;

    char[] c = {'A', 'B', 'C', 'D', 'E', 'F'};
    int x = (int)(Math.random() * 100) + 1;
    int charnum = (int)(Math.random() * 6);
    String seatNumber = Integer.toString(x);
    seatNumber = seatNumber + c[charnum];


    try{

        Class.forName("com.mysql.jdbc.Driver"); 
        connection = DriverManager.getConnection(url, "Application", "JAAYS");
        preparedStatement = connection.prepareStatement(str);
        ResultSet rs;
        rs = preparedStatement.executeQuery();

        rs.next();
        String maxTnum = rs.getString("tnum");
        //out.println("<text>" + maxTnum + "hello</text>");

        if(maxTnum != null && ! maxTnum.isEmpty()){
            //out.println("<text>not empty</text><br>");
            newTicketNumber = Integer.parseInt(maxTnum);
            newTicketNumber++;
        } else{
            newTicketNumber = 1000;
        }

        //String for Ticket
        String strticket = "INSERT INTO Ticket VALUES(" + newTicketNumber + ", " + bookingfee + ", NOW());";

        //String for TicketFor
        String strticketfor = "INSERT INTO TicketFor VALUES(" + newTicketNumber + ", " + flightNumber + ", '" + airlineBooked + "', '" + specialmeal + "', '" + classBooked + "', '" + seatNumber + "');";
        String strticketfortwo = "INSERT INTO TicketFor VALUES(" + newTicketNumber + ", " + firsttripNumber + ", '" + firsttripAirline + "', '" + specialmeal + "', '" + firstclassBooked + "', '" + seatNumber + "');";

        //String for Buys
        String strbuys = "INSERT INTO Buy VALUES(NOW(), NOW(), " + newTicketNumber + ", '" + userid + "');";

        out.println("<text>" + strticket + "</text><br>");
        out.println("<text>" + strticketfor + "</text><br>");
        out.println("<text>" + strbuys + "</text><br>");

        preparedStatement = connection.prepareStatement(strticket);
        preparedStatement.executeUpdate();
        preparedStatement = connection.prepareStatement(strticketfor);
        preparedStatement.executeUpdate();
        preparedStatement = connection.prepareStatement(strticketfortwo);
        preparedStatement.executeUpdate();
        preparedStatement = connection.prepareStatement(strbuys);
        preparedStatement.executeUpdate();

    } catch (Exception e) {
        out.print(e);
    }

    %>
    
    <br>
    <br>

    <form method="post" action="customerLogin.jsp">
            <input type="submit" value="Go Back to Start!">
    </form>    

</body>
</html>