
<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*,java.text.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Flight</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");

            String airlineID = request.getParameter("airlineID");
            int flightNumber = Integer.parseInt(request.getParameter("flightNumber"));
            String domInt = request.getParameter("domInt");
            String dayOfWeek = request.getParameter("dayOfWeek");
            String departDate = request.getParameter("departDate");
            String departTime = request.getParameter("departTime");
            String arriveDate = request.getParameter("arrivalDate");
            String arriveTime = request.getParameter("arrivalTime");
            float firstClassFare= Float.parseFloat(request.getParameter("firstClassFare"));
            float businessClassFare = Float.parseFloat(request.getParameter("businessClassFare"));
            float economyClassFare = Float.parseFloat(request.getParameter("economyClassFare"));
            int firstClassOccupancy = Integer.parseInt(request.getParameter("firstClassOccupancy"));
            int businessClassOccupancy = Integer.parseInt(request.getParameter("businessClassOccupancy"));
            int economyClassOccupancy = Integer.parseInt(request.getParameter("economyClassOccupancy"));
            String aID = request.getParameter("aID");
            String dID = request.getParameter("dID");

            
            String q = "SELECT count(*) FROM Flight WHERE airlineID = ? AND flightNumber = ?";
            preparedStatement = connection.prepareStatement(q);
            preparedStatement.setString(1, airlineID);
            preparedStatement.setInt(2, flightNumber);
            ResultSet rs;
            rs = preparedStatement.executeQuery(q);
            try {
                rs.next();
            } catch (Exception e) {
                out.print("query's wrong.");
            }
            String cnt = rs.getString(1); 
            if(cnt.equals("1")) {
                out.println("The flight number wanted already exists, <a href='manageInfo.jsp'>please try again.</a>");
            }
            else {
                String update1 = 
                    "INSERT INTO Flight
                    VALUES()
                                
                int outcome = 0;
                outcome = preparedStatement.executeUpdate();
                if (outcome == 0) {
                    response.sendRedirect("../registerFailure.jsp");
                    return;
                }
                else {
                    String update2 = "INSERT INTO Departs(airportID,flightNumber,airlineID) VALUES(?,?,?)";
                    preparedStatement = connection.prepareStatement(update2);
                    preparedStatement.setString(1, dID);
                    preparedStatement.setInt(2, flightNumber);
                    preparedStatement.setString(3, airlineID);
                    outcome = 0;
                    outcome = preparedStatement.executeUpdate();
                    String update3 = "INSERT INTO Arrives(airportID,flightNumber,airlineID) VALUES(?,?,?)";
                    preparedStatement = connection.prepareStatement(update3);
                    preparedStatement.setString(1, dID);
                    preparedStatement.setInt(2, flightNumber);
                    preparedStatement.setString(3, airlineID);
                    outcome = 0;
                    outcome = preparedStatement.executeUpdate();
                    if (outcome == 0) {
                        response.sendRedirect("../registerFailure.jsp");
                        return;
                    }
                    out.println("Flight data is successfully inserted.");
                }
            }
		} catch (Exception e) {
			out.print(e);
		}
	%>
    </body>
</html>
