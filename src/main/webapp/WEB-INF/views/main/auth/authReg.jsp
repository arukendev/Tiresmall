<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대전 타이어쇼핑몰</title>
<link
rel="shortcut icon"
href="resources/web/favicon.png"
type="image/png"
/>
<link rel="icon" href="resources/web/favicon.png" type="image/png" />
<link rel="stylesheet" href="resources/css/main/auth/auth.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main/auth/reg_check.js"></script>
</head>
<body>
	<form action="authReg.do" method="post" name="join_form"
		onsubmit="return joinCheck()">
		<!-- 홈페이지 회원 가입의 경우 타입 1번 -->
		<input name="u_logintype" value="1" type="hidden">
		<!-- default value는 1 , 이메일 인증완료시 value 2 -->
		<input name="emailConfirm" value="1" type="hidden">
		
		
		<div id="join_container">
			<div id="join_logo">
				<a href="/home"> <img alt="" src="resources/web/logo.png">
				</a>
			</div>
			<div class="join_box">
				<div class="join_title">아이디</div>
				<div id="id_input">
					<input name="u_id" oninput="checkId()">
				</div>
				<span id="checkID_result"></span>
			</div>
			<div class="join_box">
				<div class="join_title">비밀번호</div>
				<div id="pw_input">
					<input name="pw_password" type="password">
				</div>
				<span id="checkPW_result"></span>
				<div class="join_title">비밀번호확인</div>
				<div id="pwCheck_input">
					<input name="pw_pwCheck" type="password">
				</div>
				<span id="checkPW_result_check"></span>
			</div>
			<div class="join_box">
				<div class="join_title">이름</div>
				<div id="name_input">
					<input name="i_name">
				</div>
			</div>
			<div class="join_box">
				<div class="join_title">휴대폰번호</div>
				<div id="phoneNum_input">
					<input name="i_phoneNum" maxlength="11"
						 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
				</div>
				<span id="checkNum_result_check"></span>
			</div>
			<div class="join_box">
				<div class="join_title">이메일</div>
				<div id="email_inputCheck">
					<input name="i_email" id="i_email">
				</div>
				<!-- <div id="email_input">
					<input name="i_emailCheck" id="i_emailCheck">
					<button type="button" id="mail_Check">인증번호 받기</button>
					<button type="button" id="authnum_check">인증번호 확인</button>
				</div> -->
			</div>

		


			<div id="join_btn">
				<button	class="lastCheck">회원가입하기</button>
			</div>
		</div>
	</form>









</body>
</html>