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









var keydown = false;
//모달 js
$(".hoem-modal-open").click(function() {
	$("#home-modal").css("display","flex");
	keydown = false;
	window.addEventListener("keydown", (e) => {
		if (keydown) return;
		if(e.keyCode == 27){
			console.log(e.keyCode);
			if($("#home-modal-what-know-tire").css("display") == "flex") { 
				 return;
			}else{
				$(".btn_close").trigger("click");
				keydown = true;
			}	
		}
		if(e.keyCode == 13){
			console.log(e.keyCode);
			$(".home-modal-search").trigger("click");
		}

	});
})
$(".hoem-modal-car-open").click(function() {
	$("#home-modal").css("display","flex");
	$("#home-modal-car-search").css("color","white");
	$("#home-modal-car-search").css("background-color","var(--red)");
	$("#home-modal-tire-search").css("color","black");
	$("#home-modal-tire-search").css("background-color","white");

	$("#home-modal-tire-search-container").css("display","none");
	$("#home-modal-car-search-container").css("display","block");
	keydown = false;
	window.addEventListener("keydown", (e) => {
		if (keydown) return;
		if(e.keyCode == 27){
			console.log(e.keyCode);
			if($("#home-modal-what-know-tire").css("display") == "flex") { 
				 return;
			}else{
				$(".btn_close").trigger("click");
				keydown = true;
			}	
		}
		if(e.keyCode == 13){
			console.log(e.keyCode);
			$(".home-modal-search").trigger("click");
		}

	});
})

//모달 끄기
$(".btn_close").click(function() {
	$("#home-modal").css("display","none");
	homeModalTireSeachInitialization();	
})


$("#home-modal-car-search").click(function() {
	$("#home-modal-car-search").css("color","white");
	$("#home-modal-car-search").css("background-color","var(--red)");
	$("#home-modal-tire-search").css("color","black");
	$("#home-modal-tire-search").css("background-color","white");

	$("#home-modal-tire-search-container").css("display","none");
	$("#home-modal-car-search-container").css("display","block");
	homeModalTireSeachInitialization();
})
$("#home-modal-tire-search").click(function() {
	$("#home-modal-tire-search").css("color","white");
	$("#home-modal-tire-search").css("background-color","var(--red)");
	$("#home-modal-car-search").css("color","black");
	$("#home-modal-car-search").css("background-color","white");
	$("#home-modal-car-search-container").css("display","none");
	$("#home-modal-tire-search-container").css("display","block");
})

$(document).on("click",".item-list li", function() {
	let result = $(this).val();
	if(result>140){	//140보다 크면 단면폭
		
		$(".tire-width").text(result);
		if($("#front_tire_width").val()  == ""){
			$("#front_tire_width").val(result);
			$(".front-tire-width").text(result);
		}else{
			$("#rear_tire_width").val(result);
			$(".rear-tire-width").text(result);
		}
		$(".item-list").remove(); 
		$("#home-modal-tire-search-content-item").append(
			"<ol class='item-list'>" +
			"<li value='25'>25</li>" +
			"<li value='30'>30</li>" +
			"<li value='35'>35</li>" +
			"<li value='40'>40</li>" +
			"<li value='45'>45</li>" +
			"<li value='50'>50</li>" +
			"<li value='55'>55</li>" +
			"<li value='60'>60</li>" +
			"<li value='65'>65</li>" +
			"<li value='70'>70</li>" +
			"<li value='75'>75</li>" +
			"<li value='80'>80</li>" +
			"</ol>"
		);
		$(".tire-width").css("color","black");
		$(".tire-ratio").css("color","#d85050");

	}else if(result>=30){//30보다 크면 편평비
		$(".tire-ratio").text(result);
		if($("#front_tire_ratio").val()  == ""){
			$("#front_tire_ratio").val(result);
			$(".front-tire-ratio").text(result);
		}else{
			$("#rear_tire_ratio").val(result);
			$(".rear-tire-ratio").text(result);
		}
		$(".item-list").remove();
		$("#home-modal-tire-search-content-item").append(
			"<ol class='item-list'>" +
			"<li value='13'>13</li>" +
			"<li value='14'>14</li>" +
			"<li value='15'>15</li>" +
			"<li value='16'>16</li>" +
			"<li value='17'>17</li>" +
			"<li value='18'>18</li>" +
			"<li value='19'>19</li>" +
			"<li value='20'>20</li>" +
			"<li value='21'>21</li>" +
			"<li value='22'>22</li>" +
			"</ol>"
		);
		$(".tire-ratio").css("color","black");
		$(".tire-inch").css("color","#d85050");
	}else{//나머지는 inch
		$(".tire-inch").text(result);
		if($("#front_tire_inch").val()  == ""){
			$("#front_tire_inch").val(result);
			$(".front-tire-inch").text(result);
		}else{
			$("#rear_tire_inch").val(result);
			$(".rear-tire-inch").text(result);
		}
		$(".item-list").remove();
		$(".home-modal-tire-search-what").css("display","none"); 
		$("#home-modal-tire-search-content-text").css("display","none");	
		$(".home-modal-tire-select-result").css("display","flex");	
	}
})
//다시 선택 누를시
$(".home-modal-tire-select-result-back").click(function() {
	homeModalTireSeachInitialization();
	
})
//타이어 추가 버튼
$(".home-modal-rear-tire-select").click(function() {
	$(".home-modal-tire-select-result").css("display","none");
	$(".home-modal-rear-tire-select").css("display","none");
	$("#home-modal-tire-search-content-text").css("display","flex");
	$(".home-modal-tire-search-what").css("display","flex");
	$(".rearTireResult").css("display","flex");
	$(".tire-width").text("단면폭");
	$(".tire-width").css("color","#d85050");
	$(".tire-ratio").text("편평비");
	$(".tire-inch").text("인치");
	$(".tire-inch").css("color","black");
	$("#home-modal-tire-search-content-text").append(
			"<span class='home-modal-span front-tire'>"+
			$("#front_tire_width").val() +" / "+
			$("#front_tire_ratio").val() +" R "+
			$("#front_tire_inch").val() +							
		"</span>"
	);
	$("#home-modal-tire-search-content-item").append(
			"<ol class='item-list'>" +
				"<li value='145'>145</li>" +
				"<li value='155'>155</li>" +
				"<li value='165'>165</li>" +
				"<li value='170'>170</li>" +
				"<li value='175'>175</li>" +
				"<li value='185'>185</li>" +
				"<li value='195'>195</li>" +
				"<li value='205'>205</li>" +
				"<li value='215'>215</li>" +
				"<li value='225'>225</li>" +
				"<li value='235'>235</li>" +
				"<li value='245'>245</li>" +
				"<li value='255'>255</li>" +
				"<li value='265'>265</li>" +
				"<li value='275'>275</li>" +
				"<li value='285'>285</li>" +
				"<li value='295'>295</li>" +
				"<li value='305'>305</li>" +
				"<li value='315'>315</li>" +
				"<li value='325'>325</li>" +
				"<li value='335'>335</li>" +
				"<li value='345'>345</li>" +
				"<li value='355'>355</li>" +
			"</ol>"
		);
})


//타이어 사이즈 어떻게 보는지 알려주기
$(".home-modal-tire-search-what-text").click(function() {
	$("#home-modal-what-know-tire").css("display","flex");
})
$(".btn_close2").click(function() {
	$("#home-modal-what-know-tire").css("display","none");
})
$(".home-modal-what-know-tire-buttun-close").click(function() {
	$("#home-modal-what-know-tire").css("display","none");
})

function homeModalTireSeachInitialization() {
	$(".tire-width").text("단면폭");	
	$(".tire-ratio").text("편평비");
	$(".tire-inch").text("인치");
	$(".tire-width").css("color","#d85050");
	$(".tire-ratio").css("color","black");
	$(".tire-inch").css("color","black");
	$("#home-modal-tire-search-content-text").css("display","flex");
	$("#home-modal-tire-search-content-item").css("display","flex");
	$(".home-modal-tire-search-what").css("display","flex");
	$(".home-modal-rear-tire-select").css("display","flex");
	$(".rearTireResult").css("display","none");
	$(".front-tire").remove();
	$(".item-list").remove();
	$("#home-modal-tire-search-content-item").append(
		"<ol class='item-list'>" +
			"<li value='145'>145</li>" +
			"<li value='155'>155</li>" +
			"<li value='165'>165</li>" +
			"<li value='170'>170</li>" +
			"<li value='175'>175</li>" +
			"<li value='185'>185</li>" +
			"<li value='195'>195</li>" +
			"<li value='205'>205</li>" +
			"<li value='215'>215</li>" +
			"<li value='225'>225</li>" +
			"<li value='235'>235</li>" +
			"<li value='245'>245</li>" +
			"<li value='255'>255</li>" +
			"<li value='265'>265</li>" +
			"<li value='275'>275</li>" +
			"<li value='285'>285</li>" +
			"<li value='295'>295</li>" +
			"<li value='305'>305</li>" +
			"<li value='315'>315</li>" +
			"<li value='325'>325</li>" +
			"<li value='335'>335</li>" +
			"<li value='345'>345</li>" +
			"<li value='355'>355</li>" +
		"</ol>"
	);
}









