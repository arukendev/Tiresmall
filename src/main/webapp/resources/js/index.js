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

const dropSearchImg = document.querySelector(".index_dropImg_search");
const dropBrandImg = document.querySelector(".index_dropImg_brand");
const dropStoreImg = document.querySelector(".index_dropImg_store");
const dropBoardImg = document.querySelector(".index_dropImg_board");

const dropSearchA = document.querySelectorAll(".index_dropSearch_a");
const dropBrandA = document.querySelectorAll(".index_dropBrand_a");
const dropStoreA = document.querySelectorAll(".index_dropStore_a");
const dropBoardA = document.querySelectorAll(".index_dropBoard_a");

for (let i = 0; i < dropSearchA.length; i++) {
  const element = dropSearchA[i];
  element.addEventListener("mouseenter", () => {
    dropSearchImg.src = `resources/web/main/index/search/${i + 1}.jpg`;
  });
}

for (let i = 0; i < dropBrandA.length; i++) {
  const element = dropBrandA[i];
  element.addEventListener("mouseenter", () => {
    dropBrandImg.src = `resources/web/main/index/brand/${i + 1}.jpg`;
  });
}

for (let i = 0; i < dropStoreA.length; i++) {
  const element = dropStoreA[i];
  element.addEventListener("mouseenter", () => {
    dropStoreImg.src = `resources/web/main/index/store/${i + 1}.jpg`;
  });
}

for (let i = 0; i < dropBoardA.length; i++) {
  const element = dropBoardA[i];
  element.addEventListener("mouseenter", () => {
    dropBoardImg.src = `resources/web/main/index/board/${i + 1}.jpg`;
  });
}

topNav.addEventListener("mouseenter", () => {
  dropMenu.style.height = "400px";
  indexShadow.style.zIndex = "9999";
});

header.addEventListener("mouseleave", () => {
  reset();
  dropMenu.style.height = "0";
  indexShadow.style.zIndex = "-10000";
});

searchMenu.addEventListener("mouseenter", () => {
  reset();
  searchMenu.style.borderBottomColor = "var(--red)";
  dropSearch.style.display = "block";
  dropSearchImg.src = `resources/web/main/index/search/1.jpg`;
});

brandMenu.addEventListener("mouseenter", () => {
  reset();
  brandMenu.style.borderBottomColor = "var(--red)";
  dropBrand.style.display = "block";
  dropBrandImg.src = `resources/web/main/index/brand/1.jpg`;
});

storeMenu.addEventListener("mouseenter", () => {
  reset();
  storeMenu.style.borderBottomColor = "var(--red)";
  dropStore.style.display = "block";
  dropStoreImg.src = `resources/web/main/index/store/1.jpg`;
});

boardMenu.addEventListener("mouseenter", () => {
  reset();
  boardMenu.style.borderBottomColor = "var(--red)";
  dropBoard.style.display = "block";
  dropBoardImg.src = `resources/web/main/index/board/1.jpg`;
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
