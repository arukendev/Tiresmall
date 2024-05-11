<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차종 관리 페이지</title>
<link rel="stylesheet" href="resources/css/admin/car/admin_car.css">
<link rel="stylesheet" href="resources/css/admin/board/notice_board.css">
<script src="resources/js/admin/car/admin_car.js"></script>
<script src="resources/js/admin/car/validcheck.js"></script>
<script src="resources/js/admin/car/carregvaluecheck.js"></script>
</head>
<body>
	<input id="whatMenu" value="car" type="hidden">
	<input id="sm" value="1" type="hidden">
	<div class="container sub">
		<div class="car-findselect">
			<form action="car.search.do" id="car_searchBox">
				<div class="car_searchTitle">
					<div>
						메이커 <select id="carBrand" name="c_brand">
							<option value="0">전체</option>
							<c:forEach var="cb" items="${carBrands}">
								<option value="${cb.cb_name}">${cb.cb_name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<input name="c_namet" value="" type="hidden">
				<div class="car_searchTitle">
					<div class="car_searchID">
						차종 <input 
							name="c_name" style="text-align: center;" placeholder=""
							onkeypress="JavaScript:press(this.form)">
					</div>
				</div>
				<button class="carsearchButton">검색</button>
				<input name="carbrandInput" value="" type="hidden">
			</form>

			<div class="carRegButton1" style="float: right;">
				<button class="carRegButton"
					onclick="location.href='admin.car.reg.go'">신규등록</button>
			</div>
		</div>
	</div>

	<table id="admin_car_content">
		<tr>
			<td class="admin_car_content_title admin_car_no"
				style="border-right: 1px solid white;">No.</td>
			<td class="admin_car_content_title admin_car_brand"
				style="border-right: 1px solid white;">메이커</td>
			<td class="admin_car_content_title admin_car_year"
				style="border-right: 1px solid white;">연식</td>
			<td class="admin_car_content_title admin_car_name"
				style="border-right: 1px solid white;">차종</td>
			<td class="admin_car_content_title admin_car_tiresize"
				style="border-right: 1px solid white;">타이어사이즈</td>
			<td class="admin_car_content_title admin_car_management"
				style="border-right: 1px solid white;">관리</td>
		</tr>
		<c:if test="${empty cars}">
			<tr>
				<td colspan="6" style="text-align: center;">데이터가 존재하지않습니다.</td>
			</tr>
		</c:if>
		<c:forEach items="${cars }" var="c" varStatus="status">
			<tr id="admin_cars_content">
				<td class="admin_car_table_td">${status.count + (curPage-1)*count}</td>
				<td class="admin_car_table_td">${c.c_brand }</td>
				<td class="admin_car_table_td">${c.c_year1 }&nbsp;~&nbsp;${c.c_year2 }</td>
				<td class="admin_car_table_td">${c.c_name }</td>
				<td class="admin_car_table_td">
			 		<c:forEach items="${tires }" var="ts" begin="${status.count -1}" end="${status.count-1}">
						<c:forEach items="${ts }" var="tire">
							<c:if test="${tire != null }">
								<c:out value="${tire }" /><br>
							</c:if>
						</c:forEach>
					</c:forEach>
				</td>
				<td class="admin_car_table_td">
					<button class="updatecarbutton" onclick="updateCar('${c.c_id}')">수정</button>
					<button type="button" class="deletecarbutton" onclick="deletecar('${c.c_id}')">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>

	<div id="paging-box">
		<c:if test="${curPage != 1 }">
			<a style="color: black;" href="car.page.change?p=${curPage - 1 }">이전</a>
		</c:if>
		<c:forEach var="page" begin="1" end="${pageCount }">
			<c:choose>
				<c:when
					test="${page eq param.p or (curPage == 1 and curPage == page)}">
					<a style="color: white; background-color: #333;"
						href="car.page.change?p=${page }">${page } </a>
				</c:when>
				<c:otherwise>
					<a style="color: black;" href="car.page.change?p=${page }">${page }
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${curPage != pageCount }">
			<a style="color: black;" href="car.page.change?p=${curPage + 1 }">다음</a>
		</c:if>
	</div>
</body>
</html>