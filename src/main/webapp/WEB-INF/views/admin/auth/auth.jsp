<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/auth/admin_auth.css">
<link rel="stylesheet" href="resources/css/admin/tire/admin_tire.css">
<link rel="stylesheet" href="resources/css/admin/board/notice_board.css">
<link rel="stylesheet" href="resources/css/admin/board/notice_modal.css">
<script src="resources/js/admin/auth/admin_auth.js"></script>
</head>
<body>
	<input id="whatMenu" value="auth" type="hidden">
	<div class="container">
		<div id="auth_container">

			<!-- 모달 창  -->
			<div id="auth_modal">
				<form action="admin.update.go" method="post">
				<input type="hidden" name="i_no" id="auth_i_no" value="">
					<div id="auth_modal_container">
						<div id="auth_modalInfo">회원정보</div>
						<div id="auth_modal_page">
							<div id="auth_basicInfo">
								<div class="auth_modal_title"
									style="border-bottom: 1px solid #eee">기본정보</div>
								<div id="auth_basic_content">
									<div class="auth_modal_content">
										<div id="auth__modal_searchTitle">
											구분 <select id="auth_modal_sortation" name="i_grade">
												<option value="1" class="auth_sortation_option1">일반</option>
												<option value="2" class="auth_sortation_option2">업체</option>
												<option value="3" class="auth_sortation_option3">관리자</option>
											</select>
										</div>
										<div class="auth_modal_input">
											아이디 <input type="text" id="auth_id" name="u_id" value="" />
										</div>
										<div class="auth_modal_input">
											회원명 <input type="text" id="auth_name" name="i_name" />
										</div>
										<div class="auth_modal_input">
											전화번호 <input type="text" id="auth_phone" name="i_phone" />
										</div>
									</div>
									<div class="auth_modal_content">
										<div class="auth_modal_input">
											차량명 <input type="text" id="auth_carName" name="mc_model" />
										</div>
										<div class="auth_modal_input">
											제조사 <input type="text" id="auth_carBrand" name="mc_brand" />
										</div>
										<div class="auth_modal_input">
											차량번호 <input type="text" id="auth_carNUm" name="mc_number" />
										</div>
										<div class="auth_modal_input">
											차량년식 <input type="text" id="auth_carYear" name="mc_year" />
										</div>
									</div>
								</div>
							</div>
							<div id="auth_companyInfo">
								<div class="auth_modal_title">업체정보</div>
								<div id="auth_basic_content">
									<div class="auth_modal_content">
										<div class="auth_modal_input">
											업체명<input type="text" name="" />
										</div>
										<div class="auth_modal_input">
											연락처<input type="text" name="" />
										</div>
										<div class="auth_modal_input">
											대표자명<input type="text" name="" />
										</div>
										<div class="auth_modal_input">
											사업자번호<input type="text" name="" />
										</div>
									</div>
									<div class="auth_modal_content">
										<div class="auth_modal_input auth_modal_addr">
											주소<input type="text" name="" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="auth_modal_btn">
							<button class="admin_notPrintBTN">수정</button>
							<div class="admin_deleteBTN ">취소</div>
						</div>
					</div>
				</form>
			</div>


			<!-- 검색  -->

			<form action="admin.searchAuth.do" class="auth_form" method="post">
				<div id="auth_searchBox">
					<div class="auth_searchTitle">
						<div>
							구분 <select id="auth_sortation" name="i_grade">
								<option value="0">전체</option>
								<option value="1">일반</option>
								<option value="2">업체</option>
								<option value="3">관리자</option>
							</select>
						</div>
					</div>
					<div class="auth_searchTitle">
						<div class="auth_searchID">
							<label for="auth_searchid">아이디</label> <input id="auth_searchid"
								name="u_id">
						</div>
					</div>
					<div class="auth_searchTitle">
						<div class="auth_search_name">
							<label for="auth_searchname">이름</label> <input
								id="auth_searchname" name="i_name">
						</div>
					</div>
					<!-- <div class="auth_searchTitle">
						<div class="auth_search_carnum">
							<label for="auth_searchcarnumber"> 자동차번호</label>
							<input id="auth_searchcarnumber" name="">
						</div>
					</div> -->
					<div id="searchBtn">
						<button>검색</button>
					</div>
				</div>
			</form>

 


			<table id="auth_content">
				<tr>
					<td class="auth_content_title auth_no" style="border-left-color:#343a40; ">No.</td>
					<td class="auth_content_title auth_sortation">구분</td>
					<td class="auth_content_title auth_id">ID</td>
					<td class="auth_content_title auth_name">이 름</td>
					<td class="auth_content_title auth_phoneNum">연락처</td>
					<td class="auth_content_title auth_carNum">자동차 번호</td>
					<td class="auth_content_title auth_date">등록일</td>
					<td class="auth_content_title auth_management"style="border-right-color:#343a40; ">관리</td>
				</tr>
				<c:if test="${empty manyAuth}">
					<tr>
						<td colspan="8">해당 회원이 없습니다</td>
					</tr>

				</c:if>
				
				<c:forEach items="${manyAuth }" var="a" varStatus="status">
					<tr id="manyAuth_content">
						<td class="auth_table_td">${status.count + (curPage-1)*count}</td>
						
						<td class="auth_table_td">
						<c:choose>
						<c:when test="${a.i_grade == 0 }">
							전체
						</c:when>
						<c:when test="${a.i_grade == 1 }">
							일반
						</c:when>
						<c:when test="${a.i_grade == 2 }">
							업체
						</c:when>
						<c:when test="${a.i_grade == 3 }">
							관리자
						</c:when>
						</c:choose>
						</td>
						<td class="auth_table_td">${a.u_id }</td>
						<td class="auth_table_td">${a.i_name }</td>
						<td class="auth_table_td">${a.i_phoneNum }</td>
						<td class="auth_table_td">${a.mc_number }<c:if
								test="${empty a.mc_number}">차 번호 없음</c:if></td>
						<td class="auth_table_td"><fmt:formatDate
								value="${a.i_newDate }" pattern="yyyy-MM-dd" /></td>
						<td id="auth_Btn" class="auth_table_td">
							<button class="admin_notPrintBTN auth_update" 
								onclick="updateauth('${a.u_no }','${a.u_id }','${a.i_grade }','${a.i_name }','${a.i_phoneNum }'
												,'${a.mc_number }','${a.mc_carName }','${a.mc_brand }','${a.mc_year }')">
								수정</button> 
							<button type="button" onclick="deleteAuth('${a.u_id }')" class="admin_deleteBTN">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>

		<div id="paging-box">
				<c:if test="${curPage != 1 }">
					<a style="color: black;" href="auth.page.change?p=${curPage - 1 }">이전</a>
				</c:if>

				<c:forEach var="page" begin="1" end="${pageCount }">
					<c:choose>
						<c:when
							test="${page eq param.p or (curPage == 1 and curPage == page)}">
							<a style="color: white; background-color: #333;"
								href="auth.page.change?p=${page }" style="color: black">${page }
							</a>
						</c:when>
						<c:otherwise>
							<a style="color: black;" href="auth.page.change?p=${page }">${page }
							</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${curPage != pageCount }">
					<a style="color: black;" href="auth.page.change?p=${curPage + 1 }">다음</a>
				</c:if>
			</div>

		</div>
	</div>
</body>
</html>