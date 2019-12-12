<!DOCTYPE html>
<html>
    <head>
        <title>View Past/Future Reservations: Security Check</title>
    </head>
    <body>
        <h1>Security Check to View Reservations</h1>
        <br>
        <h3>Please re-enter your login credentials:</h3>
        <form method="post" action="checkLogin.jsp">     
            <div class="container">
              <label for="uname"><b>Username</b></label>
              <input type="text" placeholder="Enter Username" name="username" required>
      
              <label for="psw"><b>Password</b></label>
              <input type="password" placeholder="Enter Password" name="password" required>
                  
              <button onclick="location.href = 'viewReservationsLoginCheck.jsp';" type="submit">Login</button>
            </div>
          </form>
    </body>
</html>