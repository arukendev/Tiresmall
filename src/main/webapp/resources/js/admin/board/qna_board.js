const qnaNum = $('#noInput_M')
const userName = $('#userName_M')
const qnaId = $('#userId_M')
const qnaDate = $('#date_M')
const dateInput = $('#date_M')
const qnaTxt = $('#txtInput_M')
const replyTxt = $('#txtInput_Reply')
/*
const replyTxt = $('#txtInput_Reply')
 * */

$('.qna_modal_go').click(function() {

	$('#qna_modal').show();
	$('#qna_modal').css('z-index', '3');
	// 모달 on
	let contents = $(this).children();
	let q_reply_board_no = 0;
	$(contents).each(function(i, c) {
		if(i == 0){
			// td_c1
			$(qnaNum).val($(c).children().val());
			// typehidden
			q_reply_board_no = $(c).children().val();
			console.log(q_reply_board_no);
		}
		
		// td_c2
		else if (i == 1) {
			$(userName).val($(c).text());
			
		// td_c3
		} else if (i == 2) {
			$(qnaId).val($(c).text());
			
		// displaynone
		} else if (i == 3) {
			$(qnaTxt).val($(c).text());
			/*
			$(qnaTxt).val($(".ad_qna_txt").val().replaceAll("<br>", "\r\n"));
			 * */
			
		// td_c4: PASS
			/*
		} else if (i == 4) {
			 * */
			
		// td_c5?????
		} else if (i == 5) {
			$(qnaDate).val($(c).text());
		
		// displaynone
		} else if (i == 6) {
			/*
			$(replyTxt).val($(c).text());
			 * */
		
		// td_c6
		} else if (i == 7) {
			
			if($(c).children().val() != 0){
				$(replyTxt).val("");
				$.ajax({
					url : "get.reply.do",
					data : {q_reply_board_no},
					success : function(data) {
						$(replyTxt).val(data.q_reply_txt.replaceAll("<br>", "\r\n"));
					// $(replyTxt).val(data.q_reply_txt.replaceAll("<br>", "\r\n"));
					// $(replyTxt).val(data.);
					// $(replyTxt).val(data.q_reply_txt);
					// $(replyTxt).text(txt.replaceAll("<br>", "\r\n"));
					}
				});
				
			} else {
				$(replyTxt).val("");
				
			}
			/*
			 * */
		}
	})
	$("#update_modal").attr("action", "qna.reply.reg.do")
	$("body").css("overflow", 'hidden');

})

$(".modalBtn1").click(function() {
	if($("#txtInput_Reply").val() == ""){
		alert("답변을 해주세요");
		$("#txtInput_Reply").focus();
		return false;
	}
})

$("#cancleModal").click(function() {
	$('#qna_modal').hide();
	// 모달 off
	$("body").css("overflow", 'auto');

});

window.addEventListener("keydown", (e) => {
	if(e.keyCode == 27){
		$("#cancleModal").trigger("click");
	}

});
