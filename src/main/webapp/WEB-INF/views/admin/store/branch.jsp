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
					<input name="b_name" style="text-align: center;">
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
			<td class="admin_car_content_title admin_store_name"
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
				<td class="admin_car_table_td">[${b.b_sortation}]${b.b_name }</td>
				<td class="admin_car_table_td">${b.b_area }</td>
				<td class="admin_car_table_td">${b.b_manager }</td>
				<td class="admin_car_table_td">${b.b_managernumber }</td>
				<td class="admin_car_table_td">
					<button class="updatebranchbutton" onclick="location.href='admin.store.update.go?b_id=${b.b_id}'">수정</button>
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
</body>
</html>