<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Donation Posting</title>
</head>

<body>
	<form style="border: 3px solid #fca652">
		<div class="container" id="form">
			<h1 style="color: #ffd966;">Donation Details</h1>
			<a href="postings.jsp"><button type="button" class="loginbtn">Back</button></a>
			<p style="color: #ffd966;"><b> Thank you for your generous donation in advance! - FireStock Team</b></p>
			<hr>

			<label style="color: #ffd966;" for="name"><b>Donation Title</b></label> <br>
			<input type="text" placeholder="Enter Donation Title" name="name" required>
			<br>

			<label style="color: #ffd966;" for="quantity"><b>Quantity</b></label> <br>
			<input type="text" placeholder="Enter Quantity " name="quantity" required><br>

			<label style="color: #ffd966;" for="category"><b>Category</b></label><br>
			<Select class="customSelect" name="category" id="category" required>
				<option value="">Choose a Category</option>
				<option value="1">water</option>
				<option value="2">food</option>
				<option value="3">beverages</option>
				<option value="4">clothing</option>
				<option value="5">medical supply</option>
				<option value="6">paper products</option>
				<option value="7">cleaning supplies</option>
				<option value="8">baby supplies</option>
				<option value="9">shoes</option>
				<option value="10">camping supplies</option>
				<option value="11">batteries</option>
				<option value="12">personal care supplies</option>
				<option value="13">cars</option>
				<option value="14">appliances</option>
				<option value="15">furniture</option>
			</select><br>
			
			<label style="color: #ffd966;" for="city"><b>City</b></label><br>
			<Select class="customSelect" name="city" id="city" required>
				<option value="">Choose a City</option>
				<option value="1">Oakland</option>
				<option value="2">Oroville</option>
				<option value="3">Placerville</option>
				<option value="4">Fresno</option>
				<option value="5">Los Angeles</option>
				<option value="6">Santa Ana</option>
				<option value="7">Auburn</option>
				<option value="8">Sacramento</option>
				<option value="9">San Bernardino</option>
				<option value="10">San Diego</option>
				<option value="11">San Francisco</option>
				<option value="12">Redwood City</option>
				<option value="13">San Jose</option>
				<option value="14">Red Bluff</option>
				<option value="15">Santa Rosa</option>
			</select><br>
			
			<label style="color: #ffd966;" for="county"><b>County</b></label><br>
			<Select class="customSelect" name="county" id="county" required>
				<option value="">Choose a County</option>
				<option value="1">Alameda</option>
				<option value="2">Butte</option>
				<option value="3">El Dorado</option>
				<option value="4">Fresno</option>
				<option value="5">Los Angeles</option>
				<option value="6">Orange</option>
				<option value="7">Placer</option>
				<option value="8">Sacramento</option>
				<option value="9">San Bernardino</option>
				<option value="10">San Diego</option>
				<option value="11">San Francisco</option>
				<option value="12">San Mateo</option>
				<option value="13">Santa Clara</option>
				<option value="14">Tehama</option>
				<option value="15">Sonoma</option>
			</select><br>
			
			<label style="color: #ffd966;" for="picture"><b>Picture</b></label><br>
			<input type="text" placeholder="Enter a image url" name="picture" required><br>
			
			<label style="color: #ffd966;" for="contact"><b>Contact Information</b></label><br>
			<input type="text" placeholder="Enter a phone number or email" name="contact" required><br>

			<div class="signupbts">
					<input type="submit" class="postbtn">
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

.customSelect{
	width: 41.5%;
	padding: 20px;
	margin: 5px 0 22px 0;
	display: inline-block;
	background: #f1f1f1;
	border: none;
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
