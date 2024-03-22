<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />

<title>논산 타이어쇼핑몰</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link rel="shortcut icon" href="resources/web/favicon.png"
	type="image/png" />
<link rel="icon" href="resources/web/favicon.png" type="image/png" />
<link rel="stylesheet" href="resources/css/index.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
</head>
<body>
	<div class="index_shadow"></div>
	<div class="index_container">
		<header>
			<div class="index_header">
				<div class="index_hTop">
					<div class="index_hTopLeft">
						<!-- <a href="javascript:board_openKakao_new()" class="index_kakao"
							style="cursor: pointer">카카오톡상담 <img
							src="resources/web/main/board/kakaologo.png" style="width: 16px" />
						</a> -->

						<!-- <img
                onclick="board_openKakao_new()"
                style="
                  cursor: pointer;
                  width: 80px;
                  position: relative;
                  top: 2px;
                "
                src="resources/web/main/board/tsd.png"
              /> -->
						<c:if test="${sessionScope.homegradecheck.i_grade > 1}">
							<a href="admin.order.go?m=order" class="main_admin_go">관리자 페이지
							</a>
						</c:if>
					</div>
					<div class="index_hTopRight">
						<c:choose>
							<c:when test="${not empty sessionScope.loginMember.i_name}">
								<a>${sessionScope.loginMember.i_name}님 안녕하세요!</a>
								<a class="index_logIn" onclick="location.href='logout.do'">로그아웃</a>
							</c:when>
							<c:otherwise>
								<a class="index_logIn" href="login">로그인</a>
								<a class="index_nonLogIn" href="non-member">비회원 주문조회</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="index_hBottom">
					<div class="index_logo">
						<a href="/home"> <img src="resources/web/logo.png"
							style="width: 190px" />
						</a>
					</div>
					<div class="index_topNav">
						<div class="index_tnMenu index_tnSearch">
							<a>타이어 찾기</a>
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
						<input class="whereAmI" value="${board_whereAmITwo}" type="hidden" />
					</div>
					<div class="index_sideNav">
						<c:choose>
							<c:when test="${not empty sessionScope.loginMember.i_name}">
								<a href="profile"><img src="resources/web/main/user.png" /></a>
							</c:when>
							<c:otherwise>
								<a href="login"><img src="resources/web/main/user.png" /></a>
							</c:otherwise>
						</c:choose>
						<a href="cart"><img src="resources/web/main/cart.png" /></a>
					</div>
				</div>
			</div>
			<div class="index_dropMenu">
				<ul class="index_dropSearch index_dropWrapper">
					<li class="index_dropMenu_menu">
						<div class="index_dropMenu_txt">
							<!--hoem-modal-open  -->
							<a class="index_dropSearch_a hoem-modal-open"> 타이어 사이즈로 검색 </a> <a
								class="index_dropSearch_a hoem-modal-car-open"> 차종으로 검색 </a>
						</div>
						<div class="index_dropMenu_img">
							<img class="index_dropImg_search"
								src="resources/web/main/index/search/1.jpg" />
						</div>
					</li>
				</ul>
				<ul class="index_dropBrand index_dropWrapper">
					<li class="index_dropMenu_menu">
						<div class="index_dropMenu_txt">
							<a class="index_dropBrand_a" href="product.brand?b=&p=1">전체타이어</a>
							<c:forEach items="${sessionScope.brands }" var="b"
								varStatus="status">
								<a class="index_dropBrand_a"
									href="product.brand?b=${b.tb_name }&p=1">${b.tb_name }</a>
								<input type="hidden" value="${b.tb_img }" class="hidden_tb_id">
							</c:forEach>
						</div>
						<div class="index_dropMenu_img">
							<img class="index_dropImg_brand"
								src="resources/web/main/index/brand/1.jpg" />
						</div>
					</li>
				</ul>
				<ul class="index_dropStore index_dropWrapper">
					<li class="index_dropMenu_menu">
						<div class="index_dropMenu_txt">
							<c:forEach items="${sessionScope.stores }" var="s"
								varStatus="status">
								<a class="index_dropStore_a" href="store?id=${s.b_id }&p=1">${s.b_name }</a>
								<input type="hidden" value="${s.b_mainimg }" class="hidden_b_id">
							</c:forEach>
						</div>

						<div class="index_dropMenu_img">
							<img class="index_dropImg_store"
								src="resources/web/main/index/store/shop1.png" />
						</div>
					</li>
				</ul>
				<ul class="index_dropBoard index_dropWrapper">
					<li class="index_dropMenu_menu">
						<div class="index_dropMenu_txt">
							<a class="index_dropBoard_a"
								href="board.faq.read.search?f_sortation=">FAQ</a> <a
								class="index_dropBoard_a" href="board.qna.check">1:1 문의</a> <a
								class="index_dropBoard_a" href="board.notice.read">공지사항</a> <a
								class="index_dropBoard_a" href="board.event.read">이벤트</a>
						</div>
						<div class="index_dropMenu_img">
							<img class="index_dropImg_board"
								src="resources/web/main/index/board/1.jpg" />
						</div>
					</li>
				</ul>
			</div>
		</header>
		<main>
		<div id="home-modal">
			<div id="home-modal-container">
				<div id="home-modal-container-title">
					타이어 사이즈 찾기
					<p class="btn_close">
						<a>"닫기"</a>
					</p>
				</div>
				<div id="home-modal-search-select">
					<div id="home-modal-tire-search" class="home-modal-search-div">타이어
						사이즈로 찾기</div>
					<div id="home-modal-car-search" class="home-modal-search-div">차종으로
						사이즈 찾기</div>
				</div>
				<div id="home-modal-search-content">
					<div id="home-modal-tire-search-container">
						<div id="home-modal-tire-search-content">
							<div id="home-modal-tire-search-content-text">
								<span class="home-modal-span tire-width">단면폭</span> <img
									src="resources/web/main/search/right-arrow.png"> <span
									class="home-modal-span tire-ratio">편평비</span> <img
									src="resources/web/main/search/right-arrow.png"
									class="imgRemove"> <span
									class="home-modal-span tire-inch">인치</span>
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
								<div class="home-modal-tire-search-what-text">내차 타이어 사이즈
									어떻게 아나요?</div>
							</div>
							<div class='home-modal-tire-select-result'>
								<div class='home-modal-tire-select-result-text'>
									<span class="home-modal-result-span front-tire-width"></span> <span
										class="home-modal-slush-display1">/</span> <span
										class="home-modal-result-span front-tire-ratio"></span> R <span
										class="home-modal-result-span front-tire-inch"></span>
								</div>
								<div class='home-modal-tire-select-result-text rearTireResult'>
									<span class="home-modal-result-span rear-tire-width"></span> <span
										class="home-modal-slush-display2">/</span> <span
										class="home-modal-result-span rear-tire-ratio"></span> R <span
										class="home-modal-result-span rear-tire-inch"></span>
								</div>
								<div class='home-modal-tire-result-text'>※ 타이어 앞, 뒤가 다른 경우
									'타이어 추가' 버튼을 눌러주세요.</div>
								<div class='home-modal-tire-select-result-button'>
									<div class="home-modal-tire-select-result-back">다시 선택</div>
									<div class="home-modal-rear-tire-select">타이어 추가</div>
									<form action='product.tire.search'>
										<input type="hidden" name="front_tire_width"
											id="front_tire_width"> <input type="hidden"
											name="front_tire_ratio" id="front_tire_ratio"> <input
											type="hidden" name="front_tire_inch" id="front_tire_inch">
										<input type="hidden" name="rear_tire_width"
											id="rear_tire_width" value="0"> <input type="hidden"
											name="rear_tire_ratio" id="rear_tire_ratio" value="0">
										<input type="hidden" name="rear_tire_inch" id="rear_tire_inch"
											value="0">
										<button class="home-modal-tire-select-go">검색</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div id="home-modal-car-search-container">
						<div id="home-modal-car-search-content">
							<div id="home-modal-car-search-content-text">
								<span class="home-modal-span car-brand">제조사</span> <img
									src="resources/web/main/search/right-arrow.png"> <span
									class="home-modal-span car-year">생산년도</span> <img
									src="resources/web/main/search/right-arrow.png"> <span
									class="home-modal-span car-name">차종명</span>
							</div>
							<div id="home-modal-car-search-content-item"></div>
							<!-- <div class="home-modal-tire-search-what-text">내차 타이어 사이즈
									어떻게 아나요?</div> -->
							<div class='home-modal-car-select-result'>
								<div class="home-modal-car-select-result-choice">타이어 사이즈를
									선택해주세요!</div>
								<div class='home-modal-car-select-result-button'>
									<div class="home-modal-car-select-result-back">다시 선택</div>
									<form action='product.tire.search'>
										<input type="hidden" name="front_tire_width"
											class="front_tire_width"> <input type="hidden"
											name="front_tire_ratio" class="front_tire_ratio"> <input
											type="hidden" name="front_tire_inch" class="front_tire_inch">
										<input type="hidden" name="rear_tire_width"
											class="rear_tire_width" value="0"> <input
											type="hidden" name="rear_tire_ratio" class="rear_tire_ratio"
											value="0"> <input type="hidden" name="rear_tire_inch"
											class="rear_tire_inch" value="0">
										<button class="home-modal-car-select-go">검색</button>
									</form>
								</div>
							</div>
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
					<div class="home-modal-what-know-tire-buttun-close">닫기</div>
				</div>
			</div>
		</div>
		<jsp:include page="${content}"></jsp:include> </main>
		<footer>
			<div class="index_footer">
				<div class="index_fTop">
					<div class="index_fLogo">
						<img src="resources/web/logo2.png" style="width: 190px" />
					</div>
					<div class="index_fNav">
						<a href="termsAndConditionsOfUse">이용약관 |</a> 
						<a href="PrivacyPolicy">&nbsp;개인정보 처리방침 |</a>
						<div class="footer_modal_criteria footer1">&nbsp;환불정책 |
							<div class="footer_modal_content footerModal1">
                        		<p class="tit">환불정책</p>
			                    <ol class="list">
			                    	<li>
			                                1. 제품의 문제가 있을 경우 반품 또는 교환이 모두 가능합니다.<br>
			                           		    단 특별한 사유가 없거나 고객님께 책임이 있는 부분에 대해서는 불가능합니다.
			                       	</li>
			                     	<li>2. 단순 반품과 제품에 문제가 없을 경우 왕복 택배비가 부과 됩니다.</li>
			                     	<li>3. 대전 타이어쇼핑몰에서 판매되는 모든 타이어는 정식 유통된 제품만 취급하며 각 제조사의 지정된 지점에서 A/S를 받으실수 있습니다.</li>
			                  		<li>4. 환불관련 문의는 고객센터 010-5125-8008 으로 문의해주세요.</li>
			          			</ol>
							</div>
						</div>
						<div class="footer_modal_criteria footer2">&nbsp;장착점 제휴문의 |
							<div class="footer_modal_content footerModal2">
								장착점 제휴문의는 고객센터 010-5125-8008로 전화 주시기 바랍니다.
							</div>
						</div>
						<div class="footer_modal_criteria footer3">&nbsp;도매문의
							<div class="footer_modal_content footerModal3">
								도매문의는 고객센터 010-5125-8008로 전화 주시기 바랍니다.
							</div>
						</div>
					</div>
				</div>
				<div class="index_fBottom">
					<p>대전 타이어쇼핑몰 ㅣ 대표 강민석 ㅣ 대전광역시 서구 신갈마로 83(갈마동) 사업자등록번호
						601-15-58309 ㅣ 통신판매업 신고번호 2022-대전서구-0842호</p>
					<p>고객센터 010-5125-8008 ㅣ kny2220@naver.com</p>
					<!-- <a href="#" target="_new">
						<img src="page/ui/image/layout/footer_btn_info.gif" alt="사업자정보확인">
					</a> -->
					<p>TIRESHOPPINGMALL.COM | Copyright © PITNINE & SUN Co.,Ltd.
						All Rights Reserved.</p>
				</div>
			</div>
		</footer>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuyB2oFUoxC04Ue82J1pxusEfNPy5FBJE&callback=initMap"></script>
	<script src="resources/js/index.js"></script>
	<script src="resources/js/main/order/cart.js"></script>
	<script src="resources/js/main/order/pay.js"></script>
	<!-- main.board -->
	<script src="resources/js/main/board/main_board_kakao.js"></script>
	<script src="resources/js/main/board/main_board_whereAmI.js"></script>
	<script src="resources/js/main/board/main_board_qna_complete.js"></script>
	<script src="resources/js/main/board/main_board_deleteQna.js"></script>
	<script src="resources/js/main/board/main_board_event.js"></script>
</body>
</html>
