<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.lang.String" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Add Flight</title>
    </head>
    <body>
        <h1>Add a Flight</h1>
        <form action = "addFlightB.jsp" method = "POST">
                <table>
		
                        <tr>
                            <td>Airline ID</td>
                            <td><input type="text" name="airlineID" placeholder="Enter the Airline ID"></td>
                        </tr>
                        
                        <tr>
                            <td>Flight Number</td>
                            <td><input type="text" name="flightNumber" placeholder="Enter the Flight Number"></td>
                        </tr>
        
                        <tr>
                            <td>Domestic or Interational</td>
                            <td><input type="text" name="domInt" placeholder="Enter domestic or international for the flight"></td>
                        </tr>
        
                        <tr>
                            <td>Days of Week</td>
                            <td><input type="text" name="dayOfWeek" placeholder="Enter days of week"></td>
                        </tr>
        
                        <tr>
                            <td>Departure Date</td>
                            <td><input type="text" name="departDate" placeholder="Enter departure date"></td>
                        </tr>
                        <tr>
                                <td>Departure Time</td>
                                <td><input type="text" name="departTime" placeholder="Enter the departure time of the flight"></td>
                        </tr>
                        <tr>
                                <td>Arrival Date</td>
                                <td><input type="text" name="arrivalDate" placeholder="Enter the arrival date"></td>
                        </tr>
                        <tr>
                                <td>Arrival Time</td>
                                <td><input type="text" name="arriveTime" placeholder="Enter the arrival time"></td>
                        </tr>
                        <tr>
                                <td>First Class Fare</td>
                                <td><input type="text" name="firstClassFare" placeholder="Enter the fare for First Class" required></td>
                        </tr>
                        <tr>
                                <td>Business Class Fare</td>
                                <td><input type="text" name="businessClassFare" placeholder="Enter the fare for Business Class" required></td>
                        </tr>
                        <tr>
                                <td>Economy Fare</td>
                                <td><input type="text" name="economyClassFare" placeholder="Enter the fare for Ecomomy" required></td>
                        </tr>
                        <tr>
                                <td>First Class Occupancy</td>
                                <td><input type="text" name="firstClassOccupancy" placeholder="Enter the total seats for First Class" required></td>
                        </tr>
                        <tr>
                                <td>Business Class Occupancy</td>
                                <td><input type="text" name="businessClassOccupancy" placeholder="Enter the total seats for Business Class" required></td>
                        </tr>
                        <tr>
                                <td>Economy Occupancy</td>
                                <td><input type="text" name="economyClassOccupancy" placeholder="Enter the total seats for Economy" required></td>
                        </tr>
                        <tr>
                                <td>Arrival Airport</td>
                                <td><input type="text" name="aID" placeholder="Enter the ID for arriving airport" required></td>
                        </tr>
                        <tr>
                                <td>Departure Airport</td>
                                <td><input type="text" name="dID" placeholder="Enter the ID for departure airport" required></td>
                        </tr>
        
                    </table>

            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>