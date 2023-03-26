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
	<div class="board_event_r_column">
		<div>번호</div>
		<div>
			<img src="resources/web/main/board/eventicon.png"/>
			<div>
				항상 멋진 이벤트로 여러분께 찾아뵙겠습니다!
			</div>
		</div>
		<div>진행여부</div>
	</div>
	
	<c:choose>
		<c:when test="${empty events }">
			<div class="board_event_r_none">
				<div>
					등록된 이벤트가 없습니다
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<c:set var="num" value="${eventCount - ((pageNumber - 1) * countPerPage) }"/>
			<c:forEach var="e" items="${events }">
				<div class="board_event_r_list">
					<div>
						${num }
					</div>
					<div>
						<a href="board.event.readdetail?e_no=${e.e_no}">${e.e_title }</a>
					</div>
					<div>
						<c:choose>
							<c:when test="${e.e_status == '진행중'}">
								<div style="padding-top: 2px;">
									<span style="font-weight: 500;">${e.e_status }</span>
								</div>
							</c:when>
							<c:otherwise>
								<div></div>
								<div style="bottom: 0;">
									${e.e_status }
								</div>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${e.e_status == '진행중'}">
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
				</div>
				<c:set var="num" value="${num-1 }"/>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	<div class="board_event_r_buttons">
		<div></div>
		
		<c:choose>
			<c:when test="${empty events }">
				<div></div>
			</c:when>
			<c:otherwise>
				<div class="board_event_r_pagingButtons">
					<c:choose>
						<c:when test="${pageNumber != 1 }">
							<div>
								<a href="board.event.read.paging?pn=1"><i class="fa-solid fa-angles-left"></i></a>
							</div>
							<div>
								<a href="board.event.read.paging?pn=${pageNumber - 1 }"><i class="fa-solid fa-chevron-left"></i></a>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<i class="fa-solid fa-angles-left" style="color:lightgray"></i>
							</div>
							<div>
								<i class="fa-solid fa-chevron-left" style="color:lightgray"></i>
							</div>
						</c:otherwise>
					</c:choose>
					
					<%--
					<c:forEach var="page" begin="${begin }" end="${end }">
					 --%>
					<%--
					 --%>
					<c:forEach var="page" begin="1" end="${pageCount }">
						<c:choose>
							<c:when test="${(page == param.pn) or (pageNumber == 1 and pageNumber == page) }">
								<div class="board_event_r_pagingButtons_selected">
									<a href="board.event.read.paging?pn=${page }" style="color: #fff;">${page }</a>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<a href="board.event.read.paging?pn=${page }">${page }</a>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pageNumber != pageCount }">
							<div>
								<a href="board.event.read.paging?pn=${pageNumber + 1 }"><i class="fa-solid fa-chevron-right"></i></a>
							</div>
							<div>
								<a href="board.event.read.paging?pn=${pageCount }"><i class="fa-solid fa-angles-right"></i></a>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<i class="fa-solid fa-chevron-right" style="color:lightgray"></i>
							</div>
							<div>
								<i class="fa-solid fa-angles-right" style="color:lightgray"></i>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</c:otherwise>
		</c:choose>
		
		<div>
		</div>
	</div>
</body>
</html>