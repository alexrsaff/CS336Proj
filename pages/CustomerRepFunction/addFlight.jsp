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
                            <td><input type="text" name="airlineID" placeholder="Enter the Airline ID" pattern="[A-Z]{2}"></td>
                        </tr>
                        
                        <tr>
                            <td>Flight Number</td>
                            <td><input type="number" name="flightNumber" placeholder="Enter the Flight Number"></td>
                        </tr>
        
                        <tr>
                            <td>Domestic or International</td>
                            <td><input type="text" name="domInt" placeholder="Enter domestic or international for the flight"></td>
                        </tr>
        
                        <tr>
                            <td>Days of Week</td>
                            <td><input type="text" name="dayOfWeek" placeholder="Enter days of week"></td>
                        </tr>
        
                        <tr>
                            <td>Departure Date</td>
                            <td><input type="date" name="departDate" placeholder="Enter departure date"></td>
                        </tr>
                        <tr>
                                <td>Departure Time</td>
                                <td><input type="time" name="departTime" placeholder="Enter the departure time of the flight"></td>
                        </tr>
                        <tr>
                                <td>Arrival Date</td>
                                <td><input type="date" name="arrivalDate" placeholder="Enter the arrival date"></td>
                        </tr>
                        <tr>
                                <td>Arrival Time</td>
                                <td><input type="time" name="arriveTime" placeholder="Enter the arrival time"></td>
                        </tr>
                        <tr>
                                <td>First Class Fare</td>
                                <td><input type="number" name="firstClassFare" placeholder="Enter the fare for First Class" required></td>
                        </tr>
                        <tr>
                                <td>Business Class Fare</td>
                                <td><input type="number" name="businessClassFare" placeholder="Enter the fare for Business Class" required></td>
                        </tr>
                        <tr>
                                <td>Economy Fare</td>
                                <td><input type="number" name="economyClassFare" placeholder="Enter the fare for Economy" required></td>
                        </tr>
                        <tr>
                                <td>First Class Occupancy</td>
                                <td><input type="number" name="firstClassOccupancy" placeholder="Enter the total seats for First Class" required></td>
                        </tr>
                        <tr>
                                <td>Business Class Occupancy</td>
                                <td><input type="number" name="businessClassOccupancy" placeholder="Enter the total seats for Business Class" required></td>
                        </tr>
                        <tr>
                                <td>Economy Occupancy</td>
                                <td><input type="number" name="economyClassOccupancy" placeholder="Enter the total seats for Economy" required></td>
                        </tr>
                        <tr>
                                <td>Arrival Airport</td>
                                <td><input type="text" name="aID" placeholder="Enter the ID for arriving airport" required pattern="[A-Z]{3}"></td>
                        </tr>
                        <tr>
                                <td>Departure Airport</td>
                                <td><input type="text" name="dID" placeholder="Enter the ID for departure airport" required pattern="[A-Z]{3}"></td>
                        </tr>
        
                    </table>

            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>