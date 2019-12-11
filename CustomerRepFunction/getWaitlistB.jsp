<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<HTML>
    <BODY>
<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
        Connection conn = DriverManager.getConnection(url, "Application", "JAAYS");
        Statement statement=conn.createStatement();
        String query = "SELECT username FROM Waitlist WHERE flightNumber  =" Integer.parseInt(request.getParameter("flightNumber")) + " AND airlineID = request.getParameter("airlineID"));
        ResultSet output = statement.executeQuery(query);
        %>
            <TABLE BORDER="1">
                <TR>
                    <TH>Username</TH>
                </TR>
        <%
        while(output.next())
        {
            %>
                <TR>
                        <TD> <%= output.getString("username") %></td>
                </TR>
            <%
        }
        %>
                    </TABLE>
                    <a href='manageInfo.jsp'>Return</a>
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