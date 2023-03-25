<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div class="board_event_rd_rowAndValue">
			<div>제목</div>
			<div>${event.e_title}</div>
			<div>진행여부</div>
			<div>
				<c:choose>
					<c:when test="${event.e_status == '진행중'}">
						<div style="padding-top: 1px;">
							<span style="font-weight: 500;">${event.e_status }</span>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							${event.e_status }
						</div>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${event.e_status == '진행중'}">
						<div>
							<img class="tire-rotate" src="resources/web/main/board/qnacomplete.png"/>
						</div>
					</c:when>
					<c:otherwise>
						<div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
				<div>
					<img src="resources/upload-event/${event.e_mainimg }">
				</div>
				<c:forEach var="d" items="${detailimgs }">
					<div>
						<img src="resources/upload-event/${d }">
					</div>
				</c:forEach>
			</div>
			<div>
			</div>
			<div>
				${event.e_content }
			</div>
		</div>
	
		<div class="board_event_rd_buttons">
			<button class="board_qna_buttonGray" onclick="location.href='board.event.read'">이벤트 목록</button>
		</div>
	</div>
</body>
</html>