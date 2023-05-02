<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/store/admin_store.css">
<script src="resources/js/admin/store/admin_store.js"></script>
</head>
<body>
	<input id="whatMenu" value="store" type="hidden">
	<div class="container sub">
		<div id="tire_container">
			<div id="admin-store-reg">
				<h1 id="admin-store-reg-whatPage">장착점 등록</h1>
			</div>
			<form action="admin.store.reg.do" id="admin_store_table_container"
				method="post" enctype="multipart/form-data">
				<table id="admin_store_table" border="1">
					<tr>
						<td class="admin_store_table_title">구분</td>
						<td colspan="3">
							<div class="admin-store-reg-info-content">
								<label class="admin-store-reg-label"> 
									<input type="radio" name="b_sortation" class="admin-store-reg-input">
									<div class="rad-design"></div>
									<div class="rad-text">직영점 (당일 장착점)</div>
								</label> 
								<label class="admin-store-reg-label"> 
									<input type="radio" name="b_sortation" class="admin-store-reg-input" checked="checked">
									<div class="rad-design"></div>
									<div class="rad-text">제휴 장착점</div>
								</label>
							</div>
						</td>
					</tr>
					<tr>
						<td class="admin_store_table_title">지역</td>
						<td>
							<div id="b_area" class="admin-store-reg-info-content">
								<select name="b_area1" id="storeRegDo"></select> 
								<select name="b_area2" id="storeRegSi"></select> 
								<input type="hidden"id="hiddenStoreReg_b_area" name="b_area">
							</div>
						</td>
						<td class="admin_store_table_title">상세주소</td>
						<td>
							<input class="admin-store-reg-info-input storeAddrWidth" name="b_addr"autocomplete="off">
						</td>
					</tr>
					<tr>
						<td class="admin_store_table_title">장착점 명</td>
						<td>
							<input class="admin-store-reg-info-input storebrandNameWidth" name="b_name"autocomplete="off">
						</td>
						<td class="admin_store_table_title">지도 데이터</td>
						<td>
							<input class="admin-store-reg-info-input storeAddrWidth" name="b_mapdata"autocomplete="off"placeholder="36.1900937, 127.0954606 좌표 입력">
						</td>
					</tr>
					<tr>

					</tr>
					<tr>
						<td class="admin_store_table_title">영업 시간</td>
						<td colspan="3">
							<input class="admin-store-reg-info-input storeTimeWidth" name="b_time"autocomplete="off">
						</td>
					</tr>
					<tr>
						<td class="admin_store_table_title">취급 서비스</td>
						<td colspan="3">
							<input class="admin-store-reg-info-input storeTimeWidth" name="b_service"autocomplete="off">
						</td>
					</tr>
					
					<tr>
						<td class="admin_store_table_title">담당자명</td>
						<td>
							<input class="admin-store-reg-info-input storebrandNameWidth" name="b_manager"autocomplete="off">
						</td>
						<td class="admin_store_table_title">전화번호</td>
						<td>
							<input class="admin-store-reg-info-input storeNumberWidth"name="b_managernumber" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td class="admin_store_table_title">대표자명</td>
						<td>
							<input class="admin-store-reg-info-input storebrandNameWidth" name="b_cr"autocomplete="off">
						</td>
						<td class="admin_store_table_title">사업자 번호</td>
						<td>
							<input class="admin-store-reg-info-input storeNumberWidth"name="b_branchnumber" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td class="admin_store_table_title">사업자 이메일</td>
						<td colspan="3">
							<input class="admin-store-reg-info-input storeNumberWidth"name="b_email" autocomplete="off">
						</td>
					</tr>
					<tr>
						<td class="admin_store_table_title">메인 이미지</td>
						<td colspan="3">
							<div class="admin-store-reg-img-container">
								<div class="admin-store-reg-img-contain">
									<div class="admin-store-img-title"
										style="border-right: 2px solid white;">현재 이미지</div>
									<div class="admin-store-img-content">
										<img id="imagePreview">
									</div>
								</div>
								<div class="admin-store-reg-img-contain">
									<div class="admin-store-img-title">이미지 등록</div>
									<div class="admin-store-img-content">
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
						<td colspan="4">
							<div id="admin_store_reg_button">
								<button class="admin-store-reg-button">등록</button>
								<div class="admin_store_reg_deleteBTN" onclick="history.back()">취소</div>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>