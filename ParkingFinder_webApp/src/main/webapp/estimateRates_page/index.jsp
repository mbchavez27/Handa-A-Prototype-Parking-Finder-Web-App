<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Handa Parking App</title>
<link rel="icon" href="handa_icon.png" type="image/icon type" />
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
<link rel="stylesheet" href="style.css" />
</head>
<body>
	<!--Navigation Bar -->
	<div class="d-flex justify-content-between w-100 nav">
		<div class="logo">
			<a href="/ParkingFinder_webApp/home_page/index.jsp"> <img
				src="handa_logo.png" alt="handa_logo" />
				<h1>
					<span class="logo-white">Han</span><span class="logo-yellow">Da</span>
				</h1>
			</a>
		</div>
		<div class="profile_picture">
			<img src="profile_picture.jpg" alt="handa_logo" />
			<div class="logOut">
				<a
					href="http://localhost:8081/ParkingFinder_webApp/logIn_page/index.html">
					<button class="logOutButton">Log-Out</button>
				</a>
			</div>
		</div>
	</div>
	<!--Content-->
	<div class="container-fluid justify-content-center">
		<div class="parkingLotName">
			<h1>
				<span><a href="/ParkingFinder_webApp/home_page/index.jsp">></a></span>
				<%
				try {
					String parkingLotName = "Podium Open Parking";
					out.println(parkingLotName);
				} catch (Exception e) {
					out.println("Parking Lot");
				}
				%>
			</h1>
		</div>
		<div class="menuCard" id="estimatedResults">
			<div class="flexRate">
				<div class="flexImage">
					<img src="cashRate.png" />
				</div>
				<div class="flexText">
					<h2>Estimated Parking Rate</h2>
					<p>
						&#8369; :
						<%
						//Variables
						int baseRate = 70;
						int succeedingRate = 20;
						int firstHours = 3;
						//Logic for Parking Rates 
						try {
							int parkedHours = Integer.parseInt(request.getParameter("parkingRate"));
							if (parkedHours > firstHours) {
								int totalRate = baseRate;
								for (int i = 0; i < parkedHours - firstHours; i++) {
							totalRate += succeedingRate;
								}
								out.println(totalRate);
							} else {
								out.println(baseRate);
							}
						} catch (Exception e) {
							out.println("-");
						}
						%>
					</p>
				</div>
			</div>
		</div>
		<div class="menuCard" id="estimateInput">
			<form action="/ParkingFinder_webApp/estimateRates_page/index.jsp"
				method="post">
				<label for="parkingRate">Total # of hours stayed:</label>
				<p>
					<%
					try {
						int parkedHours = Integer.parseInt(request.getParameter("parkingRate"));
						out.println("<input type=\"number\" id=\"parkingRate\" name=\"parkingRate\" value=\"" + parkedHours + "\""
						+ "min=\"1\"/>");
					} catch (Exception e) {
						out.println("<input type=\"number\" id=\"parkingRate\" name=\"parkingRate\" value=\"1\" min=\"1\"/>");
					}
					%>
					<button>Estimate</button>
				</p>
			</form>
		</div>
		<div class="menuCard" id="parkingRateInfo">
			<h2>Parking Rates Info:</h2>
			<h3>Base Price:</h3>
			<h4>For First <% out.println(firstHours); %> hours</h4>
			<p>
				&#8369;
				<%
				try {
					out.println(baseRate);
				} catch (Exception e) {
					out.println("-");
				}
				%>
			</p>
			<h3>Succeeding Hour:</h3>
			<p>
				&#8369;
				<%
				try {
					out.println(succeedingRate);
				} catch (Exception e) {
					out.println("-");
				}
				%>
			</p>
			<h3>Others:</h3>
			<p>Day Parking: &#8369;-</p>
			<p>Overnight Parking: &#8369;-</p>
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
