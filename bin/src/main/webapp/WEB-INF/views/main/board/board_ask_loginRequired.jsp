<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		(회원)<span class="tab">&#9;</span>
		<input placeholder="아이디">		
		<input placeholder="비밀번호">
		<button onclick="location.href='board.ask.readall'">로그인하여 문의</button>
	</div>
	<div>
		(비회원)<span class="tab">&#9;</span>
		<input placeholder="주문자명">
		<input placeholder="전화번호">
		<button onclick="location.href='board.ask.readall'">주문번호로 문의</button>
	</div>
</body>
</html>