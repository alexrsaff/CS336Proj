<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
	Connection conn = null;
	PreparedStatement psa = null;
	try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, "Application", "JAAYS");
        String user = request.getParameter("username");
        String pw = request.getParameter("password");
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String email = request.getParameter("email");
        
		if(user != null && !user.isEmpty() && pw != null && !pw.isEmpty() && 
            fname != null  && !fname.isEmpty() && lname != null && !lname.isEmpty() 
			&& email != null && !email.isEmpty())
			{
			String enter = "INSERT INTO Person (username, password, fname, lname, email)" + "VALUES(?, ?, ?, ?, ?);";
            
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
                enter = "INSERT INTO Customer (username)" + "VALUES(?);";
            
                psa = conn.prepareStatement(enter);
                psa.setString(1, user);
                
                outcome = 0;
                outcome = psa.executeUpdate();
                if (outcome == 0) {
                    response.sendRedirect("registerFailure.jsp");
                    return;
                }
                else {
                    response.sendRedirect("registerSuccess.jsp");
	        	    return;
                }
	        }
        } 
        else 
        {
			response.sendRedirect("registerFailure.jsp");
			return;
		}
    }catch(Exception e) 
    {
        if(e instanceof java.sql.SQLIntegrityConstraintViolationException)
        {
            out.print("That username is taken. Go back and try again.");
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