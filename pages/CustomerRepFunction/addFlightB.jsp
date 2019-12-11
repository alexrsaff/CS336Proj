<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*,java.text.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Flight</title>
    </head>
    <body>
        <%
        String query = "";
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
            Connection conn = DriverManager.getConnection(url, "Application", "JAAYS");
            Statement statement=conn.createStatement();
            query = "SELECT count(*) FROM Flight WHERE airlineID = '" + request.getParameter("airlineID")+
                        "' AND flightNumber = '" + request.getParameter("flightNumber") + "'";
            ResultSet output = statement.executeQuery(query);
            output.next();
            if(output.getInt(1) >= 1)
            {

                out.println("The flight number wanted already exists: output, <a href='manageInfo.jsp'>please try again.</a>");
            }
            else
            {
                query = "INSERT INTO Flight VALUES(" +
                        request.getParameter("flightNumber")+",'"+request.getParameter("domInt")+"','"+
                        request.getParameter("dayOfWeek")+"','"+request.getParameter("departDate")+"','"+
                        request.getParameter("departTime")+"','"+request.getParameter("arrivalDate")+"','"+
                        request.getParameter("arriveTime")+"','"+request.getParameter("airlineID")+"',"+
                        request.getParameter("firstClassFare")+","+request.getParameter("businessClassFare")+","+
                        request.getParameter("economyClassFare")+","+request.getParameter("economyClassOccupancy")+","+
                        request.getParameter("businessClassOccupancy")+","+request.getParameter("firstClassOccupancy")+")";
                out.println(query);
                out.println(statement.executeUpdate(query));
            }
        }catch(Error e)
        {
            out.println(query);
            out.println(e);
        }
		%>
    </body>
</html>
