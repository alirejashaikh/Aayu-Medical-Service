var opt_logo_img = document.querySelectorAll(".opt-logo-img");
var opt_logo_hover_img = document.querySelectorAll(".opt-logo-hover-img");

opt_logo_img[0].addEventListener("mouseover", () => {
  opt_logo_img[0].style.display = "none";
  opt_logo_hover_img[0].style.display = "block";
});

opt_logo_img[0].addEventListener("mouseleave", () => {
  opt_logo_img[0].style.display = "block";
  opt_logo_hover_img[0].style.display = "none";
});

