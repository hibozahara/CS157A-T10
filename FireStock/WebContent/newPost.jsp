<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Donation Posting</title>
</head>

<body>
	<form style="border: 3px solid #fca652" action="<%=request.getContextPath()%>/newPost"  method="post">
		<div class="container" id="form">
			<h1 style="color: #ffd966;">Donation Details</h1>
			<a href="postings.jsp"><button type="button" class="loginbtn">Back</button></a>
			<p style="color: #ffd966;"><b> Thank you for your generous donation in advance! - FireStock Team</b></p>
			<hr>

			<label style="color: #ffd966;" for="name"><b>Donation Title</b></label> <br>
			<input type="text" placeholder="Enter Donation Title" name="name" required />
			<br>

			<label style="color: #ffd966;" for="quantity"><b>Quantity</b></label> <br>
			<input type="text" placeholder="Enter Quantity " name="quantity" required /><br>

			<label style="color: #ffd966;" for="category"><b>Category</b></label><br>
			<input type="text" placeholder="Enter Category Type" name="category" required /><br>
			
			<label style="color: #ffd966;" for="city"><b>City</b></label><br>
			<input type="text" placeholder="Enter City" name="city" required /><br>
			
			<label style="color: #ffd966;" for="county"><b>County</b></label><br>
			<input type="text" placeholder="Enter County" name="county" required /><br>
			
			<label style="color: #ffd966;" for="picture"><b>Picture</b></label><br>
			<input type="text" placeholder="Enter a image url" name="picture" required /><br>
			
			<label style="color: #ffd966;" for="contact"><b>Contact Information</b></label><br>
			<input type="text" placeholder="Enter a phone number or email" name="contact" required /><br>

			<input type="hidden" name="email" value="<%= session.getAttribute("email") %>" />
			
			<div class="signupbts">
				<input type="submit" class="postbtn" />

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
