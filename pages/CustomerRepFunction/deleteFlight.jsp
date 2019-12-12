<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Delete Flight</title>
    </head>
    <body>
        <h1>Delete a Flight</h1>
        <form action = "deleteFlightB.jsp" method = "POST">
            <input type="text" name="airlineID" placeholder="Enter the Airline ID" required pattern="[A-Z]{2}">
            <br>
            <input type="number" name="flightNumber" placeholder="Enter the Flight Number" required maxlength="15">
            <br>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>