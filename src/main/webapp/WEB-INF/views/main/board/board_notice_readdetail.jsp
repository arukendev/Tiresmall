<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="board_notice_rd_rowAndValue">
			<div>제목</div>
			<div>${notice.n_title}</div>
			<div>날짜</div>
			<div><fmt:formatDate value="${notice.n_date }" pattern="yyyy-MM-dd"/></div>
			<div>내용</div>
			<div>${notice.n_txt}</div>
		</div>
	
		<div class="board_notice_rd_buttons">
			<button class="board_qna_buttonGray" onclick="location.href='board.notice.read'">공지사항 목록</button>
		</div>
	</div>
</body>
</html>