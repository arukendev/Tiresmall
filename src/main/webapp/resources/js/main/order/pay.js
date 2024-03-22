
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


//지도 실행
initMap();

//장착점 변경 할떄
payStore.addEventListener("change", () => {
	$.ajax({
		    url: "pay.store.change",
		    type: "get",
		    data: { b_id : payStore.value },
		    success: function (data) {
		      console.log(data);
		     
		      payStoreAddress.innerText =data.b_area +""+ data.b_addr;
		      payStorePhone.innerText = data.b_managernumber;
		      $(".mapAddre").val(data.b_mapdata);
		      initMap(data.b_name);
		      
		    },
		  });
});

//지도
function initMap(d) {
	
	const latV=$(".mapAddre").val().split(", ")[0];
	const lngV=$(".mapAddre").val().split(", ")[1];
	
	  //네이버 지도
	  
	  var mapOptions = {
			    center: new naver.maps.LatLng(latV, lngV),
			    zoom: 17,
			    zoomControl: true,
			    zoomControlOptions: {
			        style: naver.maps.ZoomControlStyle.LARGE,
			        position: naver.maps.Position.RIGHT_CENTER
			    }
			    
	  };

	  var map = new naver.maps.Map('pay_map', mapOptions);
	  
	  //정보창 
	  var contentString = [
		  	'<div id="content">' +
		  		'<div id="siteNotice">' + "</div>" +
		  		'<h1 id="firstHeading" class="firstHeading">'+ d +'</h1>' +
		    "</div>"
	   ].join('');
	  

	  //마커
	  var marker = new naver.maps.Marker({
			  position: new naver.maps.LatLng(latV, lngV),
			  map: map

	  });

	  
	  //정보창 오픈하기
/*	  infowindow.open(map, marker);
	  //클릭하면정보창 없애고 띄우기
	  naver.maps.Event.addListener(marker, "click", function(e) {
		    if (infowindow.getMap()) {
		        infowindow.close();
		    } else {
		        infowindow.open(map, marker);
		    }
		});		*/	
};	






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
let content = $(document.querySelector(".pay_kakaopay_content"));
function submitCheck(e) {
let payEl =	$("input[name=o_paymethod]:checked");
content = $(document.querySelector(".pay_kakaopay_content"));
  if (payDate.value) {
    payDate.style.borderColor = "#aaa";
    document.querySelector(".pay_date_confirm").innerText = "";
  }
  if (!dateReg.test(payDate.value)) {
    payDate.style.borderColor = "var(--red)";
    payDate.focus();
    document.querySelector(".pay_date_confirm").innerText =
      "올바르지 않은 날짜입니다.";
    e.preventDefault();
  }
  if (!payDate.value) {
    payDate.style.borderColor = "var(--red)";
    payDate.focus();
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
    payNameInput.focus();
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
    payPhoneInput.focus();
    document.querySelector(".pay_phone_confirm").innerText =
      "올바르지 않은 연락처입니다.";
    e.preventDefault();
  }
  if (!payPhoneInput.value) {
    payPhoneInput.style.borderColor = "var(--red)";
    payPhoneInput.focus();
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
    payEmailInput.focus();
    document.querySelector(".pay_email_confirm").innerText =
      "올바르지 않은 이메일입니다.";
    e.preventDefault();
  }
  if (!payEmailInput.value) {
    payEmailInput.style.borderColor = "var(--red)";
    payEmailInput.focus();
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
    payCarNumInput.focus();
    document.querySelector(".pay_carNum_confirm").innerText =
      "올바르지 않은 차량번호입니다.";
    e.preventDefault();
  }
  if (!payCarNumInput.value) {
    payCarNumInput.style.borderColor = "var(--red)";
    payCarNumInput.focus();
    document.querySelector(".pay_carNum_confirm").innerText =
      "차량번호를 입력해주세요.";
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
  
  if(payEl.val() == "카카오"){
	  $(payBtn).attr("onclick", "kakao_pay()");
	  $(payBtn).attr("type", "button");
  }else{
	  $(payBtn).removeAttr("onclick");
	  $(payBtn).removeAttr("type");
  }
  $(payBtn).trigger("click");
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


//payStore.addEventListener("change", () => {
payCarYearSelect.addEventListener("change", () => {
	if($("#pay_o_carbrand_select").val()!=""){
		$("#pay_o_carname_select option").remove();
		$.ajax({
			url: "product.car.name.get.ajax",
			data : {c_brand : $("#pay_o_carbrand_select").val(),
					c_year1 : $("#pay_o_caryear_select").val()},
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$("select[name=o_carname]").append(
						"<option value='"+  data[i].c_name +"'>"+  data[i].c_name + "</option>"
					);
				}
			}
		})
	}
	
  payCarYearSelect.style.borderColor = "#aaa";
  document.querySelector(".pay_car_confirm").innerText = "";
});


payCarBrandSelect.addEventListener("change", () => {
	if( $("#pay_o_carname_select").val()!=""){
		$("#pay_o_carname_select option").remove();
		$.ajax({
			url: "product.car.name.get.ajax",
			data : {c_brand : $("#pay_o_carbrand_select").val(),
					c_year1 : $("#pay_o_caryear_select").val()},
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					$("select[name=o_carname]").append(
						"<option value='"+  data[i].c_name +"'>"+  data[i].c_name + "</option>"
					);
				}
			}
		})
	}
  payCarBrandSelect.style.borderColor = "#aaa";
  document.querySelector(".pay_car_confirm").innerText = ""; 
});


payCarNameSelect.addEventListener("change", () => {
  payCarNameSelect.style.borderColor = "#aaa";
  document.querySelector(".pay_car_confirm").innerText = "";
});


payBtn.addEventListener("click", submitCheck);



function payChange(e) {
  if (e.value === "현장결제") {
    document.querySelector(".pay_nonbankpay_content").style.display = "none";
    content.hide();
  } else if(e.value == "무통장"){
	document.querySelector(".pay_nonbankpay_content").style.display = "flex";
	content.hide();
  } else if(e.value == "카카오"){
	document.querySelector(".pay_nonbankpay_content").style.display = "none";
	content.show();
  }
}










