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

	
	 

		<table id="admin_car_content">
				<tr>
					<td class="admin_car_content_title admin_brand_no" style="border-right: 1px solid white;">메이커</td>
					<td class="admin_car_content_title admin_brand_each" style="border-right: 1px solid white;">등록차종수</td>
					<td class="admin_car_content_title admin_brand_order" style="border-right: 1px solid white;">표시순서</td>
					<td class="admin_car_content_title admin_brand_manage" style="border-right: 1px solid white;">관리</td>

				</tr>
			
	<c:if test="${empty carbrands}">
		<table>
			<tr>
				<td colspan="5" style="text-align: center;">데이터가 존재하지않습니다.</td>
			</tr>
		</table>
	</c:if>
	
	<c:forEach var="carcount" items="${carcount}" varStatus="status"> 
     
	
	
</c:forEach>

	
		<c:forEach items="${carbrands}" var="cb" varStatus="status">
					<tr id="admin_cars_content">
						<td class="admin_car_table_td">${cb.cb_name}</td>
						<td class="admin_car_table_td">${empty carcount[status.index].cb_ea ? 0 : carcount[status.index].cb_ea}</td>
						<td class="admin_car_table_td"> ${cb.cb_order }</td>
						<td class="admin_car_table_td">
							<button type="button"  class ="updatecarbrandbutton" onclick="updatecb1('${cb.cb_name}','${cb.cb_order }')">수정</button>
            <button type="button"   class ="updatecarbrandbutton" onclick="deletecb1('${cb.cb_name}')">삭제</button>
							</td>
					
					</tr>
				</c:forEach>
			</table>
	
	 
	 
	 </div>
	 
	 
	 
	 <div id="brandregpopup01" class="carbrandregbuttonarea">
		<div class="close">X</div>
		<div>
			<form action="reg.brand.do"  name="regform"
				onsubmit="return carbrandregcall();" >
				<table border="1" class="">
				<tr>
					<td style="background-color: #3399ff">브랜드 명</td>
					<td><input name="cb_name" id="cb_name"></td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">표시순서</td>
					<td><input name="cb_order" id="cb_order"></td>
					
		
					</tr>
					
					<tr>
					<td colspan=2><div class="carbrandregokbutton">
								<button class="carbrandregokbutton1" id="regcarbrand">등록</button>
							</div></td>
					</tr>
					
				</table>
			</form>
		</div>
	 </div>
	 
	 
	 
<div id="updatebrandpopup01">
    <div class="close">close</div>
    <div>
    

			<form action="update.brand.do"  name="updateform"
				onsubmit="return carbrandupdatecall();" >
				<table border="1" class="">
				<tr>
					<td style="background-color: #3399ff">브랜드 명</td>
					<td><input name="old_cb_name" id="cb_name_u" type="hidden">
					<input name="new_cb_name" id="cb_name_n" style = "width:180px; height: 30px;">
					
					</td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">표시순서</td>
					<td><input name="cb_order" id="cb_order_u" style = "width:180px; height: 30px;"></td>
					
		
					</tr>
					
					<tr>
					<td colspan=2><div class="carbrandupdateokbutton">
								<button class="carbrandupdateokbutton1" id="updatecarbrand">수정</button>
							</div></td>
					</tr>
					
				</table>
			</form>
		
    
    
    </div>
</div>

	 
	 
	 
	 
    
    
    
    
    

	
    
	 
	 
	

</body>
</html>