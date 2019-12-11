
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
            SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");

            String airlineID = request.getParameter("airlineID");
            int flightNumber = Integer.parseInt(request.getParameter("flightNumber"));
            String domInt = request.getParameter("domInt");
            String dayOfWeek = request.getParameter("dayOfWeek");
            Date departDate = sdf.parse(request.getParameter("departDate"));
            String departTime = request.getParameter("departTime");
            Date arriveDate = sdf.parse(request.getParameter("arrivalDate"));
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
                out.print("ure query's wrong, bitch.");
            }
            String cnt = rs.getString(1); 
            if(cnt.equals("1")) {
                out.println("The flight number wanted already exists, <a href='manageInfo.jsp'>please try again.</a>");
            }
            else {
                String update1 = "INSERT INTO Flight(flightNumber,domInt ,dayOfWeek, departDate, departTime,arriveDate,arriveTime,firstClassFare,businessClassFare,economyClassFare,airlineID,firstClassOccupancy,businessClassOccupancy,economyClassOccupancy) VALUES(?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?)";
                preparedStatement = connection.prepareStatement(update1);
                
                preparedStatement.setInt(1, flightNumber);
                preparedStatement.setString(2, domInt);
                preparedStatement.setString(3, dayOfWeek);
                preparedStatement.setDate(4, new java.sql.Date(departDate.getTime()));
                preparedStatement.setTimestamp(5, new java.sql.Timestamp(departTime.getTime()));
                preparedStatement.setDate(6, new java.sql.Date(arrivalDate.getTime()));
                preparedStatement.setTime(stamp(7, new java.sql.Timestamp(arrivalTime.getTime())));
                preparedStatement.setFloat(8, firstClassFare);
                preparedStatement.setFloat(9, businessClassFare);
                preparedStatement.setFloat(10, economyClassFare);
                preparedStatement.setString(11, airlineID);
                preparedStatement.setInt(12, firstClassOccupancy);
                preparedStatement.setInt(13, businessClassOccupancy);
                preparedStatement.setInt(14, economyClassOccupancy);
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
