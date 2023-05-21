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
	href="resources/css/admin/tire/admin_tire_reg.css">
<script src="resources/js/admin/tire/admin_tire.js"></script>
</head>
<body>
	<input id="whatMenu" value="tire" type="hidden">
	<input id="sm" value="1" type="hidden">

	<div class="container sub">
		<div id="tire_container">
			<div id="admin-tire-reg">
				<h1 id="admin-tire-reg-whatPage">타이어 상품 수정</h1>
			</div>
			<div id="admin_tire_table_container">
				<form action="admin.tire.update.do" method="post" enctype="multipart/form-data">
					<input type="hidden" value="${tireGroup.tg_id }" id="tireIdHidden" name="tg_id">
					<input type="hidden" value="${tireGroup.tg_brand }" id="tireBrandHidden">
					<input type="hidden" value="${tireGroup.tg_print }" id="tirePrintHidden">
					<input type="hidden" value="${tireGroup.tg_sedan }" id="tireSedanHidden">
					<input type="hidden" value="${tireGroup.tg_suv }" id="tireSUVHidden">
					<input type="hidden" value="${tireGroup.tg_detail}" id="tireDetailHidden">
					<table id="admin_tire_table" border="1">
						<tr>
							<td class="admin_tire_table_title">브랜드</td>
							<td>
								<div class="admin-tire-reg-radio-di">
									<label class="admin-tire-teg-label"> 
										<input type="radio"name="tg_brand" value="넥센타이어" class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">넥센타이어</div>
									</label> 
									<label class="admin-tire-teg-label"> 
										<input type="radio" name="tg_brand" value="금호타이어" class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">금호타이어</div>
									</label> 
									<label class="admin-tire-teg-label"> 
										<input type="radio" name="tg_brand" value="미쉐린타이어" class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">미쉐린타이어</div>
									</label> 
									<label class="admin-tire-teg-label"> 
										<input type="radio" name="tg_brand" value="콘티넨탈타이어"class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">콘티넨탈타이어</div>
									</label> 
									<label class="admin-tire-teg-label"> 
										<input type="radio" name="tg_brand" value="한국타이어" class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">한국타이어</div>
									</label> 
									<label class="admin-tire-teg-label"> 
										<input type="radio" name="tg_brand" value="요코하마타이어" class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">요코하마타이어</div>
									</label> 
									<label class="admin-tire-teg-label"> 
										<input type="radio" name="tg_brand" value="브리지스톤타이어" class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">브리지스톤타이어</div>
									</label> 
									<label class="admin-tire-teg-label"> 
									<input type="radio" name="tg_brand" value="굳이어타이어" class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">굳이어타이어</div>
									</label>
								</div>
								<div class="admin-tire-reg-radio-di">
									<label class="admin-tire-teg-label"> 
									<input type="radio"name="tg_brand" value="던롭타이어" class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">던롭타이어</div>
									</label> 
									<label class="admin-tire-teg-label"> 
									<input type="radio" name="tg_brand" value="피렐리타이어" class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">피렐리타이어</div>
									</label> 
									<label class="admin-tire-teg-label"> 
									<input type="radio" name="tg_brand" value="BF굿리치타이어" class="admin-tire-teg-input">
										<div class="rad-design"></div>
										<div class="rad-text">BF굿리치타이어</div>
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td class="admin_tire_table_title">모델명</td>
							<td><input type="text" name="tg_name" value="${tireGroup.tg_name }"
								id="admin-tire-reg-name-input" /></td>
						</tr>
						<tr>
							<td class="admin_tire_table_title">설명</td>
							<td>
								<div>
									<div>
										<input type="text" name="tg_text" id="admin-tire-reg-txt-input"  value="${tireGroup.tg_text }"/>
									</div>
									<!-- <div>타이어 특성 고르기</div> -->
								</div>
							</td>
						</tr>
						<tr>
							<td class="admin_tire_table_title">타이어사이즈</td>
							<td>
								<div id="admin_tire_update_size_button">사이즈추가</div>
								<table id="admin-tire-size-reg">
									<tr>
										<td class="admin-tire-size-reg-title admin-tire-size"
											style="border-right: 2px solid white;">사이즈</td>
										<td class="admin-tire-size-reg-title admin-tire-name"
											style="border-right: 2px solid white;">타이어 이름</td>
										<td class="admin-tire-size-reg-title admin-tire-marking"
											style="border-right: 2px solid white;">마킹</td>
										<td class="admin-tire-size-reg-title admin-tire-pricefac"
											style="border-right: 2px solid white;">공장도가</td>
										<td class="admin-tire-size-reg-title admin-tire-stock"
											style="border-right: 2px solid white;">재고</td>
										<td class="admin-tire-size-reg-title admin-tire-delete">삭제</td>
									</tr>
									<tbody id="admin_tire_size_add">
									
									<!--사이에 추가할때마다 생기고 지워지는 공간  밑은 추가되는것들 -->
									<c:forEach items="${tireSizes }" var="ts">
										<tr style='height: 50px;'>
											<td class='admin-tire-size-reg-content'>
												<input type="hidden" value="${ts.ti_id }" class="tiIdHidden">
												<div class='admin-tire-reg-size-modal'>
													<div class='admin-tire-reg-size-modal-container'>
														<div class='admin-tire-reg-size-modal-title'>사이즈 입력</div>
														<div class='admin-tire-reg-size-modal-input'>
															<div class='admin-tire-reg-size-modal-input'>
																<input class='tire_input_width' value="${ts.ti_width }"name='ti_width'>
																<span class='size-span'>/</span>
																<input class='tire_input_ratio' value="${ts.ti_ratio }" name='ti_ratio'>
																<span class='size-span'>R</span>
																<input class='tire_input_inch' value="${ts.ti_inch }" name='ti_inch'>
															</div>
															<div class='admin-tire-reg-size-modal-button'>
																<div class='admin_tire_reg_in admin-tire-reg-size-modal-button1'>입력</div>
																<div class='admin_tire_reg_cen admin-tire-reg-size-modal-button2'>취소</div>
															</div>
														</div>
													</div>
												</div> 
												<div class='admin_tire_size_reg_modal_open'>
														<span class='tire_width size-span'>${ts.ti_width }</span>
														<span class='size-span'>/</span>
														<span class='tire_ratio size-span'>${ts.ti_ratio }</span>
														<span class='size-span'>R</span>
														<span class='tire_inch size-span'>${ts.ti_inch }</span>
													</div>
												</td>
												<td class='admin-tire-size-reg-content'><span class='admin-tire-reg-name'>${tireGroup.tg_name }</span></td>
												<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-marking-input' name='ti_marking'  value="${ts.ti_marking }"></td>
												<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-pricefac-input' name='ti_pricefac' value="${ts.ti_pricefac }">&nbsp;원</td>
												<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-stock-input' name='ti_stock' value="${ts.ti_stock }">&nbsp;개</td>
												<td class='admin-tire-size-reg-content'>
													<div class='admin-tire-size-reg-delete'>삭제</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td class="admin_tire_table_title">메인 이미지</td>
							<td>
								<div class="admin-tire-img-container">
									<div class="admin-tire-img-contain">
										<div class="admin-tire-img-title"
											style="border-right: 2px solid white;">현재 이미지</div>
										<div class="admin-tire-img-content">
											<img src="resources/web/main/tire/${tireGroup.tg_img}" id="imagePreview">
										</div>
									</div>
									<div class="admin-tire-img-contain">
										<div class="admin-tire-img-title">이미지 등록</div>
										<div class="admin-tire-img-content">
											<div class="filebox1 bs3-primary">
												<input class="upload-name1" placeholder="첨부파일"
													disabled="disabled"> <label for="file1" class="imgUploadMain">업로드</label>
												<input type="file" id="file1" name="file">
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td class="admin_tire_table_title">상세 이미지</td>
							<td>
								<div class="admin-tire-img-container">
									<div class="admin-tire-img-contain">
										<div class="admin-tire-img-title"
											style="border-right: 2px solid white;">현재 이미지</div>
										<div class="admin-tire-img-content admin_tire_reg_img_preview" >
											<c:forEach items="${filesName}" var="f">
												<img src="resources/web/main/tire/${f}"class="files"><br />
											</c:forEach>
										</div>
									</div>
									<div class="admin-tire-img-contain">
										<div class="admin-tire-img-title">이미지 등록</div>
										<div class="admin-tire-img-content">
											<div class="filebox2  bs3-primary">
												<input class="upload-name2" placeholder="첨부파일" disabled="disabled"> 
												<label for="file2" class="imgUploadDetail">업로드</label>
												<input type="file" id="file2" name="files"  multiple="multiple">
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<div id="admin_tire_reg_button">
						<button class="admin-tire-reg-size-modal-button1 admin_tire_update_do" style="font-size:15pt;">저장</button>
						<div class="admin-tire-reg-size-modal-button2" onclick="history.back()" style="font-size:15pt; margin-left: 20px;">취소</div> 
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>