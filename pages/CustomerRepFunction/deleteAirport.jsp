<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Delete Airport</title>
    </head>
    <body>
        <h1>Delete an Airport</h1>
        <form action = "deleteAirportB.jsp" method = "POST">
            <input type="text" name="airportID" placeholder="Enter the ID of the Airport" required maxlength="15">
            <br>
            <input type="submit" value="Submit"/>
            <br>
            <a href='manageInfo.jsp'>Return</a>
        </form>
    </body>
</html>