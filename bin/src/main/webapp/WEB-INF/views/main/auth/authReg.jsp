<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main/auth/auth.css">
</head>
<body>
	<form  action="authReg.do"  method="post" 
		name="join_form" onsubmit="return joinCheck();">
		<div id="join_container">
			<div id="join_logo">
				<a href="/home">
				<img alt="" src="resources/web/logo.png">
				</a>
			</div>
			<div class="join_box">
				<div class="join_title">이메일(아이디)</div>
				<div id="email_input">
					<input name="u_id">
				</div>
			</div>
			<div class="join_box">
				<div class="join_title">비밀번호</div>
				<div id="pw_input">
					<input name="pw_password" type="password" >
				</div>
				<div class="join_title">비밀번호확인</div>
				<div id="pwCheck_input">
					<input name="pw_pwCheck" type="password">
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
			<div id="join_pic"></div>
			<div id="join_policy"></div>
			
			<div id="join_btn">
			<button>회원가입하기</button>
			</div>
		</div>
		</form>









	</div>
</body>
</html>