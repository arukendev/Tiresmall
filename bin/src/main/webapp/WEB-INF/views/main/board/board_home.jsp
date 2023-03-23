<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	무엇을 도와드릴까요?<br>
	상품 주문/배송 장착 반품/교환/취소<br>
	<div>
		<img src="resources/web/main/board/askLogo.svg" style="width: 50px;"/>
		<a class="board_sideMenuList" href="board.ask">1:1문의하기</a>
	</div>
	<div>
		<img src="resources/web/main/board/kakaoLogo.png" style="width: 50px;"/>
		<a onclick="board_openKakao()" style="cursor: pointer">카카오톡상담하기</a>
	</div>
	
	<div class="home_board_box">
		<div class="home_title home_board_title">
			<h1>공지사항</h1>
			<a href="board.notice">더 보기</a>
		</div>
		<ul class="home_board_content">
			<li>공지사항 1</li>
			<li>공지사항 2</li>
			<li>공지사항 3</li>
			<li>공지사항 4</li>
			<li>공지사항 5</li>
		</ul>
	</div>
	<div class="home_board_box">
		<div class="home_title home_board_title">
			<h1>이벤트</h1>
			<a href="board.event">더 보기</a>
		</div>
		<ul class="home_board_content">
			<li>이벤트 1</li>
			<li>이벤트 2</li>
			<li>이벤트 3</li>
			<li>이벤트 4</li>
			<li>이벤트 5</li>
		</ul>
	</div>
</body>
</html>