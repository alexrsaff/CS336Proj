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
		<form action = "RevenueReportOut.jsp" method = "POST">
            <label>Aggregate by: </label>
			<select name = "Aggregator">
				<option value="Flight" selected>Flight</option>
				<option value="Airline">Airline</option>
				<option value="Customer">Customer</option>
			</select>
            <br>
            <input type="submit" value="Generate report"/>
		</form>
    </body>
</html>