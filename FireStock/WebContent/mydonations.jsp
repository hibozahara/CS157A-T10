<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>My Donations</title>
</head>

<body>
	<div class="navbar">
		<img src="images/testlogo.png" alt="">
		<div class="navbar-right">
			<a href="postings.jsp">Donations</a>
			<a href="mydonations.jsp">My Donations</a>
			<a href="myrequests.jsp">My Request</a>
			<form action="<%= request.getContextPath() %>/logout" method="post">
					<button type="submit" class="logoutbtn">Logout</button>
			</form>
		</div>
	</div>
	
	<h3  style="text-align:center">Items You Donated:</h3>

	<div class="row">
		<div class="card">
			<div class="container">
        	<div class="text-center"> <button type="submit" class="button3">Edit</button>
			<button type="submit" class="button4">Delete</button> </div>
				<br>
				<div class="header">Title: </div>
				<div class="cardElements" style="text-align:center"> Contact Information:</div>
				<div class="cardElements" style="text-align:center"> Quantity:</div>
				<div class="cardElements" style="text-align:center"> Category:</div>
				<div class="cardElements" style="text-align:center"> City:</div>
				<div class="cardElements" style="text-align:center"> County:</div>
				<div class="cardElements" style="text-align:center"> Picture:</div>
				
				<br>
        	    <button type="submit" class="button1">Accept</button>
        		<button type="submit" class="button2">Decline</button>
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
	background-color: #ffd966;
}

.navbar {
	overflow: hidden;
	background-color: #501b1d;
}

img{
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
	margin-bottom: 5px;
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
      font-weight: bold;
	

    }
    .button3 {
        background-color: #e68a00	;
        border-radius: 3px;
        border: none;
        color: #FFFFFF;
        cursor: pointer;
        display: inline-block;
        font-family:Arial, "Helvetica Neue", Helvetica, sans-serif;
        font-size: 12px;
        padding: 5px 15px;
        text-align: center;
 		font-weight: bold;
      }

     .button4 {
          background-color: #e68a00;
          border-radius: 3px;
          border: none;
          color: #FFFFFF;
          cursor: pointer;
          display: inline-block;
          font-family:Arial, "Helvetica Neue", Helvetica, sans-serif;
          font-size: 12px;
          padding: 5px 15px;
          text-align: center;
          font-weight: bold;

        }
        
  .text-center {
  text-align: center;
}





</style>
</html>
