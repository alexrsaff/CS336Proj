<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>

<%
    String userid = (String)session.getAttribute("username");
    session.setAttribute("username", userid);
    out.println("<h2>" + "Welcome "+ userid + "</h2>");
%>

<body>

	<%
    String flightNumber;
    String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
    Connection connection = null;
    PreparedStatement preparedStatement = null;

		try {
			Class.forName("com.mysql.jdbc.Driver"); 
            connection = DriverManager.getConnection(url, "Application", "JAAYS");

			String filter = request.getParameter("filter");// request.setAttribute("departureAirport", departureAirport);
			String sortmethod = request.getParameter("sortmethod"); //request.setAttribute("arrivalAirport", arrivalAirport);

            String str = (String)session.getAttribute("searchString");

            String filterConcat = " ORDER BY " + filter + " " + sortmethod;
            str = str + filterConcat + ";";

			preparedStatement = connection.prepareStatement(str);
            
			ResultSet rs;
			rs = preparedStatement.executeQuery(str);

    %>
    <text>Search criteria: </text>
    <%
        out.println("<text>" + str + "</text>");
    %>
    <br>


	<!--  Make an HTML table to show the results in: -->
	<table border="3" style=color:black cellspacing="4" cellpadding="4">
		<tr style=color:red>
            <th>Airline Company</th>
            <th>Flight Number</th>
            <th>Flight Type</th>
            <th>Departure Time</th>
            <th>Departure Date</th>
            <th>Departure Airport</th>
            <th>Arrival Time</th>
            <th>Arrival Date</th>
            <th>Arrival Airport</th>
			<th>Economy Class Price</th>
			<th>Business Class Price</th>
			<th>First Class Price</th>
        </tr>

		<%
			//parse out the results
				while (rs.next()) {	
					flightNumber = rs.getString("flightNumber");
		%>
		<tr>
                <td><%=rs.getString("airlineID")%></td>
                <td><%=rs.getString("flightNumber")%></td>
                <td><%=rs.getString("domInt")%></td>
                <td><%=rs.getString("departTime")%></td>
                <td><%=rs.getString("departDate")%></td>
                <td><%=rs.getString("airportID")%></td>
                <td><%=rs.getString("arriveTime")%></td>
                <td><%=rs.getString("arriveDate")%></td>
                <td><%=rs.getString("arriveairportID")%></td>
                <td>$ <%=rs.getString("economyClassFare")%></td>
                <td>$ <%=rs.getString("businessClassFare")%></td>
                <td>$ <%=rs.getString("firstClassFare")%></td>
		</tr>
		<%
			}
		%>
	</table>


	<%
		} catch (Exception e) {
			out.print(e);
		}
	%>
	<br>

	<form method="post" action="sortOneWay.jsp">
	</form>
</body>
</html>