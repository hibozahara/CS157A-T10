<%@page import="java.util.function.Predicate"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@ page
	import="model.Donation, dao.DonationDAO, model.User, dao.UserDao, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Donation Listings</title>

</head>

<body>
	<%
		List<Donation> list = DonationDAO.getDonations();
	List<User> users = new ArrayList<>();
	UserDao userDao = new UserDao();
	for (int i = 0; i < list.size(); i++) {
		int userId = list.get(i).getUserId();
		users.add(userDao.getUserById(userId));
	}
	request.setAttribute("list", list);
	request.setAttribute("users", users);
	%>

	<div class="navbar">
		<img class="logo" src="images/testlogo.png" alt="">
		<div class="navbar-right">
			<a href="postings.jsp">Donations</a> <a href="mydonations.jsp">My
				Donations</a> <a href="myrequests.jsp">My Request</a>
			<form action="<%=request.getContextPath()%>/logout" method="post">
				<div class="signupbts">
					<button type="submit" class="logoutbtn">Logout</button>
				</div>
			</form>
		</div>
	</div>

	<%-- <form action="<%= request.getContextPath() %>/searchPosts">
		<label for="search"><b>Search</b></label><br>
		<input type="text" placeholder="Enter Search String: " name="q" ><br>
	</form> --%>

	<form action="postings.jsp" method="get">
		<select name="category" id="category">
			<option value="none">None</option>
			<option value="water">Water</option>
			<option value="food">Food</option>
			<option value="beverages">Beverages</option>
			<option value="clothing">Clothing</option>
			<option value="medical supply">Medical Supply</option>
			<option value="paper products">Paper Products</option>
			<option value="cleaning supplies">Cleaning Supplies</option>
			<option value="baby supplies">Baby Supplies</option>
			<option value="shoes">Shoes</option>
			<option value="camping supplies">Camping Supplies</option>
			<option value="batteries">Batteries</option>
			<option value="personal care supplies">Personal Care
				Supplies</option>
			<option value="cars">Cars</option>
			<option value="appliances">Appliances</option>
			<option value="furniture">Furniture</option>
		</select> <input type="submit" value="Select a Category" />
	</form>
	
	<form action="postings.jsp" method="get">
		<select name="countyName" id="county">
			<option value="none">None</option>
			<option value="Alameda">Alameda</option>
			<option value="Butte">Butte</option>
			<option value="El Dorado">El Dorado</option>
			<option value="Fresno">Fresno</option>
			<option value="Los Angeles">Los Angeles</option>
			<option value="Orange">Orange</option>
			<option value="Placer">Placer</option>
			<option value="Sacramento">Sacramento</option>
			<option value="San Bernardino">San Bernardino</option>
			<option value="San Diego">San Diego</option>
			<option value="San Francisco">San Francisco</option>
			<option value="San Mateo">San Mateo</option>
			<option value="Santa Clara">Santa Clara</option>
			<option value="Tehama">Tehama</option>
			<option value="Sonoma">Sonoma</option>
		</select> <input type="submit" value="Select a County" />
	</form>
	
	<form action="postings.jsp" method="get">
		<select name="cityName" id="city">
			<option value="none">None</option>
			<option value="Oakland">Oakland</option>
			<option value="Oroville">Oroville</option>
			<option value="Placerville">Placerville</option>
			<option value="Fresno">Fresno</option>
			<option value="Los Angeles">Los Angeles</option>
			<option value="Santa Ana">Santa Ana</option>
			<option value="Auburn">Auburn</option>
			<option value="Sacramento">Sacramento</option>
			<option value="San Bernardino">San Bernardino</option>
			<option value="San Diego">San Diego</option>
			<option value="San Francisco">San Francisco</option>
			<option value="Redwood City">Redwood City</option>
			<option value="San Jose">San Jose</option>
			<option value="Red Bluff">Red Bluff</option>
			<option value="Santa Rosa">Santa Rosa</option>
		</select> <input type="submit" value="Select a County" />
	</form>


	<a href="newPost.jsp"><button type="submit" class="buttonupload">Upload
			A Donation</button></a>

	<h3 style="text-align: center">Donation Listings</h3>

	<!-- If option is selected, run a sort based on the selection , stored in ${ param.category }-->
	<c:choose>
		<c:when test="${ param.category == 'none'}">
			<c:forEach items="${list}" var="l">
				<div class="row">
					<div class="card">
						<div class="container">
							<h4 style="text-align: center"></h4>
							<div class="header">Title: ${ l.getTitle() }</div>
							<div class="cardElements" style="text-align: center">
								Quantity: ${ l.getQuantity() }</div>
							<div class="cardElements" style="text-align: center">
								Category: ${ l.getTypeName() }</div>
							<div class="cardElements" style="text-align: center">City:
								${ l.getCityName() }</div>
							<div class="cardElements" style="text-align: center">
								County: ${ l.getCountyName() }</div>
							<div class="cardElements" style="text-align: center">
								<img src="${ l.getPicture() }" alt="" height="100px"
									width="100px" />
							</div>
							<br>
							<div class="text-center">
								<form action="<%=request.getContextPath()%>/request"
									method="post">
									<input type="hidden" name="donationUserId"
										value="${ l.getUserId() }" /> <input type="submit"
										value="Request Now"></input>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:when test="${ not empty param.category }">
			<c:set var="category" value="${ param.category }" />
			<%
				Predicate<Donation> condition = donation -> !donation.getTypeName()
					.contains((String) pageContext.getAttribute("category"));
			list.removeIf(condition);
			%>
		</c:when>
		
		<c:when test="${ param.countyName == 'none'}">
			<c:forEach items="${list}" var="l">
				<div class="row">
					<div class="card">
						<div class="container">
							<h4 style="text-align: center"></h4>
							<div class="header">Title: ${ l.getTitle() }</div>
							<div class="cardElements" style="text-align: center">
								Quantity: ${ l.getQuantity() }</div>
							<div class="cardElements" style="text-align: center">
								Category: ${ l.getTypeName() }</div>
							<div class="cardElements" style="text-align: center">City:
								${ l.getCityName() }</div>
							<div class="cardElements" style="text-align: center">
								County: ${ l.getCountyName() }</div>
							<div class="cardElements" style="text-align: center">
								<img src="${ l.getPicture() }" alt="" height="100px"
									width="100px" />
							</div>
							<br>
							<div class="text-center">
								<form action="<%=request.getContextPath()%>/request"
									method="post">
									<input type="hidden" name="donationUserId"
										value="${ l.getUserId() }" /> <input type="submit"
										value="Request Now"></input>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:when test="${ not empty param.countyName }">
			<c:set var="countyName" value="${ param.countyName }" />
			<%
				Predicate<Donation> condition = donation -> !donation.getCountyName()
					.contains((String) pageContext.getAttribute("countyName"));
			list.removeIf(condition);
			%>
		</c:when>
		
		<c:when test="${ param.cityName == 'none'}">
			<c:forEach items="${list}" var="l">
				<div class="row">
					<div class="card">
						<div class="container">
							<h4 style="text-align: center"></h4>
							<div class="header">Title: ${ l.getTitle() }</div>
							<div class="cardElements" style="text-align: center">
								Quantity: ${ l.getQuantity() }</div>
							<div class="cardElements" style="text-align: center">
								Category: ${ l.getTypeName() }</div>
							<div class="cardElements" style="text-align: center">City:
								${ l.getCityName() }</div>
							<div class="cardElements" style="text-align: center">
								County: ${ l.getCountyName() }</div>
							<div class="cardElements" style="text-align: center">
								<img src="${ l.getPicture() }" alt="" height="100px"
									width="100px" />
							</div>
							<br>
							<div class="text-center">
								<form action="<%=request.getContextPath()%>/request"
									method="post">
									<input type="hidden" name="donationUserId"
										value="${ l.getUserId() }" /> <input type="submit"
										value="Request Now"></input>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:when test="${ not empty param.cityName }">
			<c:set var="cityName" value="${ param.cityName }" />
			<%
				Predicate<Donation> condition = donation -> !donation.getCityName()
					.contains((String) pageContext.getAttribute("cityName"));
			list.removeIf(condition);
			%>
		</c:when>
	</c:choose>
	<c:forEach items="${list}" var="l">
				<div class="row">
					<div class="card">
						<div class="container">
							<h4 style="text-align: center"></h4>
							<div class="header">Title: ${ l.getTitle() }</div>
							<div class="cardElements" style="text-align: center">
								Quantity: ${ l.getQuantity() }</div>
							<div class="cardElements" style="text-align: center">
								Category: ${ l.getTypeName() }</div>
							<div class="cardElements" style="text-align: center">City:
								${ l.getCityName() }</div>
							<div class="cardElements" style="text-align: center">
								County: ${ l.getCountyName() }</div>
							<div class="cardElements" style="text-align: center">
								<img src="${ l.getPicture() }" alt="" height="100px"
									width="100px" />
							</div>
							<br>
							<div class="text-center">
								<form action="<%=request.getContextPath()%>/request"
									method="post">
									<input type="hidden" name="donationUserId"
										value="${ l.getUserId() }" /> <input type="submit"
										value="Request Now"></input>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>

</body>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	font-size: 17px;
	line-height: 1.6;
	background-color: #ffd966;
}

.navbar {
	overflow: hidden;
	background-color: #501b1d;
}

.navbar a {
	float: left;
	text-align: center;
	padding-left: 20px;
	padding-top: 20px;
	color: #ffd966;
	text-decoration: none;
	font-weight: bold;
}

.navbar-right {
	float: right;
	padding-right: 30px;
}

.row {
	width: 50%;
	margin: 0 auto;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	display: flex;
	justify-content: center;
	align-self: center;
	margin-top: 50px;
	background-color: #501b1d;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.container {
	padding: 2px 16px;
}

.header {
	color: #ffffff;
	text-align: center;
}

h4 {
	color: #ffd966;
}

.cardElements {
	color: #FFFFFF;
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

.button1 {
	background-color: #009900;
	border-radius: 3px;
	border: none;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	font-size: 12px;
	padding: 10px 20px;
	text-align: center;
	font-weight: bold;
}

.button2 {
	background-color: #990000;
	border-radius: 3px;
	border: none;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	font-size: 12px;
	padding: 10px 20px;
	text-align: center;
}

.buttonupload {
	background-color: #501b1d;
	border-radius: 10px;
	border: none;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	font-size: 16px;
	padding: 10px 10px;
	text-align: center;
	margin-top: 10px;
	position: absolute;
	right: 0;
	font-weight: bold;
	width: 10%;
}

.logoutbtn {
	padding: 20px 5px;
	margin-top: 8px;
	margin-right: 30px;
	background-color: #ffd966;
	float: right;
	width: 24%;
	border-radius: 10px;
	font-weight: bold;
	margin-bottom: 10px;
}

.logo {
	width: 4%;
	height: 4%;
	padding-top: 20px;
	padding-left: 20px;
}

.text-center {
	text-align: center;
}
</style>
</html>