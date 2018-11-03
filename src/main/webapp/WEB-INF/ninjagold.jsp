<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Ninja Gold (Version 2.0)</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: lightgrey;
		}
		h1 {
			text-align: center;
			padding: 5px;
		}
		h5 {
			margin-left: 120px;
			width: 1100px;
		}
		#blueline{
			background-color: blue;
			height: 3px;
		}
		#count {
			text-align: center;
			margin: 10px;
		}
		#box1 {
			margin: 20px;
			padding: 20px;
			width: 200px;
			background-color:rgb(67, 78, 131);
			color: white;
			display: inline-block;
			border-radius: 15px;
		}
		#box2 {
			margin: 20px;
			padding: 20px;
			width: 200px;
			background-color:rgb(23, 36, 32);
			color: white;
			display: inline-block;
			border-radius: 15px;
		}
		#box3 {
			margin: 20px;
			padding: 20px;
			width: 200px;
			background-color:rgb(65, 167, 151);
			color: white;
			display: inline-block;
			border-radius: 15px;
		} 
		#box4 {
			margin: 20px;
			padding: 20px;
			width: 230px;
			background-color:rgb(59, 187, 113);
			color: white;
			display: inline-block;
			border-radius: 15px;
		}
		#box5 {
			margin: 20px;
			padding: 20px;
			width: 230px;
			background-color: rgb(77, 111, 225);
			color: white;
			display: inline-block;
			border-radius: 15px;
		}
		h4 {
			font-size: 36px;
		}
		p {
			font-size: 18px;
		}
		input[type = submit] {
			width: 120px;
			font-size: 18px;
			background-color: rgb(144, 153, 62);
			color: white;
			padding: 10px 16px;
			margin: 0;
			border: none;
			border-radius: 8px;
			cursor: pointer;
		}
		#activity {
			margin-left: 30px;
			height: 270px;
			overflow: auto;
		}
		#emptyspace {
			height: 30px;
		}
		#resetbutton {
			margin-top: 30px;
			margin-left: 30px;
		}
	</style>   
</head>
<body>
	<div id = "wrapper">
		<h1>Welcome to Ninja Gold (Ver 2.0)! </h1>
		<h5>You are a ninja, and you need gold! To earn them, you will need to enter the
		buildings shown below by clicking on the buttons inside the boxes. </h5>
		<h5>You can earn a lot of gold if you enter the bank, but be careful!
		You can lose a lot of gold as well! </h5>    
		<h5>Have fun!</h5>
		
		<% int gold = (int) session.getAttribute("gold"); %>
		
		<div id = "blueline"></div>
		<div id = "count">
			<h3>Your gold: <%= gold %></h3>
			<% if (gold < -49) {  %>
				<h6 style = "color: red;">You are running low on gold!</h6>
			<% } %>
			<% if (gold > 100) {  %>
				<h6 style = "color: green;">You're rich!</h6>
			<% } %>
		</div>
		
		<div id = "box1" align = "center">
			<h4>Market</h4>
			<p>Gain 10-20 gold</p>
			<form action = '/gold' method = 'post'>
				<input name = 'building' type = 'hidden' value = 'market'>
				<input type = 'submit' value = 'Find Gold!'>
			</form> 
		</div>
		
		<div id = "box2" align = "center">
			<h4>Cave</h4>
			<p>Gain 5-10 gold</p>
			<form action = '/gold' method = 'post'>
				<input name = 'building' type = 'hidden' value = 'cave'>
				<input type = 'submit' value = 'Find Gold!'>
			</form> 
		</div>
		
		<div id = "box3" align = "center">
			<h4>Shack</h4>
			<p>Gain 2-5 gold</p>
			<form action = '/gold' method = 'post'>
				<input name = 'building' type = 'hidden' value = 'shack'>
				<input type = 'submit' value = 'Find Gold!'>
			</form> 
		</div>
		
		<div id = "box4" align = "center">
			<h4>Bank</h4>
			<p>Gain or lose 0-50 gold</p>
			<form action = '/gold' method = 'post'>
				<input name = 'building' type = 'hidden' value = 'bank'>
				<input type = 'submit' value = 'Find Gold!'>
			</form> 
		</div>
		
		<div id = "box5" align = "center">
			<h4>Spa</h4>
			<p>Lose 5-20 gold</p>
			<form action = '/gold' method = 'post'>
				<input name = 'building' type = 'hidden' value = 'spa'>
				<input type = 'submit' value = "Don't click!">
			</form> 
		</div>
		
		<%! @SuppressWarnings("unchecked") %>
		<% ArrayList<String> message = (ArrayList<String>) session.getAttribute("message"); %>
		<% int getgold = (int) (session.getAttribute("getgold")); %>
		
		<div id = "activity">
			<p><b>Activities:</b></p>
			<c:forEach var = "m" items = "${message}">
				<p><c:out value = "${m}"/></p>
			</c:forEach>
		</div>
		
		<div id = "resetbutton">
			<form action = '/reset' method = 'post'>
				<input type = 'submit' value = 'Reset Game'>
			</form>
		</div>
		<div id = "emptyspace"></div>
	</div>
</body>
</html>