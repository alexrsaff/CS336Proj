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
            String query;
            PreparedStatement ps;
            ResultSet rs;
            int outcome = 0;
            q = "SELECT count(*) FROM Flight AS f WHERE f.airlineID = ? AND f.flightNumber = ?";
            ps = connection.prepareStatement(q);
            ps.setString(1, airlineID);
            ps.setInt(2,flightNumber);
            
            rs = ps.executeQuery();
            rs.next();
            String cnt = rs.getString(1);
            if (cnt.equals("1")){ //flight exists in the db
                if(action.equals("1")) { //change flight number
                    int newValue = Integer.parseInt(request.getParameter("newValue"));
                    query = "UPDATE Flight SET flightNumber = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setInt(1, newValue);
                    ps.setInt(2, flightNumber);
                    ps.setString(3,airlineID);
                    
                    outcome = ps.executeUpdate();
                    if (outcome != 0) {
                        out.println("Flight Number changed.");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }else if(action.equals("2")){ //edit domInt
                    String newValue = request.getParameter("newValue");
                    query = "UPDATE Flight SET domInt = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setString(1,newValue);
                    ps.setInt(2,flightNumber);
                    ps.setString(3,airlineID);

                    outcome = ps.executeUpdate();
                    if(outcome != 0){
                        out.println("Domestic/International Changed");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }else{
                        out.println("fail");
                    }
                }else if(action.equals("3")){ //edit day of week
                    String newValue = request.getParameter("newValue");
                    query = "UPDATE Flight SET dayOfWeek = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setString(1,newValue);
                    ps.setInt(2,flightNumber);
                    ps.setString(3,airlineID);

                    outcome = ps.executeUpdate();
                    if(outcome != 0){
                        out.println("Domestic/International Changed");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }else{
                        out.println("fail");
                    }
                    
                }else if(action.equals("4")){ //edit first class fare
                    float newValue = Float.parseFloat(request.getParameter("newValue"));
                    query = "UPDATE Flight SET firstClassFare = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setFloat(1,newValue);
                    ps.setInt(2,flightNumber);
                    ps.setString(3,airlineID);
                    outcome = ps.executeUpdate();
                    if(outcome != 0){
                        out.println("First Class Fare Changed");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }else{
                        out.println("fail");
                    }
                    
                }else if(action.equals("5")){ //edit business class fare
                    float newValue = Float.parseFloat(request.getParameter("newValue"));
                    query = "UPDATE Flight SET businessClassFare = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setFloat(1,newValue);
                    ps.setInt(2,flightNumber);
                    ps.setString(3,airlineID);
                    outcome = ps.executeUpdate();
                    if(outcome != 0){
                        out.println("Business Class Fare Changed");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }else{
                        out.println("fail");
                    }
                    
                }else if(action.equals("6")){ //edit economy class fare
                    float newValue = Float.parseFloat(request.getParameter("newValue"));
                    query = "UPDATE Flight SET economyClassFare = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setFloat(1,newValue);
                    ps.setInt(2,flightNumber);
                    ps.setString(3,airlineID);
                    outcome = ps.executeUpdate();
                    if(outcome != 0){
                        out.println("Economy Class Fare Changed");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }else{
                        out.println("fail");
                    }
                    
                }else if(action.equals("7")){ //edit first class occupancy
                    int newValue = Integer.parseInt(request.getParameter("newValue"));
                    query = "UPDATE Flight SET firstClassOccupancy = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setInt(1,newValue);
                    ps.setInt(2,flightNumber);
                    ps.setString(3,airlineID);

                    outcome = ps.executeUpdate();
                    if(outcome != 0){
                        out.println("First Class Occupancy Changed");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }else{
                        out.println("fail");
                    }
                    
                }else if(action.equals("8")){ //edit business class occupancy
                    int newValue = Integer.parseInt(request.getParameter("newValue"));
                    query = "UPDATE Flight SET businessClassOccupancy = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setInt(1,newValue);
                    ps.setInt(2,flightNumber);
                    ps.setString(3,airlineID);

                    outcome = ps.executeUpdate();
                    if(outcome != 0){
                        out.println("Business Class Occupancy Changed");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }else{
                        out.println("fail");
                    }
                    
                }
                else if(action.equals("9")){ //edit economy class occupancy
                    int newValue = Integer.parseInt(request.getParameter("newValue"));
                    query = "UPDATE Flight SET economyClassOccupancy = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setInt(1,newValue);
                    ps.setInt(2,flightNumber);
                    ps.setString(3,airlineID);

                    outcome = ps.executeUpdate();
                    if(outcome != 0){
                        out.println("Economy Class Occupancy Changed");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }else{
                        out.println("fail");
                    }

                    
                }else if(action.equals("10")){ //edit departure airport
                    String newValue = request.getParameter("newValue");
                    query = "UPDATE Departs SET airportID = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setString(1,newValue);
                    ps.setInt(2,flightNumber);
                    ps.setString(3,airlineID);

                    outcome = ps.executeUpdate();
                    if(outcome != 0){
                        out.println("Departure Airport Changed");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }else{
                        out.println("fail");
                    }

                
            }else if(action.equals("11")){ //edit arrival airport
                    String newValue = request.getParameter("newValue");
                    query = "UPDATE Arrives SET airportID = ? WHERE flightNumber = ? AND airlineID = ?";
                    ps = connection.prepareStatement(query);
                    ps.setString(1,newValue);
                    ps.setInt(2,flightNumber);
                    ps.setString(3,airlineID);

                    outcome = ps.executeUpdate();
                    if(outcome != 0){
                        out.println("Arrival Airport Changed");
                        out.println("Flight data is successfully changed. <a href='manageInfo.jsp'>Back.</a>");
                    }else{
                        out.println("fail");
                    }
                }
            }else{
                out.println("Did not work. <a href = 'manageInfo.jsp'>please try again.</a>");
            }
		} catch (Exception e) {
			out.print(e);
		}
	%>
    </body>
</html>

