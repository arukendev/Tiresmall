const qnaId = $('#userId_M')
const userName = $('#userName_M')
const dateInput = $('#date_M')
const qnaNum = $('#noInput_M')
const qnaTxt = $('#txtInput_M')
const replyTxt = $('#txtInput_Reply')
const qnaDate = $('#date_M')

$('.qna_modal_go').click(function() {

	$('#qna_modal').show();
	$('#qna_modal').css('z-index', '3');
	// 모달 on
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
	$('#qna_modal').hide();
	// 모달 off
	$("body").css("overflow", 'auto');

});
