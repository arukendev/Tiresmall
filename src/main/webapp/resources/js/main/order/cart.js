const cartTgId = document.querySelectorAll(".cart_tg_id");
const cPPElement = document.querySelectorAll(".cart_product_price");
const cartPdStock = document.querySelectorAll(".cart_ti_stock");
const cartGpPrice = document.querySelectorAll(".cart_ti_pricegp");
const cartSobi = document.querySelectorAll(".cart_nav_value")[0];
const cartHalin = document.querySelectorAll(".cart_nav_value")[1];
const cartGyuljae = document.querySelectorAll(".cart_nav_value")[2];

for (let i = 0; i < cartTgId.length; i++) {
  const pElement = cPPElement[i];
  pElement.innerText = `${(
    parseInt(cartGpPrice[i].value) * parseInt(cartPdStock[i].value)
  ).toLocaleString()}원`;
}

changeAllPrice();

function cartDelete(id) {
  $.ajax({
    url: "cart.delete",
    type: "POST",
    data: { ti_id: id },
    success: function () {
      location.reload();
    },
    error: function () {
      location.reload();
    },
  });
}

function changeCartQuantity(element, plus) {
  const cartProduct = element.closest(".cart_product");
  const cartTiId = cartProduct.querySelector(".cart_ti_id");
  const cPPElement = cartProduct.querySelector(".cart_product_price");
  const cSIElement = cartProduct.querySelector(".cart_ti_stock");
  const cFiPElement = cartProduct.querySelector(".cart_final_price");
  const cFaPElement = cartProduct.querySelector(".cart_finalFac_price");

  let cppValue = parseInt(cartProduct.querySelector(".cart_ti_pricegp").value);
  let cpfValue = parseInt(cartProduct.querySelector(".cart_ti_pricefac").value);
  let ccInput;

  if (plus) {
    const cartCount = element.previousElementSibling;
    ccInput = parseInt(cartCount.value);
    ccInput++;
    cartCount.value = ccInput;
    cppValue = cppValue * ccInput;
    cpfValue = cpfValue * ccInput;
  } else {
    const cartCount = element.nextElementSibling;
    ccInput = parseInt(cartCount.value);
    if (ccInput !== 1) {
      ccInput--;
    }
    cartCount.value = ccInput;
    cppValue = cppValue * ccInput;
    cpfValue = cpfValue * ccInput;
  }
  cPPElement.innerText = `${cppValue.toLocaleString()}원`;
  cSIElement.value = ccInput;
  cFiPElement.value = cppValue;
  cFaPElement.value = cpfValue;
  $.ajax({
    url: "cart.update",
    type: "POST",
    data: {
      ti_id: cartTiId.value,
      ti_stock: ccInput,
      ti_allpricegp: cppValue,
      ti_allpricefac: cpfValue,
    },
    success: function () {},
    error: function () {
      location.reload();
    },
  });
  changeAllPrice();
}

function changeAllPrice() {
  const cAPElement = document.querySelectorAll(".cart_final_price");
  const cAFElement = document.querySelectorAll(".cart_finalFac_price");

  let cartAllPrice = 0;
  let cartAllFacPrice = 0;
  for (let i = 0; i < cartTgId.length; i++) {
    cartAllPrice += parseInt(cAPElement[i].value);
    cartAllFacPrice += parseInt(cAFElement[i].value);
  }
  cartSobi.innerText = `${cartAllFacPrice.toLocaleString()}원`;
  cartHalin.innerText = `${(
    cartAllFacPrice - cartAllPrice
  ).toLocaleString()}원`;
  cartGyuljae.innerText = `${cartAllPrice.toLocaleString()}원`;
}
