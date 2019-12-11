/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.27
 * Generated at: 2019-12-11 05:41:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.adminFunctionality;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.lang.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class reservationListUN_005fB_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("java.lang");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("java.io");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <title>Admin: Generate Reservation List by Username</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");

        String url = "jdbc:mysql://project.cvxoxmir4k3m.us-east-2.rds.amazonaws.com:3306/Project";
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(url, "Application", "JAAYS");
            Statement statement = conn.createStatement();
            PreparedStatement ps;
            String newValue = request.getParameter("username");
            
            String q = "SELECT t4.ticketNumber, t4.airlineID, t4.flightNumber, b.time, b.date, t4.class, t4.seatNumber, t4.meal FROM TicketFor t4, Buy b WHERE t4.ticketNumber=b.ticketNumber AND b.username = ?";
            ps = conn.prepareStatement(q);
            ps.setString(1,newValue);

            ResultSet rs = ps.executeQuery();
            //ResultSet rs = statement.executeQuery(q);
            if(rs.next()==false) {
                System.out.println("The username does not exist in the database.");
            }
            else {
            
      out.write("\r\n");
      out.write("            <table border=\"1\">\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th>Ticket Number</th>\r\n");
      out.write("                        <th>Airline ID</th>\r\n");
      out.write("                        <th>Flight Number</th>\r\n");
      out.write("                        <th>Time</th>\r\n");
      out.write("                        <th>Date</th>\r\n");
      out.write("                        <th>Class</th>\r\n");
      out.write("                        <th>Seat Number</th>\r\n");
      out.write("                        <th>Meal</th>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                ");

                while (rs.next()) {
                
      out.write("\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td> ");
      out.print( rs.getString("ticketNumber") );
      out.write("</td>\r\n");
      out.write("                        <td> ");
      out.print( rs.getString("airlineID") );
      out.write("</td>\r\n");
      out.write("                        <td> ");
      out.print( rs.getString("flightNumber") );
      out.write("</td>\r\n");
      out.write("                        <td> ");
      out.print( rs.getString("time") );
      out.write("</td>\r\n");
      out.write("                        <td> ");
      out.print( rs.getString("date") );
      out.write("</td>\r\n");
      out.write("                        <td> ");
      out.print( rs.getString("class") );
      out.write("</td>\r\n");
      out.write("                        <td> ");
      out.print( rs.getString("seatNumber") );
      out.write("</td>\r\n");
      out.write("                        <td> ");
      out.print( rs.getString("meal") );
      out.write("</td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                ");

                } 
            } 
      out.write("\r\n");
      out.write("        </table>\r\n");
      out.write("        </body>\r\n");
      out.write("        </html>\r\n");
      out.write("        ");

        rs.close();
        statement.close();
        conn.close();
		} catch (Exception e) {
			out.print(e);
		}
    
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
