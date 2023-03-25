<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>대전 타이어쇼핑몰</title>
    <link rel="stylesheet" href="resources/css/main/auth/auth.css" />
    <link rel="shortcut icon" href="resources/web/favicon.png" type="image/png"/>
    <link rel="icon" href="resources/web/favicon.png" type="image/png"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="resources/js/main/auth/termOfUse.js"></script>
    <script type="text/javascript" src="resources/js/main/auth/main_auth.js"></script>
  </head>
  <body>
    <div id="find_container">
      <div id="find_logo">
        <a href="/home">
          <img alt="" src="resources/web/logo.png" />
        </a>
      </div>

      <div class="find_title">
        <div class="findTab active">
          <a href="#find_email">이메일(아이디) 찾기</a>
        </div>
        <div class="findTab"><a href="#find_pw">비밀번호 찾기</a></div>
      </div>
      <div class="find_content">
        <div id="find_email">
          <div id="find_input">
            <span>이름</span>
            <input name="i_name" />
          </div>
          <div id="find_input">
            <span>전화번호</span>
            <input name="i_phoneNum" />
          </div>
          <div id="find_btn">
            <button id="idFind_btn" >아이디 찾기</button>
          </div>
        </div>
        <h1 id="result_id" ></h1>
        
        <!-- 비밀번호 화면 -->
        <div id="find_pw">
          <div id="find_input">
            <span>아이디</span>
            <input name="u_idPW" required />
          </div>
          <div id="find_input">
            <span>이메일</span>
            <input name="i_emailPW" type="email" />
          </div>

          <div id="find_btn">
            <button id="pwFind_btn" >비밀번호 찾기</button>
          </div>
        </div>
        
          	<div id="emailNumCheck_box" style="display: none" >
					<div id="emailNumCheck_box_title">인증번호</div>
				
					<input name="i_emailCheck" id="i_emailCheck">
					<button type="button" id="authnum_check">인증번호 확인</button>
			</div>
			
				<form action="pwNewSet" method="POST">
			<div id="setPw_box" style="display: none" >
					<input name="u_id" value="" type="hidden">
					<div id="pwNewSet_title">새로운 비밀번호</div>
						<input name="pw_password" type="password" id="pw_password"  >
					<div id="pwNewSet_title" >새로운 비밀번호확인</div>
						<input name="pw_pwCheck" type="password">
					<button >인증번호 확인</button>
			</div>
				</form>
			
        	<button id="backHOME" style="display: none">홈으로 돌아가기</button>
      </div>
    </div>
  </body>
</html>
