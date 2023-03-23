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

// 날짜제한
const payDate = document.querySelector(".pay_date");
const payToday = new Date().toISOString().split("T")[0];
const payFiveDaysAfter = new Date(
  new Date().getTime() + 4 * 24 * 60 * 60 * 1000
)
  .toISOString()
  .split("T")[0];

payDate.min = payToday;
payDate.max = payFiveDaysAfter;

const payForm = document.querySelector(".pay_container");
const payNameInput = document.querySelector(".pay_customer_input");
const payPhoneInput = document.querySelector(".pay_phone_input");
const payEmailInput = document.querySelector(".pay_email_input");
const payCarYearSelect = document.querySelector("select[name=o_caryear]");
const payCarBrandSelect = document.querySelector("select[name=o_carbrand]");
const payCarNameSelect = document.querySelector("select[name=o_carname]");
const payCarNumInput = document.querySelector(".pay_carNum_input");

const phoneReg = /^\d{9,11}$/;
const emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
const carNumReg = /\d{2,3}[가-힣]{1}\d{4}/;

function payPhoneCheck(e) {
  if (!phoneReg.test(e.target.value)) {
    payPhoneInput.style.borderColor = "var(--red)";
  } else {
    payPhoneInput.style.borderColor = "green";
  }
}
function payEmailCheck(e) {
  if (!emailReg.test(e.target.value)) {
    payEmailInput.style.borderColor = "var(--red)";
  } else {
    payEmailInput.style.borderColor = "green";
  }
}

function payCarNumCheck(e) {
  if (!carNumReg.test(e.target.value)) {
    payCarNumInput.style.borderColor = "var(--red)";
  } else {
    payCarNumInput.style.borderColor = "green";
  }
}

function submitCheck(e) {
  if (
    payDate.value === "" ||
    payNameInput.value === "" ||
    payPhoneInput.value === "" ||
    payEmailInput.value === "" ||
    payCarNumInput.value === "" ||
    payCarYearSelect.value === "" ||
    payCarBrandSelect.value === "" ||
    payCarNameSelect.value === "" ||
    payCarNumInput.value === ""
  ) {
    e.preventDefault();
  }
}

payPhoneInput.addEventListener("input", payPhoneCheck);
payEmailInput.addEventListener("input", payEmailCheck);
payCarNumInput.addEventListener("input", payCarNumCheck);

payForm.addEventListener("submit", submitCheck);
