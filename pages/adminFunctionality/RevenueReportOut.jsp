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
		String midChunk = ", SUM(F.firstClassFare + F.economyClassFare + F.businessClassFare + T.bookingFee) AS Revenue FROM Flight F LEFT JOIN TicketFor TF ON F.flightNumber = TF.flightNumber AND F.airlineID = TF.airlineID LEFT JOIN Ticket T ON TF.ticketNumber = T.ticketNumber RIGHT JOIN Buy B ON TF.ticketNumber = B.ticketNumber LEFT JOIN Person P ON B.username = P.username GROUP BY P.username ";
		String startChunk = "";
		String endChunk = "";
		String option = "";
		if(request.getParameter("Aggregator").equals("Flight"))
		{
			option = "Flight Number";
			startChunk = "SELECT F.flightNumber";
			endChunk = "HAVING F.flightNumber IS NOT NULL ORDER BY Revenue DESC";
		}
		else if(request.getParameter("Aggregator").equals("Airline"))
		{
			option = "Airline ID";
			startChunk = "SELECT F.airlineID";
			endChunk = "HAVING F.airlineID IS NOT NULL ORDER BY Revenue DESC";
		}
		else
		{
			option = "Username";
			startChunk = "SELECT P.username";
			endChunk = "HAVING P.username IS NOT NULL ORDER BY Revenue DESC";	
		}
        String query = startChunk + midChunk + endChunk;
        ResultSet output = statement.executeQuery(query);
        %>
            <TABLE BORDER="1">
                <TR>
                    <TH><%out.print(option);%></TH>
                    <TH>Revenue</TH>
                </TR>
        <%
        while(output.next())
        {
            %>
                <TR>
                        <TD> <%= output.getString(0) %></td>
                        <TD> <%= output.getString(1) %></TD>
                </TR>
            <%
        }
        %>
                    </TABLE><br>
                    <input type="button" onclick="window.location.href='../project/RevenueReport.jsp'" value="Back to revenue report page"><br><br>
                    <input type="button" onclick="window.location.href='../project/adminNavigation.jsp'" value="Back to admin navigation page">
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