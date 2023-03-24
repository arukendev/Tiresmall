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
		<div class="board_event_rd_rowAndValue">
			<div>제목</div>
			<div>${event.e_title}</div>
			<div>진행여부</div>
			<div>${event.e_status}</div>
			<div>
				<img src="resources/upload-event/${event.e_mainimg }">
				<img src="resources/upload-event/${event.e_detailimg }">
			</div>
		</div>
	
		<div class="board_event_rd_buttons">
			<button class="board_qna_buttonGray" onclick="location.href='board.event.read'">이벤트 목록</button>
		</div>
	</div>
</body>
</html>