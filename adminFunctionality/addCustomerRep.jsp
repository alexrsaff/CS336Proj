<html>
    <head>
        <title>Admin: Add Customer</title>
    </head>
    <body>
        <h1>
		    <b>Please enter the customer representative's information you want to add into the database.</b>
	    </h1>
		
	    <form method="post" action="addCustomerRepB.jsp">
	
		    <table>
		
			    <tr>
				    <td>Username</td>
		    		<td><input type="text" name="username" required></td>
                </tr>
                
			    <tr>
			    	<td>Password</td>
			    	<td><input type="text" name="password" required></td>
                </tr>

                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="fname" required></td>
                </tr>

                <tr>
                    <td>Last Name</td>
                    <td><input type="text" name="lname" required></td>
                </tr>

                <tr>
                    <td>E-Mail</td>
                    <td><input type="text" name="email" required></td>
                </tr>

            </table>
            
		    <input type="submit" value="submit">
	    </form>
    </body>
</html>