<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin: Edit Customer Representative</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");

            String action = request.getParameter("action");
            String username = request.getParameter("username");
            String newValue = request.getParameter("newValue");
            String q;
            PreparedStatement ps;
            ResultSet rs;
            int outcome = 0;

            q = "SELECT count(*) FROM Person p, CustomerRep cr WHERE p.username = cr.username AND username = ?";
            ps = connection.prepareStatement(q);
            ps.setString(1, username);
            
            rs = ps.executeQuery();
            rs.next();
            String cnt = rs.getString(1);

            if (cnt.equals("1")){ //username exists in the db
                if(action.equals("1")) { //change pw
                    q = "UPDATE Person SET password = ? WHERE username = ?";

                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setString(2, username);
                    
                    outcome = ps.executeUpdate();

                    if (outcome != 0) {
                        out.println("Password changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }
    
                else if(action.equals("2")) { //change fname
                    q = "UPDATE Person SET fname = ? WHERE username = ?";

                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setString(2, username);
                    
                    outcome = ps.executeUpdate();

                    if (outcome != 0) {
                        out.println("First name changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }
                else if(action.equals("3")) { //change lastname
                    q = "UPDATE Person SET lname = ? WHERE username = ?";

                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setString(2, username);
                    
                    outcome = ps.executeUpdate();

                    if (outcome != 0) {
                        out.println("Last name changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }
                else if(action.equals("4")) { //change email
                    q = "UPDATE Person SET email = ? WHERE username = ?";

                    ps = connection.prepareStatement(q);
                    ps.setString(1, newValue);
                    ps.setString(2, username);
                    
                    outcome = ps.executeUpdate();

                    if (outcome != 0) {
                        out.println("E-mail changed.");
                    }
                    else {
                        out.println("u r Failure.");
                    }
                }
            }

            else {
                out.println("The username you entered does not exist, <a href = 'editCustomerRep.jsp'>please try again.</a>");
            }
		} catch (Exception e) {
			out.print(e);
		}
    %>
    <input type="button" onclick="window.location.href='../project/login.jsp'" value="Back to admin navigation page">

    </body>
</html>