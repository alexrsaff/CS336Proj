
<!DOCTYPE html>
<html>
    <head>
        <title>Generate Reservation List</title>
    </head>
    <body>
        <form method = "post" action = "reservationListB.jsp">
            <h1>Are you producing the list by flight number or customer name?</h1>
            <select name = "action" required>
                <option value="1">Flight Number</option>
                <option value="2">Customer Name</option>
            </select>

            <p>Please input your search:</p>
            <p><input type = "text" name = "newValue" required></p>

            <input type = "submit" value = "submit">
        </form>
    </body>
</html>