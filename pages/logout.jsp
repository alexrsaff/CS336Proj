<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
    <head>
        <title>Logout</title>
    </head>
    <body>
        <% session.invalidate();
        response.sendRedirect("login.jsp");
        %>
        <input type="button" onclick="window.location.href='../project/login.jsp'" value="Back to login page">
    </body>
</html>