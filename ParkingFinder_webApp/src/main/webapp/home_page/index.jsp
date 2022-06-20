<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Handa Parking App</title>
<link rel="icon" href="handa_icon.png" type="image/icon type">
<!-- Imports -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Montserrat:wght@100;200;700;800;900&family=Varela+Round&display=swap"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Fredoka+One&family=Montserrat:wght@100;200&family=Varela+Round&display=swap"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous" />
<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<!-- Connection from MYSQL && Adding Variables -->
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;

	try {
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingfinder_db", "root", "strawberry");
		statement = connection.createStatement();
		String username = request.getParameter("username");
		String password = request.getParameter("password");	
		String sql = "SELECT * FROM users Where user_Username = '"+username+"' AND user_Password = '"+password+"'";

		resultSet = statement.executeQuery(sql);

		while (resultSet.next()) {
	%>
	<div class="d-flex justify-content-between w-100 nav">
		<div class="logo">
			<a href="/ParkingFinder_webApp/home_page/index.jsp"> <img
				src="handa_logo.png" alt="handa_logo">
				<h1>
					<span class="logo-white">Han</span><span class="logo-yellow">Da</span>
				</h1>
			</a>
		</div>
		<div class="profile_picture">
			<img src="profile_picture.jpg" alt="handa_logo">
			<div class="logOut">
				<a
					href="http://localhost:8081/ParkingFinder_webApp/logIn_page/index.html">
					<button class="logOutButton">Log-Out</button>
				</a>
			</div>
		</div>
	</div>
	<!-- Greetings -->
	<div class="container-fluid content">
		<div class="greetingsCard">
			<h1>
				<%="Hello, " + resultSet.getString("user_Username")%>
			</h1>
			<h2><%=resultSet.getString("parkingLot_Name")%></h2>
		</div>
		<%
		}

		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		<!-- Menu -->
		<div class="row justify-content-center">
			<div class="col-12 menuCard">
				<a
					href="https://www.canva.com/design/DAE3wuz8yYM/6-Iw1-CzzeK-jmX6ZSOAMA/view?mode=prototype">
					<h3>Look</h3>
					<p>
						for Available Parking <br /> Space
					</p>
				</a>
			</div>
			<div class="col-12  menuCard">
				<a href="/ParkingFinder_webApp/estimateRates_page/index.jsp">
					<h3>Estimate</h3>
					<p>
						Parking rates of a parking space <br />based on location and time
					</p>
				</a>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-6 menuCard">
				<a href="/ParkingFinder_webApp/ChangeParkingLot_page/index.jsp">
					<h3>Change</h3>
					<p>
						the location of the <br />current Parking Lot
					</p>
				</a>
			</div>
			<div class="col-6 menuCard">
				<a href="/ParkingFinder_webApp/AddFavorites_Page/index.jsp">
					<h3>Add</h3>
					<p>Favorite Parking lots</p>
				</a>
			</div>
		</div>
	</div>
	</div>
	<!-- Imports -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
	<script src="scripts.js"></script>
</body>
</html>
