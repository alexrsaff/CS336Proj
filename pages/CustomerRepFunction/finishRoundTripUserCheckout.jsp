<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>

<body>

	<%
    String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    
    //First flight
    String userid = request.getParameter("user");
    String airlineBooked = request.getParameter("airline");
    String flightNumber = request.getParameter("flightNum");
    String classBooked = request.getParameter("classBooked");


    //Second flight
    String airlineBookedTwo = request.getParameter("airlineTwo");
    String flightNumberTwo = request.getParameter("flightNumTwo");
    String classBookedTwo = request.getParameter("classBookedTwo");

    String specialmeal = request.getParameter("specialMeal");
    if (specialmeal.isEmpty()){
        specialmeal = "none";
    }

    out.println("<text>You have successfully purchased the flight for " + userid + " on airline "+ airlineBooked + ".</text><br>");
    out.println("<text>On flight number: " + flightNumber + "</text><br>");
    out.println("<text>With class: " + classBooked + "</text><br><br>");
    out.println("<text>You have also successfully purchased the flight for " + userid + " on airline "+ airlineBookedTwo + ".</text><br>");
    out.println("<text>On flight number: " + flightNumberTwo + "</text><br>");
    out.println("<text>With class: " + classBookedTwo + "</text><br><br>");


    String str = "SELECT MAX(ticketNumber) AS tnum FROM Ticket;";
    int newTicketNumber = 0;
    //String seatNumber = "69A";

    //Random r = new Random();
    //char c = (char)(r.nextInt(26) + 'a');
    char[] c = {'A', 'B', 'C', 'D', 'E', 'F'};
    int x = (int)(Math.random() * 100) + 1;
    int charnum = (int)(Math.random() * 6);
    String seatNumber = Integer.toString(x);
    seatNumber = seatNumber + c[charnum];

    float bookingfee = 75;

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
        String strticketfortwo = "INSERT INTO TicketFor VALUES(" + newTicketNumber + ", " + flightNumberTwo + ", '" + airlineBookedTwo + "', '" + specialmeal + "', '" + classBookedTwo + "', '" + seatNumber + "');";

        //String for Buys
        String strbuys = "INSERT INTO Buy VALUES(NOW(), NOW(), " + newTicketNumber + ", '" + userid + "');";

        //out.println("<text>" + strticket + "</text><br>");
        //out.println("<text>" + strticketfor + "</text><br>");
        //out.println("<text>" + strbuys + "</text><br>");

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

    <form method="post" action="manageInfo.jsp">
            <input type="submit" value="Finished">
    </form>

</body>
</html>