<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div id="profileInfo_item_info">
				<select id="mc_brand" name="mc_brand" onchange="selectBrand()" value="${personalInfomation.mc_brand }" >
						<option value="Hyundai" 
						<c:if test="${personalInfomation.mc_brand eq 'Hyundai' }">selected</c:if> >현대</option>
						<option value="Kia"
						<c:if test="${personalInfomation.mc_brand eq 'Kia' }">selected</c:if>>기아</option>
						<option value="GM Korea"
						<c:if test="${personalInfomation.mc_brand eq 'GM Korea' }">selected</c:if>
						>GM 대한민국</option>
						<option value="Renault Samsung"
						<c:if test="${personalInfomation.mc_brand eq 'Renault Samsung' }">selected</c:if>
						>르노삼성</option>
						<option value="SsangYong"
						<c:if test="${personalInfomation.mc_brand eq 'SsangYong' }">selected</c:if>
						>쌍용</option>
						<option value="BMW Korea"
						<c:if test="${personalInfomation.mc_brand eq 'BMW Korea' }">selected</c:if>
						>BMW 대한민국</option>
						<option value="Mercedes-Benz Korea"
						<c:if test="${personalInfomation.mc_brand eq 'Mercedes-Benz Korea' }">selected</c:if>
						>메르세데스-벤츠 코리아</option>
					</select>
				
				</div>
			</div>	
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">차종</div>
				<div id="profileInfo_item_info">
				<select id="mc_carname" name="mc_carname">
						<optgroup label="Hyundai">
							<option value="그랜저"
							<c:if test="${personalInfomation.mc_carname eq '그랜저' }">selected</c:if>
							>그랜저</option>
							<option value="소나타"
							<c:if test="${personalInfomation.mc_carname eq '소나타' }">selected</c:if>
							>소나타</option>
							<option value="팰리세이드"
							<c:if test="${personalInfomation.mc_carname eq '팰리세이드' }">selected</c:if>
							>팰리세이드</option>
							<option value="아반떼"
							<c:if test="${personalInfomation.mc_carname eq '아반떼' }">selected</c:if>
							>아반떼</option>
							<option value="쏘나타 하이브리드"
							<c:if test="${personalInfomation.mc_carname eq '쏘나타 하이브리드' }">selected</c:if>
							>쏘나타 하이브리드</option>
						</optgroup>
						<optgroup label="Kia">
							<option value="K5"
							<c:if test="${personalInfomation.mc_carname eq 'K5' }">selected</c:if>
							>K5</option>
							<option value="K7"
							<c:if test="${personalInfomation.mc_carname eq 'K7' }">selected</c:if>
							>K7</option>
							<option value="셀토스"
							<c:if test="${personalInfomation.mc_carname eq '셀토스' }">selected</c:if>
							>셀토스</option>
							<option value="카니발"
							<c:if test="${personalInfomation.mc_carname eq '카니발' }">selected</c:if>
							>카니발</option>
							<option value="니로 하이브리드"
							<c:if test="${personalInfomation.mc_carname eq '니로 하이브리드' }">selected</c:if>
							>니로 하이브리드</option>
						</optgroup>
						<optgroup label="GM Korea">
							<option value="트래버스"
							<c:if test="${personalInfomation.mc_carname eq '트래버스' }">selected</c:if>
							>트래버스</option>
							<option value="말리부"
							<c:if test="${personalInfomation.mc_carname eq '말리부' }">selected</c:if>
							>말리부</option>
							<option value="카마로"
							<c:if test="${personalInfomation.mc_carname eq '카마로' }">selected</c:if>
							>카마로</option>
							<option value="볼트"
							<c:if test="${personalInfomation.mc_carname eq '볼트' }">selected</c:if>
							>볼트</option>
							<option value="스파크"
							<c:if test="${personalInfomation.mc_carname eq '스파크' }">selected</c:if>
							>스파크</option>
						</optgroup>
						<optgroup label="Renault Samsung">
							<option value="SM6"
							<c:if test="${personalInfomation.mc_carname eq 'SM6' }">selected</c:if>
							>SM6</option>
							<option value="QM6"
							<c:if test="${personalInfomation.mc_carname eq 'QM6' }">selected</c:if>
							>QM6</option>
							<option value="SM3 Z.E."
							<c:if test="${personalInfomation.mc_carname eq 'SM3 Z.E.' }">selected</c:if>
							>SM3 Z.E.</option>
							<option value="SM5"
							<c:if test="${personalInfomation.mc_carname eq 'SM5' }">selected</c:if>
							>SM5</option>
							<option value="카디셀"
							<c:if test="${personalInfomation.mc_carname eq '카디셀' }">selected</c:if>
							>카디셀</option>
						</optgroup>
						<optgroup label="SsangYong">
							<option value="티볼리"
							<c:if test="${personalInfomation.mc_carname eq '티볼리' }">selected</c:if>
							>티볼리</option>
							<option value="코란도C"
							<c:if test="${personalInfomation.mc_carname eq '코란도C' }">selected</c:if>
							>코란도C</option>
							<option value="렉스턴"
							<c:if test="${personalInfomation.mc_carname eq '렉스턴' }">selected</c:if>
							>렉스턴</option>
							<option value="렉스턴 스포츠"
							<c:if test="${personalInfomation.mc_carname eq '렉스턴 스포츠' }">selected</c:if>
							>렉스턴 스포츠</option>
							<option value="코로나"
							<c:if test="${personalInfomation.mc_carname eq '코로나' }">selected</c:if>
							>코로나</option>
						</optgroup>
						<optgroup label="BMW Korea">
							<option value="5 시리즈"
							<c:if test="${personalInfomation.mc_carname eq '5 시리즈' }">selected</c:if>
							>5 시리즈</option>
							<option value="7 시리즈"
							<c:if test="${personalInfomation.mc_carname eq '7 시리즈' }">selected</c:if>
							>7 시리즈</option>
							<option value="X3"
							<c:if test="${personalInfomation.mc_carname eq 'X3' }">selected</c:if>
							>X3</option>
							<option value="X5"
							<c:if test="${personalInfomation.mc_carname eq 'X5' }">selected</c:if>
							>X5</option>
							<option value="i3"
							<c:if test="${personalInfomation.mc_carname eq 'i3' }">selected</c:if>
							>i3</option>
						</optgroup>
						<optgroup label="Mercedes-Benz Korea">
							<option value="E 클래스"
							<c:if test="${personalInfomation.mc_carname eq 'E 클래스' }">selected</c:if>
							>E 클래스</option>
							<option value="S 클래스"
							<c:if test="${personalInfomation.mc_carname eq 'S 클래스' }">selected</c:if>
							>S 클래스</option>
							<option value="GLE"
							<c:if test="${personalInfomation.mc_carname eq 'GLE' }">selected</c:if>
							>GLE</option>
							<option value="GLC"
							<c:if test="${personalInfomation.mc_carname eq 'GLC' }">selected</c:if>							
							>GLC</option>
						</optgroup>
					</select>
				
				</div>
			</div>	
			<div class="profileInfo_item">
				<div id="profileInfo_item_title">연식</div>
				<div id="profileInfo_item_info"><input name="mc_year" value="${personalInfomation.mc_year }" maxlength="4" placeholder="연식 4자리 숫자 예 2012년식이면 2012" ></div>
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