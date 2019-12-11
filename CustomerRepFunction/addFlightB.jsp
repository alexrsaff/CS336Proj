  
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
	Connection conn = null;
	PreparedStatement psa = null;
	try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "Application", "JAAYS");
        int flightNumber = Integer.parseInt(request.getParameter(flightNumber));
        String airlineID = request.getParameter("airlineID");
        String domInt = request.getParameter("domInt");
        String arrivalAirport = request.getParameter("arrivalAirport");
        String departureAirport = request.getParameter("departureAirport");
        String arrivalTime = request.getParameter("arrivalTime");
        String departureTime = request.getParameter("adepartureTime");
        String dayOfWeek = request.getParameter("dayOfWeek");
        int fare = Integer.parseInt(request.getParameter(fare));

        
        if(airlineID != null && !airlineID.isEmpty() && !flightNumber.isEmpty() && domInt != null && !domInt.isEmpty()
            && arrivalAirport != null && !arrivalAirport.isEmpty() && departureAirport != null && !departureAirport.isEmpty(),
                && arrivalTime != null && !arrivalTime.isEmpty() && departureTime != null && !departureTime.isEmpty() &&
                    dayOfWeek != null && !dayOfWeek.isEmpty() && !fare.isEmpty())
			{
			String enter = "INSERT INTO Flight (flightNumber,airlineID,domInt,arrivalAirport,departureAirport,arrivalTime,departureTime,dayOfWeek,fare)" + "VALUES(?,?,?,?,?,?,?,?,?);";
            
            psa = conn.prepareStatement(enter);
            psa.setString(1, flightNumber);
            psa.setString(2, airlineID);
            psa.setString(3, domInt);
            psa.setString(4, arrivalAirport);
            psa.setString(5, departureAirport);
            psa.setString(6, arrivalTime);
            psa.setString(7, departureTime);
            psa.setString(8, dayOfWeek);
            psa.setString(9, fare);

            
            int outcome = 0;
            outcome = psa.executeUpdate();
            if (outcome == 0) 
            {
                out.println("Addition of Flight Failed. Try again.");
                response.sendRedirect("manageInfo.jsp");
                return;
            } 
            else 
            {
	        	out.println("Flight Added!");
	        	return;
	        }
        } 
        else 
        {
            out.println("Addition of Flight Failed. Try again.");
			response.sendRedirect("manageInfo.jsp");
			return;
		}
    }catch(Exception e) 
    {
        if(e instanceof java.sql.SQLIntegrityConstraintViolationException)
        {
            out.print("Invalid ID.");
        }
        else{
        out.print("<p>Server Connection Error.</p>");
        out.print(e);
        e.printStackTrace();}
    } 
    finally 
    {
        try { psa.close(); } catch (Exception e) {}
        try { conn.close(); } catch (Exception e) {}
    }
%>


%>

</body>
</html>