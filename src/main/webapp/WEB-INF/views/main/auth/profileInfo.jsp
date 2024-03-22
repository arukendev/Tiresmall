<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main/auth/main_auth.js"></script>
</head>
<body>
<form action="updateInfo" onsubmit="return updateCheck()">
<div id="profileInfo_container">
	<div id="profileInfo_title">회원정보 </div>
	<div id="profileInfo_underline"></div>
	<div id="profileInfo_box">
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">이름:</div>
				<div id="profileInfo_item_info">
					<input name="i_name" value="${personalInfomation.i_name }"disabled>
				</div>
			</div>
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">전화번호:</div>
				<div id="profileInfo_item_info">
					<input name="i_phoneNum" value="${personalInfomation.i_phoneNum }"disabled>
				</div>
			</div>
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">이메일:</div>
				<div id="profileInfo_item_info">
					<input name="i_email" value="${personalInfomation.i_email }"disabled>
				</div>
			</div>
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">자동차브랜드</div>
				<div id="profileInfo_item_info">
					<select id="mc_brand" name="mc_brand" onchange="selectBrand()" value="${personalInfomation.mc_brand }" >
						<c:forEach items="${carBrand }" var="c" >
							<option value="${c.cb_name }"
							  <c:if test="${(personalInfomation.mc_brand) eq (c.cb_name)}">selected</c:if>>
								${c.cb_name }
							</option>
						</c:forEach>
					</select>
				
				</div>
			</div>	
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">연식</div>
				<div id="profileInfo_item_info">
					<input id="mc_year_hidden" type="hidden" value="${personalInfomation.mc_year }"/>
					<select id="mc_year" name="mc_year">
					</select>
				</div>
			</div>
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">차종</div>
				<div id="profileInfo_item_info">
					<select id="mc_carname" name="mc_carname">
						<c:choose>
							<c:when test="${personalInfomation.mc_carname != null }">
								<option value="${personalInfomation.mc_carname }" 
									selected="selected">${personalInfomation.mc_carname }</option>
							</c:when>
							<c:otherwise>
								<option>브랜드와 년식을 먼저 선택해주세요</option>
							</c:otherwise>
						</c:choose>
					</select>
				</div>
			</div>	
				
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">자동차번호</div>
				<div id="profileInfo_item_info"><input name="mc_number" value="${personalInfomation.mc_number }"></div>
			</div>	
		<div id="profileInfo_btns">
			<button >회원 정보 수정</button>
			<button type="button" onclick="deleteOK(${personalInfomation.u_no})">회원 탈퇴</button>
		</div>
	</div>	

</div>
</form>

</body>
</html>