<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
	Connection conn = NULL;
	PreparedStatement psa = NULL;
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "Application", "JAAYS");
        String user = request.getParameter("username");
        String pw = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
        
		if(user != NULL && !user.isEmpty() && pw != NULL && !pw.isEmpty() && 
            fname != NULL  && !fname.isEmpty() && lname != NULL && !lname.isEmpty() 
			&& email != NULL && !email.isEmpty())
			{
			String enter = "INSERT INTO Person (user, pw, fname, lname, email)" + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            
            psa = conn.prepareStatement(enter);
			psa.setString(1, user);
			psa.setString(2, pw);
			psa.setString(3, fname);
            psa.setString(4, lname);
            psa.setString(5, email);
            
            int outcome = 0;
	        outcome = psa.executeUpdate();
            if (outcome == 0) 
            {
                response.sendRedirect("registerFailure.jsp");
                return;
            } 
            else 
            {
	        	response.sendRedirect("registerSuccess.jsp");
	        	return;
	        }
        } 
        else 
        {
			response.sendRedirect("registerFailure.jsp");
			return;
		}
    } catch(Exception e) 
    {
        out.print("<p>Server Connection Error.</p>");
        e.printStackTrace();
    } 
    finally 
    {
        try { psa.close(); } catch (Exception e) {}
        try { conn.close(); } catch (Exception e) {}
    }
%>