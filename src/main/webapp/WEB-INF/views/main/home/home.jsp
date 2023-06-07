<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script
		src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous">
    </script>
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
     <div id="home-modal">
		<div id="home-modal-container">
			<div id="home-modal-container-title">
				타이어 사이즈 찾기
				<p class="btn_close">
					<a>"닫기"</a>
				</p>
			</div>
			<div id="home-modal-search-select">
				<div id="home-modal-tire-search" class="home-modal-search-div">타이어 사이즈로 찾기</div>
				<div id="home-modal-car-search" class="home-modal-search-div">차종으로 사이즈 찾기</div>
			</div>
			<div id="home-modal-search-content">
				<div id="home-modal-tire-search-container">
					<div id="home-modal-tire-search-content">
						<div id="home-modal-tire-search-content-text">
							<span class="home-modal-span tire-width">단면폭</span>
								<img src="resources/web/main/search/right-arrow.png">
							<span class="home-modal-span tire-ratio">편평비</span>
								<img src="resources/web/main/search/right-arrow.png">
							<span class="home-modal-span tire-inch">인치</span>
						</div>
						<div id="home-modal-tire-search-content-item">
							<ol class="item-list">
								<li value="145">145</li>
								<li value="155">155</li>
								<li value="165">165</li>
								<li value="170">170</li>
								<li value="175">175</li>
								<li value="185">185</li>
								<li value="195">195</li>
								<li value="205">205</li>
								<li value="215">215</li>
								<li value="225">225</li>
								<li value="235">235</li>
								<li value="245">245</li>
								<li value="255">255</li>
								<li value="265">265</li>
								<li value="275">275</li>
								<li value="285">285</li>
								<li value="295">295</li>
								<li value="305">305</li>
								<li value="315">315</li>
								<li value="325">325</li>
								<li value="335">335</li>
								<li value="345">345</li>
								<li value="355">355</li>
							</ol>
						</div>	
						<div class="home-modal-tire-search-what">
							<div class="home-modal-tire-search-what-text">
								내차 타이어 사이즈 어떻게 아나요? 
							</div>
						</div>
						<div class='home-modal-tire-select-result'>
							<div class='home-modal-tire-select-result-text'>
								<span class="home-modal-result-span front-tire-width">245</span>
								/
								<span class="home-modal-result-span front-tire-ratio">45</span>
								R
								<span class="home-modal-result-span front-tire-inch">18</span>
							</div>
							<div class='home-modal-tire-select-result-text rearTireResult'>
								<span class="home-modal-result-span rear-tire-width">235</span>
								/
								<span class="home-modal-result-span rear-tire-ratio">55</span>
								R
								<span class="home-modal-result-span rear-tire-inch">19</span>
							</div>
							<div class='home-modal-tire-result-text'>
								※ 타이어 앞, 뒤가 다른 경우 '타이어 추가' 버튼을 눌러주세요.
							</div>
							<div class='home-modal-tire-select-result-button'>
								<div class="home-modal-tire-select-result-back">다시 선택</div>
								<div class="home-modal-rear-tire-select">타이어 추가</div>
								<form action=''>
									<input type="hidden" name="front_tire_width" id="front_tire_width">
									<input type="hidden" name="front_tire_ratio" id="front_tire_ratio">
									<input type="hidden" name="front_tire_inch" id="front_tire_inch">
									<input type="hidden" name="rear_tire_width" id="rear_tire_width">
									<input type="hidden" name="rear_tire_ratio" id="rear_tire_ratio">
									<input type="hidden" name="rear_tire_inch" id="rear_tire_inch">
									<button class="home-modal-tire-select-go">검색</button>
								</form>
							</div>
							
							
						</div>
					</div>					
<!-- 					<div class="home-modal-search-butten">
						<button class="home-modal-tire-search">검색</button>
					</div> -->
				</div>
				<div id="home-modal-car-search-container">
					<div  id="home-modal-car-search-content">
						차종으로 타이어 사이즈 검색
					</div>

				</div>
			</div>
		</div>
	</div>

	<div id="home-modal-what-know-tire">
		<div id="home-modal-what-know-tire-container">	
			<div id="home-modal-tire-search-what-img">
				<img src="resources/web/main/search/searchTireGuideImg2.png">
				<p class="btn_close2">
					<a>"닫기"</a>
				</p>
			</div>
			<div class="home-modal-what-know-tire-buttun">
				<div class="home-modal-what-know-tire-buttun-close">닫기 </div>
			</div>
		</div>
	</div>
      
      <section>
        <div class="home_title">
          <img src="resources/web/logo4.png" style="height: 35px" />
          <span>이용 방법</span>
          <hr />
        </div>
        <div class="home_manual">
          <div class="home_manual_menu hoem-modal-open">
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
        <div class="home_title">
          <span>MD 추천 타이어</span>
          <hr />
        </div>
        <div class="home_recommend">
          <a class="home_recommend_menu" href="product.brand.type?b=&p=1&t=sedan">
            <div class="home_shadow"></div>
            <img
              src="resources/web/main/home/sedan.jpg"
              class="home_recommend_img"
            />
            <span class="home_recommend_txt">승용차용</span>
          </a>
          <a class="home_recommend_menu" href="product.brand.type?b=&p=1&t=suv">
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
            <a href="board.notice.read">더 보기</a>
          </div>
          <!-- 
          <ul class="home_board_content">
            <li>공지사항 1</li>
            <li>공지사항 2</li>
            <li>공지사항 3</li>
            <li>공지사항 4</li>
            <li>공지사항 5</li>
          </ul>
           -->
          <ul class="home_board_content">
            <c:forEach var="n" items="${notices }" begin="0" end="4">
				<li><a href="board.notice.readdetail?n_no=${n.n_no}">${n.n_title }</a></li>
			</c:forEach>
          </ul>
        </div>
        <div class="home_board_box">
          <div class="home_title home_board_title">
            <h1>이벤트</h1>
            <a href="board.event.read">더 보기</a>
          </div>
          <!-- 
          <ul class="home_board_content">
            <li>이벤트 1</li>
            <li>이벤트 2</li>
            <li>이벤트 3</li>
            <li>이벤트 4</li>
            <li>이벤트 5</li>
          </ul>
           -->
          <ul class="home_board_content">
			<c:forEach var="e" items="${events }" begin="0" end="4">
				<c:if test="${e.e_popup == 1}">
					<li><a href="board.event.readdetail?e_no=${e.e_no}">${e.e_title }</a></li>
				</c:if>
			</c:forEach>
          </ul>
        </div>
      </section>
      <section class="home_store_section">
        <div class="home_title">
          <span>매장 안내</span>
          <hr />
        </div>
        <div class="home_store">
          <a class="home_store_menu" href="store?id=1">
            <div class="home_shadow"></div>
            <img
              class="home_store_img"
              src="resources/web/main/home/shop1.png"
            />
            <span class="home_store_txt">타이어쇼핑몰</span>
          </a>
          <a class="home_store_menu" href="store?id=2">
            <div class="home_shadow"></div>
            <img
              class="home_store_img"
              src="resources/web/main/home/shop2.png"
            />
            <span class="home_store_txt">타이어테크 죽동점</span>
          </a>
          <a class="home_store_menu" href="store?id=3">
            <div class="home_shadow"></div>
            <img
              class="home_store_img"
              src="resources/web/main/home/shop3.png"
            />
            <span class="home_store_txt">논산 타이어쇼핑몰</span>
          </a>
          <a class="home_store_menu" href="store?id=4">
            <div class="home_shadow"></div>
            <img
              class="home_store_img"
              src="resources/web/main/home/shop4.png"
            />
            <span class="home_store_txt">타이어테크 연무점</span>
          </a>
          <a class="home_store_menu" href="store?id=5">
            <div class="home_shadow"></div>
            <img
              class="home_store_img"
              src="resources/web/main/home/shop5.png"
            />
            <span class="home_store_txt">타이어테크 반월점</span>
          </a>
          <div class="home_store_menu">
            <img src="resources/web/main/index/brand/1.jpg">
          </div>
        </div>
      </section>
    </div>
		<dialog class="board_event_modal_dialog">
    		<c:forEach var="e" items="${events }">
				<input type="hidden" class="dialog_val" value="${e.e_popup }">
    		</c:forEach>
			<jsp:include page="${eventModal}"></jsp:include>
		<dialog>
		

		
    <script src="resources/js/main/home/main_home.js"></script>
  </body>
</html>
