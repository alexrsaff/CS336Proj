<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<HTML>
    <BODY>
<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection conn = DriverManager.getConnection(url, "Application", "JAAYS");
		Statement statement=conn.createStatement();
		String select = "SELECT TF.ticketNumber, F.airlineID, F.flightNumber, TF.class, TF.seatNumber, TF.meal, D.airportID, F.departDate, F.departTime, A.airportID, F.arriveDate, F.arriveTime FROM TicketFor TF ";
		String joins = "LEFT JOIN Flight F ON TF.flightNumber = F.flightNumber AND TF.airlineID = F.airlineID LEFT JOIN Arrives A ON F.flightNumber = A.flightNumber AND F.airlineID = A.airlineID LEFT JOIN Departs D ON D.flightNumber = F.flightNumber AND F.airlineID = D.airlineID ";
		String endChunk = " ORDER BY F.departDate, F.departTime ASC";
		String query = select + joins + endChunk;
        ResultSet output = statement.executeQuery(query);
        %>
            <TABLE BORDER="1">
                <TR>
					<TH>Ticket Number</TH>
					<TH>Airline ID</TH>
					<TH>Flight Number</TH>
					<TH>Class</TH>
					<TH>Seat Number</TH>
					<TH>Meal</TH>
					<TH>Departure Airport ID</TH>
					<TH>Departure Date</TH>
					<TH>Departure Time</TH>
					<TH>Arrival Airport ID</TH>
					<TH>Arrival Date</TH>
					<TH>Arrival Time</TH>
                </TR>
        <%
        while(output.next())
        {
            %>
                <TR>
                        <TD> <%= output.getString("ticketNumber") %></td>
						<TD> <%= output.getString("airlineID") %></TD>
						<TD> <%= output.getString("flightNumber") %></td>
						<TD> <%= output.getString("class") %></TD>
						<TD> <%= output.getString("seatNumber") %></td>
						<TD> <%= output.getString("meal") %></TD>
						<TD> <%= output.getString("D.airportID") %></td>
						<TD> <%= output.getString("departDate") %></TD>
						<TD> <%= output.getString("departTime") %></td>
						<TD> <%= output.getString("A.airportID") %></TD>
						<TD> <%= output.getString("arriveDate") %></td>
						<TD> <%= output.getString("arriveTime") %></TD>
                </TR>
            <%
        }
        %>
                    </TABLE><br>
                    <input type="button" onclick="window.location.href='adminNavigation.jsp'" value="Back to admin page">
                </BODY>
            </HTML>
        <%
        output.close();
        statement.close();
        conn.close();
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>