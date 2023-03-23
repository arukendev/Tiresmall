<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="resources/css/admin/tire/admin_tireBrand.css">
	<link rel="stylesheet"
	href="resources/css/admin/tire/admin_tire.css">
<script src="resources/js/admin/tire/admin_tire.js"></script>
</head>
<body>
	<input id="whatMenu" value="tire" type="hidden">
	<input id="sm" value="2" type="hidden">
	<input type="hidden" value="${r }" id="deleteSu">
	<div class="container sub">
		<div id="admin_tire_brand">
			<div id="admin_brand_menu_title"><h1>타이어브랜드관리페이지</h1></div>
			<div id="admin_tireBrand_reg" onclick="">신규등록</div>
		</div>

		<table id="admin_tire_brand_content">
			<tr>
				<td class="admin_tire_content_title admin_tire_brand_no" style="border-right: 2px solid white">No.</td>
				<td class="admin_tire_content_title admin_tire_brand_name"style="border-right: 2px solid white">브랜드명</td>
				<td class="admin_tire_content_title admin_tire_print_order"style="border-right: 2px solid white">출력 순서</td>
				<td class="admin_tire_content_title admin_tire_brand_Print"style="border-right: 2px solid white">출력 여부</td>
				<td class="admin_tire_content_title admin_tire_brand_num"style="border-right: 2px solid white">상품수</td>
				<td class="admin_tire_content_title admin_tire_brand_management">관리</td>
			</tr>
			<c:if test="${empty brands}">
				<tr>
					<td colspan="5">타이어 브랜드가 없습니다</td>
				</tr>

			</c:if>

			<c:forEach items="${brands }" var="t" varStatus="status">
				<tr id="admin_tire_brands_content">
					<td class="admin_tire_table_td">${status.count}</td>
					<td class="admin_tire_table_td"><input id="admin-tire-brand-name" value=" ${t.tb_name }" name="tb_name"></td>
					<td class="admin_tire_table_td"><input id="admin-tire-brand-order" value=" ${t.tb_order }" name="tb_order ">번</td>
					<td class="admin_tire_table_td">
						<c:choose>
							<c:when test="${t.tb_ea ==1 }">
								<button class="admin_printBTN">출력</button>
							</c:when>
							<c:otherwise>
								<button class="admin_notPrintBTN">숨김</button>
							</c:otherwise>
						</c:choose>
					</td>
					<td class="admin_tire_table_td">${t.tb_num }개</td>
					<td id="tire_Btn" class="admin_tire_table_td">
						<button type="button" class="admin_deleteBTN" onclick="tireBrandDelete('${t.tb_name }')">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
</body>
</html>