<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="board.ask.update.do" method="post">
		<div class="board_ask_cu_rowAndValue">
			<div>제목<span class="board_ask_cu_important">*</span></div>
			<div><input required name="q_title" type="text" value="${ask.q_title}"></div>
			<div>내용<span class="board_ask_cu_important">*</span></div>
			<div>
				<div>
					<textarea required name="q_txt" maxlength="2000">${ask.q_txt}</textarea>
					<div><span class="board_ask_cu_important">* 내용은 2000자까지 입력이 가능합니다.</span></div>
				</div>
			</div>
		</div>
		
		<div class="board_ask_cu_request">*는 필수 입력사항입니다.</div>
	
		<div class="board_ask_cu_buttons">
				<button class="board_ask_buttonRed" name="q_no" value="${ask.q_no}">수정하기</button>
				<button class="board_ask_buttonGray" type="button" onclick="location.href='board.ask.readall'">내 문의목록</button>
		</div>
	</form>
</body>
</html>