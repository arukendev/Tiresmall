$(function() {
	
	let sub = $('#whatMenu').val();
	let menuNum=1;
	if(sub == 'order'){
		subMenu(menuNum);
		$("#subMenu").css("display","none");
	}else if(sub == 'tire'){
		menuNum=2;
		subMenu(menuNum);
		$("#subMenu").css("display","fiex");
	}else if(sub == 'car'){
		menuNum=3;
		subMenu(menuNum);
		$("#subMenu").css("display","fiex");
	}else if(sub == 'auth'){
		menuNum=4;
		subMenu(menuNum);
		$("#subMenu").css("display","none");
	}else if(sub == 'rental'){
		menuNum=5;
		subMenu(menuNum);
		$("#subMenu").css("display","none");
	}else if(sub == 'store'){
		menuNum=6;
		subMenu(menuNum);
		$("#subMenu").css("display","none");
	}else if(sub == 'notice'){
		menuNum=7;
		subMenu(menuNum);
		$("#subMenu").css("display","fiex");
	}
	
	
	let sm = $("#sm").val();

	if(sm == 1){
		$(".subMenuContent1").css("background-color","black")
		.css("color","white").css("border-radius","20px");
	}else if(sm == 2){
		$(".subMenuContent2").css("background-color","black")
		.css("color","white").css("border-radius","20px");
	}else if(sm == 3){
		$(".subMenuContent3").css("background-color","black")
		.css("color","white").css("border-radius","20px");
	}else if(sm == 4){
		$(".subMenuContent4").css("background-color","black")
		.css("color","white").css("border-radius","20px");
	}
	
	
	
});


function subMenu(no) {
	$("#menuTitle"+no).css("border-top-left-radius","20px");
	$("#menuTitle"+no).css("border-top-right-radius","20px");
	$("#menuTitle"+no).css("background-color","white");
	$("#menuTitle"+no).css("color","#181c32");
}

function notSubMenu() {
	
}

