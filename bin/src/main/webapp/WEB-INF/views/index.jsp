<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>대전 타이어쇼핑몰</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
    />
    <link
      rel="shortcut icon"
      href="resources/web/favicon.png"
      type="image/png"
    />
    <link rel="icon" href="resources/web/favicon.png" type="image/png" />
    <link rel="stylesheet" href="resources/css/index.css" />
  </head>
  <body>
    <div class="index_shadow"></div>
    <div class="index_container">
      <header>
        <div class="index_header">
          <div class="index_hTop">
            <div class="index_hTopLeft">
              <a href="admin.order.go?m=order">관리자</a>
              <a href="/home">구매가이드</a>
              <a onclick="board_openKakao()" style="cursor: pointer"
                >카카오톡상담
                <img
                  src="resources/web/main/board/kakaoLogo.png"
                  style="width: 16px; vertical-align: bottom"
              /></a>
            </div>
            <div class="index_hTopRight">
              <c:choose>
                <c:when test="${not empty sessionScope.loginMember.i_name}">
                  <a>${sessionScope.loginMember.i_name }님 안녕하세요!</a>
                  <a onclick="location.href='logout.do'">로그아웃 </a>
                </c:when>
                <c:otherwise>
                  ${sessionScope.loginMember.i_name }
                  <a href="login">로그인</a>
                </c:otherwise>
              </c:choose>
              <a href="non-member">| 비회원 주문조회</a>
            </div>
          </div>
          <div class="index_hBottom">
            <div class="index_logo">
              <a href="/home">
                <img src="resources/web/logo.png" style="width: 190px" />
              </a>
            </div>
            <div class="index_topNav">
              <div class="index_tnMenu index_tnSearch">
                <a href="search.car">타이어 찾기</a>
              </div>
              <div class="index_tnMenu index_tnBrand">
                <a href="product.brand?b=&p=1">브랜드별 타이어</a>
              </div>
              <div class="index_tnMenu index_tnStore">
                <a href="store?id=1">매장 안내</a>
              </div>
              <div class="index_tnMenu index_tnBoard">
                <a href="board.home">고객센터</a>
              </div>
              <input
                class="whereAmI"
                value="${board_whereAmITwo}"
                type="hidden"
              />
            </div>
            <div class="index_sideNav">
              <a href="profile"><i class="fa-regular fa-user"></i></a>
              <a href="cart"><i class="fa-solid fa-basket-shopping"></i></a>
            </div>
          </div>
        </div>
        <div class="index_dropMenu">
          <ul class="index_dropSearch index_dropWrapper">
            <li class="index_dropMenu_menu">
              <div class="index_dropMenu_txt">
                <a href="search.car">차종으로 검색</a>
                <a href="search.size">타이어 사이즈로 검색</a>
                <a href="search.product">제품명으로 찾기</a>
              </div>
              <div class="index_dropMenu_img">
                <img src="resources/web/main/index/search/1.jpg" />
              </div>
            </li>
          </ul>
          <ul class="index_dropBrand index_dropWrapper">
            <li class="index_dropMenu_menu">
              <div class="index_dropMenu_txt">
                <a href="product.brand?b=넥센&p=1">넥센타이어</a>
                <a href="product.brand?b=한국&p=1">한국타이어</a>
                <a href="product.brand?b=콘티넨탈&p=1">콘티넨탈타이어</a>
                <a href="product.brand?b=피렐리&p=1">피렐리타이어</a>
                <a href="product.brand?b=미쉐린&p=1">미쉐린타이어</a>
              </div>
              <div class="index_dropMenu_img">
                <img src="resources/web/main/index/brand/1.jpg" />
              </div>
            </li>
          </ul>
          <ul class="index_dropStore index_dropWrapper">
            <li class="index_dropMenu_menu">
              <div class="index_dropMenu_txt">
                <a href="store?id=1">타이어쇼핑몰</a>
                <a href="store?id=2">타이어테크 죽동점</a>
                <a href="store?id=3">논산 타이어쇼핑몰(타이어테크 시청점)</a>
                <a href="store?id=4">타이어테크 연무점</a>
                <a href="store?id=5">타이어테크 반월점</a>
              </div>
              <div class="index_dropMenu_img">
                <img src="resources/web/main/index/store/1.jpg" />
              </div>
            </li>
          </ul>
          <ul class="index_dropBoard index_dropWrapper">
            <li class="index_dropMenu_menu">
              <div class="index_dropMenu_txt">
                <a href="board.faq">FAQ</a>
                <a href="board.ask">1:1 문의</a>
                <a href="board.notice">공지사항</a>
                <a href="board.event">이벤트</a>
              </div>
              <div class="index_dropMenu_img">
                <img src="resources/web/main/index/board/1.jpg" />
              </div>
            </li>
          </ul>
        </div>
      </header>
      <main>
        <jsp:include page="${content}"></jsp:include>
      </main>
      <footer>
        <div class="index_footer">
          <div class="index_fTop">
            <div class="index_fLogo">
              <img src="resources/web/logo2.png" style="width: 190px" />
            </div>
            <div class="index_fNav">
              <a href="/">이용약관 |</a>
              <a href="/">개인정보 처리방침 |</a>
              <a href="/">장착점 제휴문의 |</a>
              <a href="/">환불정책 |</a>
              <a href="/">도매문의</a>
            </div>
          </div>
          <div class="index_fBottom">
            <p>
              대전 타이어쇼핑몰 ㅣ 대표 강남용 ㅣ 대전광역시 서구 신갈마로
              83(갈마동) 사업자등록번호 597-01-01529 ㅣ 통신판매업 신고번호
              2022-대전서구-0842호
            </p>
            <p>고객센터 010-5125-8008 ㅣ kny2220@naver.com</p>
            <p>
              TIRESHOPPINGMALL.COM | Copyright © PITNINE & SUN Co.,Ltd. All
              Rights Reserved.
            </p>
          </div>
        </div>
      </footer>
    </div>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="resources/js/index.js"></script>
    <script src="resources/js/main/search/main_search.js"></script>
    <script src="resources/js/main/board/main_board.js"></script>
    <script src="resources/js/main/board/main_board_kakao.js"></script>
    <script src="resources/js/main/board/main_board_whereAmI.js"></script>
  </body>
</html>
