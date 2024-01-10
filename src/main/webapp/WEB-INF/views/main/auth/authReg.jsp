<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대전 타이어쇼핑몰</title>
<link
rel="shortcut icon"
href="resources/web/favicon.png"
type="image/png"
/>
<link rel="icon" href="resources/web/favicon.png" type="image/png" />
<link rel="stylesheet" href="resources/css/main/auth/auth.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main/auth/reg_check.js"></script>
</head>
<body>
	<form action="authReg.do" method="post" name="join_form"
		onsubmit="return joinCheck()">
		<!-- 홈페이지 회원 가입의 경우 타입 1번 -->
		<input name="u_logintype" value="1" type="hidden">
		<!-- default value는 1 , 이메일 인증완료시 value 2 -->
		<input name="emailConfirm" value="1" type="hidden">
		
		
		<div id="join_container">
			<div id="join_logo">
				<a href="/home"> <img alt="" src="resources/web/logo.png">
				</a>
			</div>
			<div class="join_box">
				<div class="join_title">아이디</div>
				<div id="id_input">
					<input name="u_id" oninput="checkId()">
				</div>
				<span id="checkID_result"></span>
			</div>
			<div class="join_box">
				<div class="join_title">비밀번호</div>
				<div id="pw_input">
					<input name="pw_password" type="password">
				</div>
				<div class="join_title">비밀번호확인</div>
				<div id="pwCheck_input">
					<input name="pw_pwCheck" type="password">
				</div>
			</div>
			<div class="join_box">
				<div class="join_title">이름</div>
				<div id="name_input">
					<input name="i_name">
				</div>
			</div>
			<div class="join_box">
				<div class="join_title">휴대폰번호</div>
				<div id="phoneNum_input">
					<input name="i_phoneNum" type="number" maxlength="11">
				</div>
			</div>
			<div class="join_box">
				<div class="join_title">이메일</div>
				<div id="email_inputCheck">
					<input name="i_email" id="i_email">
				</div>
				<div id="email_input">
					<input name="i_emailCheck" id="i_emailCheck">
					<button type="button" id="mail_Check">인증번호 받기</button>
					<button type="button" id="authnum_check">인증번호 확인</button>
				</div>
			</div>

			<div class="join_box_carInfo">
				<div class="join_title">브랜드</div>
				<div id="name_input">
					<select id="mc_brand" name="mc_brand" onchange="selectBrand()">
						<option value="Hyundai">현대</option>
						<option value="Kia">기아</option>
						<option value="GM Korea">GM 대한민국</option>
						<option value="Renault Samsung">르노삼성</option>
						<option value="SsangYong">쌍용</option>
						<option value="BMW Korea">BMW 대한민국</option>
						<option value="Mercedes-Benz Korea">메르세데스-벤츠 코리아</option>
					</select>
				</div>
			</div>
			<div class="join_box_carInfo">
				<div class="join_title">차량모델</div>
				<div id="name_input">
					<select id="mc_carname" name="mc_carname">
						<optgroup label="Hyundai">
							<option value="그랜저">그랜저</option>
							<option value="소나타">소나타</option>
							<option value="팰리세이드">팰리세이드</option>
							<option value="아반떼">아반떼</option>
							<option value="쏘나타 하이브리드">쏘나타 하이브리드</option>
						</optgroup>
						<optgroup label="Kia">
							<option value="K5">K5</option>
							<option value="K7">K7</option>
							<option value="셀토스">셀토스</option>
							<option value="카니발">카니발</option>
							<option value="니로 하이브리드">니로 하이브리드</option>
						</optgroup>
						<optgroup label="GM Korea">
							<option value="트래버스">트래버스</option>
							<option value="말리부">말리부</option>
							<option value="카마로">카마로</option>
							<option value="볼트">볼트</option>
							<option value="스파크">스파크</option>
						</optgroup>
						<optgroup label="Renault Samsung">
							<option value="SM6">SM6</option>
							<option value="QM6">QM6</option>
							<option value="SM3 Z.E.">SM3 Z.E.</option>
							<option value="SM5">SM5</option>
							<option value="카디셀">카디셀</option>
						</optgroup>
						<optgroup label="SsangYong">
							<option value="티볼리">티볼리</option>
							<option value="코란도C">코란도C</option>
							<option value="렉스턴">렉스턴</option>
							<option value="렉스턴 스포츠">렉스턴 스포츠</option>
							<option value="코나">코나</option>
						</optgroup>
						<optgroup label="BMW Korea">
							<option value="5 시리즈">5 시리즈</option>
							<option value="7 시리즈">7 시리즈</option>
							<option value="X3">X3</option>
							<option value="X5">X5</option>
							<option value="i3">i3</option>
						</optgroup>
						<optgroup label="Mercedes-Benz Korea">
							<option value="E 클래스">E 클래스</option>
							<option value="S 클래스">S 클래스</option>
							<option value="GLE">GLE</option>
							<option value="GLC">GLC</option>
							<option value="EQC">
						</optgroup>
					</select>
				</div>
			</div>
			<div class="join_box_carInfo">
				<div class="join_title">연식</div>
				<div id="name_input">
					<input name="mc_year" maxlength="4" type="number">
				</div>
			</div>
			<div class="join_box_carInfo">
				<div class="join_title">차량번호</div>
				<div id="name_input">
					<input name="mc_number">
				</div>
			</div>



			<div id="join_btn">
				<button>회원가입하기</button>
			</div>
		</div>
	</form>









</body>
</html>