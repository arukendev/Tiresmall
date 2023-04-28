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
			<div id="admin-tire-reg">
				<h1 id="admin-tire-reg-whatPage">장착점 등록</h1>
			</div>
			<form action="admin.tire.reg.do" id="admin_tire_table_container"
				method="post" enctype="multipart/form-data">
				<table id="admin_tire_table" border="1">
					<tr>
						<td class="admin_tire_table_title">구분</td>
						<td>
							<div class="admin-store-reg-info-content">
								<label class="admin-store-reg-label"> 
									<input type="radio"	name="b_sortation" class="admin-store-reg-input">
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
						<td class="admin_tire_table_title">지역</td>
						<td>
							<div>
								<select name="b_area1" id="storeRegDo"></select>
								<select name="b_area2"id="storeRegSi"></select> 
								<input type="hidden" id="hiddenStoreReg_b_area" name="b_area">
							</div>
						</td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">장착점 명</td>
						<td>
							<div>
								<input class="admin-store-reg-info-input" name="b_branchname"autocomplete="off">
							</div>
						</td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">상세주소</td>
						<td>
							<div id="auth_carYear"class="admin-store-reg-info-content"><!--가로  -->
								<input class="admin-store-reg-info-input" name="b_addr"autocomplete="off">	
							</div>
						</td>
					</tr>
					<tr>
					
					</tr>
					<tr>
						<td class="admin_tire_table_title">영업 시간</td>
						<td>
							<div>
								<input class="admin-store-reg-info-input" name="b_time"autocomplete="off">
							</div>
						</td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">취급 서비스</td>
						<td>
							<div>
								<input class="admin-store-reg-info-input" name="b_service"autocomplete="off">
							</div>	
						</td>
					</tr>
					<tr>
						<td class="admin_tire_table_title">지도 데이터</td>
						<td>
							<div>
								<input class="admin-store-reg-info-input" name="b_mapdata"autocomplete="off"placeholder="36.1900937, 127.0954606식으로 입력해주세요">
							</div>	
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
						<td>
						
						</td>
						<td>
						
						</td>
					</tr>
					<tr>
						<td>
						
						
						</td>
						<td>
						
						
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