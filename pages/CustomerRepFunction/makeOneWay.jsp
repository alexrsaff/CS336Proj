<%@ page import ="java.io.*,java.util.*,java.sql.*,java.lang.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>


<body>

	<br>
	<form method="post" action="finishOneWayUserCheckout.jsp">
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
				<td>Class: </td>
				<td>
					<select name="classBooked" size=1>
						<option value="economy">Economy Class</option>
						<option value="business">Business Class</option>
						<option value="first">First Class</option>
					</select>				
				</td>
			</tr>
			<tr>
				<td>Special Meal: </td>
				<td><input type="text" name="specialMeal"></td>
			</tr>
		</table>
	<input type="submit" value="Submit">
	</form>
	<br>
	<br>

</body>

</html>