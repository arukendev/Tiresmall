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
				<h1 id="admin-tire-reg-whatPage">타이어 상품 등록</h1>
			</div>
			<form action="admin.tire.reg.do" id="admin_tire_table_container"
				method="post" enctype="multipart/form-data">
				<table id="admin_tire_table" border="1">
					<tr>
						<td class="admin_tire_table_title">브랜드</td>
						<td>
							<div class="admin-tire-reg-radio-di">
								<label class="admin-tire-teg-label"> 
									<input type="radio"name="tg_brand" value="넥센타이어" class="admin-tire-teg-input" id="tireBrandFocus">
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
						<td><input type="text" name="tg_name"
							id="admin-tire-reg-name-input" /></td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">설명</td>
						<td>
							<div>
								<div>
									<input type="text" name="tg_text" id="admin-tire-reg-txt-input" value=" "/>
								</div>
								<!-- <div>타이어 특성 고르기</div> -->
							</div>
						</td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">출력</td>
						<td>
							<div class="admin-tire-reg-radio-di">
								<label class="admin-tire-teg-label"> 
									<input type="radio"	name="tg_print" class="admin-tire-teg-input" value="1">
									<div class="rad-design"></div>
									<div class="rad-text">출력</div>
								</label> 
								<label class="admin-tire-teg-label"> 
									<input type="radio" name="tg_print" class="admin-tire-teg-input" value="0" checked="checked">
									<div class="rad-design"></div>
									<div class="rad-text">숨김</div>
								</label>
							</div>
						</td>
					</tr>
					<tr>
					
					</tr>
					<tr>
						<td class="admin_tire_table_title">추천</td>
						<td>
							<div class="admin-tire-reg-radio-di">
								<label class="admin-tire-teg-label"> 
									<input type="checkbox" name="tg_suv" class="admin-tire-teg-input" value="1">
									<!-- <input type="hidden" name="tg_suv" class="admin-tire-teg-input" id="suv_check_hidden" value="0"> -->
									<div class="rad-design"></div>
									<div class="rad-text">SUV추천</div>
								</label> 
								<label class="admin-tire-teg-label"> 
									<input type="checkbox" name="tg_sedan" class="admin-tire-teg-input"  value="1">
									<!-- <input type="hidden" name="tg_sedan" class="admin-tire-teg-input" id="sedan_check_hidden" value="0"> -->
									<div class="rad-design"></div>
									<div class="rad-text">승용차 추천</div>
								</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">타이어사이즈</td>
						<td>
							<div id="admin_tire_size_button">사이즈추가</div>
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
									<tr style='height: 50px;' class="admin_tire_validation_test">
										<td class='admin-tire-size-reg-content'>
											<div class='admin-tire-reg-size-modal'>
												<div class='admin-tire-reg-size-modal-container'>
													<div class='admin-tire-reg-size-modal-title'>사이즈 입력</div>
													<div class='admin-tire-reg-size-modal-input'>
														<div class='admin-tire-reg-size-modal-input'>
															<input type="text"    class='tire_input_width'name='ti_width'  maxlength='3'>
															<span class='size-span'>/</span>
															<input type="text"  class='tire_input_ratio' name='ti_ratio' maxlength='2'>
															<span class='size-span'>R</span>
															<input class='tire_input_inch' name='ti_inch' maxlength='2'>
														</div>
														<div class='admin-tire-reg-size-modal-button'>
															<div class='admin_tire_reg_in admin-tire-reg-size-modal-button1'>입력</div>
															<div class='admin_tire_reg_cen admin-tire-reg-size-modal-button2'>취소</div>
														</div>
													</div>
												</div>
											</div> 
					
										<div class='admin_tire_size_reg_modal_open'>
												<span class='tire_width size-span'>---</span>
												<span class='size-span'>/</span>
												<span class='tire_ratio size-span'>--</span>
												<span class='size-span'>R</span>
												<span class='tire_inch size-span'>--</span>
											</div>
										</td>
										<td class='admin-tire-size-reg-content'><span class='admin-tire-reg-name'></span></td>
										<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-marking-input' name='ti_marking'></td>
										<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-pricefac-input' name='ti_pricefac'>&nbsp;원</td>
										<td class='admin-tire-size-reg-content'><input class='admin-tire-reg-stock-input' name='ti_stock' value="0">&nbsp;개</td>
										<td class='admin-tire-size-reg-content'><div
												class='admin-tire-size-reg-delete'>삭제</div></td>
									</tr>
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
						<td class="admin_tire_table_title">상세 이미지</td>
						<td>
							<div class="admin-tire-img-container">
								<div class="admin-tire-img-contain">
									<div class="admin-tire-img-title"
										style="border-right: 2px solid white;">현재 이미지</div>
									<div class="admin-tire-img-content admin_tire_reg_img_preview">
									</div>
								</div>
								<div class="admin-tire-img-contain">
									<div class="admin-tire-img-title">이미지 등록</div>
									<div class="admin-tire-img-content">
										<div class="filebox2  bs3-primary">
											<input class="upload-name2" placeholder="첨부파일"
												disabled="disabled"> <label for="file2">업로드</label>
											<input type="file" id="file2" name="files"  multiple="multiple">
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