<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<html>
<head>
<meta charset="UTF-8">
<title>장착점 관리</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css" />
<link rel="stylesheet" href="resources/css/admin/board/notice_board.css">
<link rel="stylesheet" href="resources/css/admin/store/admin_store.css">
<script src="resources/js/admin/store/admin_store.js"></script>
</head>
<body>
	<input id="whatMenu" value="store" type="hidden">
	<div class="branch-findselect">
		<form action="admin.store.search.do">
			<div class="branch-findarea">
				<div class="branch_searcharea">
					주소 
					<select name="b_area1" id="listsido1"></select>
					<select name="b_area2"id="listgugun1"></select> 
					<input type="hidden" name="b_area" id="hidden_b_area">
				</div>
				<div class="branch_searcharea">
					장착점명 
					<input name="b_branchname" style="text-align: center;">
				</div>
				<div>
					<button class="branchsearchButton">검색</button>
				</div>
			</div>
		</form>

		<div class="branchRegButton1">
			<button class="branchRegButton" onclick="location.href='admin.store.reg.go'">신규등록</button>
		</div>
	</div>

	<table id="admin_car_content">
		<tr>
			<td class="admin_car_content_title admin_store_no"
				style="border-right: 1px solid white;">No.</td>
			<td class="admin_car_content_title admin_store_branchname"
				style="border-right: 1px solid white;">장착점명</td>
			<td class="admin_car_content_title admin_store_area"
				style="border-right: 1px solid white;">지역</td>
			<td class="admin_car_content_title admin_store_manager"
				style="border-right: 1px solid white;">담당자</td>
			<td class="admin_car_content_title admin_store_phonenumber"
				style="border-right: 1px solid white;">연락처</td>
			<td class="admin_car_content_title admin_store_manage"
				style="border-right: 1px solid white;">관리</td>
		</tr>

		<c:if test="${empty branchs}">
			<tr>
				<td colspan="5" style="text-align: center;">데이터가 존재하지않습니다.</td>
			</tr>
		</c:if>

		<c:forEach items="${branchs }" var="b" varStatus="status">
			<tr id="admin_cars_content">
				<td class="admin_car_table_td">${status.count + (curPage-1)*count}</td>
				<td class="admin_car_table_td">[${b.b_sortation}]${b.b_branchname }</td>
				<td class="admin_car_table_td">${b.b_area }</td>
				<td class="admin_car_table_td">${b.b_manager }</td>
				<td class="admin_car_table_td">${b.b_branchnumber }</td>
				<td class="admin_car_table_td">
					<button class="updatebranchbutton"
						onclick="updatebranch('${b.b_id}', '${b.b_sortation }',
					'${b.b_area }','${b.b_addr } ',
					'${b.b_name }','${b.b_time }',
					'${b.b_service }','${b.b_mapdata }','${b.b_manager }',
					'${b.b_managernumber}','${b.b_branchname}','${b.b_branchnumber}',
					'${b.b_cr}','${b.b_email}','${b.b_file }')">수정</button>
					<button type="button" class="deletebranchbutton"
						id="updatebranch('${b.b_id}')" onclick="deletebranch('${b.b_id}')">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>

	<div id="paging-box">
		<c:if test="${curPage != 1 }">
			<a style="color: black;" href="branch.page.change?p=${curPage - 1 }">이전</a>
		</c:if>

		<c:forEach var="page" begin="1" end="${pageCount }">
			<c:choose>
				<c:when
					test="${page eq param.p or (curPage == 1 and curPage == page)}">
					<a style="color: white; background-color: #333;"
						href="notice.page.change?p=${page }">${page } </a>
				</c:when>
				<c:otherwise>
					<a style="color: black;" href="branch.page.change?p=${page }">${page }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${curPage != pageCount }">
			<a style="color: black;" href="branch.page.change?p=${curPage + 1 }">다음</a>
		</c:if>
	</div>
	
	
	
<!-- 모달 -->
	<div id="admin_store_modal">
		<form action="admin.store.reg.go" method="post">
			<input type="hidden" name="b_id" id="store_b_id" value="">
			<div id="admin_store_modal_container">
				<div id="admin_store_modalInfo">정착점 등록</div>
				<div id="admin_store_modal_page">
					<!-- 구분 설정/ 아이디 / 회원명 / 전화번호 / 차랑명 / 제조사 / 차량번호 / 차량년식 -->
					<div id="admin-store-modal-in-info">
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div class="admin-store-modal-info-title"><!--가로  -->
								구분
							</div>
							<div class="admin-store-reg-info-content">
								<label class="admin-store-reg-label"> 
									<input type="radio"	name="b_sortation" class="admin-store-reg-input">
									<div class="rad-design"></div>
									<div class="rad-text">직영점 (당일 장착점)</div>
								</label> 
								<label class="admin-store-reg-label"> 
									<input type="radio" name="b_sortation" class="admin-store-reg-input" checked="checked">
									<div class="rad-design"></div>
									<div class="rad-text">제휴 장착점</div>
								</label>
							</div>
						</div>
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div class="admin-store-modal-info-title"><!--가로  -->
								지역		
							</div>
							<div id="b_area" class="admin-store-reg-info-content"><!--가로  -->
								<select name="b_area1" id="storeRegDo"></select>
								<select name="b_area2"id="storeRegSi"></select> 
								<input type="hidden" id="hiddenStoreReg_b_area" name="b_area">
							</div>
						</div>
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div class="admin-store-modal-info-title"><!--가로  -->
								장착점 명		
							</div>
							<div id="auth_carBrand" class="admin-store-reg-info-content"><!--가로  -->
								<input class="admin-store-reg-info-input" name="b_branchname"autocomplete="off">
							</div>
						</div>
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div class="admin-store-modal-info-title"><!--가로  -->
								상세주소
							</div>
							<div id="auth_carYear"class="admin-store-reg-info-content"><!--가로  -->
								<input class="admin-store-reg-info-input" name="b_addr"autocomplete="off">	
							</div>
						</div>
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div class="admin-store-modal-info-title"><!--가로  -->
								영업시간
							</div>
							<div id="auth_carYear"class="admin-store-reg-info-content"><!--가로  -->
								<input class="admin-store-reg-info-input" name="b_time"autocomplete="off">
							</div>
						</div>		
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div class="admin-store-modal-info-title"><!--가로  -->
								취급 서비스
							</div>
							<div id="auth_carYear"class="admin-store-reg-info-content"><!--가로  -->
								<input class="admin-store-reg-info-input" name="b_service"autocomplete="off">
							</div>
						</div>		
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div class="admin-store-modal-info-title"><!--가로  -->
								지도데이터
							</div>
							<div id="auth_carYear"class="admin-store-reg-info-content"><!--가로  -->
								<input class="admin-store-reg-info-input" name="b_mapdata"autocomplete="off"placeholder="36.1900937, 127.0954606식으로 입력해주세요">		
							</div>
						</div>
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div class="admin-store-modal-info-title"><!--가로  -->
								사진
							</div>
							<div id="auth_carYear"class="admin-store-reg-info-content"><!--가로  -->
								사진 밑 업로드 들어갈곳
							</div>
						</div>
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div class="admin-store-modal-info-title"><!--가로  -->
								담당자명
							</div>
							<div id="auth_carYear"class="auth-modal-info-content"><!--가로  -->
								<input class="admin-store-reg-info-name-input" name="b_manager"autocomplete="off">
							</div>
							<div class="admin-store-modal-info-title"><!--가로  -->
								전화번호
							</div>
							<div id="auth_carYear"class="auth-modal-info-content"><!--가로  -->
								<input class="admin-store-reg-info-input2" name="b_managernumber"autocomplete="off">
							</div>
						</div>
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div  class="admin-store-modal-info-title"><!--가로  -->
								업체명
							</div>
							<div id="auth_carYear"class="admin-store-reg-info-content"><!--가로  -->
								<input class="admin-store-reg-info-input2" name="b_managernumber"autocomplete="off">	
							</div>
							<div class="admin-store-modal-info-title"><!--가로  -->
								사업자 번호
							</div>
							<div id="auth_carYear"class="admin-store-reg-info-content"><!--가로  -->
								<input class="admin-store-reg-info-input2" name="b_managernumber"autocomplete="off">	
							</div>
						</div>
						<div class="admin-store-modal-lenght"><!-- 세로 -->
							<div class="admin-store-modal-info-title admin-store-modal-info-final-line"><!--가로  -->
								 대표자명
							</div>
							<div id="auth_carYear"class="admin-store-reg-info-content"><!--가로  -->
								<input class="admin-store-reg-info-name-input" name="b_manager"autocomplete="off">	
							</div>
							<div class="admin-store-modal-info-title admin-store-modal-info-final-line"><!--가로  -->
								 사업자이메일
							</div>
							<div id="auth_carYear"class="admin-store-reg-info-content"><!--가로  -->
								<input class="admin-store-reg-info-input2" name="b_managernumber"autocomplete="off">	
							</div>
						</div>							
					</div>	
				</div>
				<div id="auth_modal_btn">
					<button class="admin_printBTN admin_store_reg">저장</button>
					<div class="admin_cenBTN">취소</div>
				</div>
			</div>
		</form>
	</div>




</body>
</html>