<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>대전 타이어쇼핑몰</title>
    <link rel="stylesheet" href="resources/css/main/auth/auth.css" />
    <link
      rel="shortcut icon"
      href="resources/web/favicon.png"
      type="image/png"
    />
    <link rel="icon" href="resources/web/favicon.png" type="image/png" />
    <script
      src="https://code.jquery.com/jquery-3.6.3.js"
      integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
      crossorigin="anonymous"
    ></script>
    <script
      type="text/javascript"
      src="resources/js/main/auth/termOfUse.js"
    ></script>
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
            <input name="a_name" />
          </div>
          <div id="find_input">
            <span>전화번호</span>
            <input name="a_phoneNum" />
          </div>
          <div id="find_btn">
            <button>아이디 찾기</button>
          </div>
        </div>
        <!-- 비밀번호 화면 -->
        <div id="find_pw">
          <div id="find_input">
            <span>이메일</span>
            <input name="a_email" type="email" required />
          </div>
          <div id="find_input">
            <span>이름</span>
            <input name="a_name" />
          </div>
          <div id="find_input">
            <span>전화번호</span>
            <input name="a_phoneNum" />
          </div>

          <div id="find_btn">
            <button>비밀번호 찾기</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
