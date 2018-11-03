<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Game Over</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: lightgrey;
			text-align: center;
			padding-top: 10px;
			padding-bottom: 20px;
		}
		input[type = submit] {
			width: 150px;
			font-size: 18px;
			background-color: blue;
			color: white;
			padding: 10px 16px;
			margin: 0;
			border: none;
			border-radius: 8px;
			cursor: pointer;
		}
		img {
			padding: 20px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>Game over! You have lost too many gold to continue!</h1>
		<h1>Press the button below the image to start a new game.</h1>
		<img src = "https://derpicdn.net/img/2013/6/12/346472/medium.jpg" alt = "out of money">
		<form action = '/reset' method = 'post'>
			<input type = 'submit' value = 'Restart Game'>
		</form>
	</div>
</body>
</html>