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
		String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver"); 
            connection = DriverManager.getConnection(url, "Application", "JAAYS");
    
			String str = "SELECT f.airlineID, f.flightNumber, f.domInt, f.departTime, f.departDate, f.arriveTime, f.arriveDate, d.airportID, a.airportID as arriveairportID, f.fare FROM Flight as f, Departs as d, Arrives as a WHERE f.flightNumber=d.flightNumber AND f.flightNumber=a.flightNumber AND f.airlineID=d.airlineID AND f.airlineID=a.airlineID;";
			
			preparedStatement = connection.prepareStatement(str);
            
			//Run the query against the database.
			ResultSet rs;
			rs = preparedStatement.executeQuery(str);
	%>


	<!--  Make an HTML table to show the results in: -->
	<table border="3" style=color:black cellspacing="2" cellpadding="2">
		<tr style=color:red>
			<th>Airline Company</th>
			<th>Flight Number</th>
			<th>Flight Type</th>
			<th>Departure Time</th>
			<th>Departure Date</th>
			<th>Departure Airport</th>
			<th>Arrival Time</th>
			<th>Arrival Date</th>
			<th>Arrival Airport</th>
			<th>Ticket Price</th>
			<th>Reserve</th>
		</tr>

		<%
			//parse out the results
				while (rs.next()) {
					flightNumber = rs.getString("flightNumber");
		%>

		<tr>
			<td><%=rs.getString("airlineID")%></td>
			<td><%=rs.getString("flightNumber")%></td>
			<td><%=rs.getString("domInt")%></td>
			<td><%=rs.getString("departTime")%></td>
			<td><%=rs.getString("departDate")%></td>
			<td><%=rs.getString("airportID")%></td>
			<td><%=rs.getString("arriveTime")%></td>
			<td><%=rs.getString("arriveDate")%></td>
			<td><%=rs.getString("arriveairportID")%></td>
			<td>$ <%=rs.getString("fare")%></td>
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
	<form method="post" action="searchOneWaySortFilter.jsp">
		<!-- hidden type name trip_type = "1"-->
		<table>
			<tr>
				<td>Departure Airport (three letters)</td>
				<td><input type="text" name="departureAirport" pattern="[A-Z]{3}"></td>
			</tr>
			<tr>
				<td>Arrival Airport (three letters)</td>
				<td><input type="text" name="arrivalAirport" pattern="[A-Z]{3}"></td>
			</tr>
			<tr>
				<td>Departure Date</td>
				<td><input type="date" name="departureDate"></td>
			</tr>
			<tr>
				<td>Arrival Date</td>
				<td><input type="date" name="arrivalDate"></td>
			</tr>

			<tr>
				<td>---</td>
			</tr>

			<tr>
				<td><b>Additional Filters:</b></td>
			</tr>
			<tr>
				<td>Airline Company (2 letters)</td>
				<td><input type="text" name="airlineCompany" pattern="[A-Z]{2}"></td>
			</tr>
			<tr>
				<td>Date Flexibility (+ or - 3 days): </td>
				<td>
					<select name="flexibility" size=1>
							<option value="no">Not flexible</option>
							<option value="yes">Flexible</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td>Price Range Filter: </td>
				<td><input type="number" name="priceMin"></td>
				<td> to </td>
				<td><input type="number" name="priceMax"></td>
			</tr>
	
		</table>

		<br>
		<br>

	<input type="submit" value="Search">
	</form>
</body>

</html>