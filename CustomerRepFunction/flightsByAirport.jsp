<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Search Flights By Airport</title>
    </head>
    <body>
        <h1>Choose an Airport</h1>
        <form action = "flightsByAirportB.jsp" method = "POST">
            <input type="text" name="airportID" placeholder="Enter the ID of the Airport" required maxlength="40">
            <br>
            <input type="submit" value="Submit"/>
            <br>
            <a href='login.jsp'>Return to Login</a>
        </form>
    </body>
</html>