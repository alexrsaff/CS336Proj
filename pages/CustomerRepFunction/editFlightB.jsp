<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempFour";
	Connection conn = null;
	PreparedStatement psa = null;
	try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "Application", "JAAYS");
        int flightNumber = Integer.parseInt(request.getParameter(flightNumber));
        String airlineID = request.getParameter("airlineID");
        String attribute = request.getParameter("attribute");
        String data = request.getParameter("data");
        
		if(airlineID != null && !airlineID.isEmpty() && flightNumber != null && !flightNumber.isEmpty())
			{
			String enter = "UPDATE Flight SET attribute = ? where (flightNumber,airlineID) = (?,?)";
            
            psa = conn.prepareStatement(enter);
            psa.setString(1, data);
            psa.setInt(2,flightNumber);
            psa.setString(3,airlineID);
            
            
            int outcome = 0;
            outcome = psa.executeUpdate();
            if (outcome == 0) 
            {
                out.println("Flight Edit Failure! Try again.");
                response.sendRedirect("manageInfo.jsp");
                return;
            } 
            else 
            {
	        	out.println("Flight Edit Success!");
	        	return;
	        }
        } 
        else 
        {
            out.println("Flight Edit Failure! Try again.");
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