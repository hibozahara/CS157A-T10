<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Contact an Admin</title>
</head>

<body>
	<form action="mailto:someone@example.com" method="post"style="border: 3px solid #fca652">
		<div class="container" id="form">
			<h1 style="color: #ffd966;">Contact Us</h1>
			<a href="home.jsp"><button type="button" class="loginbtn">Back</button></a>
			<p style="color: #ffd966;"><b> The Team will respond to you within 3-5 business days.</b></p>
			<hr>

			<label style="color: #ffd966;" for="name"><b>Your Name</b></label> <br>
			<input type="text" placeholder="Enter Your Name" name="name" required>
			<br>

			<label style="color: #ffd966;" for="email"><b>Email</b></label> <br>
			<input type="text" placeholder="Enter Email " name="email" required><br>

			<label style="color: #ffd966;" for="message"><b>Message</b></label><br>
			<input type="text" placeholder="Enter Message Here" name="message" required>
			<br>


			<div class="signupbts">
				<a href="home.jsp">
					<button type="button" class="postbtn">Send Now</button>
				</a>
			</div>
		</div>
	</form>
</body>

<style>
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

.postbtn {
	padding: 14px 20px;
	background-color: #ffd966;
}

.postbtn {
	float: left;
	width: 25%;
}

.loginbtn {
	padding: 14px 20px;
	margin-top: -70px;
	background-color: #ffd966;
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
