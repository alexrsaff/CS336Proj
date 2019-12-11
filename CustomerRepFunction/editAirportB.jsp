<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
	Connection conn = null;
	PreparedStatement psa = null;
	try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "Application", "JAAYS");
        String airportID = request.getParameter("airportID");
        String data = request.getParameter("data");
        
		if(airportID != null && !airportID.isEmpty() && data != null && !data.isEmpty())
			{
			String enter = "UPDATE Airport SET airportID = ? where airportID = ?";
            
            psa = conn.prepareStatement(enter);
            psa.setString(1, data);
            psa.setString(2,airportID);
            
            int outcome = 0;
            outcome = psa.executeUpdate();
            if (outcome == 0) 
            {
                out.println("Airport Edit Failure! Try again.");
                out.println("<a href='manageInfo.jsp'>Return</a>");
                return;
            } 
            else 
            {
                out.println("Airport Edit Success!");
                response.sendRedirect("manageInfo.jsp");
	        	return;
	        }
        } 
        else 
        {
            out.println("Airport Edit Failure!.");
			out.println("<a href='manageInfo.jsp'>Return</a>");
			return;
		}
    }catch(Exception e) 
    {
        if(e instanceof java.sql.SQLIntegrityConstraintViolationException)
        {
            out.print("Invalid.ID already taken.");
            out.println("<a href='manageInfo.jsp'>Return</a>");
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