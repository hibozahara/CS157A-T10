<%@page import="java.sql.DriverManager"%>
<%@ page import="model.Donation, dao.DonationDAO, model.User, dao.UserDao, java.util.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
	for(int i = 0; i < list.size(); i++) {
		int userId = list.get(i).getUserId();
		users.add(UserDao.getUserNameById(userId));
	}
	request.setAttribute("users", users);

	%>

	<div class="navbar">
		<a href="#">Logo</a>
		<div class="navbar-right">
			<a href="#">Donations</a>
			<a href="mydonations.jsp">My Donations</a>
			<a href="#">My Request</a>
			<form action="<%= request.getContextPath() %>/logout" method="post">
				<div class="signupbts">
					<button type="submit" class="loginbtn">Logout</button>
				</div>
			</form>
		</div>
	</div>
	
	<a href="newPost.jsp"><button type="submit" class="buttonupload">Upload A Donation</button></a>
	
	<h3  style="text-align:center">Donation Listings</h3>
	
	<div><input type="text" value="<%= session.getAttribute("email") %>" /></div>
	
	<c:forEach items="${users}" var="u">
		<div class="row">
			<div class="card">
				<div class="container">
	        	<h4 style="text-align:center" >${u.getName()}</h4>
					<div class="header">Title:</div>
					<div class="cardElements" style="text-align:center"> ${ u.getEmail() }</div>
					<div class="cardElements" style="text-align:center"> Quantity:</div>
					<div class="cardElements" style="text-align:center"> Category:</div>
					<div class="cardElements" style="text-align:center"> City:</div>
					<div class="cardElements" style="text-align:center"> County:</div>
					<div class="cardElements" style="text-align:center"> Picture:</div>
					<br>
	         		 <form action="<%= request.getContextPath() %>/request" method="post">
		                <input type="hidden" name="donationUserEmail" value="${ u.getEmail() }"/>
		                <input type="submit" value="Request Now"></input> 
	              </form>	
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
  	width: 25%;
  	display: flex;
  	justify-content: center;
  	align-self:center;
  	margin-top: 50px;
	margin-left: 25px;
	background-color: #0059b3;

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

/* button { */
/* 	background-color: #ffefa0; */
/* 	color: #ac4b1c; */
/* 	font-weight: bold; */
/* 	padding: 14px 20px; */
/* 	border: none; */
/* 	cursor: pointer; */
/* 	width: 100%; */
/* } */

form input {
	background-color: #009900;
    border-radius: 3px;
    border: none;
    color: #FFFFFF;
    cursor: pointer;
    display: inline-block;
    font-family:Arial, "Helvetica Neue", Helvetica, sans-serif;
    font-size: 12px;
    padding: 10px 20px;
    text-align: center;
    font-weight: bold;
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
      font-family:Arial, "Helvetica Neue", Helvetica, sans-serif;
      font-size: 12px;
      padding: 10px 20px;
      text-align: center;
	

    }
    .buttonupload {
        background-color: #1A237E;
        border-radius: 10px;
        border: none;
        color: #FFFFFF;
        cursor: pointer;
        display: inline-block;
        font-family:Arial, "Helvetica Neue", Helvetica, sans-serif;
        font-size: 16px;
        padding: 10px 15px;
        text-align: center;
        margin-top: 10px;
        position: absolute; 
        right: 0;
        font-weight: bold;

      }
 
 .text-center {
  text-align: center;
}
      

</style>
</html>