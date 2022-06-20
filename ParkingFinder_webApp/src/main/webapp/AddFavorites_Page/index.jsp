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
			<img src="profile_picture.jpg" alt="handa_logo">
			<div class="logOut">
				<a
					href="http://localhost:8081/ParkingFinder_webApp/logIn_page/index.html">
					<button class="logOutButton">Log-Out</button>
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid justify-content-center">

		<div class="parkingLotName">
			<h1>
				<span><a href="/ParkingFinder_webApp/home_page/index.jsp">></a></span>
				Add Favorite Parking Lot
			</h1>
		</div>
		<div class="menuCard" id="changeResults">
			<div class="flexChangePark">
				<div class="flexText">
					<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}

					//get current user data
					Connection connection = null;
					Statement statement = null;
					ResultSet resultSet = null;

					try {
						connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingfinder_db", "root", "strawberry");
						statement = connection.createStatement();
						String sql = "SELECT * FROM currentuser_tbl";

						resultSet = statement.executeQuery(sql);

						while (resultSet.next()) {
							String parkingLot = request.getParameter("selectedParkingLot");
							String userID = resultSet.getString("user_ID");

							try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingfinder_db", "root",
								"strawberry");
						Statement st = con.createStatement();
						st.executeUpdate("insert ignore into favoriteparkinglots_tbl(parkingLot_ID,user_ID) values('" + parkingLot
								+ "','" + userID + "')");
							}

							catch (Exception e) {
						e.printStackTrace();
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
					<h2>Current Favorites Parking Lot</h2>
					<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					}

					//get current user data
					Connection con = null;
					Statement stmt = null;
					ResultSet resultSets = null;

					try {
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingfinder_db", "root", "strawberry");
						stmt = con.createStatement();
						String sql2_2 = "SELECT * FROM currentuser_tbl";

						resultSets = stmt.executeQuery(sql2_2);

						while (resultSets.next()) {
							String ID = resultSets.getString("user_ID");
							int user_ID = Integer.parseInt(ID);

							//get favorite parking lots 
							Connection connection2 = null;
							Statement statement2 = null;
							ResultSet resultSet2 = null;

							try {
						connection2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingfinder_db", "root",
								"strawberry");
						statement2 = connection2.createStatement();
						String sql2 = "SELECT * FROM favoriteparkinglots where user_ID=" + ID + " Group by parkingLot_Name";

						resultSet2 = statement2.executeQuery(sql2);

						while (resultSet2.next()) {
							out.println("<p>" + resultSet2.getString("parkingLot_Name") + "</p>");
						}

							} catch (Exception e) {
						e.printStackTrace();
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>
				</div>
			</div>
		</div>
		<div class="menuCard" id="changeParkingLot">
			<form action="/ParkingFinder_webApp/AddFavorites_Page/index.jsp"
				method="post">
				<label for="selectedParkingLot">Add Favorite Parking Lots</label>
				<p>
					<select class="selectedParkingLot" name="selectedParkingLot"
						id="selectedParkingLot">
						<%
						try {
							Class.forName("com.mysql.jdbc.Driver");
						} catch (ClassNotFoundException e) {
							e.printStackTrace();
						}

						Connection connection3 = null;
						Statement statement3 = null;
						ResultSet resultSet3 = null;

						try {
							connection3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/parkingfinder_db", "root", "strawberry");
							statement3 = connection3.createStatement();
							String sql3 = "SELECT * FROM parkinglot_tbl";

							resultSet3 = statement3.executeQuery(sql3);

							while (resultSet3.next()) {
								int parkingID = resultSet3.getInt("parkingLot_ID");
								out.println("<option  value=\"" + parkingID + "\")\">" + resultSet3.getString("parkingLot_Name") + " ");
							}

						} catch (Exception e) {
							e.printStackTrace();
						}
						%>
					</select>
					<button>Add</button>
				</p>
			</form>
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
