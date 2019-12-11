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
        String query = "SELECT a.airlineID, a.flightNumber, d.airlineID, d.flightNumber FROM Arrives AS a, Departs AS d WHERE a.airportID = ? OR d.airportID = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, airportID);
        ps.setString(2, airportID);
        ResultSet output = ps.executeQuery();
        %>
        <table border="3" style=color:black cellspacing="2" cellpadding="2">
                <tr style=color:pink>
                <TR>
                    <TH>Airline ID</TH>
                    <TH>Flight Number</TH>
                </TR>
        <%
        while(output.next())
        {
            %>
                <TR>
                        <TD> <%= output.getString("a.airlineID") %></td>
                        <TD> <%= output.getString("a.flightNumber") %></TD>
                        <TD> <%= output.getString("d.airlineID") %></td>
                        <TD> <%= output.getString("d.flightNumber") %></TD>
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
        conn.close();
    }
    catch(Exception e)
    {
        out.print(e);
    }
%>