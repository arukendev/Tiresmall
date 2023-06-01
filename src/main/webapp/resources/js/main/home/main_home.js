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



//모달 js
$(".hoem-modal-open").click(function() {
	$("#home-modal").css("display","flex");
	
	window.addEventListener("keydown", (e) => {
		if(e.keyCode == 27){
			console.log(e.keyCode);
			$(".btn_close").trigger("click");
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
})


$("#home-modal-car-search").click(function() {
	$("#home-modal-car-search").css("color","white");
	$("#home-modal-car-search").css("background-color","var(--red)");
	$("#home-modal-tire-search").css("color","black");
	$("#home-modal-tire-search").css("background-color","white");

	$("#home-modal-tire-search-container").css("display","none");
	$("#home-modal-car-search-container").css("display","block");
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
		$(".item-list").remove();
		if(width == 145){
			
		}
		
	}else if(result>=30){//30보다 크면 편평비
		$(".tire-ratio").text(result);	
	}else{//나머지는 inch
		$(".tire-inch").text(result);	
	}
	
	
})












