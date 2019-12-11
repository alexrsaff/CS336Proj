  
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempFour";
	Connection conn = null;
	PreparedStatement psa = null;
	try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "Application", "JAAYS");
        String airlineID = request.getParameter("airlineID");
        int flightNumber = Integer.parseInt(request.getParameter(flightNumber));
        
		if(airlineID != null && !airlineID.isEmpty() && flightNumber != null && !flightNumber.isEmpty())
			{
			String enter = "DELETE FROM Flight WHERE (flightNumber,airlineID) = (?,?)";
            
            psa = conn.prepareStatement(enter);
            psa.setInt(1,flightNumber);
            psa.setString(2, airlineID);
            
            int outcome = 0;
            outcome = psa.executeUpdate();
            if (outcome == 0) 
            {
                out.println("Deletion Failure");
                out.println("<a href='manageInfo.jsp'>Return</a>");
                return;
            } 
            else 
            {
                out.println("Flight Deleted!");
                out.println("<a href='manageInfo.jsp'>Return</a>");
	        	return;
	        }
        } 
        else 
        {
            out.println("Deletion Failure");
			out.println("<a href='manageInfo.jsp'>Return</a>");
			return;
		}
    }catch(Exception e) 
    {
        if(e instanceof java.sql.SQLIntegrityConstraintViolationException)
        {
            out.print("No such flight exists .");
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