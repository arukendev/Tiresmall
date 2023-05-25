<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차종 브랜드 관리 페이지</title>
<link rel="stylesheet"
	href="resources/css/admin/car/admin_car_brand.css">
<script src="resources/js/admin/car/admin_car.js"></script>
</head>
	<body>
		
		<input id="whatMenu" value="car" type="hidden">
		<input id="sm" value="2" type="hidden">
		<div class="container sub">
			<div class="car-findselect">
				<div class="brandRegButton1" style="float: right;">
					<button class="brandRegButton">신규등록</button>
				</div>
			</div>
			<!-- 모달창  -->
			<form action="reg.brand.do">
				<div id='admin_car_brand_reg_modal'>
					<div class='admin_car_brand_reg_page'>
						<div class='admin_car_brand_reg_title'>차 메이커 등록</div>
						<div class='admin-car-brand-reg-input'> 
							<div class='admin-car-brand-reg-input'>
								<div class="admin_car_brand_reg_BrandName">
									<div class="admin_car_brand_reg_td_title">브랜드명</div>
									<div><input class="admin_car_brand_reg_brand_name" name="cb_name" required="required"></div>
								</div>
							</div>
							<div class='admin_carBrand_reg_button'>
								<button class='admin-carBrand-reg-button'>입력</button>
								<div class='admin_carBrand_deleteBTN'>취소</div>
							</div>
						</div>
					</div>
				</div> 
			</form>
			
			<table id="admin_car_content">
				<tr>
					<td class="admin_car_content_title admin_brand_num"
						style="border-right: 1px solid white;">No.
					</td>
					<td class="admin_car_content_title admin_brand_no"
						style="border-right: 1px solid white;">메이커</td>
					<td class="admin_car_content_title admin_brand_each"
						style="border-right: 1px solid white;">등록&nbsp;차종수</td>
					<td class="admin_car_content_title admin_brand_manage"
						style="border-right: 1px solid white;">관리</td>
				</tr>
				<c:if test="${empty carbrands}">
					<tr>
						<td colspan="4" style="text-align: center;">데이터가 존재하지않습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${carbrands}" var="cb" varStatus="status">
					<tr id="admin_cars_content">					
						<td class="admin_car_table_td">${status.count }</td>
						<td class="admin_car_table_td">
							<input name="cb_name" value="${cb.cb_name}" class="admin_car_brand_name">
							<input type="hidden" value="${cb.cb_id}" class="car_brand_name">
						</td>
						<td class="admin_car_table_td">${cb.cb_num }</td>
						<td class="admin_car_table_td">
							<button type="button" class="deletecarbrandbutton"
								onclick="deleteCarBrand('${cb.cb_id}')">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
</html>