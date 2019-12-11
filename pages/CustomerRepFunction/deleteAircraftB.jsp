  
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempFour";
	Connection conn = null;
	PreparedStatement psa = null;
	try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "Application", "JAAYS");
		String aircraftID = request.getParameter("aircraftID");
        
		if(aircraftID != null && !aircraftID.isEmpty())
			{
                String enter = "DELETE FROM Aircraft WHERE aircraftID = ?";
            
            psa = conn.prepareStatement(enter);
			psa.setString(1, aircraftID);
            
            int outcome = 0;
            outcome = psa.executeUpdate();
            if (outcome == 0) 
            {
                out.println("No such Aircraft exists!");
                out.println();
                out.println("<a href='manageInfo.jsp'>Return</a>");
                return;
            } 
            else 
            {
                out.println("Aircraft Delete Failure! Try again.");
                response.sendRedirect("manageInfo.jsp");
	        	return;
	        }
        } 
        else 
        {
            out.println("Aircraft Edit Fail.");
			response.sendRedirect("manageInfo.jsp");
			return;
		}
    }catch(Exception e) 
    {
        if(e instanceof java.sql.SQLIntegrityConstraintViolationException)
        {
            out.print("No aircraft exists.");
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