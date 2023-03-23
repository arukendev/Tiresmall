<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <div class="home_container">
      <div class="home_video">
        <video
          src="resources/web/main/home/main_movie.mp4"
          autoplay
          muted
          loop
          style="width: 100%"
        ></video>
      </div>
      <section>
        <h1 class="home_title">
          <img src="resources/web/logo4.png" style="height: 35px" />
          <span>이용 방법</span>
        </h1>
        <div class="home_manual">
          <div class="home_manual_menu">
            <img
              src="resources/web/main/home/manual_1.png"
              style="width: 300px"
            />
            <h3 class="home_manual_title">1. 타이어 사이즈 검색</h3>
            <span class="home_manual_txt">타이어 간편하게 주문하기</span>
          </div>
          <div class="home_manual_menu">
            <img
              src="resources/web/main/home/manual_2.png"
              style="width: 300px"
            />
            <h3 class="home_manual_title">2. 당일장착점 예약</h3>
            <span class="home_manual_txt">직영점 타이어 장착일 예약하기</span>
          </div>
          <div class="home_manual_menu">
            <img
              src="resources/web/main/home/manual_3.png"
              style="width: 300px"
            />
            <h3 class="home_manual_title">3. 주문접수 후 해피콜</h3>
            <span class="home_manual_txt"
              >타이어 주문확인 장착설명 예약확인</span
            >
          </div>
          <div class="home_manual_menu">
            <img
              src="resources/web/main/home/manual_4.png"
              style="width: 300px"
            />
            <h3 class="home_manual_title">4. 장착점 방문</h3>
            <span class="home_manual_txt">장착 후 현장결제 및 안전운전</span>
          </div>
        </div>
      </section>
      <section>
        <h1 class="home_title">MD 추천 타이어</h1>
        <div class="home_recommend">
          <a class="home_recommend_menu">
            <div class="home_shadow"></div>
            <img
              src="resources/web/main/home/sedan.jpg"
              class="home_recommend_img"
            />
            <span class="home_recommend_txt">승용차용</span>
          </a>
          <a class="home_recommend_menu">
            <div class="home_shadow"></div>
            <img
              src="resources/web/main/home/suv.jpg"
              class="home_recommend_img"
            />
            <span class="home_recommend_txt">SUV용</span>
          </a>
        </div>
      </section>
      <section class="home_board_section">
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
      </section>
      <section class="home_store_section">
        <h1 class="home_title">매장 안내</h1>
        <div class="home_store">
          <a class="home_store_menu" href="/">
            <div class="home_shadow"></div>
            <img
              class="home_store_img"
              src="resources/web/main/home/shop1.png"
            />
            <span class="home_store_txt">타이어쇼핑몰</span>
          </a>
          <a class="home_store_menu" href="/">
            <div class="home_shadow"></div>
            <img
              class="home_store_img"
              src="resources/web/main/home/shop2.png"
            />
            <span class="home_store_txt">타이어테크 죽동점</span>
          </a>
          <a class="home_store_menu" href="/">
            <div class="home_shadow"></div>
            <img
              class="home_store_img"
              src="resources/web/main/home/shop3.png"
            />
            <span class="home_store_txt">논산 타이어쇼핑몰</span>
          </a>
          <a class="home_store_menu" href="/">
            <div class="home_shadow"></div>
            <img
              class="home_store_img"
              src="resources/web/main/home/shop4.png"
            />
            <span class="home_store_txt">타이어테크 연무점</span>
          </a>
          <a class="home_store_menu" href="/">
            <div class="home_shadow"></div>
            <img
              class="home_store_img"
              src="resources/web/main/home/shop5.png"
            />
            <span class="home_store_txt">타이어테크 반월점</span>
          </a>
        </div>
      </section>
    </div>
    <script src="resources/js/main/home/main_home.js"></script>
  </body>
</html>
