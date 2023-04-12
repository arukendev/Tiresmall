<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="board_mainContainerSinnzidai">
		<div class="board_title">
			${board_whereAmITwo }
		</div>
		
		<div class="board_link">
			<div>
				<a href="/home"><i class="fa-solid fa-house"></i></a> <i class="fa-solid fa-chevron-right"></i> <a href="board.home">고객센터</a> ${board_whereAmIOne }
			</div>
		</div>
	
		<div class="board_sideMenu">
			<div>
				<a class="board_sideMenuList board_home" href="board.home">고객센터</span></a>
			</div>
			
			<br>
			<br>
			
			<div>
				<a class="board_sideMenuList board_faq" href="board.faq.read.search?f_sortation=">FAQ</a>
			</div>
			<div>
				<a class="board_sideMenuList board_qna" href="board.qna.check">1:1문의 <img class="board_qnaAndKakaoLogo" src="resources/web/main/board/qnalogo.png"/></a>
			</div>
			<div>
				<a class="board_kakao" href="javascript:board_openKakao_new()" style="cursor: pointer">카카오톡상담 <img class="board_qnaAndKakaoLogo" src="resources/web/main/board/kakaologo.png"/></a>
			</div>
			
			<br>
			
			<div>
				<a class="board_sideMenuList board_notice" href="board.notice.read">공지사항</a>
			</div>
			<div>
				<a class="board_sideMenuList board_event" href="board.event.read">이벤트</a>
			</div>
		</div>
		
		<div class="board_sideVoid"></div>
		
		<div class="board_sideInfoSinnzidai">
			<i class="fa-solid fa-headphones"></i> 전화문의<br>
			<span class="board_sideInfoSinnzidai_20px">
			<a href='tel:010-5125-8008'><span class="board_sideInfo_bold">010-5125-8008</span></a><br>
			</span>
			<br>
			<i class="fa-solid fa-clock"></i> 운영시간<br>
			<span class="board_sideInfoSinnzidai_20px">
			평일<span class="tab">&#9;</span><span class="board_sideInfo_bold">08:30 - 19:00</span><br>
			토요일<span class="tab">&#9;</span><span class="board_sideInfo_bold">08:30 - 16:00</span><br>
			</span>
			(일요일 휴무)
		</div>
		
		<div class="board_contentsArea">
			<input class="whereAmI" value="${board_whereAmITwo }" type="hidden">
			<jsp:include page="${board_contents }"></jsp:include>
		</div>
	</div>
</body>
</html>