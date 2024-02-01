// 버튼
const sizeBtn = document.querySelector(".detail_choose");
const methodBtn = document.querySelector(".detail_method");
const standardBtn = document.querySelector(".detail_standard");
const cartBtn = document.querySelector(".detail_cart");
const plusBtn = document.querySelector(".detail_plus");
const minusBtn = document.querySelector(".detail_minus");

const priceTab = document.querySelector(".detail_price_wrapper");

const product_tg_id = document.querySelector(".product_tg_id").value;
const product_tg_brand = document.querySelector(".product_tg_brand").value;
const product_tg_name = document.querySelector(".product_tg_name").value;
const product_tg_img = document.querySelector(".product_tg_img").value;
const product_tg_dcrate = document.querySelector(".product_tg_dcrate").value;

const quantityInput = document.querySelector(".detail_quantity_input");
let quantityInputValue = parseInt(quantityInput.value);
const finalPrice = document.querySelector(".detail_final_price");
const notPrice = document.querySelector(".detail_not_price");

function sizeSelect(id, width, ratio, inch, marking, size, price, facPrice) {
  finalPrice.innerText = `${parseInt(price).toLocaleString()}원`;
  notPrice.innerText = `${parseInt(facPrice).toLocaleString()}원`;
  document.querySelector(".detail_option_size").innerText = size;
  document.querySelector(".product_ti_id").value = id;
  document.querySelector(".product_ti_width").value = width;
  document.querySelector(".product_ti_ratio").value = ratio;
  document.querySelector(".product_ti_inch").value = inch;
  document.querySelector(".product_ti_marking").value = marking;
  document.querySelector(".product_ti_pricegp").value = price;
  document.querySelector(".product_ti_pricefac").value = facPrice;
  quantityInput.value = 1;
  quantityInputValue = 1;
  priceTab.style.display = "block";
  
}

// 사이즈 선택 ajax
sizeBtn.addEventListener("click", () => {
  $.ajax({
    url: "product.size.get",
    type: "POST",
    data: { tg_id: product_tg_id },
    success: function (data) {
      $(".size_wrapper").empty();
      const tireSizes = data["sizes"];
      const tireDiscount = (100 - product_tg_dcrate) * 0.01;
      let tireSize;
      $.each(tireSizes, function (i) {
        if (tireSizes[i]["ti_ratio"] === 0) {
          tireSize = `${tireSizes[i]["ti_width"]}R${tireSizes[i]["ti_inch"]} (${tireSizes[i]["ti_marking"]})`;
        } else {
          tireSize = `${tireSizes[i]["ti_width"]}/${tireSizes[i]["ti_ratio"]}R${tireSizes[i]["ti_inch"]} (${tireSizes[i]["ti_marking"]})`;
        }
        const tirePrice =
          Math.floor((tireSizes[i]["ti_pricefac"] * tireDiscount) / 100) * 100;
        $(".size_wrapper").append(`
          <div class="tire_size">
            <button 
              class="tire_size_button${i}"
              onclick="sizeSelect(
                '${tireSizes[i]["ti_id"]}',
                '${tireSizes[i]["ti_width"]}',
                '${tireSizes[i]["ti_ratio"]}',
                '${tireSizes[i]["ti_inch"]}',
                '${tireSizes[i]["ti_marking"]}',
                '${tireSize}',
                '${tirePrice}',
                '${tireSizes[i]["ti_pricefac"]}'
              )
            "></button>
          </div>
        `);
        $(`.tire_size_button${i}`).append(`
          <span>${tireSize}</span>
          <span>${tirePrice.toLocaleString()}원</span>
          `);
      });
    },
  });
  const sizeSelector = document.querySelector(".detail_size_selector");
  sizeSelector.showModal();
});


if($(".product_ti_width").val() !=""){
	$(".detail_price_wrapper").css("display","block");
}

// 수량별 가격 변동
plusBtn.addEventListener("click", () => {
  quantityInputValue++;
  quantityInput.value = quantityInputValue;
  const finalPriceValue =
    parseInt(document.querySelector(".product_ti_pricegp").value) *
    quantityInputValue;
  const notPriceValue =
    parseInt(document.querySelector(".product_ti_pricefac").value) *
    quantityInputValue;
  finalPrice.innerText = `${finalPriceValue.toLocaleString()}원`;
  notPrice.innerText = `${notPriceValue.toLocaleString()}원`;
});

minusBtn.addEventListener("click", () => {
  if (quantityInputValue !== 1) {
    quantityInputValue--;
  }
  quantityInput.value = quantityInputValue;
  const finalPriceValue =
    parseInt(document.querySelector(".product_ti_pricegp").value) *
    quantityInputValue;
  const notPriceValue =
    parseInt(document.querySelector(".product_ti_pricefac").value) *
    quantityInputValue;
  finalPrice.innerText = `${finalPriceValue.toLocaleString()}원`;
  notPrice.innerText = `${notPriceValue.toLocaleString()}원`;
});

function insertToCart(go) {
  const product_ti_id = document.querySelector(".product_ti_id").value;
  const product_ti_width = document.querySelector(".product_ti_width").value;
  const product_ti_ratio = document.querySelector(".product_ti_ratio").value;
  const product_ti_inch = document.querySelector(".product_ti_inch").value;
  const product_ti_marking = document.querySelector(
    ".product_ti_marking"
  ).value;
  const product_ti_stock = quantityInputValue;
  const product_ti_pricefac = document.querySelector(
    ".product_ti_pricefac"
  ).value;
  const product_ti_pricegp = document.querySelector(
    ".product_ti_pricegp"
  ).value;
  const product_ti_allpricefac =
    quantityInputValue *
    parseInt(document.querySelector(".product_ti_pricefac").value);
  const product_ti_allpricegp =
    quantityInputValue *
    parseInt(document.querySelector(".product_ti_pricegp").value);

  const cartDTO = {
    tg_id: product_tg_id,
    tg_brand: product_tg_brand,
    tg_name: product_tg_name,
    tg_img: product_tg_img,
    tg_dcrate: product_tg_dcrate,
    ti_id: product_ti_id,
    ti_width: product_ti_width,
    ti_ratio: product_ti_ratio,
    ti_inch: product_ti_inch,
    ti_marking: product_ti_marking,
    ti_stock: product_ti_stock,
    ti_pricefac: product_ti_pricefac,
    ti_pricegp: product_ti_pricegp,
    ti_allpricefac: product_ti_allpricefac,
    ti_allpricegp: product_ti_allpricegp,
  };

  if (go) {
    if (product_ti_id !== "") {
      $.ajax({
        url: "cart.pay",
        type: "POST",
        data: cartDTO,
        success: function (result) {
          if (result === 1) {
            location.href = "pay.go";
          }
        },
      });
    } else {
      document.querySelector(".detail_size_warning").showModal();
    }
  } else {
    // 장바구니 추가
    if (product_ti_id !== "") {
      $.ajax({
        url: "cart.add",
        type: "POST",
        data: cartDTO,
        success: function (result) {
          if (result === 1) {
            const cartDialog = document.querySelectorAll(
              ".detail_cart_dialog"
            )[0];
            cartDialog.showModal();
          } else {
            const cartDialog = document.querySelectorAll(
              ".detail_cart_dialog"
            )[1];
            cartDialog.showModal();
          }
        },
      });
    } else {
      document.querySelector(".detail_size_warning").showModal();
    }
  }
}

methodBtn.addEventListener("click", () => {
  const sizeGuide = document.querySelector(".detail_size_guide");
  sizeGuide.showModal();
});

standardBtn.addEventListener("click", () => {
  const standardTable = document.querySelector(".detail_standard_table");
  standardTable.showModal();
});

// 상품정보 표시
const detail = document.querySelector(".detail_nav_detail");
const confirm = document.querySelector(".detail_nav_confirm");
const guide = document.querySelector(".detail_nav_guide");
const info = document.querySelector(".detail_nav_info");

const detailPage = document.querySelector(".detail_include_detail");
const confirmPage = document.querySelector(".detail_include_confirm");
const guidePage = document.querySelector(".detail_include_guide");
const infoPage = document.querySelector(".detail_include_info");

detail.addEventListener("click", () => {
  resetDetailInclude();
  detail.classList.add("detail_nav_li_active");
  detailPage.style.display = "block";
});

confirm.addEventListener("click", () => {
  resetDetailInclude();
  confirm.classList.add("detail_nav_li_active");
  confirmPage.style.display = "block";
});

guide.addEventListener("click", () => {
  resetDetailInclude();
  guide.classList.add("detail_nav_li_active");
  guidePage.style.display = "block";
});

info.addEventListener("click", () => {
  resetDetailInclude();
  info.classList.add("detail_nav_li_active");
  infoPage.style.display = "block";
});

function resetDetailInclude() {
  detailPage.style.display = "none";
  confirmPage.style.display = "none";
  guidePage.style.display = "none";
  infoPage.style.display = "none";
  detail.classList.remove("detail_nav_li_active");
  confirm.classList.remove("detail_nav_li_active");
  guide.classList.remove("detail_nav_li_active");
  info.classList.remove("detail_nav_li_active");
}














