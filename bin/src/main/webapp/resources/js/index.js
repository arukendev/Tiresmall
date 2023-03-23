const header = document.querySelector("header");
const topNav = document.querySelector(".index_topNav");
const dropMenu = document.querySelector(".index_dropMenu");
const indexShadow = document.querySelector(".index_shadow");

const searchMenu = document.querySelector(".index_tnSearch");
const brandMenu = document.querySelector(".index_tnBrand");
const storeMenu = document.querySelector(".index_tnStore");
const boardMenu = document.querySelector(".index_tnBoard");

const dropSearch = document.querySelector(".index_dropSearch");
const dropBrand = document.querySelector(".index_dropBrand");
const dropStore = document.querySelector(".index_dropStore");
const dropBoard = document.querySelector(".index_dropBoard");

topNav.addEventListener("mouseenter", () => {
  dropMenu.style.height = "400px";
  indexShadow.style.zIndex = "99";
});

header.addEventListener("mouseleave", () => {
  reset();
  dropMenu.style.height = "0";
  indexShadow.style.zIndex = "-100";
});

searchMenu.addEventListener("mouseenter", () => {
  reset();
  searchMenu.style.borderBottomColor = "var(--red)";
  dropSearch.style.display = "block";
});

brandMenu.addEventListener("mouseenter", () => {
  reset();
  brandMenu.style.borderBottomColor = "var(--red)";
  dropBrand.style.display = "block";
});

storeMenu.addEventListener("mouseenter", () => {
  reset();
  storeMenu.style.borderBottomColor = "var(--red)";
  dropStore.style.display = "block";
});

boardMenu.addEventListener("mouseenter", () => {
  reset();
  boardMenu.style.borderBottomColor = "var(--red)";
  dropBoard.style.display = "block";
});

function reset() {
  dropBoard.style.display = "none";
  dropSearch.style.display = "none";
  dropBrand.style.display = "none";
  dropStore.style.display = "none";
  searchMenu.style.borderBottomColor = "white";
  brandMenu.style.borderBottomColor = "white";
  storeMenu.style.borderBottomColor = "white";
  boardMenu.style.borderBottomColor = "white";
}
