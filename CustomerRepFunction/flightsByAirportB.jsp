<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<HTML>
    <BODY>
<%
    PreparedStatement preparedStatement = null;
    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/tempfour";
        Connection conn = DriverManager.getConnection(url, "Application", "JAAYS");
        PreparedStatement ps;
        String airportID = request.getParameter("airportID");
        String query = "SELECT a.airlineID, a.flightNumber FROM Arrives AS a WHERE a.airportID = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, airportID);
        ResultSet output = ps.executeQuery();
        %>
        <table border="4" style=color:black cellspacing="2" cellpadding="2">
                <tr style=color:pink>
                <TR>
                    <TH>Arrival Airline ID</TH>
                    <TH>Arrival Flight Number</TH>
                </TR>
        <%
        while(output.next())
        {
            %>
                <TR>
                        <TD> <%= output.getString("a.airlineID") %></td>
                        <TD> <%= output.getString("a.flightNumber") %></TD>
                </TR>
            <%
        }
        %>
                    </TABLE>
                </BODY>
            </HTML>
        <%
        String query2 = "SELECT d.airlineID, d.flightNumber FROM Departs AS d WHERE d.airportID = ?";
        ps = conn.prepareStatement(query2);
        ps.setString(1, airportID);
        ResultSet output2 = ps.executeQuery();
        %>
        <table border="3" style=color:black cellspacing="2" cellpadding="2">
                <tr style=color:pink>
                    <br>
                    <br>
                <TR>
                    <TH>Departure Airline ID</TH>
                    <TH>Departure Flight Number</TH>
                </TR>
        <%
        while(output2.next())
        {
            %>
                <TR>
                        <TD> <%= output2.getString("d.airlineID") %></td>
                        <TD> <%= output2.getString("d.flightNumber") %></TD>
                </TR>
            <%
        }
        %>
                    </TABLE>
                    <a href='adminNavigation.jsp'>Return to Home</a>
                </BODY>
            </HTML>
        <%
        output.close();
        output2.close();
        conn.close();
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>