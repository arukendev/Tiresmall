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
<script src="resources/js/admin/store/validcheck.js"></script>
<script src="resources/js/admin/store/regvaluecheck.js"></script>
<script src="resources/js/admin/store/updatevaluecheck.js"></script>
<link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css" />
<link rel="stylesheet" href="resources/css/admin/board/notice_board.css">
<link rel="stylesheet"
	href="resources/css/admin/store/branch-findselect.css">

<script src="resources/js/admin/store/admin_store.js"></script>

<script type="text/javascript">
	
</script>

</head>
<body>
	<input id="whatMenu" value="store" type="hidden">

	<div class="branch-findselect">
		<div class="branch-findarea">

			<form action="branch.search.branchname">
				<div class="branch-text1">주소 선택</div>

				<select name="b_area1" id="listsido1">
				</select> <select name="b_area2" id="listgugun1"></select> <input
					name="branchnameInput" value="" type="hidden">
				<button class="branch-findareabutton">주소 검색</button>

			</form>
		</div>
		<div class="branch-text2" style="float: left;">장착점명</div>

		<form name="branchsearchform" action="branch.search.branchname">

			<input name="branchnameInput"
				style="text-align: center; height: 38px;"
				onkeypress="JavaScript:press(this.form)"> <input
				name="branchareaInput" value="" type="hidden">
			<button class="branchsearchButton" style="float: right;">장착점명
				검색</button>

		</form>

		<div class="branchRegButton1">

			<button class="branchRegButton">신규등록</button>
		</div>


	</div>


	<table id="admin_car_content">
				<tr>
					<td class="admin_car_content_title admin_car_no" style="border-right: 1px solid white;">No.</td>
					<td class="admin_car_content_title admin_car_branchname" style="border-right: 1px solid white;">장착점명</td>
					<td class="admin_car_content_title admin_phonenumber" style="border-right: 1px solid white;">연락처</td>
					<td class="admin_car_content_title admin_car_area" style="border-right: 1px solid white;">지역</td>
					<td class="admin_car_content_title admin_car_manage" style="border-right: 1px solid white;">관리</td>
				</tr>


<c:if test="${empty branchs}">
		<table>
			<tr>
				<td colspan="5" style="text-align: center;">데이터가 존재하지않습니다.</td>
			</tr>
		</table>
	</c:if>


	
		<c:forEach items="${branchs }" var="b" varStatus="status">
					<tr id="admin_cars_content">
						<td class="admin_car_table_td">${status.count + (curPage-1)*count}</td>
						<td class="admin_car_table_td">[${b.b_sortation}]
				${b.b_branchname }</td>
						<td class="admin_car_table_td"> ${b.b_branchnumber }</td>
						<td class="admin_car_table_td">
							${b.b_area }
							</td>
						<td class="admin_car_table_td">
						<button class="updatebranchbutton"
					onclick="updatebranch('${b.b_id}', '${b.b_sortation }',
					'${b.b_area }','${b.b_addr } ',
					'${b.b_name }','${b.b_time }',
					'${b.b_service }','${b.b_mapdata }','${b.b_manager }',
					'${b.b_managernumber}','${b.b_branchname}','${b.b_branchnumber}',
					'${b.b_cr}','${b.b_email}')">수정</button>
					<button type="button" class="updatebranchbutton"
					id="updatebranch('${b.b_id}')" onclick="deletebranch('${b.b_id}')">삭제</button>
						</td>
						
					</tr>
				</c:forEach>
			</table>

	
			

	<c:if test="${empty branchs}">
		<table>
			<tr>
				<td colspan="5" style="text-align: center;">데이터가 존재하지않습니다.</td>
			</tr>
		</table>
	</c:if>


	
	
	
	
	<div id="paging-box" class="branch-paging-box">
		<c:if test="${curPage != 1 }">
			<a href="branch.page.change?p=${curPage - 1 }">이전</a>
		</c:if>

		<c:forEach var="page" begin="1" end="${pageCount }">
			<c:choose>
				<c:when
					test="${page eq param.p or (curPage == 1 and curPage == page)}">
					<a style="color: black" href="branch.page.change?p=${page }">${page }
					</a>
				</c:when>
				<c:otherwise>
					<a href="branch.page.change?p=${page }">${page } </a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${curPage != pageCount }">
			<a href="branch.page.change?p=${curPage + 1 }">다음</a>
		</c:if>
	</div>
	







	<div id="regpopup01" class="regbuttonarea">
		<div class="close">X</div>
		<div>
			<form action="reg.branch.do" method="post" name="regform"
				onsubmit="return branchregcall();" enctype="multipart/form-data">
				<table border="1" class="">
					<tr>
						<td style="background-color: #0ec492">구분</td>
						<td><input type='radio' name="b_sortation" value='직영점(당일장착점)' />직영점(당일장착점)
							<input type='radio' name="b_sortation" value='제휴장착점' /> 제휴장착점</td>
					</tr>
					<tr>
						<td style="background-color: #0ec492">사진</td>
						<td>
						
    <div class="preview-image" style="float: left;">
      <div class="upload-display" style="float: left;">
        <div class="upload-thumb-wrap" style="float: left;"><img class="upload-thumb"></div>
      </div>
    </div>
    <div class="fileinputstyle" style="float: left; margin-top: 20px;">없음</div>
    <label class="custom-file-upload" style="margin-top: 20px;">
      <input type="file" name="file" onchange="previewImagereg(event)">
      파일 선택
    </label>
  </td>
</tr>
						
					
					<tr>
						<td style="background-color: #0ec492">임시 id</td>
						<td><input name="b_id" id="inputid" style = "width:180px; height: 30px;"></td>
					</tr>


					<tr>
						<td style="background-color: #0ec492">지역</td>
						<td><div style='float: left'>
								<select name="b_area1" id="regsido1" style="width: 120px"></select>
								<select name="b_area2" id="reggugun1" style="width: 120px"></select>
							</div></td>
					</tr>


					<tr>
						<td style="background-color: #0ec492">장착점명</td>
						<td><input name="b_name" id="inputname" style = "width:180px; height: 30px;"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">상세주소</td>
						<td><input name="b_addr" id="inputaddr" style = "width:400px; height: 30px;"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">영업시간</td>
						<td><input name="b_time" id="inputregtime" style = "width:400px; height: 30px;"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">취급서비스</td>
						<td><input name="b_service" id="service" style = "width:400px; height: 30px;"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">지도데이터</td>
						<td><input name="b_mapdata" id="inputmapdata" placeholder="입력예)37.544500, 127.044444"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">연락처명</td>
						<td>담당자명 <input name="b_manager" style = "width:180px; height: 30px;"> 전화번호 <input
							name="b_managernumber" style = "width:180px; height: 30px;"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">사업자정보</td>
						<td class="branchinfoareasangdanframe"><div
								class="branchinfoareasangdan" style="float: left;">
								<div style="float: left;">
									<div class="branchnamestyle1">업체명</div>
									<input name="b_branchname" style="height: 30px; width: 165px;">
								</div>

								<div style="float: left;">
									<div class="branchnamestyle2">사업자번호</div>
									<input name="b_branchnumber" style="height: 30px;">
								</div>

							</div> <br>
							<div class="branchinfoareahadan" style="float: left;">
								<div style="float: left;">
									<div class="branchnamestyle3">대표자명</div>
									<input name="b_cr" style="height: 30px; width: 150px;">
								</div>

								<div class="" style="float: left;">
									<div class="branchnamestyle4">사업자이메일</div>
									<input name="b_email" style="height: 30px;">
								</div>

							</div></td>
					</tr>

					<tr>
						<td colspan=2><div class="regokbutton">
								<button class="regokbutton1" id="regbranch">등록</button>
							</div></td>
				</table>
			</form>
		</div>
	</div>

	<div id="popup01">
		<div class="close">X</div>
		<div>
			<form action="admin.store.update.do" name="updateform" method="post"
				onsubmit="return branchupdatecall();" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<td style="background-color: #0ec492">구분</td>
						<td><select name="b_sortation" id="b_sortation_i">
								<option value='직영점(당일장착점)'>직영점(당일장착점)</option>
								<option value='제휴장착점'>제휴장착점</option>
						</select>
					</tr>



					<tr>
						<td style="background-color: #0ec492">지역</td>
						<td><select name="b_area1" id="sido1"></select> <select
							name="b_area2" id="gugun1"></select></td>
					</tr>


					<tr>
						<td style="background-color: #0ec492">장착점명</td>
						<td><input name="b_name" id='b_name_i'> <input
							type="hidden" name="b_id" id="b_id_i"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">상세주소</td>
						<td><input name="b_addr" id='b_addr_i'></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">영업시간</td>
						<td><input name="b_time" id='b_time_i'></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">취급서비스</td>
						<td><input name="b_service" id='b_service_i'></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">지도데이터</td>
						<td><input name="b_mapdata" id='b_mapdata_i'></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">연락처</td>
						<td>담당자명 <input name="b_manager" id='b_manager_i'>
							전화번호 <input name="b_managernumber" id='b_managernumber_i'></td>
					</tr>

					<tr>

						<td style="background-color: #0ec492">사업자정보</td>
						<td class="branchinfoareasangdanframe"><div
								class="branchinfoareasangdan" style="float: left;">
								<div style="float: left;">
									<div class="branchnamestyle1">업체명</div>
									<input name="b_branchname" id='b_branchname_i'
										style="height: 30px; width: 165px;">
								</div>

								<div style="float: left;">
									<div class="branchnamestyle2">사업자번호</div>
									<input name="b_branchnumber" id='b_branchnumber_i'
										style="height: 30px;">
								</div>

							</div> <br>
							<div class="branchinfoareahadan" style="float: left;">
								<div style="float: left;">
									<div class="branchnamestyle3">대표자명</div>
									<input name="b_cr" id='b_cr_i'
										style="height: 30px; width: 150px;">
								</div>

								<div class="" style="float: left;">
									<div class="branchnamestyle4">사업자이메일</div>
									<input name="b_email" id='b_email_i' style="height: 30px;">
								</div>

							</div></td>
					<tr>
						<td style="background-color: #0ec492">대표이미지</td>
						<td>
						
    <div class="preview-image" style="float: left;">
      <div class="upload-display" style="float: left;">
        <div class="upload-thumb-wrap" style="float: left;"><img class="update-upload-thumb"></div>
      </div>
    </div>
    <div class="updatefileinputstyle" style="float: left; margin-top: 20px;"></div>
    <label class="custom-file-upload" style="margin-top: 20px;">
      <input type="file" name="file" onchange="previewImage(event)">
      파일 선택
    </label>
  
						
						</td>
					</tr>
					<tr>
						<td colspan=2><div class="updateokbutton">
								<button class="updateokbutton1" id="updateb_id">수정</button>
							</div></td>
					</tr>
				</table>


			</form>
		</div>
	</div>






</body>

</html>