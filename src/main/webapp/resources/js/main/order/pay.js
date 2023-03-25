const payAllId = document.querySelectorAll(".pay_tg_id");
const payAllGp = document.querySelectorAll(".pay_final_price");
const payAllFac = document.querySelectorAll(".pay_finalFac_price");

let payAllGpPrices = 0;
let payAllFacPrices = 0;

payAllGp.forEach((e) => {
  payAllGpPrices = payAllGpPrices + parseInt(e.value);
});

payAllFac.forEach((e) => {
  payAllFacPrices = payAllFacPrices + parseInt(e.value);
});

const payNavValue = document.querySelectorAll(".pay_nav_value");

payNavValue[0].innerText = `${payAllFacPrices.toLocaleString()}원`;
payNavValue[1].innerText = `${(
  payAllFacPrices - payAllGpPrices
).toLocaleString()}원`;
payNavValue[2].innerText = `${payAllGpPrices.toLocaleString()}원`;

const payStoreAddress = document.querySelector(".pay_storeAddress");
const payStorePhone = document.querySelector(".pay_storePhone");
const payStore = document.querySelector(".pay_store");

payInitStoreMap(
  36.3417632,
  127.3663178,
  "[직영점] 타이어쇼핑몰",
  "대전광역시 서구 신갈마로 83 (갈마동)"
);

function payInitStoreMap(latV, lngV, store, address) {
  const map = new google.maps.Map(document.querySelector(".pay_map"), {
    center: { lat: latV, lng: lngV },
    zoom: 18,
  });

  const marker = new google.maps.Marker({
    position: { lat: latV, lng: lngV },
    map: map,
    title: store,
  });

  const contentString = `
    <div class="pay_mapContent">
      <div class="pay_notice">
      </div>
      <h1 class="pay_heading">${store}</h1>
      <div class="pay_mapBody">
        <p>${address}</p>
        <a 
          style="color: blue; text-decoration: underline; font-size:11pt;"
          target="_blank"
          href="https://www.google.com/maps/dir//'${latV},${lngV}'/@${latV},${lngV},18z">
          <i class="fa-solid fa-diamond-turn-right"></i>
          경로찾기
        </a>
      </div>
    </div>`;

  const infowindow = new google.maps.InfoWindow({
    content: contentString,
    ariaLabel: store,
  });

  infowindow.open({
    anchor: marker,
    map,
  });

  marker.addListener("click", () => {
    infowindow.open({
      anchor: marker,
      map,
    });
  });
}

payStore.addEventListener("change", () => {
  if (payStore.value === "타이어쇼핑몰") {
    payInitStoreMap(
      36.3417632,
      127.3663178,
      "[직영점] 타이어쇼핑몰",
      "대전광역시 서구 신갈마로 83 (갈마동)"
    );
    payStoreAddress.innerText = "대전광역시 서구 신갈마로 83 (갈마동)";
    payStorePhone.innerText = "042 - 545 - 8008";
  } else if (payStore.value === "타이어테크 죽동점") {
    payInitStoreMap(
      36.369228,
      127.338054,
      "[제휴 당일장착점] 타이어테크 죽동점",
      "대전광역시 유성구 죽동 707-2번지 타이어테크"
    );
    payStoreAddress.innerText = "대전광역시 유성구 죽동 707-2번지 타이어테크";
    payStorePhone.innerText = "010 - 4417 - 2220";
  } else if (payStore.value === "논산 타이어쇼핑몰") {
    payInitStoreMap(
      36.1900937,
      127.0954606,
      "[제휴 당일장착점] 논산 타이어쇼핑몰(타이어테크 시청점)",
      "충청남도 논산시 시민로 262 논산타이어 (내동)"
    );
    payStoreAddress.innerText = "충청남도 논산시 시민로 262 논산타이어 (내동)";
    payStorePhone.innerText = "010 - 8488 - 2326";
  } else if (payStore.value === "타이어테크 연무점") {
    payInitStoreMap(
      36.1188693,
      127.0984388,
      "[제휴 당일장착점] 타이어테크 연무점",
      "충청남도 논산시 연무읍 왕릉로13번길 38 타이어테크 연무점"
    );
    payStoreAddress.innerText =
      "충청남도 논산시 연무읍 왕릉로13번길 38 타이어테크 연무점";
    payStorePhone.innerText = "010 - 4202 - 1588";
  } else {
    payInitStoreMap(
      36.208517,
      127.0937896,
      "[제휴 당일장착점] 타이어테크 반월점 (로얄카)",
      "충청남도 논산시 해월로252 타이어테크 반월점 (로얄카)"
    );
    payStoreAddress.innerText =
      "충청남도 논산시 해월로252 타이어테크 반월점 (로얄카)";
    payStorePhone.innerText = "010 - 7267 - 2220";
  }
});

// 날짜제한
const payDate = document.querySelector(".pay_date");
$.datepicker.setDefaults({
  dateFormat: "yy-mm-dd",
  prevText: "이전 달",
  nextText: "다음 달",
  monthNames: [
    "1월",
    "2월",
    "3월",
    "4월",
    "5월",
    "6월",
    "7월",
    "8월",
    "9월",
    "10월",
    "11월",
    "12월",
  ],
  monthNamesShort: [
    "1월",
    "2월",
    "3월",
    "4월",
    "5월",
    "6월",
    "7월",
    "8월",
    "9월",
    "10월",
    "11월",
    "12월",
  ],
  dayNames: ["일", "월", "화", "수", "목", "금", "토"],
  dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
  dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
  showMonthAfterYear: true,
  yearSuffix: "년",
});
$(function () {
  // 오늘 날짜를 구합니다
  var today = new Date();

  // 최소 날짜는 오늘, 최대 날짜는 오늘부터 5일 뒤로 설정합니다
  var minDate = today;

  // datepicker를 생성하고 최소/최대 날짜를 설정합니다
  $(".pay_date").datepicker({
    minDate: minDate,
  });
});

const payForm = document.querySelector(".pay_container");
const payBtn = document.querySelector(".pay_nav_pay");

const payNameInput = document.querySelector(".pay_customer_input");
const payPhoneInput = document.querySelector(".pay_phone_input");
const payEmailInput = document.querySelector(".pay_email_input");
const payCarYearSelect = document.querySelector("select[name=o_caryear]");
const payCarBrandSelect = document.querySelector("select[name=o_carbrand]");
const payCarNameSelect = document.querySelector("select[name=o_carname]");
const payCarNumInput = document.querySelector(".pay_carNum_input");

const dateReg = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
const phoneReg = /^\d{9,11}$/;
const emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const carNumReg = /\d{2,3}[가-힣]{1}\d{4}/;

function payDateCheck(e) {
  if (!dateReg.test(e.target.value)) {
    payDate.style.borderColor = "var(--red)";
    document.querySelector(".pay_date_confirm").innerText =
      "올바르지 않은 날짜입니다.";
  } else {
    payDate.style.borderColor = "#aaa";
    document.querySelector(".pay_date_confirm").innerText = "";
  }
}

function payPhoneCheck(e) {
  if (!phoneReg.test(e.target.value)) {
    payPhoneInput.style.borderColor = "var(--red)";
    document.querySelector(".pay_phone_confirm").innerText =
      "올바르지 않은 연락처입니다.";
  } else {
    payPhoneInput.style.borderColor = "#aaa";
    document.querySelector(".pay_phone_confirm").innerText = "";
  }
}
function payEmailCheck(e) {
  if (!emailReg.test(e.target.value)) {
    payEmailInput.style.borderColor = "var(--red)";
    document.querySelector(".pay_email_confirm").innerText =
      "올바르지 않은 이메일입니다.";
  } else {
    payEmailInput.style.borderColor = "#aaa";
    document.querySelector(".pay_email_confirm").innerText = "";
  }
}

function payCarNumCheck(e) {
  if (!carNumReg.test(e.target.value)) {
    payCarNumInput.style.borderColor = "var(--red)";
    document.querySelector(".pay_carNum_confirm").innerText =
      "올바르지 않은 차량번호입니다.";
  } else {
    payCarNumInput.style.borderColor = "#aaa";
    document.querySelector(".pay_carNum_confirm").innerText = "";
  }
}

function submitCheck(e) {
  if (payDate.value) {
    payDate.style.borderColor = "#aaa";
    document.querySelector(".pay_date_confirm").innerText = "";
  }
  if (!dateReg.test(payDate.value)) {
    payDate.style.borderColor = "var(--red)";
    document.querySelector(".pay_date_confirm").innerText =
      "올바르지 않은 날짜입니다.";
    e.preventDefault();
  }
  if (!payDate.value) {
    payDate.style.borderColor = "var(--red)";
    document.querySelector(".pay_date_confirm").innerText =
      "장착일을 입력해주세요.";
    e.preventDefault();
  }
  if (payNameInput.value) {
    payNameInput.style.borderColor = "#aaa";
    document.querySelector(".pay_customer_confirm").innerText = "";
  }
  if (!payNameInput.value) {
    payNameInput.style.borderColor = "var(--red)";
    document.querySelector(".pay_customer_confirm").innerText =
      "주문자를 입력해주세요.";
    e.preventDefault();
  }
  if (payPhoneInput.value) {
    payPhoneInput.style.borderColor = "#aaa";
    document.querySelector(".pay_phone_confirm").innerText = "";
  }
  if (!phoneReg.test(payPhoneInput.value)) {
    payPhoneInput.style.borderColor = "var(--red)";
    document.querySelector(".pay_phone_confirm").innerText =
      "올바르지 않은 연락처입니다.";
    e.preventDefault();
  }
  if (!payPhoneInput.value) {
    payPhoneInput.style.borderColor = "var(--red)";
    document.querySelector(".pay_phone_confirm").innerText =
      "연락처를 입력해주세요.";
    e.preventDefault();
  }
  if (payEmailInput.value) {
    payEmailInput.style.borderColor = "#aaa";
    document.querySelector(".pay_email_confirm").innerText = "";
  }
  if (!emailReg.test(payEmailInput.value)) {
    payEmailInput.style.borderColor = "var(--red)";
    document.querySelector(".pay_email_confirm").innerText =
      "올바르지 않은 이메일입니다.";
    e.preventDefault();
  }
  if (!payEmailInput.value) {
    payEmailInput.style.borderColor = "var(--red)";
    document.querySelector(".pay_email_confirm").innerText =
      "이메일을 입력해주세요.";
    e.preventDefault();
  }
  if (payCarNumInput.value) {
    payCarNumInput.style.borderColor = "#aaa";
    document.querySelector(".pay_carNum_confirm").innerText = "";
  }
  if (!carNumReg.test(payCarNumInput.value)) {
    payCarNumInput.style.borderColor = "var(--red)";
    document.querySelector(".pay_carNum_confirm").innerText =
      "올바르지 않은 차량번호입니다.";
    e.preventDefault();
  }
  if (!payCarNumInput.value) {
    payCarNumInput.style.borderColor = "var(--red)";
    document.querySelector(".pay_carNum_confirm").innerText =
      "차량번호를 입력해주세요.";
    e.preventDefault();
  }
  if (
    payCarYearSelect.value === "" ||
    payCarBrandSelect.value === "" ||
    payCarNameSelect.value === ""
  ) {
    payCarYearSelect.style.borderColor = "var(--red)";
    payCarBrandSelect.style.borderColor = "var(--red)";
    payCarNameSelect.style.borderColor = "var(--red)";
    document.querySelector(".pay_car_confirm").innerText =
      "차량정보를 입력해주세요";
    e.preventDefault();
  }
  if (
    payCarYearSelect.value ||
    payCarBrandSelect.value ||
    payCarNameSelect.value
  ) {
    payCarYearSelect.style.borderColor = "#aaa";
    payCarBrandSelect.style.borderColor = "#aaa";
    payCarNameSelect.style.borderColor = "#aaa";
    document.querySelector(".pay_car_confirm").innerText = "";
  }
}

payDate.addEventListener("input", payDateCheck);
payDate.addEventListener("click", () => {
  payDate.style.borderColor = "#aaa";
  document.querySelector(".pay_date_confirm").innerText = "";
});
payNameInput.addEventListener("input", () => {
  payNameInput.style.borderColor = "#aaa";
  document.querySelector(".pay_customer_confirm").innerText = "";
});
payPhoneInput.addEventListener("input", payPhoneCheck);
payEmailInput.addEventListener("input", payEmailCheck);
payCarNumInput.addEventListener("input", payCarNumCheck);
payCarYearSelect.addEventListener("change", () => {
  payCarYearSelect.style.borderColor = "#aaa";
  document.querySelector(".pay_car_confirm").innerText = "";
});
payCarBrandSelect.addEventListener("change", () => {
  payCarBrandSelect.style.borderColor = "#aaa";
  document.querySelector(".pay_car_confirm").innerText = "";
});
payCarNameSelect.addEventListener("change", () => {
  payCarNameSelect.style.borderColor = "#aaa";
  document.querySelector(".pay_car_confirm").innerText = "";
});
payBtn.addEventListener("click", submitCheck);
