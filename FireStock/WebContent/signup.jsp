<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="utf-8">
   <title>FireStock - Registration</title>
 </head>

 <body>
<form style="border:3px solid #fca652">
  <div class="container" id="form">
    <h1 style="color:#ffefa0;">Sign up below!</h1>
    <a href="login.jsp"><button type="button" class="loginbtn">Login</button></a>
    <p style="color: #ffefa0;">Please fill in this form to create a FireStock account.</p>
    <hr>

    <label style="color:#ffefa0;" for="name"><b>Full Name</b></label> <br>
    <input type="text" placeholder="Enter Full Name" name="name" required> <br>

  <!--  <input  style="width: 400px;" type="text" placeholder="Enter Full Name" name="name" required><br> -->


    <label style="color:#ffefa0;" for="email"><b>Email</b></label> <br>
    <input type="text" placeholder="Enter Email" name="email" required><br>

    <label style="color:#ffefa0;" for="pwd"><b>Password</b></label><br>
    <input type="password" placeholder="Enter Password" name="pwd" required><br>

    <label style="color:#ffefa0;" for="pwdc"><b>Confirm Password</b></label><br>
    <input type="password" placeholder="Repeat Password" name="pwdc" required>

    <div class="signupbts">
      <a href="home.jsp"><button type="button" class="cancelbtn">Cancel</button></a>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
</form>
</body>

<style>
body{
  background-color: #ffefa0;
}


#form{
  background-color: #ac4b1c;
}

 input[type=text], input[type=password] {
  width: 40%;
  padding: 20px;
  margin: 5px 0 22px 0;
  display: inline-block;
  background: #f1f1f1;
  border: none;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
}

button {
  background-color: #ffefa0;
  color: #ac4b1c;
  font-weight: bold;
  padding: 14px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity:5;
}


.cancelbtn {
  padding: 14px 20px;
  background-color: #ffefa0;
}

.cancelbtn {
  float: left;
  width: 25%;
}

.loginbtn{
  padding: 14px 20px;
  margin-top: -70px;
  background-color: #ffefa0;
  float: right;
  width: 9%;
  
}


.signupbtn {
  float: right;
  width: 25%;
}

.container {
  padding: 20px;

}

.signupbts::after {
  content: "";
  clear: both;
  display: table;
}

/*buttons resize as screen size changes */
@media screen and (max-width: 310px) {
  .cancelbtn, .signupbtn {
    width: 100%;
  }
}

</style>

</html>