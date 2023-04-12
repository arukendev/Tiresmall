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
	<div class="board_notice_r_column">
		<div>번호</div>
		<div>
			<img src="resources/web/main/board/noticeicon.png"/>
			<div>
				고객 여러분께 전달드리는 공지사항입니다.
			</div>
		</div>
		<div>등록일</div>
	</div>
	
	<c:choose>
		<c:when test="${empty notices }">
			<div class="board_notice_r_none">
				<div>
					등록된 공지사항이 없습니다
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<c:set var="num" value="${noticeCount - ((pageNumber - 1) * countPerPage) }"/>
			<c:forEach var="n" items="${notices }">
				<div class="board_notice_r_list">
					<div>
						${num }
					</div>
					<div>
						<a href="board.notice.readdetail?n_no=${n.n_no}">${n.n_title }</a>
					</div>
					<div>
						<fmt:formatDate value="${n.n_date }" pattern="yyyy-MM-dd"/>
					</div>
				</div>
				<c:set var="num" value="${num-1 }"/>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	<div class="board_notice_r_buttons">
		<div></div>
		
		<c:choose>
			<c:when test="${empty notices }">
				<div></div>
			</c:when>
			<c:otherwise>
				<div class="board_notice_r_pagingButtons">
					<c:choose>
						<c:when test="${pageNumber != 1 }">
							<div>
								<a href="board.notice.read.paging?pn=1"><i class="fa-solid fa-angles-left"></i></a>
							</div>
							<div>
								<a href="board.notice.read.paging?pn=${pageNumber - 1 }"><i class="fa-solid fa-chevron-left"></i></a>
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
								<div class="board_notice_r_pagingButtons_selected">
									<a href="board.notice.read.paging?pn=${page }" style="color: #fff;">${page }</a>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<a href="board.notice.read.paging?pn=${page }">${page }</a>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pageNumber != pageCount }">
							<div>
								<a href="board.notice.read.paging?pn=${pageNumber + 1 }"><i class="fa-solid fa-chevron-right"></i></a>
							</div>
							<div>
								<a href="board.notice.read.paging?pn=${pageCount }"><i class="fa-solid fa-angles-right"></i></a>
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