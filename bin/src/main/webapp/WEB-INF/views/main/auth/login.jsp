<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main/auth/auth.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript" src="resources/js/main/auth/login_social.js"></script>
</head>
<body>
	<form action="login.do" method="post" >
	<div id="login_container">
		<div id="login_logo">
		<a href="/home">
		<img alt="" src="resources/web/logo.png">
		</a> 
		</div>
		<div id="login_box">
			<div id="login_box_title">ID로그인 </div>
			<input id="login_id" name="u_id" placeholder="아이디">		
			<input type="password" id="login_pw" name="pw_password" placeholder="비밀번호">		
		</div>
		<div id="login_btn"> 
			<button>로그인</button>
		</div>
		<div id="login_other_btn"> 
			<span onclick="location.href='findEmail.go'">아이디/비밀번호 찾기 |</span>		
			<span onclick="location.href='authTermsOfUse.go'">회원가입</span>		
		</div>
		<div id="login_btn_social">
			<div id="login_btn_kakao">
				<button type="button" onclick="kakaoLogin()" ><img alt="" src="resources/img/auth/kakao_login_medium_wide.png"></button>
			</div>
			<div id="login_btn_naver">
				<a><img src="resources/img/auth/naver_login_btn.png"> </a>
			</div>
		</div>
	</div>
	</form>
</body>
</html>