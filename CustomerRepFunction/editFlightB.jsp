<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Customer Rep: Edit Flight</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");
            String action = request.getParameter("action");
            String airlineID = request.getParameter("airlineID");
            int flightNumber = Integer.parseInt(request.getParameter("flightNumber"));
            
            String q;
            PreparedStatement ps;
            ResultSet rs;
            int outcome = 0;
            q = "SELECT count(*) FROM Flight f f.airlineID = ? AND f.flightNumber = ?";
            ps = connection.prepareStatement(q);
            ps.setString(1, airlineID);
            ps.setInt(2,flightNumber)
            
            rs = ps.executeQuery();
            rs.next();
            String cnt = rs.getString(1);
            if (cnt.equals("1")){ //flight exists in the db
                if(action.equals("1")) { //change flight number
                    int newValue = Integer.parseInt(request.getParameter("newValue"));
                    q = "UPDATE Flight SET flightNumber = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setInt(2, flightNumber);
                    ps.setString(3,airlineID);
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("Flight Number changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }
    
                else if(action.equals("2")) { //change domestic or international
                    q = "UPDATE Flights SET domInt = ? WHERE flightNumber = ? AND airportID = ?";
                    String newValue = request.getParameter("newValue");
                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setInt(2, flightNumber);
                    ps.setString(3,airlineID);
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("Domestic/International changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }
                else if(action.equals("3")) { //change days of week
                    String newValue = request.getParameter("newValue");
                    q = "UPDATE Flight SET dayOfWeek = ? WHERE username = ?";
                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setString(2, username);
                    ps.setString(3,airlineID);
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("day of week changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }
                else if(action.equals("4")) { //change depart date
                    q = "UPDATE Flight SET departDate = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("depart date changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("5")) { //change depart time
                    q = "UPDATE Flight SET departTime = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("depart time changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("6")) { //change arrival date
                    q = "UPDATE Flight SET arriveDate = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("arrival date changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("7")) { //change arrival time
                    q = "UPDATE Flight SET arriveTime = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("arrival time changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("8")) { //change first class fare
                    float newValue = Float.parseFloatrequest.getParameter("newValue");
                    q = "UPDATE Flight SET firstClassFare = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setFloat(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("first class fare changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("9")) { //change business class fare
                    float newValue = Float.parseFloatrequest.getParameter("newValue");
                    q = "UPDATE Flight SET businessClassFare = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setFloat(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("business class fare changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("10")) { //change economy fare
                    float newValue = Float.parseFloatrequest.getParameter("newValue");
                    q = "UPDATE Flight SET economyClassFare = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setFloat(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("economy fare changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("11")) { //change first class seats
                    int newValue = Integer.parseInt(request.getParameter("newValue"));
                    q = "UPDATE Flight SET firstClassOccupancy = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setInt(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("number of first class seats changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("12")) { //change business class occupancy
                    int newValue = Integer.parseInt(request.getParameter("newValue"));
                    q = "UPDATE Flight SET businessClassOccupancy = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setInt(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("Number of business class seats changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("13")) { //change economy class occupancy
                    int newValue = Integer.parseInt(request.getParameter("newValue"));
                    q = "UPDATE Flight SET economyClassOccupancy = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setInt(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("Number of Economy seats changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("14")) { //change depart airport
                    String newValue = request.getParameter("newValue");
                    q = "UPDATE Departs SET airportID = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("depart airport changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("15")) { //change arrival airport
                    String newValue = request.getParameter("newValue");
                    q = "UPDATE Arrive SET airportID = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setInt(2, flightNumber;
                    ps.setString(3,airlineID)
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("Arrival Airport changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
            }
            else {
                out.println("The username you entered does not exist, <a href = 'editCustomerRep.jsp'>please try again.</a>");
            }
		} catch (Exception e) {
			out.print(e);
		}
	%>
    </body>
</html>

