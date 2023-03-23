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

				<select name="b_area1" id="sido1">
				</select> <select name="b_area2" id="gugun1"></select> <input
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




	<div class="branchdata_div_outter">
		<div class="branchdata_div" style="float: left; margin-top: 5px;">

			<div class="branchdata_div1"
				style="border: 1px solid gray; float: left;">No.</div>
			<div class="branchdata_div2"
				style="border: 1px solid gray; float: left;">장착점명</div>
			<div class="branchdata_div3"
				style="border: 1px solid gray; float: left;">연락처</div>
			<div class="branchdata_div4"
				style="border: 1px solid gray; float: left;">지역</div>
			<div class="branchdata_div5"
				style="border: 1px solid gray; float: left;">관리</div>
		</div>
	</div>

	<c:if test="${empty branchs}">
		<table>
			<tr>
				<td colspan="5" style="text-align: center;">데이터가 존재하지않습니다.</td>
			</tr>
		</table>
	</c:if>


	<c:forEach var="b" items="${branchs }" varStatus="status">
		<div class="branchdatalist_div"
			style="border: 1px solid gray; float: left;">
			<div class="branchdatalist_div1" style="float: left;">${status.count }</div>
			<div class="branchdatalist_div2" style="float: left;">[${b.b_sortation}]
				${b.b_branchname }</div>
			<div class="branchdatalist_div3" style="float: left;">${b.b_branchnumber }
			</div>
			<div class="branchdatalist_div4" style="float: left;">${b.b_area }</div>
			<div class="branchdatalist_div5" style="float: left;">

				<button class="updatebranchbutton"
					onclick="updatebranch('${b.b_id}', '${b.b_sortation }',
					'${b.b_area }','${b.b_addr } ',
					'${b.b_name }','${b.b_time }',
					'${b.b_service }','${b.b_mapdata }','${b.b_manager }',
					'${b.b_managernumber}','${b.b_branchname}','${b.b_branchnumber}',
					'${b.b_cr}','${b.b_email}')">수정</button>
				<button type="button" class="updatebranchbutton"
					id="updatebranch('${b.b_id}')" onclick="deletebranch('${b.b_id}')">삭제</button>
			</div>

		</div>
	</c:forEach>
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
						<td><input type="file" name="file"></td>
					</tr>
					<tr>
						<td style="background-color: #0ec492">임시 id</td>
						<td><input name="b_id" id="inputid"></td>
					</tr>


					<tr>
						<td style="background-color: #0ec492">지역</td>
						<td><div style='float: left'>
								<select name="b_area1" id="sido1" style="width: 120px"></select>
								<select name="b_area2" id="gugun1" style="width: 120px"></select>
							</div></td>
					</tr>


					<tr>
						<td style="background-color: #0ec492">장착점명</td>
						<td><input name="b_name" id="inputname"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">상세주소</td>
						<td><input name="b_addr" id="inputaddr"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">영업시간</td>
						<td><input name="b_time" id="inputregtime"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">취급서비스</td>
						<td><input name="b_service" id="service"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">지도데이터</td>
						<td><input name="b_mapdata" id="inputmapdata"></td>
					</tr>

					<tr>
						<td style="background-color: #0ec492">연락처명</td>
						<td>담당자명 <input name="b_manager"> 전화번호 <input
							name="b_managernumber"></td>
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
						<td style="background-color: #0ec492">취급서비스</td>
						<td><input type="file" name="file"></td>
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