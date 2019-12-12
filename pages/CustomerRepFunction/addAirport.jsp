<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Add Airport</title>
    </head>
    <body>
        <h1>Add an Airport</h1>
        <form action = "addAirportB.jsp" method = "POST">
            <input type="text" name="airportID" placeholder="Enter the ID of the Airport" required pattern="[A-Z]{3}">
            <br>
            <input type="submit" value="Submit"/>
            <br>
            <a href='manageInfo.jsp'>Return</a>
        </form>
    </body>
</html>