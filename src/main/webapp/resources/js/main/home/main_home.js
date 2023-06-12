const homeShadow = document.querySelectorAll(".home_shadow");
const recommendImg = document.querySelectorAll(".home_recommend_img");
const storeImg = document.querySelectorAll(".home_store_img");

homeShadow[0].addEventListener("mouseenter", () => {
  recommendImg[0].style.transform = "scale(1.1)";
});

homeShadow[1].addEventListener("mouseenter", () => {
  recommendImg[1].style.transform = "scale(1.1)";
});

homeShadow[2].addEventListener("mouseenter", () => {
  storeImg[0].style.transform = "scale(1.1)";
});

homeShadow[3].addEventListener("mouseenter", () => {
  storeImg[1].style.transform = "scale(1.1)";
});

homeShadow[4].addEventListener("mouseenter", () => {
  storeImg[2].style.transform = "scale(1.1)";
});

homeShadow[5].addEventListener("mouseenter", () => {
  storeImg[3].style.transform = "scale(1.1)";
});

homeShadow[6].addEventListener("mouseenter", () => {
  storeImg[4].style.transform = "scale(1.1)";
});

homeShadow[0].addEventListener("mouseleave", () => {
  recommendImg[0].style.transform = "scale(1)";
});

homeShadow[1].addEventListener("mouseleave", () => {
  recommendImg[1].style.transform = "scale(1)";
});

homeShadow[2].addEventListener("mouseleave", () => {
  storeImg[0].style.transform = "scale(1)";
});

homeShadow[3].addEventListener("mouseleave", () => {
  storeImg[1].style.transform = "scale(1)";
});

homeShadow[4].addEventListener("mouseleave", () => {
  storeImg[2].style.transform = "scale(1)";
});

homeShadow[5].addEventListener("mouseleave", () => {
  storeImg[3].style.transform = "scale(1)";
});

homeShadow[6].addEventListener("mouseleave", () => {
  storeImg[4].style.transform = "scale(1)";
});



















