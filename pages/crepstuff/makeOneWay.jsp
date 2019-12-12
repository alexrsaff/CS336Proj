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

	<br>
	<form method="post" action="searchOneWaySortFilter.jsp">
		<!-- hidden type name trip_type = "1"-->
		<table>
			<tr>
				<td>Enter Userid of customer: </td>
				<td><input type="text" name="user"></td>
			</tr>
			<tr>
				<td>Enter flight number: </td>
				<td><input type="number" name="flightNum"></td>
			</tr>
			<tr>
				<td>Enter airline company: </td>
				<td><input type="text" name="airline" pattern="[A-Z]{2}"></td>
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
				<td>Economy Price Range Filter: </td>
				<td><input type="number" name="priceMin"></td>
				<td> to </td>
				<td><input type="number" name="priceMax"></td>
			</tr>
	
		</table>

		<br>

	<input type="submit" value="Search">
	</form>
	<br>
	<br>

	<form method="post" action="registerOneWay.jsp">
		<div class="container" style=background-color:aqua>
			<h3><b>Fill out the following about the flight you wish to book</b></h3>
			<table>
				<tr>
					<td>Airline Company (2 letters): </td>
					<td><input type="text" name="airlineBooked" pattern="[A-Z]{2}"></td>
				</tr>
				<tr>
					<td>Flight Number: </td>
					<td><input type="number" name="flightNumberBooked"></td>
				</tr>
				<tr>
					<td>Class: </td>
					<td>
						<select name="classBooked" size=1>
							<option value="economy">Economy Class</option>
							<option value="business">Business Class</option>
							<option value="first">First Class</option>
						</select>				
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="Book Now!">
		</div>
	</form>

</body>

</html>