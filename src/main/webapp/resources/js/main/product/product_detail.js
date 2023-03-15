// 버튼
const sizeBtn = document.querySelector(".detail_choose");
const methodBtn = document.querySelector(".detail_method");
const standardBtn = document.querySelector(".detail_standard");
const cartBtn = document.querySelector(".detail_cart");
const plusBtn = document.querySelector(".detail_plus");
const minusBtn = document.querySelector(".detail_minus");

const priceTab = document.querySelector(".detail_price_wrapper");

function sizeSelect(size, price, facPrice) {
  document.querySelector(".detail_option_size").innerText = size;
  document.querySelector(".detail_final_price").innerText = `${parseInt(
    price
  ).toLocaleString()}원`;
  document.querySelector(".detail_not_price").innerText = `${parseInt(
    facPrice
  ).toLocaleString()}원`;
  priceTab.style.display = "block";
}

// 사이즈 선택 ajax
sizeBtn.addEventListener("click", () => {
  const tg_id = document.querySelector(".tg_id").value;
  const tg_dcrate = document.querySelector(".tg_dcrate").value;
  $.ajax({
    url: "product.size.get",
    type: "POST",
    data: { tg_id },
    success: function (data) {
      $(".size_wrapper").empty();
      const tireSizes = data["sizes"];
      const tireDiscount = (100 - tg_dcrate) * 0.01;
      $.each(tireSizes, function (i) {
        const tireSize = `${tireSizes[i]["ti_width"]}/${tireSizes[i]["ti_ratio"]}R${tireSizes[i]["ti_inch"]}(${tireSizes[i]["ti_hg"]}${tireSizes[i]["ti_speed"]})`;
        const tirePrice =
          Math.floor((tireSizes[i]["ti_pricefac"] * tireDiscount) / 100) * 100;
        $(".size_wrapper").append(`
          <div class="tire_size">
            <button class="tire_size_button${i}" onclick="sizeSelect('${tireSize}', '${tirePrice}', '${tireSizes[i]["ti_pricefac"]}')"></button>
          </div>
        `);
        $(`.tire_size_button${i}`).text(
          `${tireSize} ${tirePrice.toLocaleString()}원`
        );
      });
    },
  });
  const sizeSelector = document.querySelector(".detail_size_selector");
  sizeSelector.showModal();
});

// 수량별 가격 변동
plusBtn.addEventListener("click", () => {
  let quantityInput = document.querySelector(".detail_quantity_input").value;
  let finalPrice = document.querySelector(".detail_final_price").innerText;
  let notPrice = document.querySelector(".detail_not_price").innerText;
  let ti_stock = document.querySelector(".ti_stock").value;
  let ti_pricegp = document.querySelector(".ti_pricegp").value;
  let ti_pricefac = document.querySelector(".ti_pricefac").value;

  let intQuantityInput = parseInt(quantityInput);
  let intFinalPrice = parseInt(finalPrice.replace("원", "").replace(",", ""));
  let intNotPrice = parseInt(notPrice.replace("원", "").replace(",", ""));

  intQuantityInput++;
  intFinalPrice = intQuantityInput * intFinalPrice;
  intNotPrice = intQuantityInput * intNotPrice;

  quantityInput = intQuantityInput;
  finalPrice = `${intFinalPrice.toLocaleString()}원`;
  notPrice = `${intNotPrice.toLocaleString()}원`;
  ti_stock = intQuantityInput;
  ti_pricegp = intFinalPrice;
  ti_pricefac = intNotPrice;
});

minusBtn.addEventListener("click", () => {
  if (intInput !== 1) {
    intInput--;
  }
});

cartBtn.addEventListener("click", () => {
  const tg_id = document.querySelector(".tg_id").value;
  const tg_brand = document.querySelector(".tg_brand").value;
  const tg_name = document.querySelector(".tg_name").value;
  const tg_img = document.querySelector(".tg_img").value;
  const tg_dcrate = document.querySelector(".tg_dcrate").value;
  const ti_width = document.querySelector(".ti_width").value;
  const ti_ratio = document.querySelector(".ti_ratio").value;
  const ti_inch = document.querySelector(".ti_inch").value;
  const ti_stock = document.querySelector(".ti_stock").value;
  const ti_pricefac = document.querySelector(".ti_inch").value;
  const ti_pricegp = document.querySelector(".ti_inch").value;
  const cartDTO = {
    tg_id,
    tg_brand,
    tg_name,
    tg_img,
    tg_dcrate,
    ti_width,
    ti_ratio,
    ti_inch,
    ti_stock,
    ti_pricegp,
    ti_pricefac,
  };

  // 장바구니 추가
  $.ajax({
    url: "cart.add",
    type: "POST",
    data: cartDTO,
    success: function (result) {
      if (result === 1) {
        const cartDialog = document.querySelector(".detail_cart_dialog");
        cartDialog.showModal();
      }
    },
  });
});

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
