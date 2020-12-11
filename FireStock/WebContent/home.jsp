<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>FireStock</title>
</head>

<body>
	<header>
		<a href="signup.jsp" class="signUpButton"><b>Sign up!</b></a> <a
			href="login.jsp" class="loginButton"><b>Login</b></a> <a
			href="contactadmin.jsp" class="contactButton"><b>Help</b></a>
		<h1 id="FS">FireStock</h1>
	</header>

	<form style="border: 3px solid #501b1d">
		<section id="section-a">
			<p>
				<b>THE PROBLEM:</b>
			</p>
			<p>Unlike prior years, California has faced the largest outburst
				of wild fires across the state. These wild fires have devastated the
				local environment and uprooted people from their homes.</p>
		</section>
	</form>
	<br>

	<form style="border: 3px solid #501b1d"></form>
	<section id="section-b">
		<p>
			<b>OUR MISSION:</b>
		</p>
		<p>We want to provide a donation platform for affected people to
			obtain resources they are lacking</p>
	</section>




	<section id="section-c">
		<div id="home-images">
			<div class="image-entity">
				<img src="images/wildfire.jpg" alt="" />
			</div>

			<div class="image-entity">
				<img src="images/map.png" alt="" />
			</div>
		</div>

	</section>
</body>

<style>
body {
	margin: 0;
	font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	font-size: 17px;
	line-height: 1.6;
	background-color: #501b1d;
}

h1 {
	font-size: 60px;
	line-height: 1.2;
	color: #ffd966;
}

p {
	font-size: 20px;
	color: #501b1d;
	text-align: center;
}

.signUpButton {
	padding: 15px;
	display: block;
	background-color: #ffd966;
	text-align: center;
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 18px;
	text-decoration: none;
	color: #501b1d;
	border-radius: 10px;
}

.loginButton {
	padding: 15px;
	display: block;
	background-color: #ffd966;
	text-align: center;
	position: absolute;
	top: 10px;
	right: 130px;
	font-size: 18px;
	text-decoration: none;
	color: #501b1d;
	border-radius: 10px;
}

.contactButton {
	padding: 15px;
	display: block;
	background-color: #ffd966;
	text-align: center;
	position: absolute;
	top: 10px;
	left: 10px;
	font-size: 18px;
	text-decoration: none;
	color: #501b1d;
	border-radius: 6px;
}

.signUpButton:hover {
	background-color: #ffd57e;
}

.loginButton:hover {
	background-color: #ffd57e;
}

.contactButton:hover {
	background-color: #ffd57e;
}

#FS {
	height: 100px; */ vh */ display : flex;
	flex-direction: column;
	text-align: center;
}

#section-a {
	padding: 20px;
	background: #ffd966;
	color: #501b1d;
	text-align: center;
}

#section-b {
	padding: 20px;
	background: #ffd966;
	text-align: center;
}

img {
	width: 1000px;
	height: 500px;
	object-fit: cover;
	border-radius: 5px;
}

.image-entity {
	display: inline-block;
	margin-left: auto;
	margin-right: auto;
	padding: 50px 50px 0px 50px;
}

#home-images {
	text-align: center;
}
</style>
</html>