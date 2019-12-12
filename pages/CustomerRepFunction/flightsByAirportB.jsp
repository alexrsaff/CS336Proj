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
        String query = "SELECT airlineID,flightNumber FROM flights WHERE flights.arrivalAirport = " + request.getParameter("airportName") + " OR flights.departureAirport = " + request.getParameter("airportName") + ";
        ResultSet output = statement.executeQuery(query);
        %>
            <TABLE BORDER="1">
                <TR>
                    <TH>Airline ID</TH>
                    <TH>Flight Number</TH>
                </TR>
        <%
        while(output.next())
        {
            %>
                <TR>
                        <TD> <%= output.getString("airlineID") %></td>
                        <TD> <%= output.getString("flightNumber") %></TD>
                </TR>
            <%
        }
        %>
                    </TABLE>
                    <a href='login.jsp'>Return to Login</a>
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