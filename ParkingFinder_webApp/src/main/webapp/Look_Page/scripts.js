const profilePicture = document.querySelector(".profile_picture");
const logOut = document.querySelector(".logOutButton");

profilePicture.addEventListener("mouseover", showLogOut);
profilePicture.addEventListener("mouseout", hideLogOut);

function showLogOut() {
	logOut.style.transform = "translateY(0%)";
	logOut.style.visibility = "visible";
	logOut.style.opacity = "1";
	logOut.style.transition = ".1s";
}

function hideLogOut() {
	logOut.style.transform = "translateY(-50%)";
	logOut.style.visibility = "hidden";
	logOut.style.opacity = "0";
	logOut.style.transition = ".1s";
}