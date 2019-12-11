<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Get Waitlist</title>
    </head>
    <body>
        <h1>Check Passengers on Waitlist</h1>
        <form action = "getWaitlistB.jsp" method = "POST">
            <input type="text" name="airlineID" placeholder="Enter the ID of the Airline" required maxlength="15">
            <br>
            <input type="text" name="flightNumber" placeholder="Enter the flightNumber" required maxlength="15">
            <br>

            <input type="submit" value="Submit"/>
            <br>

            <a href='manageInfo.jsp'>Return</a>
        </form>
    </body>
</html>