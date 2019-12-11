<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Intermediary</title>
</head>
<body>
<%

String op = request.getParameter("op");
String table = request.getParameter("table");

if(op.equals("add")){
	if(table.equals("Aircrafts")){
		out.println("<p> <a href='addAircraft.jsp'>Continue</a>  </p>");
	}	
	if(table.equals("Airport")){
		out.println("<p> <a href='addAirport.jsp'>Continue</a>  </p>");
	}
	if(table.equals("Flight")){
		out.println("<p> <a href='addFlight.jsp'>Continue</a>  </p>");
	}
}

if(op.equals("edit")){
	if(table.equals("Aircrafts")){
		out.println("<p> <a href='editAircraft.jsp'>Continue</a>  </p>");
	}	
	if(table.equals("Airport")){
		out.println("<p> <a href='editAirport.jsp'>Continue</a>  </p>");
	}
	if(table.equals("Flight")){
		out.println("<p> <a href='editFlight.jsp'>Continue</a>  </p>");
	}
}

if(op.equals("delete")){
	if(table.equals("Aircrafts")){
		out.println("<p> <a href='deleteAircraft.jsp'>Continue</a>  </p>");
	}	
	if(table.equals("Airport")){
		out.println("<p> <a href='deleteAirport.jsp'>Continue</a>  </p>");
	}
	if(table.equals("Flight")){
		out.println("<p> <a href='deleteFlight.jsp'>Continue</a>  </p>");
	}
}
	
%>

</body>
</html>