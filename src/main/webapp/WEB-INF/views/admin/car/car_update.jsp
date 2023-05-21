<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/admin/car/admin_car_reg.css">
<script src="resources/js/admin/car/admin_car.js"></script>
</head>
<body>
	<input id="whatMenu" value="car" type="hidden">
	<input id="sm" value="1" type="hidden">
	<input id="" value="${car.c_id }" type="hidden">
	<div class="container sub">
		<div id="tire_container">
			<div id="admin-tire-reg">
				<h1 id="admin-tire-reg-whatPage">자동차 등록</h1>
			</div>
			<form action="admin.car.reg.do" id="admin_tire_table_container"
				method="post" enctype="multipart/form-data">
				<table id="admin_tire_table" border="1">
					<tr>
						<td class="admin_tire_table_title">브랜드</td>
						<td>
							<div id="car_brand_select">
								<select id="carBrand" name="c_brand">
									<c:forEach var="cb" items="${carbrands}">
										<option value="${cb.cb_name}">${cb.cb_name}</option>
									</c:forEach>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">차종명</td>
						<td>
						<input type="text" name="c_name" id="admin-tire-reg-name-input" value="${car.c_name }"/></td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">연식</td>
						<td>
							<input name="c_year1" class="admin_car_reg_year"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength='4'value="${car.c_year1}"> &nbsp;~&nbsp; 
							<input name="c_year2"class="admin_car_reg_year"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength='4'value="${car.c_year2 }">
						</td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">타이어사이즈</td>
						<td>
							<div id="admin_tire_size_button">사이즈추가</div>
							<table id="admin-tire-size-reg">
								<tr>
									<td class="admin-tire-size-reg-title admin-car-front-size"
										style="border-right: 2px solid white;">앞타이어</td>
									<td class="admin-tire-size-reg-title admin-car-rear_size"
										style="border-right: 2px solid white;">뒤타이어</td>
									<td class="admin-tire-size-reg-title admin-car-delete">삭제</td>
								</tr>
								<tbody id="admin_tire_size_add">

									<!--사이에 추가할때마다 생기고 지워지는 공간  밑은 추가되는것들 -->
									<c:forEach items="${frontTire }" var="ft" end="${size }">
										<tr style='height: 50px;' class="admin_tire_validation_test">
											<td class='admin-tire-size-reg-content'>
												<div class='admin-tire-reg-size-modal1'>
													<div class='admin-tire-reg-size-modal-container1'>
														<div class='admin-tire-reg-size-modal-title'>사이즈 입력</div>
														<div class='admin-tire-reg-size-modal-input'>
															<div class='admin-tire-reg-size-modal-input'>
																<input class='tire_input_width1' name='tf_width' maxlength='3'> 
																<span class='size-span'>/</span> 
																<input class='tire_input_ratio1' name='tf_ratio' maxlength='2'>
																<span class='size-span'>R</span> 
																<input class='tire_input_inch1' name='tf_inch' maxlength='2'>
															</div>
															<div class='admin-tire-reg-size-modal-button'>
																<div class='admin_tire_reg_in1 admin-tire-reg-size-modal-button1'>입력</div>
																<div class='admin_tire_reg_cen1 admin-tire-reg-size-modal-button2'>취소</div>
															</div>
														</div>
													</div>
												</div>
	
												<div class='admin_tire_size_reg_modal_open1'>
													<span class='tire_width1 size-span'>---</span> 
													<span class='size-span'>/</span> 
													<span class='tire_ratio1 size-span'>--</span> 
													<span class='size-span'>R</span> 
													<span class='tire_inch1 size-span'>--</span>
												</div>
											</td>

											<td class='admin-tire-size-reg-content'>
												<div class='admin-tire-reg-size-modal2'>
													<div class='admin-tire-reg-size-modal-container2'>
														<div class='admin-tire-reg-size-modal-title'>사이즈 입력</div>
														<div class='admin-tire-reg-size-modal-input'>
															<div class='admin-tire-reg-size-modal-input'>
																<input class='tire_input_width2' name='tb_width' maxlength='3'>
																<span class='size-span'>/</span> 
																<input class='tire_input_ratio2' name='tb_ratio' maxlength='2'>
																<span class='size-span'>R</span> 
																<input class='tire_input_inch2' name='tb_inch' maxlength='2'>
															</div>
															<div class='admin-tire-reg-size-modal-button'>
																<div class='admin_tire_reg_in2 admin-tire-reg-size-modal-button1'>입력</div>
																<div class='admin_tire_reg_cen2 admin-tire-reg-size-modal-button2'>취소</div>
															</div>
														</div>
													</div>
												</div>
	
												<div class='admin_tire_size_reg_modal_open2'>
													<span class='tire_width2 size-span'>---</span> 
													<span class='size-span'>/</span> 
													<span class='tire_ratio2 size-span'>--</span> 
													<span class='size-span'>R</span> 
													<span class='tire_inch2 size-span'>--</span> 
												</div>
											</td>
											<td class='admin-tire-size-reg-content'><div
													class='admin-tire-size-reg-delete'>삭제</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">이미지</td>
						<td>
							<div class="admin-tire-img-container">
								<div class="admin-tire-img-contain">
									<div class="admin-tire-img-title"
										style="border-right: 2px solid white;">현재 이미지</div>
									<div class="admin-tire-img-content">
										<img id="imagePreview">
									</div>
								</div>
								<div class="admin-tire-img-contain">
									<div class="admin-tire-img-title">이미지 등록</div>
									<div class="admin-tire-img-content">
										<div class="filebox1 bs3-primary">
											<input class="upload-name1" placeholder="첨부파일"
												disabled="disabled"> <label for="file1">업로드</label>
											<input type="file" id="file1" name="file">
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="admin_tire_reg_button">
								<button class="admin-tire-reg-button">등록</button>
								<div class="admin_tire_reg_deleteBTN" onclick="history.back()">취소</div>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>