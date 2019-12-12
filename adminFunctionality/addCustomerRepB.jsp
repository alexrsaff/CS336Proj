<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Customer Representative</title>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, "Application", "JAAYS");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");

            String q = "SELECT count(*) FROM Person WHERE username = '"+ username +"'";

            preparedStatement = connection.prepareStatement(q);
            //preparedStatement.setString(1, username);

            ResultSet rs;
            rs = preparedStatement.executeQuery(q);
            try {
                rs.next();
            } catch (Exception e) {
                out.print("ure query's wrong, bitch.");
            }

            String cnt = rs.getString(1);
            if(cnt.equals("1")) {
                out.println("The username wanted already exists, <a href='addCustomerRep.jsp'>please try again.</a>");
            }
            else {
                String update1 = "INSERT INTO Person(username, password, fname, lname, email) VALUES(?, ?, ?, ?, ?)";
                preparedStatement = connection.prepareStatement(update1);
                
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                preparedStatement.setString(3, fname);
                preparedStatement.setString(4, lname);
                preparedStatement.setString(5, email);

                int outcome = 0;
                outcome = preparedStatement.executeUpdate();
                if (outcome == 0) {
                    response.sendRedirect("../registerFailure.jsp");
                    return;
                }

                else {
                    String update2 = "INSERT INTO CustomerRep(username) SELECT username FROM Person WHERE username = '"+ username +"'";
                    preparedStatement = connection.prepareStatement(update2);

                    //preparedStatement.setString(1, username);

                    outcome = 0;
                    outcome = preparedStatement.executeUpdate();
                    if (outcome == 0) {
                        response.sendRedirect("../registerFailure.jsp");
                        return;
                    }
                    out.println("Customer data is successfully inserted.");
                }
            }
		} catch (Exception e) {
			out.print(e);
		}
    %>
    <input type="button" onclick="window.location.href='../adminFunctionality/adminNavigation.jsp'" value="Back to admin navigation page">

    </body>
</html>