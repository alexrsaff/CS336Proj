<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Flight,Airport,Aircraft</title>
</head>
<body>

<h2> Select the operation and what table to change:</h2>

<br>
	<form method="post" action="manageInfoB.jsp">
	<p>
		<select name="op" size=1>
			<option value="add">Add</option>
			<option value="edit">Edit</option>
			<option value="delete">Delete</option>
		</select>&nbsp;
	</p>
	
	<p>
	
		<br> <select name="table" size=1>
			<option value="Aircrafts">Aircrafts</option>
			<option value="Airport">Airports</option>
			<option value="Flight">Flights</option>
		</select>&nbsp;
		<br>
	</p>
		 <input type="submit" value="Submit">
	</form>
<a href='getWaitlist.jsp'>Check Waitlist</a>
<a href='makeReservationForUser.jsp'>Make Reservations For User</a>
<br>
<br>
<a href='custRepLogin.jsp'>Return to Login</a>\

</body>
</html>