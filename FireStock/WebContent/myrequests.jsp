<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="model.Donation, dao.DonationDAO, model.User, dao.UserDao, model.Request, dao.RequestDao, java.util.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>My Requests</title>
</head>

<body>

	<%
	UserDao userDao = new UserDao();
	RequestDao requestDao = new RequestDao();
	String email = (String) session.getAttribute("email");
	int userId = userDao.getUserIdByEmail(email);
	List<Integer> requestedDonationId = requestDao.getRequestsByUserId(userId);
	List<Donation> list = new ArrayList<>();
	for(int i = 0; i < requestedDonationId.size(); i++) {
		Donation d = DonationDAO.getDonationByDonationId(requestedDonationId.get(i));
		
		list.add(d);
	}
	String name = userDao.getUserNameById(userId);
	request.setAttribute("list", list);
	

	%>
	<div class="navbar">
		<img class="logo" src="images/testlogo.png" alt="">
		<div class="navbar-right">
			<a href="postings.jsp">Donations</a>
			<a href="mydonations.jsp">My Donations</a>
			<a href="myrequests.jsp">My Request</a>
			<form action="<%= request.getContextPath() %>/logout" method="post">
					<button type="submit" class="logoutbtn">Logout</button>
			</form>
		</div>
	</div>
	<h3  style="text-align:center">Items You Requested:</h3>

	<c:forEach items="${ list }" var="l">
		<div class="row">
			<div class="card">
				<div class="container">
				<h4 style="text-align:center" >${ l.getName() }</h4>
					<div class="header">${ l.getTitle() }</div>
					<div class="cardElements" style="text-align:center"> Contact Information: ${ l.getContact() }</div>
					<div class="cardElements" style="text-align:center"> Quantity: ${ l.getQuantity() }</div>
					<div class="cardElements" style="text-align:center"> Category: ${ l.getTypeName() }</div>
					<div class="cardElements" style="text-align:center"> City: ${ l.getCityName() }</div>
					<div class="cardElements" style="text-align:center"> County: ${ l.getCountyName() }</div>
					<div class="cardElements" style="text-align:center"> 
						<img width="100px" height="100px" src="${ l.getPicture() }" alt="" />
					</div>
					<br>
	         		<div class="text-center"><button type="submit" class="button1">${ l.getStatus() }</button></div>
				</div>
			</div>
		</div>

	</c:forEach>
</body>

<style>

body{
	margin:0;
	padding:0;
	font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
	font-size: 17px;
	line-height: 1.6;
	background-color: #ffd966;
}

.navbar {
	overflow: hidden;
	background-color: #501b1d;
}

.logo {
	width: 4%;
	height: 4%;
	padding-top: 20px;
	padding-left: 20px;
}

.navbar a{
	float:left;
	text-align: center;
	padding-left: 20px;
	padding-top: 20px;
	color: #ffd966;
	text-decoration: none;
	font-weight: bold;
}

.navbar-right{
	float:right;
	padding-right: 30px;
}

.row{
	width: 50%;
	margin: 0 auto;
}

.card{
	box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  	transition: 0.3s;
  	display: flex;
  	justify-content: center;
  	align-self:center;
  	margin-top: 50px;
	margin-left: 25px;
	background-color: #501b1d;

}

.card:hover{
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}

.header{
	
	color: #ffffff;
	text-align: center;
}

h4{
	color: #ffd966;
}

.cardElements{
	color: #FFFFFF;
}

.button1 {
    background-color: #009900;
    border-radius: 3px;
    border: none;
    color: #FFFFFF;
    cursor: pointer;
    display: inline-block;
    font-family:Arial, "Helvetica Neue", Helvetica, sans-serif;
    font-size: 12px;
    padding: 10px 20px;
    font-weight: bold;

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

  .text-center {
  text-align: center;
}




</style>
</html>
