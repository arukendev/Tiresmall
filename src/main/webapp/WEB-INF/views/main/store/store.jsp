<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main/store/main_store.css">
 <script type="text/javascript" 
 src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fud1jij2os"></script>
 
 
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="resources/js/main/store/main_store.js"></script>
</head>
<body>
	<div id="store_wrap">
		<div id="store_wrap_subtitle">
			<h1>당일 장착 매장안내</h1>
			<h2>대전 타이어쇼핑몰에서 구매 후 당일 장착서비스가 가능한 매장 안내 입니다.</h2>
		</div>
		<div id="store_wrap_info">
			<div id="store_info_name">${store.b_name } </div>
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
				
		<div id="store_wrap_banner">
			<input id="store_banner_img" value="${store.b_file }" type="hidden"/>
			<img src="">
		</div>
		
		<h1 id="store_map_title">오시는 길</h1>
		
		<input id="location" value="${store.b_mapdata }" type="hidden"/>
		<input id="location_lng" type="hidden"/>
		<input id="location_lat" type="hidden"/>
		<div id="store_wrap_map">
		<!--  
			직영점 36.3417632		127.3663178
			죽동점 36.369228		127.338054
			시청점 36.1900937		127.0954606
			연무점 36.1188693		127.0984388
			반월점 36.208517		127.0937896
		 -->
		</div>
	</div>
	

</body>
</html>