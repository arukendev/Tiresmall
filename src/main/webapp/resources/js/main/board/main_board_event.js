const BoardEventModalPrev = document.querySelectorAll(".swiper-slide-prev");
// 모두 translate3d+0+0+100px&rotateY-50deg

const BoardEventModalNext = document.querySelectorAll(".swiper-slide-next");
// 모두 translate3d+0+0-100px&rotateY+50deg

function setBoardEventModalCookie(name, value, expiredays) { 
	var todayDate = new Date(); 
	todayDate.setDate(todayDate.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

function clickToSetBoardEventModalCookie() { 
	setBoardEventModalCookie("boardEventModalCookie", "done" , 1);	// 쿠키명 , 쿠키값 , 기간(1=>하루)
}

let val = 0;
$(".dialog_val").each(function(i,el) {
	val += parseInt($(el).val());
	if (val > 0) {
		return;
	}
});

if (document.cookie.indexOf("boardEventModalCookie=done") < 0){ 
	if (val > 0) {
		const dialog = document.querySelector(".board_event_modal_dialog");
		dialog.showModal();
	}
}