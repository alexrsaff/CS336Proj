<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Cancel Reservation</title>
    </head>
    <body>
        <h1>Cancel Reservation</h1>
        <form action = "cancelReservation.jsp" method = "POST">
            <input type="text" name="username" placeholder="Please Enter Username Again" required>
            <br>
            <input type="submit" value="Submit"/>
            <br>
            <a href='customerLogin.jsp'>Return</a>
        </form>
    </body>
</html>