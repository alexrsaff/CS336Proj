<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
    out.print(request.getParameter("Month"));
    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
        Connection conn = DriverManager.getConnection(url, "Application", "JAAYS");
        Statement statement=conn.createStatement();
        String query = "SELECT * FROM Ticket, Buy WHERE DATE_FORMAT(date, '%Y-%c') = " + request.getParameter("Month") + " AND Buy.ticketNumber = Ticket.ticketNumber";
        ResultSet output = statement.executeQuery(query);
        %>
            <HTML>
            <BODY>
            <TABLE BORDER="1">
                <TR>
                    <TH>Ticket Number</TH>
                    <TH>Date</TH>
                    <TH>Time</TH>
                    <TH>Username</TH>
                    <TH>Booking Fee</TH>
                </TR>
        <%
        while(output.next())
        {
            %>
                <TR>
                        <TD> <%= output.getString("ticketNumber") %></td>
                        <TD> <%= output.getString("date") %></TD>
                        <TD> <%= output.getString("time") %></TD>
                        <TD> <%= output.getString("username") %></TD>
                        <TD> <%= output.getString("bookingFee") %></TD>
                </TR>
            <%
        }
        %>
            </TABLE>
                    <input type="button" onclick="window.location.href='../project/SalesReport.jsp'" value="Back to sales report page"><br>
                    <input type="button" onclick="window.location.href='../project/login.jsp'" value="Back to login page">
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