<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Add Flight</title>
    </head>
    <body>
        <h1>Add a Flight</h1>
        <form action = "addFlightB.jsp" method = "POST">
            <input type="text" name="flightNumber" placeholder="Enter the Flight Number" required maxlength="15">
            <br>
            <input type="text" name="airlineID" placeholder="Enter the Airline ID" required maxlength="15">
            <br>
            <input type="text" name="domInt" placeholder="Enter domestic or international for the flight" required maxlength="15">
            <br>
            <input type="text" name="arrivalAirport" placeholder="Enter arrival Airport" required maxlength="15">
            <br>
            <input type="text" name="departureAirport" placeholder="Enter departure Airport" required maxlength="15">
            <br>
            <input type="text" name="arrivalTime" placeholder="Enter the arrival time of the flight" required maxlength="15">
            <br>
            <input type="text" name="departureTime" placeholder="Enter the departure time of the flight" required maxlength="15">
            <br>
            <input type="text" name="dayOfWeek" placeholder="Enter the operating days of the Flight" required maxlength="15">
            <br>
            <input type="text" name="fare" placeholder="Enter the fare of the Flight" required maxlength="15">
            <br>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>