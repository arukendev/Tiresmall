<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차종 관리 페이지</title>

<link rel="stylesheet"
	href="resources/css/admin/car/admin_car.css">
<link rel="stylesheet" href="resources/css/admin/board/notice_board.css">
<script src="resources/js/admin/car/admin_car.js"></script>
<script type="text/javascript">


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

	

</script>

</head>
<body>


	<input id="whatMenu" value="car" type="hidden">
	<input id="sm" value="1" type="hidden"> 
	<div class="container sub">



		<div class="car-findselect">
  <div class="car-findarea">
    <div id="car_searchBox">
      <form action="car.search.do">
        <div class="car_searchTitle">
          <div>
           
            메이커    <select  id = "" name="carbrandInput" style="float: left; margin-left: 20px;">
              <c:forEach var="cblist" items="${carbrand}">
                <option value="${cblist.cb_name}">${cblist.cb_name}</option>
              </c:forEach>
            </select> 
          </div>
        </div>
        <input name="carnameInput" value=""  type="hidden">
        <button class="car-findareabutton" style="float: left;">메이커 검색</button>
      </form>
      <form name="carsearchform" action="car.search.do">
        <div class="car_searchTitle">
          <div class="car_searchID">
            <label for="car_searchid">차종</label> 
            <input id="carnameInput" name="carnameInput" style="text-align: center;" onkeypress="JavaScript:press(this.form)">
          </div>
        </div>
        <button class="carsearchButton">차종 검색</button>
        <input name="carbrandInput" value=""  type="hidden">
      </form>
    </div>
  </div>
  	 <div class="carRegButton1" style="float: right;">
				<button class="carRegButton">신규등록</button>
			</div>
  
</div>
				
		
				
				</div>
			
		
			






			<table id="admin_car_content">
				<tr>
					<td class="admin_car_content_title admin_car_no" style="border-right: 1px solid white;">No.</td>
					<td class="admin_car_content_title admin_car_brand" style="border-right: 1px solid white;">메이커</td>
					<td class="admin_car_content_title admin_year" style="border-right: 1px solid white;">연식</td>
					<td class="admin_car_content_title admin_car_name" style="border-right: 1px solid white;">차종</td>
					<td class="admin_car_content_title admin_car_option" style="border-right: 1px solid white;">옵션</td>
					<td class="admin_car_content_title admin_car_tiresize" style="border-right: 1px solid white;">타이어사이즈</td>
					<td class="admin_car_content_title authadmin_manage" style="border-right: 1px solid white;">관리</td>
				</tr>
			
	<c:if test="${empty cars}">
		<table>
			<tr>
				<td colspan="5" style="text-align: center;">데이터가 존재하지않습니다.</td>
			</tr>
		</table>
	</c:if>


	
		<c:forEach items="${cars }" var="c" varStatus="status">
					<tr id="admin_cars_content">
						<td class="admin_car_table_td">${status.count + (curPage-1)*count}</td>
						<td class="admin_car_table_td">${c.c_brand }</td>
						<td class="admin_car_table_td"> ${c.c_year1 } ~ ${c.c_year2 }</td>
						<td class="admin_car_table_td">
							${c.c_name }
							</td>
						<td class="admin_car_table_td">
						${c.c_option }
						</td>	
						<td class="admin_car_table_td">
						앞 :${c.c_ft } / 뒤 :${c.c_bt }
						</td>
						<td class="admin_car_table_td">
						<button class="updatecarbutton"
					onclick="updatecar('${c.c_id}','${c.c_name }',
					'${c.c_year1 }','${c.c_year2 } ',
					'${c.c_option }','${c.c_brand }',
					'${c.c_ft }','${c.c_bt }','${c.c_print}','${c.c_file }')">수정</button>
					<button type="button" class="updatecarbutton"
					id="updatecar('${c.c_id}')" onclick="deletecar('${c.c_id}')">삭제</button>
						</td>
						
					</tr>
				</c:forEach>
			</table>
	


	
	
	
	
	
	

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
				<table border="1" class="modal_table">
				<tr>
					<td style="background-color: #3399ff; text-align: center; " >임시 ID</td>
					<td><input name="c_id" id="c_id" style = "width:180px; height: 30px;"></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff; text-align: center;">메이커</td>
					<td>	<select name="c_brand" id ="c_brand" style="float: left;">
				<c:forEach var="cblist" items="${carbrand}">
				<option value="${cblist.cb_name}">${cblist.cb_name}</option>
				</c:forEach>
					</select></td>

					</tr>
					<tr>
						<td style="background-color: #3399ff; text-align: center;">차종</td>
						<td><input name="c_name" id="c_name" style = "width:180px; height: 30px;"></td>
					</tr>
					<tr>
						<td style="background-color: #3399ff; text-align: center;">차종옵션</td>
						<td><input name="c_option" id="c_option" style = "width:200px; height: 30px;"></td>
					</tr>
					<tr>
						<td style="background-color: #3399ff; text-align: center;">연식</td>
						<td><input name="c_year1" id="c_year1" style = "width:150px; height: 30px; ">~<input
							name="c_year2" id="c_year2" style = "width:150px; height: 30px;"></td>
					</tr>
					<tr>

					<td style="background-color: #3399ff; text-align: center;">출력</td>
					<td><select name="c_print" id="c_print">
					<option value='출력'>출력</option>
					<option value='숨김'>숨김</option>
					</select></td>
					</tr>
					<tr>
				<td style="background-color: #3399ff; text-align: center;">타이어사이즈</td>
<td>
  <button type="button" onclick="addSize()" class = "admin_tire_size_button">사이즈 추가</button>
  <br>
  <br>
  <br>
  
  <div class="ftbttmstyle">
    <div class="ftstyle" style="height: 30px; width:200px; border: 1px solid white;">앞타이어</div>
    <div class="btstyle" style="height: 30px; width:200px; border: 1px solid white;">뒤타이어</div>
    <div class="tmstyle" style="height: 30px; width:200px; border: 1px solid white;">관리</div>
  </div>
  <div id="sizeInputs">
    <div style="display: block;">
      <div class="ftinputstyle" style="float: left;"><input style="height: 30px; width:198px;" name="c_ft" id="c_ft" class="c_ftinput"></div>
      <div class="btinputstyle" style="float: left;"><input style="height: 30px; width:193px;" name="c_bt" id="c_bt" class="c_btinput"></div>
      <div class="tmreginputstyle" style="float: left;">기본 타이어입니다.</div></div>
    </div>
    

    
    
</td>
<tr>
  <td style="background-color: #3399ff; text-align: center;">차종이미지</td>
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
					<td style="background-color: #3399ff; text-align: center;">메이커</td>
					<td><select name="c_brand" id="c_brand_u">
					<c:forEach var="cblist" items="${carbrand}">
				<option value="${cblist.cb_name}">${cblist.cb_name}</option>
				</c:forEach>
					</select></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff; text-align: center;">차종</td>
					<td><input name="c_name" id="c_name_u" style = "width:180px; height: 30px;"><input type="hidden" name="c_id" id="c_id_u"></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff; text-align: center;">차종옵션</td>
					<td><input name="c_option" id="c_option_u" style = "width:180px; height: 30px;"></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff; text-align: center;">연식</td>
					<td><input name="c_year1" id="c_year1_u" style = "width:180px; height: 30px;">~<input name="c_year2" id="c_year2_u" style = "width:180px; height: 30px;"></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff; text-align: center;">출력</td>
					<td><select name="c_print" id="c_print_u" >
					<option value='출력'>출력</option>
					<option value='숨김'>숨김</option>
					</select></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff; text-align: center;">타이어사이즈</td>
	<td>
  <button type="button" onclick="addupdateSize()" class = "admin_tire_size_button">사이즈 추가</button>
  
  <div id="updatesizeInputs"></div>
  
 <%-- <div class="ftbttmstyle">
    <div class="ftstyle" style="height: 30px; width:200px; border: 1px solid white;">앞타이어</div>
    <div class="btstyle" style="height: 30px; width:200px; border: 1px solid white;">뒤타이어</div>
    <div class="tmstyle" style="height: 30px; width:200px; border: 1px solid white;">관리</div>
  </div>
  
    <div style="display: block;">
      <div class="ftinputstyle" style="float: left;"><input style="height: 30px; width:193px;" name="c_ft" id="c_ft_u" class="c_ftinput"></div>
      <div class="btinputstyle" style="float: left;"><input style="height: 30px; width:193px;" name="c_bt" id="c_bt_u" class="c_btinput"></div>
      <div class="tminputstyle" style="float: left;">기본 타이어입니다.</div></div>
    </div>
    
  --%>
    
    
</td>
				
				<tr>
  <td style="background-color: #3399ff; text-align: center;">차종이미지</td>
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