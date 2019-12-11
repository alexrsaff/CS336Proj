<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
	Connection conn = null;
	PreparedStatement psa = null;
	try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "Application", "JAAYS");
		String airportID = request.getParameter("airportID");
        
		if(airportID != null && !airportID.isEmpty())
			{
			String enter = "DELETE FROM Airport WHERE airportID = ?";
            
            psa = conn.prepareStatement(enter);
			psa.setString(1, airportID);
            
            int outcome = 0;
            outcome = psa.executeUpdate();
            if (outcome == 0) 
            {
                out.println("No Airport exists!");
                out.println();
                out.println("<a href='manageInfo.jsp'>Return</a>");
                return;
            } 
            else 
            {
                out.println("Airport Deleted!");
                response.sendRedirect("manageInfo.jsp");
	        	return;
	        }
        } 
        else 
        {   
            out.println("Airport Deletion Error!");
			
			return;
		}
    }catch(Exception e) 
    {
        if(e instanceof java.sql.SQLIntegrityConstraintViolationException)
        {
            out.print("Invalid.");
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