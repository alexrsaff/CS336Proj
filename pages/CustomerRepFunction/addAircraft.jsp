<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Add Aircraft</title>
    </head>
    <body>
        <h1>Add an Aircraft</h1>
        <form action = "addAircraftB.jsp" method = "POST">
            <input type="text" name="aircraftID" placeholder="Enter the ID of the Aircraft" required maxlength="10">
            <br>
            <input type="submit" value="Submit"/>
            <br>
            <a href='manageInfo.jsp'>Return</a>
        </form>
    </body>
</html>