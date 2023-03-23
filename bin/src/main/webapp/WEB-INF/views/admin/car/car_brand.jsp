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
	href="resources/css/admin/car/admin_car_brand.css">
	
<script src="resources/js/admin/car/admin_car.js"></script>
	



</head>
<body>
	<input id="whatMenu" value="car" type="hidden">
	<input id="sm" value="2" type="hidden"> 
	<div class="container sub">



		<div class="brandRegButton1" style="float: right;">
			<button class="brandRegButton">신규등록</button>
		</div>


		<div class="branddata_div_outter">
			<div class="branddata_div" style="float: left; margin-top: 5px;">

				<div class="branddata_div1"
					style="border: 1px solid gray; float: left;">메이커명</div>
				<div class="branddata_div2"
					style="border: 1px solid gray; float: left;">등록차종수</div>
				<div class="branddata_div3"
					style="border: 1px solid gray; float: left;">표시순서</div>
				<div class="branddata_div4"
					style="border: 1px solid gray; float: left;">관리</div>
			</div>
		</div>


	</div>
	
	<c:forEach var="carcount" items="${carcount}" varStatus="status"> 
     
	
	
</c:forEach>
			
			<c:forEach var="cb" items="${carbrands}" varStatus="status"> 
     
    <div class="branddatalist_div" style="border: 1px solid gray; float: left;">
        <div class="branddatalist_div1" style="float: left;">${cb.cb_name}</div>
        <div class="branddatalist_div2" style="float: left;">${empty carcount[status.index].cb_ea ? 0 : carcount[status.index].cb_ea}</div>
        <div class="branddatalist_div3" style="float: left;">${cb.cb_order }</div>
        <div class="branddatalist_div4" style="float: left;">
        <button type="button"  class ="updatecarbrandbutton" onclick="updatecb1('${cb.cb_name}','${cb.cb_order }')">수정</button>
            <button type="button" onclick="deletecb1('${cb.cb_name}')">삭제</button>
        </div>
    </div>
   
</c:forEach>
	 
	 
	 
	 
	 
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
					<input name="new_cb_name" id="cb_name_n">
					
					</td>
					</tr>
					<tr>
					<td style="background-color: #3399ff">표시순서</td>
					<td><input name="cb_order" id="cb_order_u"></td>
					
		
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