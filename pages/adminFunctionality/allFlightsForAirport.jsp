<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>All Flights for an Airport</title>
    </head>
    <body>
		<h1>Which airport would you like to view?</h1>
			<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
			Connection conn = DriverManager.getConnection(url, "Application", "JAAYS");
			Statement statement=conn.createStatement();
			String query = "SELECT * FROM Airport";
			ResultSet output = statement.executeQuery(query);
			List<String> inputs = new ArrayList<String>();
			while(output.next())
			{
				String thisItem = output.getString(1);
				inputs.add(thisItem);
			}
			%><br>
			<form action = "allFlightsForAirportB.jsp" method = "POST">
				<label>Select Airport: </label>
				<select name = "AirportSelection">
					<%
					for(String thisItem : inputs)
					{
						String printStatement = "<option value=\"" + thisItem + "\"> " + thisItem + "</option>";
						out.println(printStatement);
					}
					%>
				</select>
				<br><br>
				<input type="submit" value="Generate report"/>
			</form>
			<br><input type="button" onclick="window.location.href='adminNavigation.jsp'" value="Back to admin page">
		</BODY>
	</HTML>
<%
output.close();
statement.close();
conn.close();
%>