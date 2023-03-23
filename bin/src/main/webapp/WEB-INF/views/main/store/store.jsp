<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main/store/main_store.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="resources/js/main/store/main_store.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuyB2oFUoxC04Ue82J1pxusEfNPy5FBJE&callback=initMap"></script>	
</head>
<body>
	<!-- <select class="sel" name="shop_complist" id="shop_complist"
			 size="6"
			style="height: 130px; width: 300px; font-size: 15px; padding: 10px; display:none;">
			<option	value="1" comp_name="[직영점] 타이어쇼핑몰" comp_tel="042-545-8008"
				comp_address="대전광역시 서구 신갈마로 83 (갈마동)" comp_address4m="대전광역시 서구 신갈마로 83"
				opentimememo="평일 : 08:30 ~ 19:00 / 토요일 : 08:30 ~ 16:00 (일요일 휴무)"
				lngmemo="127.3663178" latmemo="36.3417632"
				locmemo="한국타이어,넥센타이어,금호타이어,미쉐린타이어,컨티넨탈타이어,피넬리타이어,휠얼라인먼트,경정비,수입차정비 / 본사직영매장"
				>[직영점] 타이어쇼핑몰</option>
			<option value="2" comp_name="[제휴 당일장착점] 타이어테크 죽동점"
				comp_tel="010-4417-2220" comp_address="대전광역시 유성구 죽동 707-2번지 타이어테크" comp_address4m="유성농협 죽동지점"
				opentimememo="평일 : 08:30 ~ 19:00 / 토요일 : 08:30 ~ 16:00  (일요일휴무)"
				lngmemo="127.338054" latmemo="36.369228"
				locmemo="한국타이어, 금호타이어,넥센타이어, 타이어렌탈전문점, 휠얼라이먼트, 합성오일 전문점">[제휴
				당일장착점] 타이어테크 죽동점</option>
			<option value="3" comp_name="[제휴 당일장착점]논산 타이어쇼핑몰(타이어테크 시청점)"
				comp_tel="010-8488-2326" comp_address="충청남도 논산시 시민로 262 논산타이어 (내동)" comp_address4m="충청남도 논산시 시민로 262"
				opentimememo="평일 : 08:30 ~ 19:00 / 토요일 : 08:30 ~ 16:00  (일요일휴무)"
				lngmemo="127.0954606" latmemo="36.1900937"
				locmemo="한국,금호 넥센,미쉐린,컨티넨탈,피넬리 휠얼라이먼트,국산차및 수입차 경정비">[제휴
				당일장착점]논산 타이어쇼핑몰(타이어테크 시청점)</option>
			<option value="4" comp_name="[제휴 당일장착점]타이어테크 연무점"
				comp_tel="010-4202-1588"
				comp_address="충청남도 논산시 연무읍 왕릉로13번길 38 타이어테크 연무점"
				comp_address4m="충청남도 논산시 연무읍 금곡리 38-3"
				opentimememo="평일 : 08:30 ~ 19:00 / 토요일 : 08:30 ~ 16:00  (일요일휴무)"
				lngmemo="127.0984388" latmemo="36.1188693"
				locmemo="한국타이어,금호타이어,넥센타이어,컨티넨탈타이어,피넬리타이어,경정비,타이어렌탈">[제휴
				당일장착점]타이어테크 연무점</option>
			<option value="5" comp_name="[제휴 당일장착점] 타이어테크 반월점 (로얄카)"
				comp_tel="010-7267-2220"
				comp_address="충청남도 논산시 해월로252 타이어테크 반월점 (로얄카)"
				comp_address4m="충청남도 논산시 해월로252"
				opentimememo="평일 : 08:30 ~ 19:00 / 토요일 : 08:30 ~ 16:00  (일요일휴무)"
				lngmemo="127.0937896" latmemo="36.208517"
				locmemo="한국,금호,넥센타이어,각종수입타이어,타이어 렌탈,휠얼라이먼트,경정비">[제휴 당일장착점]
				타이어테크 반월점 (로얄카)</option>
		</select> -->
	<div id="store_wrap">
		<div id="store_wrap_subtitle">
			<h1>당일 장착 매장안내</h1>
			<h2>대전 타이어쇼핑몰에서 구매 후 당일 장착서비스가 가능한 매장 안내 입니다.</h2>
		</div>
		<div id="store_wrap_info">
			<div id="store_info_name">[${store.b_sortation}] ${store.b_name } </div>
			<div class="store_info_row">
				<div class="store_info_row_index">위치안내 </div>
				<div class="store_info_row_content storeAddress">${store.b_area } ${store.b_addr }</div>
			</div>
			<div class="store_info_row">
				<div class="store_info_row_index">전화번호 </div>
				<div class="store_info_row_content">${store.b_managernumber }</div>
			</div>
			<div class="store_info_row">
				<div class="store_info_row_index">영업시간 </div>
				<div class="store_info_row_content">${store.b_time }</div>
			</div>
			<div class="store_info_row">
				<div class="store_info_row_index">취급품목 </div>
				<div class="store_info_row_content">${store.b_service}</div>
			</div>
		</div>
			<input id="location" value="${store.b_mapdata }" type="hidden"></input>
			<input id="location_lng" type="hidden"></input>
			<input id="location_lat" type="hidden"></input>
				
		<div id="store_wrap_banner">
			<input id="store_banner_img" value="${store.b_file }" type="hidden"></input>
			<img src="">
		</div>
		
		<h1 id="store_map_title">오시는 길</h1>
		
		<div id="store_wrap_map">
			<!--  
			직영점 36.3417632		127.3663178
			죽동점 36.369228		127.338054
			시청점 36.1900937		127.0954606
			연무점 36.1188693		127.0984388
			반월점 36.208517		127.0937896
			 -->
		</div>
		
		<!-- <div id="store_wrap_likeNotice">
			<div id="store_likeNotice_notice">
				<div class="store_likeNotice_title">
					<h1>공지사항</h1>
					<a href="/">더 보기</a>
				</div>
				<div id="store_notice_content" class="store_likeNotice_content">
					공지사항들
				</div>
			</div>
			<div id="store_likeNotice_CS">
				<div class="store_likeNotice_title">
					<h1>고객센터 안내</h1>
				</div>
				<div id="store_CS_content" class="store_likeNotice_content">
					<h1>010-5125-8008</h1>
					<h2>타이어 전문 상담</h2>
					평일 08:30~19:00 / 토요일 08:30~16:00(일요일 휴무)
				</div>
				<div id="store_CS_btns">
					<div id="store_btns_1on1" onclick="location.href='/'">
						1:1 고객상담
					</div>
					<div id="store_btns_faq" onclick="location.href='/'">
						FAQ 바로가기
					</div>
				</div>
			</div>
			<div id="store_likeNotice_store">
				<div class="store_likeNotice_title">
					<h1>직영점 바로 장착 안내</h1>
				</div>
				<div id="store_store_content" class="store_likeNotice_content">
					오늘 예약 하고 바로 장착 !
					<h2>문의 상담 : 010-5125-8008</h2>
					평일 08:30~19:00 / 토요일 08:30~16:00(일요일 휴무)
				</div>
				<div id="store_btns_storeLocation">
					당일장착점 위치 안내
				</div>
			</div>
		</div>-->	
		
	</div>
	

</body>
</html>