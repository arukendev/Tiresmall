<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="resources/web/favicon.png"
	type="image/png" />
<link rel="icon" href="resources/web/favicon.png" type="image/png" />
<link rel="stylesheet" href="resources/css/main/auth/auth.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		history.replaceState({}, null, location.pathname);
	});
</script>
</head>
<body>
	<form action="authRegSocial.do" method="post" name="join_form"
		onsubmit="return joinCheck();">
		<input name="u_id" type="hidden" value="${socialID}"> <input
			name="u_logintype" type="hidden" value="2">
		<div id="join_container">
			<div id="join_logo">
				<a href="/home"> <img alt="" src="resources/web/logo.png">
				</a>
			</div>
			<div class="join_box">
				<div class="join_title">이메일</div>
				<div id="email_input">
					<input name="i_email">
				</div>
			</div>

			<div class="join_box">
				<div class="join_title">이름</div>
				<div id="name_input">
					<input name="i_name">
				</div>
			</div>
			<div class="join_box">
				<div class="join_title">전화번호</div>
				<div id="phoneNum_input">
					<input name="i_phoneNum">
				</div>
			</div>
			<div id="join_btn">
				<button>회원가입하기</button>
			</div>
		</div>
	</form>




</body>
</html>