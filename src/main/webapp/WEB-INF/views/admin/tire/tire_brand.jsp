<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"href="resources/css/admin/tire/admin_tireBrand.css">
<link rel="stylesheet"href="resources/css/admin/tire/admin_tire.css">
<script src="resources/js/admin/tire/admin_tire.js"></script>
</head>
<body>
	<input id="whatMenu" value="tire" type="hidden">
	<input id="sm" value="2" type="hidden">
	<input type="hidden" value="${r }" id="deleteSu">
	<div class="container sub">
		<div id="admin_tire_brand">
			<div id="admin_brand_menu_title"><h1>타이어브랜드관리페이지</h1></div>
			<div id="admin_tireBrand_reg">신규등록</div>
		</div>

		<form action="admin.tire.brand.reg">
			<div class='admin-tire-reg-size-modal'>
				<div class='admin-tire-reg-size-modal-container'>
					<div class='admin-tire-reg-size-modal-title'>브랜드 등록</div>
					<div class='admin-tire-reg-size-modal-input'>
						<div class='admin-tire-reg-size-modal-input'>
							<div class="admin-tire-brand-size-modal-title">
								<div class="tire-brand-reg-title">브랜드명</div>
								<div><input class="tire-brand-input" name="tb_name" required="required"></div>
							</div>
							<div class="admin-tire-brand-size-modal-title">
								<div class="tire-brand-reg-title">브랜드 이미지</div>
								<div>
									<input type="file" name="file" required="required">
								</div>
							</div>
							<div class="admin-tire-brand-size-modal-title">
								<div class="tire-brand-reg-title">출력순서</div>
								<div><input class="tire-brand-input" name="tb_order" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></div>
							</div>
							<div class="admin-tire-brand-size-modal-title">
								<div class="tire-brand-reg-title">출력여부</div>
								<div class="admin-tire-reg-radio-di">
									<label class="admin-tire-teg-label"> 
										<input type="radio"	name="tb_ea" value="1">
										출력
									</label> 
									<label class="admin-tire-teg-label"> 
										<input type="radio" name="tb_ea"  value="0" checked="checked">
										숨김
									</label>
								</div>
							</div>
						</div>
						<div class='admin-tire-reg-size-modal-button'>
							<button class='admin_tire_brand_reg_in admin-tire-reg-size-modal-button1'>입력</button>
							<div class='admin_tire_brand_reg_cen admin-tire-reg-size-modal-button2'>취소</div>
						</div>
					</div>
				</div>
			</div> 
		</form>
		
		
		<table id="admin_tire_brand_content">
			<tr>
				<td class="admin_tire_content_title admin_tire_brand_no" style="border-right: 2px solid white">No.</td>
				<td class="admin_tire_content_title admin_tire_brand_img"style="border-right: 2px solid white">브랜드이미지</td>
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
				<tr class="admin_tire_brands_content">
					<td class="admin_tire_table_td">${status.count}</td>
					<td class="admin_tire_table_td">
						<img alt="" src="resources/web/main/tire/brand/${t.tb_img}" class="admin-tire-brand-img">
						<input type="hidden" value="${t.tb_id }">
						<input type="file" class="admin-tire-brand-img-update" name="file">
					</td>
					<td class="admin_tire_table_td">
						<input value="${t.tb_name }" name = "tb_name" class = "admin-tire-brand-name">
						<input type="hidden" value="${t.tb_id }">
					</td>
					<td class="admin_tire_table_td">
						<input class="admin-tire-brand-order" value="${t.tb_order }" name="tb_order" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">번
					</td>
					<td class="admin_tire_table_td">
						<c:choose>
							<c:when test="${t.tb_ea ==1 }">
								<button class="admin_printBTN brandPrintBtn" value="${t.tb_name }">출력</button>
							</c:when>
							<c:otherwise>
								<button class="admin_notPrintBTN brandPrintBtn" value="${t.tb_name }">숨김</button>
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