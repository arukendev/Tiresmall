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










//모달 js

var keydown = false;
$(".hoem-modal-open").click(function(e) {
	$("#home-modal").css("display","flex");
	$("#home-modal-tire-search").trigger("click");
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

//메인 바에서 차종으로 검색을 누를경우
$(".hoem-modal-car-open").click(function() {
	$("#home-modal").css("display","flex");
	$("#home-modal-car-search").css("color","white");
	$("#home-modal-car-search").css("background-color","var(--red)");
	$("#home-modal-tire-search").css("color","black");
	$("#home-modal-tire-search").css("background-color","white");

	$("#home-modal-tire-search-container").css("display","none");
	$("#home-modal-car-search-container").css("display","block");
	
	homeModalCarBrandListJson();
	
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
	homeModalCarSeachInitialization();
	homeModalTireSeachInitialization();
})

//차종으로 검색
$("#home-modal-car-search").click(function() {
	$("#home-modal-car-search").css("color","white");
	$("#home-modal-car-search").css("background-color","var(--red)");
	$("#home-modal-tire-search").css("color","black");
	$("#home-modal-tire-search").css("background-color","white");

	$("#home-modal-tire-search-container").css("display","none");
	homeModalTireSeachInitialization();
	$("#home-modal-car-search-container").css("display","block");
	homeModalCarBrandListJson();	
})

//타이어 사이즈로 검색 
$("#home-modal-tire-search").click(function() {
	$("#home-modal-tire-search").css("color","white");
	$("#home-modal-tire-search").css("background-color","var(--red)");
	$("#home-modal-car-search").css("color","black");
	$("#home-modal-car-search").css("background-color","white");
	$("#home-modal-tire-search-container").css("display","block");

	homeModalCarSeachInitialization();
})

let c_brand;
let c_year1;
let c_name;

$(document).on("click",".item-list li", function() {

	let result = $(this).val();
	if(result > 140 && result < 1000){	//140보다 크면 단면폭
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
			"<li value='0'>--</li>" +
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

	}else if(result < 140 && result>=25 || result == 0 ){//25보다 크면 편평비
		$(".tire-ratio").text(result);
		if($("#front_tire_ratio").val()  == ""){
			$("#front_tire_ratio").val(result);
			$(".front-tire-ratio").text(result);
			if(result == "0"){
				$(".tire-ratio").css("display","none");
				$(".imgRemove").css("display","none");
				$(".home-modal-slush-display1").css("display","none");
				$(".front-tire-ratio").css("display","none");
				
			}
		}else{
			$("#rear_tire_ratio").val(result);
			$(".rear-tire-ratio").text(result);
			if(result == "0"){
				$(".tire-ratio").css("display","none");
				$(".imgRemove").css("display","none");
				$(".home-modal-slush-display2").css("display","none");
				$(".rear-tire-ratio").css("display","none");
			}	
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
	}else if(result < 25 && result > 0){//나머지는 inch
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
		
	}else if(result >= 1000 && result < 20000){//카 브랜드 검색
		c_brand = $(this).text();
		$(".car-brand").text(c_brand);
		$(".car-year").css("color","var(--red)");
		$(".car-brand").css("color","black");
		
		$(".car-brand-list").remove();
		$("#home-modal-car-search-content-item").append(
				"<ol class='item-list car-brand-list'>" +
					"<li value='102024'>2024</li>" +
					"<li value='102023'>2023</li>" +
					"<li value='102022'>2022</li>" +
					"<li value='102021'>2021</li>" +
					"<li value='102020'>2020</li>" +
					"<li value='102019'>2019</li>" +
					"<li value='102018'>2018</li>" +
					"<li value='102017'>2017</li>" +
					"<li value='102016'>2016</li>" +
					"<li value='102015'>2015</li>" +
					"<li value='102014'>2014</li>" +
					"<li value='102013'>2013</li>" +
					"<li value='102012'>2012</li>" +
					"<li value='102011'>2011</li>" +
					"<li value='102010'>2010</li>" +
					"<li value='102009'>2009</li>" +
					"<li value='102008'>2008</li>" +
					"<li value='102007'>2007</li>" +
					"<li value='102006'>2006</li>" +
					"<li value='102005'>2005</li>" +
					"<li value='102004'>2004</li>" +
					"<li value='102003'>2003</li>" +
					"<li value='102002'>2002</li>" +
					"<li value='102001'>2001</li>" +
					"<li value='102000'>2000</li>" +
					"<li value='101999'>1999</li>" +
					"<li value='101998'>1998</li>" +
					"<li value='101997'>1997</li>" +
					"<li value='101996'>1996</li>" +
					"<li value='101995'>1995</li>" +
					"<li value='101994'>1994</li>" +
					"<li value='101993'>1993</li>" +
				"</ol>"	
		);
	}else if(result > 100000 && result < 103000){
		c_year1 = $(this).text();		 
		$(".car-year").text(c_year1);

		$(".car-name").css("color","var(--red)");
		$(".car-year").css("color","black");
		$(".car-brand-list").remove();
		
		$("#home-modal-car-search-content-item").append(
			"<ol class='item-list car-brand-list'>" +	
			"</ol>"	
		);
		$.ajax({
			url: "product.car.name.get.ajax",
			data : {c_brand,c_year1},
			success : function(data) {
				console.log("성공");
				console.log(data.length);
				for (var i = 0; i < data.length; i++) {
					$(".car-brand-list").append(
						"<li value='2000" + (i+1) + "'>" + data[i].c_name + "</li>"	
					);
				}
			}
		})	
	}else{//이제 차를 클릭 하면 그거에 대한 타이어 사이즈가 다 나오면 됨
		c_name = $(this).text();
		console.log(c_name);
		$(".car-name").text(c_name);
		$(".car-name").css("color","black");
		$(".car-brand-list").remove();
		$("#home-modal-car-search-content-item").css("display","none");
	/*	$("#home-modal-car-search-content-item").append(
			"<ol class='item-list car-tire-size-list'></ol>"	
		);
		*/
		$(".home-modal-car-select-result").css("display","flex");												
		
		
		$.ajax({
			url: "product.car.tire.size.get.ajax",
			data : {c_brand,c_year1,c_name},
			success : function(data) {
				console.log("성공");
				var front_tire = data[0].c_ft.split("!");
				var rear_tire = data[0].c_bt.split("!");
				
				
				for (var i = 0; i < front_tire.length; i++) {
					front_tire[i] = front_tire[i].replace('앞 : ','');      
					rear_tire[i] = rear_tire[i].replace('뒤 : ','');

				/*	if(front_tire[i] == rear_tire[i]){
						$(".car-tire-size-list").append(
							"<li value='3000" + (i+1) + "'>" + front_tire[i] + "</li>" 
						);
					}else{
						$(".car-tire-size-list").append(
							"<li value='3000" + (i+1) + "'>" + 
								"전륜 : "+ front_tire[i] +
								"후륜 : "+ rear_tire[i] +
							"</li>"
						);	
					}*/
					
				}
			}
		})	
	}
	
	
	
	
})
//다시 선택 누를시	1.타이어	2.차
$(".home-modal-tire-select-result-back").click(function() {
	homeModalTireSeachInitialization();	
})
$(".home-modal-car-select-result-back").click(function() {
	homeModalCarSeachInitialization();
	$("#home-modal-car-search-container").css("display","block");
	homeModalCarBrandListJson();
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

//카 브랜드 가져오기 (db에서)
function homeModalCarBrandListJson() {	
	$("#home-modal-car-search-content-item").append(
		"<ol class='item-list car-brand-list'>" +	
		"</ol>"	
	);

	$.ajax({
		url: "product.car.brand.get.ajax",
		success : function(data) {
			console.log("성공");
			console.log(data.length);
			for (var i = 0; i < data.length; i++) {
				console.log(data[i].cb_name);
				console.log("100"+i);
				$(".car-brand-list").append(
					"<li value='100" + (i+1) + "'>" + data[i].cb_name + "</li>"	
				);
			}
			
		}
	})
}


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


//타이어 사이즈로 검색 지우기
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
	$(".tire-ratio").css("display","block");
	$(".imgRemove").css("display","block");
	$(".front-tire-ratio").css("display","block");
	$(".rear-tire-ratio").css("display","block");
	$(".home-modal-slush-display1").css("display","block");
	$(".home-modal-slush-display2").css("display","block");
	$(".home-modal-tire-select-result").css("display","none");
	$(".home-modal-tire-select-result-button").find("input").val("");
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

//차종으로 검색 지우기
function homeModalCarSeachInitialization() {
	$("#home-modal-car-search-container").css("display","none");
	$(".home-modal-car-select-result").css("display","none");
	$("#home-modal-car-search-content-item").css("display","flex");
	$("#home-modal-car-search-content-text").css("display","flex");
	$(".car-brand-list").remove();
	$(".car-brand").css("color","var(--red)");
	$(".car-year").css("color","black");
	$(".car-name").css("color","black");
	$(".car-brand").text("제조사");
	$(".car-year").text("생산년도");
	$(".car-name").text("차종명");
}














