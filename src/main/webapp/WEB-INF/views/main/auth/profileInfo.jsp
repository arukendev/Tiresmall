<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="profileInfo_container">
	<div id="profileInfo_title">회원정보 </div>
	<div id="profileInfo_underline"></div>
	<div id="profileInfo_box">
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">이름:</div>
				<div id="profileInfo_item_info"><input name="i_name" value="${personalInfomation.i_name }"disabled>
				</div>
			</div>
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">전화번호:</div>
				<div id="profileInfo_item_info"><input name="i_phoneNum" value="${personalInfomation.i_phoneNum }"disabled></div>
			</div>
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">이메일:</div>
				<div id="profileInfo_item_info"><input name="i_email" value="${personalInfomation.i_email }"disabled></div>
			</div>
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">자동차브랜드</div>
				<div id="profileInfo_item_info"><input name="i_carbrand" value="${personalInfomation.i_carbrand }"></div>
			</div>	
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">차종</div>
				<div id="profileInfo_item_info"><input name="i_carname" value="${personalInfomation.i_carname }"></div>
			</div>	
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">연식</div>
				<div id="profileInfo_item_info"><input name="i_caryear" value="${personalInfomation.i_caryear }"></div>
			</div>	
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">자동차번호</div>
				<div id="profileInfo_item_info"><input name="i_carnum" value="${personalInfomation.i_carnum }"></div>
			</div>	
		<div id="profileInfo_btns">
			<button type="button" onclick="location.href='/updateInfo'">회원 정보 수정</button>
			<button>회원 탈퇴</button>
		</div>
	</div>	

</div>


</body>
</html>