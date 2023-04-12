<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="subMenu">
		<div class="subMenuContent1" onclick="location.href='admin.notice.go'">공지사항 관리</div>
		<div class="subMenuContent2" onclick="location.href='admin.qna.go'">1:1문의 관리</div>
		<div class="subMenuContent3" onclick="location.href='admin.faq.go'">FAQ</div>
		<div class="subMenuContent4" onclick="location.href='admin.event.go'">이벤트</div>
		<div class="subMenuContent5">
			<a
                href="javascript:board_openKakao_new_admin()"
                class="index_kakao"
                style="cursor: pointer"
                >카카오톡상담
                <img
                  src="resources/web/main/board/kakaologo.png"
                  style="width: 16px"
                />
			</a>
              
			<!-- 
			<img
				onclick="board_openKakao_new_admin()"
				style="cursor: pointer; width: 80px; position: relative; top: 2px;"
				src="resources/web/main/board/tsd.png"
			/>
			 -->
		</div>
	</div>
</body>
</html>