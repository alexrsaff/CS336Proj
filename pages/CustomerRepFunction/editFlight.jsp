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
                <option value="1">Edit password</option>
                <option value="2">Edit first name</option>
                <option value="3">Edit last name</option>
                <option value="4">Edit e-mail</option>
            </select>

            <p>New update value</p>
            <p><input type="text" name="newValue" required></p>

            <input type="submit" value="submit">
	    </form>
    </body>
</html>