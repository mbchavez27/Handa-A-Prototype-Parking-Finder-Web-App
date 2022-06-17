const passwordVisble = document.querySelector("#passwordVisiblity");
const password = document.querySelector("#password");

password.setAttribute("type", "password");
passwordVisble.classList.toggle("fa-eye-slash");

passwordVisble.addEventListener("click", () => {
  if (password.type === "password") {
    password.setAttribute("type", "text");
    passwordVisble.classList.toggle("fa-eye-slash");
  } else {
    password.setAttribute("type", "password");
    passwordVisble.classList.toggle("fa-eye-slash");
  }
});
