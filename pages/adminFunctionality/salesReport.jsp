<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Generate Sales Report</title>
    </head>
    <body>
        <h1>Enter the month for which you would like the report to be generated</h1>
        <form action = "salesReportB.jsp" method = "POST">
            <input type="month" name="Month" required>
            <br><br>
            <input type="submit" value="Generate report"/>
		</form>
		<br><input type="button" onclick="window.location.href='../project/login.jsp'" value="Back to login page">
    </body>
</html>