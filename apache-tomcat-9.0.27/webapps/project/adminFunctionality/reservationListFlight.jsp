<!DOCTYPE html>
<html>
    <head>
        <title>Generate Reservation List by Flight Number</title>
    </head>
    <body>
        <h1>Enter the airline and flight number to get the reservations for that flight:</h1>
        <br>
        <form method ="post" action = "reservationListFlightB">
            Airline:<br>
            <input type="text" name="airline">
            <br>
            Flight Number:<br>
            <input type="text" name="flightnum">
            <br>
            <input type="submit" value="submit">
        </form>
    </body>
</html>