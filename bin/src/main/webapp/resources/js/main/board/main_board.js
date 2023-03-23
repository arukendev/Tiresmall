function deleteAsk(qn) {
	var ok = confirm("해당내용을 삭제하시겠습니까?");
	if (ok) {
		location.href = "board.ask.delete?q_no=" + qn;
	}
}