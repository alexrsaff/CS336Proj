  
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
        
		if(airportID != null && !airportID.isEmpty())
			{
			String enter = "INSERT INTO Airport (airportID)" + "VALUES(?);";
            
            psa = conn.prepareStatement(enter);
			psa.setString(1, airportID);
            
            int outcome = 0;
            outcome = psa.executeUpdate();
            if (outcome == 0) 
            {
                out.println("Airport Addition Error!");
                response.sendRedirect("manageInfo.jsp");
                return;
            } 
            else 
            {

                out.println("Airport Added!");
                response.sendRedirect("manageInfo.jsp");
	        	return;
	        }
        } 
        else 
        {
            out.println("Airport Addition Failure!");
			response.sendRedirect("manageInfo.jsp");
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