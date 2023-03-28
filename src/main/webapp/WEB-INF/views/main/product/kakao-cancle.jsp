<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	overflow: hidden;
	background:
		url(https://t1.daumcdn.net/kakaopay/payment-markup-html/tms/img/background-logo.png)
		repeat #ffeb00 !important;
	font-family: "Noto Sans KR", system-ui, "AppleSDGothicNeo", sans-serif;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
</head>
<body>
<br><br><br><br><br><br>
	<h2>사용자 요청에 의한 결제 취소</h2>
</body>
<script>
setTimeout(function() { 
alert('결제가 취소 되었습니다.');
window.close();
}, 300);
</script>
</html>