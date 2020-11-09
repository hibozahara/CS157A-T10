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
		<a href="signup.jsp" class="myButton">Sign up!</a> <a href="#"
			class="logo">Our logo goes here</a>
		<h1 id="FS">FireStock</h1>
	</header>

	<form style="border: 3px solid #ac4b1c">
		<section id="section-a">
			<p>
				<b>THE PROBLEM:</b>
			</p>
			<p>Unlike prior years, California has faced the largest outburst
				of wildfires across the state. These wildfires have desvasted the
				local environment and uprooted people from their homes.</p>
		</section>
	</form>
	>

	<form style="border: 3px solid #ac4b1c"></form>
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
	background-color: #ac4b1c;
}

h1 {
	font-size: 60px;
	line-height: 1.2;
	color: #ffefa0;
}

p {
	font-size: 20px;
	color: #ac4b1c;
	text-align: center;
}

.myButton {
	padding: 15px;
	display: block;
	background-color: #ffefa0;
	text-align: center;
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 18px;
	text-decoration: none;
	color: #ac4b1c;
	border-radius: 10px;
}

.myButton:hover {
	background-color: #ffd57e;
}

.logo {
	padding: 20px;
	display: block;
	background-color: #ffefa0;
	text-align: center;
	position: absolute;
	top: 10px;
	left: 10px;
	font-size: 20px;
	text-decoration: none;
	color: #ac4b1c;
	border-radius: 10px;
}

#FS {
	height: 100px; */ vh */ display : flex;
	flex-direction: column;
	text-align: center;
}

#section-a {
	padding: 20px;
	background: #ffefa0;
	color: #ac4b1c;
	text-align: center;
}

#section-b {
	padding: 20px;
	background: #ffefa0;
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