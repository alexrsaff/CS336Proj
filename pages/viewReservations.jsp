<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>View Reservations</title>
    </head>
    <body>
		<h1>Select which reservations you would like to view</h1>
		<form action = "viewReservationsB.jsp" method = "POST">
            <label>View: </label>
			<select name = "Timeframe">
        <option value="Upcoming">Upcoming Reservations</option>
        <option value="Past" >Past Reservations</option>
				<option value="All" selected>All Reservations</option>
			</select>
            <br>
            <input type="submit" value="View Reservations"/>
    </form>
    <input type="button" onclick="window.location.href='../project/customerLogin.jsp'" value="Back to menu page">
    </body>
</html>