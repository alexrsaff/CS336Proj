<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<!DOCTYPE html>
<html>

<%
    String userid = (String)session.getAttribute("username");
    session.setAttribute("username", userid);
    out.println("<h2>" + "Welcome "+ userid + "</h2>");
%>

<body>
	<h4>Search criteria: </h4>

	<%
    String flightNumber;
    String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
    Connection connection = null;
    PreparedStatement preparedStatement = null;

		try {
			Class.forName("com.mysql.jdbc.Driver"); 
            connection = DriverManager.getConnection(url, "Application", "JAAYS");

			String departureAirport = request.getParameter("departureAirport");// request.setAttribute("departureAirport", departureAirport);
			String arrivalAirport = request.getParameter("arrivalAirport"); //request.setAttribute("arrivalAirport", arrivalAirport);
			String departureDate = request.getParameter("departureDate"); //request.setAttribute("departureDate", departureDate);
            String arrivalDate = request.getParameter("arrivalDate"); //request.setAttribute("departureDate", departureDate);

            //String isFlexible = request.getParameter("flexible_or_not"); //request.setAttribute("isFlexible", isFlexible);			
            
            /*				
            
            String str1 = "SELECT weekday('" + departureDate + "') as t";
			Statement stmt1 = con.createStatement();
			//Run the query against the database.
			ResultSet result1 = stmt1.executeQuery(str1);
			result1.next();
			
			//flexible
			int dayNum = Integer.valueOf(result1.getString("t")); // this is the number use for decrement
			int dayNum2 = Integer.valueOf(result1.getString("t"));// this is the number use for increment
			int[] before = new int[3];
			int[] after = new int[3];
			for(int i = 0; i < 3; i++ ){
				dayNum -= 1;
				dayNum2 += 1;
				if(dayNum < 0){
					dayNum = 6;
				}
				if(dayNum2 > 6){
					dayNum2 = 0;
				}
				before[i] = dayNum;
				after[i] = dayNum2;
			}			
			//end of counting flexible day
			
			String str;
			if(isFlexible.equals("0")){
			 str = "SELECT a.name, o.flight_number, f.departure_time, f.arrival_time, f.departure_airport, f.arrival_airport, f.operating_days, f.total_fare from Flight as f, Airline_Company as a, Operate as o where o.companyID = a.companyID and o.flight_number = f.flight_number and f.departure_airport = ('"
					+ departureAirport + "') and f.arrival_airport =('" + arrivalAirport
					+ "') and f.operating_days like '%" + result1.getString("t") + "%' ORDER BY " + sortFlight;
			
			}
			
			else{
				str = "SELECT a.name, o.flight_number, f.departure_time, f.arrival_time, f.departure_airport, f.arrival_airport, f.operating_days, f.total_fare from Flight as f, Airline_Company as a, Operate as o where o.companyID = a.companyID and o.flight_number = f.flight_number and f.departure_airport = ('"
						+ departureAirport + "') and f.arrival_airport =('" + arrivalAirport
						+ "') and (f.operating_days like '%" + result1.getString("t") + "%' or f.operating_days like '%" + before[0] + "%' or f.operating_days like '%" + before[1] + "%' or f.operating_days like '%" + before[2] + "%' or f.operating_days like '%" + after[0] + "%' or f.operating_days like '%" + after[1] + "%' or f.operating_days like '%" + after[2] + "%') ORDER BY " + sortFlight;               
			}
            
            */

            String str = "SELECT f.airlineID, f.flightNumber, f.domInt, f.departTime, f.departDate, f.arriveTime, f.arriveDate, d.airportID, a.airportID as arriveairportID, f.fare FROM Flight as f, Departs as d, Arrives as a WHERE f.flightNumber=d.flightNumber AND f.flightNumber=a.flightNumber AND f.airlineID=d.airlineID AND f.airlineID=a.airlineID AND d.airportID = ('" + departureAirport + "') AND a.airportID = ('" + arrivalAirport + "');";
			
			preparedStatement = connection.prepareStatement(str);
            
			//Run the query against the database.
			ResultSet rs;
			rs = preparedStatement.executeQuery(str);

	%>


	<!--  Make an HTML table to show the results in: -->
	<table border="5" bgcolor="skyblue" cellspacing="4" cellpadding="4">
		<tr bgcolor="B1E1A7">
            <th>Airline Company</th>
            <th>Flight Number</th>
            <th>Flight Type</th>
            <th>Departure Time</th>
            <th>Departure Date</th>
            <th>Departure Airport</th>
            <th>Arrival Time</th>
            <th>Arrival Date</th>
            <th>Arrival Airport</th>
            <th>Ticket Price</th>
            <th>Reserve</th>
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
                <td>$ <%=rs.getString("fare")%></td>
                <td><%=rs.getString("flightNumber")%></td>
                

			</td>
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

	<form method="post" action="SortOneWay.jsp">
		<select name="price" size=1>
			<b> Price range from</b>
			<!-- 1 means one way, 2 means round-trip-->
			<option value="500">$500 and under</option>
			<option value="1500">$1500 and under</option>
			<option value="3000">$3000 and under</option>
		</select>

		<p>
			<select name="stops" size=1>
				<!-- stops = number of stops-->
				<option value="0">Nonstop</option>
				<option value="1">1 Stop</option>
			</select>
		</p>

		<select name="name" size=1>
			<!-- 1 means one way, 2 means round-trip-->
			<option value="CA">China Airline</option>
			<option value="UA">United Airline</option>
        </select>&nbsp; <br> 
	</form>
	<br>
</body>
</html>