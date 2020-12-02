<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>FireStock - Login</title>
</head>

<body>
	<form style="border: 3px solid #fca652" method="post" action="<%= request.getContextPath() %>/login">
		<div class="container" id="form">
			<a href="home.jsp"><button type="button" class="backbtn">BACK</button></a>
			<br>
			<h1 style="color: #ffd966;">Login</h1>
			<hr>

			<label style="color: #ffd966;" for="email"><b>Email</b></label> <br>
			<input type="text" placeholder="Enter Email" name="email" required><br>

			<label style="color: #ffd966;" for="pwd"><b>Password</b></label><br>
			<input type="password" placeholder="Enter Password" name="password"
				required><br>

			<div class="signupbts">				
				<button type="submit" class="loginbtn">Login</button>
			</div>
		</div>
	</form>
</body>

<style>
h1 {
	text-align: center;
}

body {
	background-color: #ffd966;
}

#form {
	background-color: #501b1d;
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
	background-color: #ffd966;
	color: #501b1d;
	font-weight: bold;
	padding: 14px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 5;
}

.loginbtn {
	float: right;
	width: 10%;
}

.backbtn {
	padding: 14px 10px;
	background-color: #ffd966;
	float: left;
	width: 10%;
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