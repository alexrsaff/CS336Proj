<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
    </head>
    <body>
        <h1>Create your Account</h1>>
        <form action = "checkRegistration.jsp" method = "POST">
            <input type="text" name="firstname" placeholder="Enter your firstname" required maxlength="15"
                pattern="[A-Z]{1}[a-z '-]{1,19}">
            <br>
            <input type="text" name="lastname" placeholder="Enter your firstname" required maxlength="15"
                pattern="[A-Z]{1}[a-z '-]{1,19}">
            <input type="text" name="username" placeholder="Enter a username" required maxlength="15" 
			    pattern="[A-Za-z0-9]{1,20}">
            <br>
            <input type="email" name="email" placeholder="Enter your email" required maxlength="50">
            <br>
            <input type="password" name="password" placeholder="Enter a password" required maxlength="20" 
			    pattern="[A-Za-z0-9]{1,20}">
            <br>
            <input type="submit" value="Finish Registration"/>
        </form>
    </body>
</html>