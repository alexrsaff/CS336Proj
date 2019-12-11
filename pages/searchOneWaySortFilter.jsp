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

			String departureAirport = request.getParameter("departureAirport");// request.setAttribute("departureAirport", departureAirport);
			String arrivalAirport = request.getParameter("arrivalAirport"); //request.setAttribute("arrivalAirport", arrivalAirport);
			String departureDate = request.getParameter("departureDate"); //request.setAttribute("departureDate", departureDate);
            String arrivalDate = request.getParameter("arrivalDate"); //request.setAttribute("departureDate", departureDate);
            String airlineCompany = request.getParameter("airlineCompany"); //request.setAttribute("departureDate", departureDate);
            String minPrice = request.getParameter("priceMin"); //request.setAttribute("departureDate", departureDate);
            String maxPrice = request.getParameter("priceMax"); //request.setAttribute("departureDate", departureDate);
            String flexible = request.getParameter("flexibility"); //request.setAttribute("departureDate", departureDate);
            
            String depAirConcat = "";
            String arrAirConcat = "";
            String airlineConcat = "";
            String minPriceConcat = "";
            String maxPriceConcat = "";
            String departDateConcat = "";
            String arriveDateConcat = "";
            
            if(! departureAirport.isEmpty()){
                depAirConcat = " AND d.airportID = ('" + departureAirport + "')";
            }
            if (! arrivalAirport.isEmpty()){
                arrAirConcat = " AND a.airportID = ('" + arrivalAirport + "')";
            }
            if (! airlineCompany.isEmpty()){
                airlineConcat = " AND f.airlineID = ('" + airlineCompany + "')";
            }
            if (! minPrice.isEmpty()){
                //int min = Integer.ParseInt(minPrice);
                minPriceConcat = " AND f.fare >= (" + minPrice + ")";
            }
            if (! maxPrice.isEmpty()){
                maxPriceConcat = " AND f.fare <= (" + maxPrice + ")";
            }

            if (flexible.equals("no")){
                if (! departureDate.isEmpty()){
                    departDateConcat = " AND f.departDate = ('" + departureDate + "')";
                }
                if (! arrivalDate.isEmpty()){
                    arriveDateConcat = " AND f.arriveDate = ('" + arrivalDate + "')";
                }
            } else if (flexible.equals("yes")){
                if (! departureDate.isEmpty()){
                    String dt = departureDate; //Dec 11, 2019
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Calendar c = Calendar.getInstance();
                    try {
                        c.setTime(sdf.parse(dt));
                    } catch (ParseException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    c.add(Calendar.DATE, 1);  // number of days to add
                    String dtone = sdf.format(c.getTime());  // dt is now the new date
                    c.add(Calendar.DATE, 1);  // number of days to add
                    String dttwo = sdf.format(c.getTime());  // dt is now the new date
                    c.add(Calendar.DATE, 1);  // number of days to add
                    String dtthree = sdf.format(c.getTime());  // dt is now the new date
                    c.add(Calendar.DATE, -4);  // number of days to add
                    String dtfour = sdf.format(c.getTime());  // dt is now the new date
                    c.add(Calendar.DATE, -1);  // number of days to add
                    String dtfive = sdf.format(c.getTime());  // dt is now the new date
                    c.add(Calendar.DATE, -1);  // number of days to add
                    String dtsix = sdf.format(c.getTime());  // dt is now the new date

                    departDateConcat = " AND (f.departDate = ('" + departureDate + "') OR f.departDate = ('" + dtone + "') OR f.departDate = ('" + dttwo + "') OR f.departDate = ('" + dtthree + "') OR f.departDate = ('" + dtfour + "') OR f.departDate = ('" + dtfive + "') OR f.departDate = ('" + dtsix + "'))";
                }

                if (! arrivalDate.isEmpty()){
                    String dt = arrivalDate; //Dec 11, 2019
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Calendar c = Calendar.getInstance();
                    try {
                        c.setTime(sdf.parse(dt));
                    } catch (ParseException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                    c.add(Calendar.DATE, 1);  // number of days to add
                    String dtone = sdf.format(c.getTime());  // dt is now the new date
                    c.add(Calendar.DATE, 1);  // number of days to add
                    String dttwo = sdf.format(c.getTime());  // dt is now the new date
                    c.add(Calendar.DATE, 1);  // number of days to add
                    String dtthree = sdf.format(c.getTime());  // dt is now the new date
                    c.add(Calendar.DATE, -4);  // number of days to add
                    String dtfour = sdf.format(c.getTime());  // dt is now the new date
                    c.add(Calendar.DATE, -1);  // number of days to add
                    String dtfive = sdf.format(c.getTime());  // dt is now the new date
                    c.add(Calendar.DATE, -1);  // number of days to add
                    String dtsix = sdf.format(c.getTime());  // dt is now the new date

                    arriveDateConcat = " AND (f.arriveDate = ('" + arrivalDate + "') OR f.arriveDate = ('" + dtone + "') OR f.arriveDate = ('" + dttwo + "') OR f.arriveDate = ('" + dtthree + "') OR f.arriveDate = ('" + dtfour + "') OR f.arriveDate = ('" + dtfive + "') OR f.arriveDate = ('" + dtsix + "'))";
                }

            }


            String str = "SELECT f.airlineID, f.flightNumber, f.domInt, f.departTime, f.departDate, f.arriveTime, f.arriveDate, d.airportID, a.airportID as arriveairportID, f.fare FROM Flight as f, Departs as d, Arrives as a WHERE f.flightNumber=d.flightNumber AND f.flightNumber=a.flightNumber AND f.airlineID=d.airlineID AND f.airlineID=a.airlineID";
            
            str = str + depAirConcat + arrAirConcat + airlineConcat + minPriceConcat + maxPriceConcat + departDateConcat + arriveDateConcat + ";";
			preparedStatement = connection.prepareStatement(str);
            
			ResultSet rs;
            rs = preparedStatement.executeQuery(str);
            session.setAttribute("searchString",str);

    %>
    <text>Search criteria: </text>
    <%
        out.println("<text>" + departureAirport + ", " + arrivalAirport + ", " + departureDate + ", " + arrivalDate + ", " + airlineCompany + ", " + minPrice + ", " + maxPrice + "</text><br>");
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

	<form method="post" action="sortOneWay.jsp">
		<select name="filter" size=1>
			<b> Choose which attribute to sort by</b>
            <option value="price">Ticket Price (Economy)</option>
            <option value="price">Ticket Price (Business)</option>
            <option value="price">Ticket Price (First Class)</option>
			<option value="1500">Take-off Time</option>
			<option value="3000">Landing Time</option>
        </select>
        <br>
        <select name="sortmethod" size=1>
            <b>Choose how to sort</b>
            <option value="price">Lowest to Highest (Earliest to Latest)</option>
            <option value="price">Highest to Earliest (Latest to Earliest)</option>
        </select>
	</form>
</body>
</html>