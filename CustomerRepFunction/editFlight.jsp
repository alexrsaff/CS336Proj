<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Flight</title>
    </head>
    <body>
        <h1>Edit Flight</h1>
        <form action = "editFlightB.jsp" method = "POST">
            <input type="text" name="flightNumber" placeholder="Enter the flightNumber" required maxlength="15">
            <br>
            <input type="text" name="airlineID" placeholder="Enter the Airline ID" required maxlength="15">
            <br>
            <input type="text" name="attribute" placeholder="Enter the attribute to change" required maxlength="30">
            <br>
            <input type="text" name="data" placeholder="Enter the new data" required maxlength="30">
            <br>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>