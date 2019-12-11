<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    body {font-family: Arial, Helvetica, sans-serif;}
    /*form {border: 3px solid #f1f1f1;}*/

    input[type=text], input[type=password] {
      width: 100%;
      padding: 12px 20px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    button {
      background-color: #1940BF;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
    }

    button:hover {
      opacity: 0.8;
    }

    .imgcontainer {
      text-align: center;
      margin: 24px 0 12px 0;
    }

    img.avatar {
      width: 40%;
      border-radius: 50%;
    }

    .container {
      padding: 2px;
    }

    span.psw {
      float: right;
      padding-top: 16px;
    }

    </style>
  </head>

  <body>
    <h2>Welcome to Knockoff Kayak (at least we're cheaper)</h2>

    <form method="post" action="checkLogin.jsp">
      <div class="imgcontainer">
        <img src="toomanyairpl.jpg" alt="Avatar" class="avatar">
      </div>

      <div class="container">
        <label for="uname"><b>Username</b></label>
        <input type="text" placeholder="Enter Username" name="username" required>

        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" required>
            
        <button onclick="location.href = 'checkLogin.jsp';" type="submit">Login</button>
      </div>
    </form>

    <div class="container">
    <button onclick="location.href = 'register.jsp';" type="submit">New User?</button>
    </div>

    <div class="container" style="background-color: white">
        <span class="psw">I forgot my <a href="#" onclick="location.href = 'forgotPassword.jsp';">password</a></span>
    </div>

  </body>
</html>