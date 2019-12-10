<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>

<%
	String userid = (String)session.getAttribute("username");
	session.setAttribute("username", userid);
	out.println("<h2>" + "Welcome "+ userid + "</h2>");
%>

<body>
	<h2>
		<b>All One-Way flights </b>
	</h2>
	<%
		String flightNumber;
		int total;

		String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver"); 
            connection = DriverManager.getConnection(url, "Application", "JAAYS");
    
			String str = "SELECT f.airlineID, f.flightNumber, f.domInt, f.departTime, f.departDate, f.arriveTime, f.arriveDate, d.airportID, a.airportID, f.fare FROM Flight as f, Departs as d, Arrives as a WHERE f.flightNumber=d.flightNumber AND f.flightNumber=a.flightNumber AND f.airlineID=d.airlineID AND f.airlineID=a.airlineID;";
			
			preparedStatement = connection.prepareStatement(str);
            
			//Run the query against the database.
			ResultSet rs;
			rs = preparedStatement.executeQuery(str);
	%>


	<!--  Make an HTML table to show the results in: -->
	<table border="3" style=color:skyblue cellspacing="4" cellpadding="4">
		<tr style=color:red>
			<th>Airline Company</th>
			<th>Flight Number</th>
			<th>Type</th>
			<th>Departure Time</th>
			<th>Departure Date</th>
			<th>Arrival Time</th>
			<th>Arrival Date</th>
			<th>Departure Airport</th>
			<th>Arrival Airport</th>
			<th>Price</th>
			<th>Reserve</th>
		</tr>

		<%
			//parse out the results
				while (rs.next()) {
					flightNumber = rs.getString("flightNumber");
		%>

		<tr>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("flightNumber")%></td>

		</tr>
		<%
			}
		%>

	</table>
	<%
		} catch (Exception e) {
			out.print(e);
		}
	%>

	<br>
	<form method="post" action="OneWay.jsp">
		<!-- hidden type name trip_type = "1"-->
		<table>
		<tr>
				<td>Enter Trip Type again</td>
				<td><input type="text" name="trip_type"></td>
			</tr>
			<tr>
				<td>Departure Airport</td>
				<td><input type="text" name="departure_airport"></td>
			</tr>
			<tr>
				<td>Arrival Airport</td>
				<td><input type="text" name="arrival_airport"></td>
			</tr>
			<tr>
				<td>Departure Date</td>
				<td><input type="date" name="departure_date"></td>
			</tr>
		</table>
		<p>
			<select name="sortBy" size=1>
				<!-- 1 means one way, 2 means round-trip-->
				<option value="total_fare">Price</option>
				<option value="departure_time">take-off time</option>
				<option value="arrival_time">landing time</option>
			</select>&nbsp;
		</p>

		<br> <select name="flexible_or_not" size=1>
			<!-- 1 means flexible, 0 means not-->
			<option value="1">Flexible</option>
			<option value="0">Not flexible</option>
		</select>&nbsp; <br> <input type="submit" value="submit">
	</form>
	<br>
</body>

</html>