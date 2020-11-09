<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Donation Listings</title>
</head>

<body>
	<div class="navbar">
		<a href="#">Logo</a>
		<div class="navbar-right">
			<a href="#">Donations</a>
			<a href="#">My Donations</a>
			<a href="#">My Request</a>
			<a href="#">Logout</a>
		</div>
	</div>
	
	<div class="row">
		<div class="card">
			<div class="container">
				<div class="header">Header</div>
				<div><img alt="Picture of donation" src="#"></div>
				<div>Description of Donation: </div>
			</div>
		</div>
		
		<div class="card">
			<div class="container">
				<div class="header">Header</div>
				<div><img alt="Picture of donation" src="#"></div>
				<div>Description of Donation: </div>
			</div>
		</div>
		
		<div class="card">
			<div class="container">
				<div class="header">Header</div>
				<div><img alt="Picture of donation" src="#"></div>
				<div>Description of Donation: </div>
			</div>
		</div>
		
		<div class="card">
			<div class="container">
				<div class="header">Header</div>
				<div><img alt="Picture of donation" src="#"></div>
				<div>Description of Donation: </div>
			</div>
		</div>
		
		<div class="card">
			<div class="container">
				<div class="header">Header</div>
				<div><img alt="Picture of donation" src="#"></div>
				<div>Description of Donation: </div>
			</div>
		</div>
		
	</div>

</body>

<style>
body{
	margin:0;
	padding:0;
	font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	font-size: 17px;
	line-height: 1.6;
	background-color: #ffefa0;
}

.navbar {
	overflow: hidden;
	background-color: #ac4b1c;
}

.navbar a{
	float:left;
	text-align: center;
	padding-left: 20px;
	padding-top: 20px;
	color: #ffefa0;
	text-decoration: none;
	font-weight: bold;
}

.navbar-right{
	float:right;
	padding-right: 30px;
}

.card{
	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  	transition: 0.3s;
  	width: 50%;
  	display: flex;
  	justify-content: center;
  	align-self:center;
  	margin-top: 50px;
}

.card:hover{
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}

.header{
	background-color: #ac4b1c;
	color: #ffefa0;
	text-align: center:
}
</style>

</html>