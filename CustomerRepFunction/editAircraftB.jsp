<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
	Connection conn = null;
	PreparedStatement psa = null;
	try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "Application", "JAAYS");
        String aircraftID = request.getParameter("aircraftID");
        String data = request.getParameter("data");
        
		if(aircraftID != null && !aircraftID.isEmpty() && data != null && !data.isEmpty())
			{
			String enter = "UPDATE Aircraft SET aircraftID = ? where aircraftID = ?";
            
            psa = conn.prepareStatement(enter);
            psa.setString(1, data);
            psa.setString(2,aircraftID);
            
            int outcome = 0;
            outcome = psa.executeUpdate();
            if (outcome == 0) 
            {
                out.println("Aircraft Edit Failure! Try again.");
                out.println("<a href='manageInfo.jsp'>Return</a>");
                return;
            } 
            else 
            {
                out.println("Aircraft Edit Success!");
                response.sendRedirect("manageInfo.jsp");
	        	return;
	        }
        } 
        else 
        {
            out.println("Aircraft Edit Failure!.");
			out.println("<a href='manageInfo.jsp'>Return</a>");
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