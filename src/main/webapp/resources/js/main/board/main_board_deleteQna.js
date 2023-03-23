function deleteQna(qn) {
	var ok = confirm("해당내용을 삭제하시겠습니까?");
	if (ok) {
		location.href = "board.qna.delete?q_no=" + qn;
	}
}