const qnaId = $('#userId_M')
const userName = $('#userName_M')
const dateInput = $('#date_M')
const qnaNum = $('#noInput_M')
const qnaTxt = $('#txtInput_M')
const replyTxt = $('#txtInput_Reply')
const qnaDate = $('#date_M')

$("#event-reg-btn").click(()=>{

	$('#event-modal').show();
	$('#event-modal').css('z-index', '3');
	// 모달 on
	
	$(document).on("keydown", function(e) {
		if(e.keyCode == 27){
			$("#cancleModal").trigger("click");
		}
	});
	
	
	let contents = $(this).children();
	let q_reply_board_no = 0;
	$(contents).each(function(i, c) {
		if(i == 0){
			$(qnaNum).val($(c).children().val());
			q_reply_board_no = $(c).children().val();
			console.log(q_reply_board_no);
		}
		else if (i == 1) {
			$(userName).val($(c).text());
		} else if (i == 2) {
			$(qnaId).val($(c).text());
		} else if (i == 3) {
			$(qnaTxt).val($(c).text());
		} else if (i == 4) {
			$(qnaDate).val($(c).text());
		} else if(i ==5){
			if($(c).children().val() != 0){
				$.ajax({
					url : "get.reply.do",
					data : {q_reply_board_no},
					success : function(data) {
					$(replyTxt).val(data.q_reply_txt);
					}
				});
				
			}
		}
	})
	$("#update_modal").attr("action", "qna.reply.reg.do")
	$("body").css("overflow", 'hidden');

})

$("#cancleModal").click(function() {
	$('#event-modal').hide();
	// 모달 off
	$("body").css("overflow", 'auto');

});



// 팝업 유무 제어
$(".on-off").click(function(){
	let onoff = $(this).text();
	let e_no = $(this).attr("value");
	let e_popup = onoff == 'on' ? 0 : 1;
	let onoffEl = $(this);
	$.ajax({
		url : 'event.switch.popup',
		data : {e_popup, e_no},
		success : function(data) {
			console.log(data);
			if(data == 1){
				onoffEl.text('on');
				onoffEl.attr('class','admin_printBTN on-off');
				alert('팝업 설정 On');
			}else{
				onoffEl.text('off');
				onoffEl.attr('class','admin_notPrintBTN on-off');
				alert('팝업 설정 Off');
			}
		}
	});
});



$("#e_duration").datepicker({minDate : 1,dateFormat :"yy-mm-dd"});

$(".modalBtn1").click(()=>{
var datatimeRegexp = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
let now = new Date();
let data = new Date($("#e_duration").val());

if ( !datatimeRegexp.test($('#e_duration').val()) ) {
    alert("날짜는 yyyy-mm-dd 형식으로 입력해주세요.");
    $("#e_duration").focus();
    return false;
}
if(now > data){
	alert('지난날을 선택 할 수 없어요.');
	return false;
}
	

});








