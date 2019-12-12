<html>
    <head>
        <title>Customer Rep: Edit Flight</title>
    </head>
    <body>        
        <form method="post" action="editFlightB.jsp">
            <p>Flight Information</p>
            <p></p><input type="text" name="airlineID" placeholder="Enter the Airline ID" required></p>
            <p></p><input type="text" name="flightNumber" placeholder="Enter the Flight Number" required></p>
            

            <p>Select an attribute you want to edit below:</p>
            <select name="action" size=1 required>
                <option value="1">Edit flight number</option>
                <option value="2">Edit domestic or international</option>
                <option value="3">Edit days of week</option>
                <option value="4">Edit first class fare</option>
                <option value="5">Edit business class fare</option>
                <option value="6">Edit economy class fare</option>
                <option value="7">Edit first class occupancy</option>
                <option value="8">Edit business class occupancy</option>
                <option value="9">Edit economy class occupancy</option>
                <option value="10">Edit departure airport</option>
                <option value="11">Edit arrival airport</option>
            </select>

            <h1>New update value:</h1>
            <p> If editing date or time, enter N/A into text box.</p>
            <p><input type="text" name="newValue" required></p>
            <p><input type="date" name="newDate" ></p>
            <p><input type="time" name="newtime" ></p>

            <input type="submit" value="submit">
	    </form>
    </body>
</html>