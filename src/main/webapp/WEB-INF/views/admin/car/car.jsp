<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="resources/css/admin/car/admin_car.css">
<script src="resources/js/admin/car/admin_car.js"></script>

<script type="text/javascript">
function addSize() {
  const ftbttmstyle2outdiv = document.querySelector('.ftbttmstyle2outdiv');
  ftbttmstyle2outdiv.style.display = 'block';
}

function deleteSize2() {
	  const ftbttmstyle2outdiv = event.target.closest('.ftbttmstyle2outdiv');

	  if (ftbttmstyle2outdiv) {
	    ftbttmstyle2outdiv.querySelector('.c_ftinput').value = '';
	    ftbttmstyle2outdiv.querySelector('.c_btinput').value = '';

	    ftbttmstyle2outdiv.style.display = 'none';
	  }
	}


function addSize2() {
	  const ftbttmstyle3outdiv = document.querySelector('.ftbttmstyle3outdiv');
	  ftbttmstyle3outdiv.style.display = 'block';
	}

	function deleteSize() {
	  
	  const ftbttmstyle3outdiv = event.target.closest('.ftbttmstyle3outdiv');

	  ftbttmstyle3outdiv.querySelector('.c_ftainput2').value = '';
	  ftbttmstyle3outdiv.querySelector('.c_btainput2').value = '';

	  ftbttmstyle3outdiv.style.display = 'none';
	}

</script>

</head>
<body>


	<input id="whatMenu" value="car" type="hidden">
	<input id="sm" value="1" type="hidden"> 
	<div class="container sub">



		<div class="car-findselect">
			<div class="car-findarea">


			<form action="car.search.do">
				<div class="car-text1">메이커</div>
				<select name="carbrandInput" style="float: left;">
				<c:forEach var="cblist" items="${carbrand}">
				<option value="${cblist.cb_name}">${cblist.cb_name}</option>
				</c:forEach>
			
				</select> 
				<input name="carnameInput" value=""  type="hidden">
				<button class="car-findareabutton" style="float: left;">메이커 검색</button>

				</form>
			</div>
			<div class="car-text2" style="float: left;">차종</div>

			<form name="carsearchform" action="car.search.do">

				<input name="carnameInput" style="text-align: center; height: 38px;"
					onkeypress="JavaScript:press(this.form)">
				<button class="carsearchButton">차종 검색</button>
			<input name="carbrandInput" value=""  type="hidden">
			</form>



			<div class="carRegButton1" style="float: right;">
				<button class="carRegButton">신규등록</button>
			</div>



		</div>




		<div class="cardata_div_outter">
			<div class="cardata_div" style="float: left; margin-top: 5px;">

				<div class="cardata_div1"
					style="border: 1px solid gray; float: left;">No.</div>
				<div class="cardata_div2"
					style="border: 1px solid gray; float: left;">메이커</div>
				<div class="cardata_div3"
					style="border: 1px solid gray; float: left;">연식</div>
				<div class="cardata_div4"
					style="border: 1px solid gray; float: left;">차종</div>
				<div class="cardata_div5"
					style="border: 1px solid gray; float: left;">옵션</div>
				<div class="cardata_div6"
					style="border: 1px solid gray; float: left;">타이어사이즈</div>
				<div class="cardata_div7"
					style="border: 1px solid gray; float: left;">관리</div>

</div>
</div>

	<c:if test="${empty cars}">
		<table>
			<tr>
				<td colspan="5" style="text-align: center;">데이터가 존재하지않습니다.</td>
			</tr>
		</table>
	</c:if>




	<c:forEach var="c" items="${cars }" varStatus="status">
	<c:if test="${c.c_print == '출력'}">
		<div class="cardatalist_div"
			style="border: 1px solid gray; float: left;">
			<div class="cardatalist_div1" style="float: left;">${status.count } </div>
			<div class="cardatalist_div2" style="float: left;">${c.c_brand } </div>
			<div class="cardatalist_div3" style="float: left;">${c.c_year1 } ~ ${c.c_year2 }</div>
			<div class="cardatalist_div4" style="float: left;">${c.c_name }</div>

			<div class="cardatalist_div5" style="float: left;">${c.c_option }  </div>
			<div class="cardatalist_div6" style="float: left;"> 앞 :${c.c_ft } 뒤 :${c.c_bt }  <c:if test="${not empty c.c_fta}">/ 앞:${c.c_fta }</c:if>  <c:if test="${not empty c.c_bta}">/ 뒤 :${c.c_bta } </c:if></div>
			<div class="cardatalist_div7" style="float: left;"> <button class="updatecarbutton"
					onclick="updatecar('${c.c_id}','${c.c_name }',
					'${c.c_year1 }','${c.c_year2 } ',
					'${c.c_option }','${c.c_brand }',
					'${c.c_ft }','${c.c_bt }','${c.c_print}','${c.c_fta }','${c.c_bta }')">수정</button>
				<button type="button" class="updatecarbutton"
					id="updatecar('${c.c_id}')" onclick="deletecar('${c.c_id}')">삭제</button> </div>

				
			</div>
			</c:if>
	</c:forEach>

	<div id="paging-box" class="car-paging-box">
		<c:if test="${curPage != 1 }">
			<a href="car.page.change?p=${curPage - 1 }">이전</a>
		</c:if>

		<c:forEach var="page" begin="1" end="${pageCount }">
			<c:choose>
				<c:when
					test="${page eq param.p or (curPage == 1 and curPage == page)}">
					<a style="color: black" href="car.page.change?p=${page }">${page }
					</a>
				</c:when>
				<c:otherwise>
					<a href="car.page.change?p=${page }">${page } </a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${curPage != pageCount }">
			<a href="car.page.change?p=${curPage + 1 }">다음</a>
		</c:if>
	</div>

	
	
	
	<div id="carregpopup01" class="carregbuttonarea">
		<div class="close">X</div>

		<div>
			<form action="reg.car.do" method="post" name="regform"
				onsubmit="return carregcall();" enctype="multipart/form-data">
				<table border="1" class="">
				<tr>
					<td style="background-color: #3399ff">임시 ID</td>
					<td><input name="c_id" id="c_id"></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">메이커</td>
					<td>	<select name="c_brand" id ="c_brand" style="float: left;">
				<c:forEach var="cblist" items="${carbrand}">
				<option value="${cblist.cb_name}">${cblist.cb_name}</option>
				</c:forEach>
					</select></td>

					</tr>
					<tr>
						<td style="background-color: #3399ff">차종</td>
						<td><input name="c_name" id="c_name"></td>
					</tr>
					<tr>
						<td style="background-color: #3399ff">차종옵션</td>
						<td><input name="c_option" id="c_option"></td>
					</tr>
					<tr>
						<td style="background-color: #3399ff">연식</td>
						<td><input name="c_year1" id="c_year1">~<input
							name="c_year2" id="c_year2"></td>
					</tr>
					<tr>

					<td style="background-color: #3399ff">출력</td>
					<td><select name="c_print" id="c_print">
					<option value='출력'>출력</option>
					<option value='숨김'>숨김</option>
					</select></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">타이어사이즈</td>
					<td>
					
					<button  type="button" onclick="addSize()">사이즈 추가</button>
					<br>
					<div class = "ftbttmstyle">
					<div class = "ftstyle" style=" height: 30px; width:200px;  border: 1px solid white;">앞타이어</div>
					<div class = "btstyle" style="height: 30px; width:200px;  border: 1px solid white;">뒤타이어</div>
					<div class = "tmstyle"  style=" height: 30px; width:200px;  border: 1px solid white;">관리</div>
					</div>
					<div style="display: block;">
					</div>
					<div style="display: block;">
					<div class = "ftinputstyle" style="float: left;" ><input style="height: 30px; width:193px;" name="c_ft" id="c_ft" class="c_ftinput"></div>
					<div class = "btinputstyle" style= "float: left;"><input style="height: 30px; width:193px;" name="c_bt" id="c_bt" class="c_btinput" ></div>
					<div class = "tminputstyle" style="float: left;">기본 타이어입니다.</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<div class = "ftbttmstyle2outdiv">
						<div class = "ftbttmstyle2">
					<div class = "ftstyle" style=" height: 30px; width:200px; position:absolute; top:460px;  border: 1px solid white;">앞타이어</div>
					<div class = "btstyle" style="height: 30px; width:200px;  position:absolute;  top:460px; left: 348px;border: 1px solid white;">뒤타이어</div>
					<div class = "tmstyle"  style=" height: 30px; width:200px;  position:absolute; top:460px;  left: 550px; border: 1px solid white;">관리</div>
					</div>
					<div style="display: block;">
					</div>
					<div style="display: block;">
					<div class = "ftinputstyle" style="float: left;" ><input style="height: 30px; width:193px;" name="c_fta" id="c_fta" class="c_ftinput"></div>
					<div class = "btinputstyle" style= "float: left;"><input style="height: 30px; width:193px;" name="c_bta" id="c_bta" class="c_btinput" ></div>
					<div class = "tminputstyle" style="float: left;"><button class="c_tminput"  type="button" onclick="deleteSize2()">삭제</button></div>
					</div>
					</div>
					
					
					
					
					</td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">차종이미지</td>
					<td>
					
					
					<div class = "ftbttmstyle">
					<div class = "ftstyle" style=" height: 30px; width:200px;  border: 1px solid white;">현재 이미지</div>
					<div class = "btstyle" style="height: 30px; width:200px;  border: 1px solid white;">이미지 등록</div>
					
					</div>
					<div style="display: block;">
					</div>
					<div style="display: block;">
					<div class = "ftinputstyle" style="float: left; height: 30px; width:199px;" >없음</div>
					<div class = "btinputstyle" style= "float: left; height: 30px; width:199px;"><input type="file" name="file"></div>
					
					</div>
					
					
					
					
					
					</tr>
					
					<tr>
					<td colspan=2><div class="carregokbutton">
								<button class="carregokbutton1" onsubmit="return carregcall();" id="regcar">등록</button>
							</div></td>
					</tr>
					
				</table>
			</form>
		</div>

		</div>  
<div id="updatecarpopup01">
    <div class="close">close</div>
    <div>
    
    <div>
			<form action="admin.car.update.do" method="post" name="updateform"
				onsubmit="return carupdatecall();" enctype="multipart/form-data">
				<table border="1" class="">
				
					<tr>
					<td style="background-color: #3399ff" >메이커</td>
					<td><select name="c_brand" id="c_brand_u">
					<c:forEach var="cblist" items="${carbrand}">
				<option value="${cblist.cb_name}">${cblist.cb_name}</option>
				</c:forEach>
					</select></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">차종</td>
					<td><input name="c_name" id="c_name_u"><input type="hidden" name="c_id" id="c_id_u"></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">차종옵션</td>
					<td><input name="c_option" id="c_option_u"></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">연식</td>
					<td><input name="c_year1" id="c_year1_u">~<input name="c_year2" id="c_year2_u"></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">출력</td>
					<td><select name="c_print" id="c_print_u">
					<option value='출력'>출력</option>
					<option value='숨김'>숨김</option>
					</select></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">타이어사이즈</td>
					<td>
					
					<button  type="button" onclick="addSize2()">사이즈 추가</button>
					<div class = "ftbttmstyle">
					<div class = "ftstyle" style="height: 30px; width:200px;  border: 1px solid white;">앞타이어</div>
					<div class = "btstyle" style="height: 30px; width:200px;  border: 1px solid white;">뒤타이어</div>
					<div class = "tmstyle"  style=" height: 30px; width:200px;  border: 1px solid white;">관리</div>
					</div>
					<div style="display: block;">
					</div>
					<div style="display: block;">
					<div class = "ftinputstyle" style="float: left;" ><input style="height: 30px; width:193px;" name="c_ft" id="c_ft_u" class="c_ftinput"></div>
					<div class = "btinputstyle" style= "float: left;"><input style="height: 30px; width:193px;"  name="c_bt" id="c_bt_u" class="c_btinput" ></div>
					<div class = "tminputstyle" style="float: left;">기본 타이어입니다.</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<div class = "ftbttmstyle3outdiv">
						<div class = "ftbttmstyle3">
					<div class = "ftstyle" style=" height: 30px; width:200px; position:absolute; top:428px;  border: 1px solid white;">앞타이어</div>
					<div class = "btstyle" style="height: 30px; width:200px;  position:absolute;  top:428px; left: 320px;border: 1px solid white;">뒤타이어</div>
					<div class = "tmstyle"  style=" height: 30px; width:200px;  position:absolute; top:428px;  left: 522px; border: 1px solid white;">관리</div>
					</div>
					<div style="display: block;">
					</div>
					<div style="display: block;">
					<div class = "ftinputstyle" style="float: left;" ><input style="height: 30px; width:193px;" name="c_fta" id="c_fta_u" class="c_ftainput2"></div>
					<div class = "btinputstyle" style= "float: left;"><input style="height: 30px; width:193px;" name="c_bta" id="c_bta_u" class="c_btainput2" ></div>
					<div class = "tminputstyle" style="float: left;"><button class="c_tminput"  type="button" onclick="deleteSize()">삭제</button></div>
					</div>
					</div>
					
					
					<tr>
					<td style="background-color: #3399ff">차종이미지</td>
					<td>
					
					
					<div class = "ftbttmstyle">
					<div class = "ftstyle" style=" height: 30px; width:200px;  border: 1px solid white;">현재 이미지</div>
					<div class = "btstyle" style="height: 30px; width:200px;  border: 1px solid white;">이미지 등록</div>
					
					</div>
					<div style="display: block;">
					</div>
					<div style="display: block;">
					<div class = "ftinputstyle" style="float: left; height: 30px; width:199px;" >없음</div>
					<div class = "btinputstyle" style= "float: left; height: 30px; width:199px;"><input type="file" name="file"></div>
					
					</div>
					
					
					
					
					
					</tr>
					
					</td>
					</tr>
						<tr>
						<td colspan=2><div class="updatecarokbutton">
								<button   class="updatecarokbutton1" id="updatecar" value=>수정</button>
							</div></td>
					</tr>
					
				</table>
			</form>
		</div>
    
    
    </div>
</div>
    
    	
    
    
	
	

</body>
</html>