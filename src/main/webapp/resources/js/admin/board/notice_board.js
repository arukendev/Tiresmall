const idInput = $('#idInput_M')
const sortationM = $('#sortationSelect_M')
const titleInput = $('#titleInput_M')
const txtInput = $('#txtInput_M')

function updateNotice(id,sortation,title,txt,date) {
	$('#notice_modal').show();
	$("body").css("overflow", 'hidden');
	$(idInput).val(id);
	$(titleInput).val(title);
	$(sortationM).val(sortation);
	$(txtInput).text(txt.replaceAll("<br>", "\r\n"));
	$("#n_date").val(date);
	 
	$("#reg_modal").attr("action", "update.notice.do")
	
}

function updateFaq(id,sortation,title,txt,date) {
	$('#notice_modal').show();
	$("body").css("overflow", 'hidden');
	$(idInput).val(id);
	$(titleInput).val(title);
	$(sortationM).val(sortation);
	$(txtInput).text(txt.replaceAll("<br>", "\r\n"));
	$("#f_date").val(date);
	
	$("#reg_modal").attr("action", "update.faq.do")
	
}

function deleteNotice(no) {
	let ok = confirm('공지사항을 삭제 하시겠습니까?')
	
	if (ok) {
		location.href='delete.notice.do?n_no='+no;
	}else {
		location.href='admin.notice.go';
	}
	
	
}

function deleteFaq(no) {
	let ok = confirm('공지사항을 삭제 하시겠습니까?')
	
	if (ok) {
		location.href='delete.faq.do?f_no='+no;
	}else {
		location.href='admin.faq.go';
	}
	
	
}

$('#notice_reg_modal').click(function() {
	
	$('#notice_modal').show();
	$(idInput).val('');
	$(titleInput).val('');
	$(sortationM).val('');
	$(txtInput).val('');
	$(txtInput).text(txt.replaceAll("<br>", "\r\n"));
	$("#n_date").val('');
	//모달 on
	$("#reg_modal").attr("action", "reg.notice.do")
	$("body").css("overflow", 'hidden');
	
})

$('#faq_reg_modal').click(function() {
	
	$('#notice_modal').show();
	$(idInput).val('');
	$(titleInput).val('');
	$(sortationM).val('');
	// $(txtInput).val('');
	$(txtInput).text(txt.replaceAll("<br>", "\r\n"));
	$("#f_date").val('');
	//모달 on
	$("#reg_modal").attr("action", "reg.faq.do")
	$("body").css("overflow", 'hidden');
	
})

$("#cancleModal").click(function() {
	$('#notice_modal').hide();
	// 모달 off
	$("body").css("overflow", 'auto');
	
});

window.addEventListener("keydown", (e) => {
	if(e.keyCode == 27){
		$("#cancleModal").trigger("click");
	}

});
