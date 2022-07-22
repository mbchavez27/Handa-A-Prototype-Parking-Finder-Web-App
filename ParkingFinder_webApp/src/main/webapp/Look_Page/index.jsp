<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%!String driverName = "com.mysql.jdbc.Driver";%>
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
			<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			Connection imgconnection = null;
			Statement imgstatement = null;
			ResultSet imgresultSet = null;

			try {
				imgconnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingfinder_db", "root", "strawberry");
				imgstatement = imgconnection.createStatement();
				String imgsql = "SELECT * FROM currentuser";

				imgresultSet = imgstatement.executeQuery(imgsql);

				while (imgresultSet.next()) {
					String defaultDp = "profile_picture.jpg";
					if (imgresultSet.getString("image") == null || imgresultSet.getString("image").length() == 0) {
				out.println("<img src=\"" + defaultDp + "\" alt=\"profile picture\">");
					} else {
				out.println("<img src=\"" + imgresultSet.getString("image") + "\" alt=\"profile picture\">");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			%>
			<div class="logOut">
				<a
					href="http://localhost:8081/ParkingFinder_webApp/logIn_page/index.jsp">
					<button class="logOutButton">Log-Out</button>
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid justify-content-center">

		<div class="parkingLotName">
			<h1>
				<span><a href="/ParkingFinder_webApp/home_page/index.jsp">></a></span>
				404 No records yet
			</h1>
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
