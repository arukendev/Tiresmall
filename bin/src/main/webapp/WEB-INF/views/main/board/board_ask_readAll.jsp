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
		<div class="board_ask_readAll_column">
			<div>번호</div>
			<div>제목</div>
			<div>등록일</div>
			<div>처리현황</div>
		</div>
		
		<div>
			<c:choose>
				<c:when test="${empty asks }">
					<div class="board_ask_readAll_none">
						<div>
							등록된 문의내용이 없습니다
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:set var="num" value="${askCount - ((pageNumber - 1) * countPerPage) }"/>
					<c:forEach var="a" items="${asks }">
						<div class="board_ask_readAll_list">
							<div>
								${num }
							</div>
							<div>
								<a href="board.ask.readone?q_no=${a.q_no}">${a.q_title }</a>
							</div>
							<div>
								<fmt:formatDate value="${a.q_date }" pattern="yyyy-MM-dd"/>
							</div>
							<!-- 
							<div>
							<%--
								${a.a_status }
							 --%>
							</div>
							 -->
							<c:choose>
								<c:when test="${!empty a.a_reply}">
									<div>
										답변완료 <i class="fa-regular fa-circle-check"></i>
									</div>
								</c:when>
								<c:otherwise>
									<div>
										답변대기
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<c:set var="num" value="${num-1 }"/>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="board_ask_readAll_buttons">
			<div></div>
			
			<div class="board_ask_readAll_pagingButtons">
				<c:choose>
					<c:when test="${pageNumber != 1 }">
						<div>
							<a href="board.ask.readall.paging?pn=1"><i class="fa-solid fa-angles-left"></i></a>
						</div>
						<div>
							<a href="board.ask.readall.paging?pn=${pageNumber - 1 }"><i class="fa-solid fa-chevron-left"></i></a>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<i class="fa-solid fa-angles-left"></i>
						</div>
						<div>
							<i class="fa-solid fa-chevron-left"></i>
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
							<div class="board_ask_readAll_pagingButtons_selected">
								<a href="board.ask.readall.paging?pn=${page }" style="color: #fff;">${page }</a>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<a href="board.ask.readall.paging?pn=${page }">${page }</a>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pageNumber != pageCount }">
						<div>
							<a href="board.ask.readall.paging?pn=${pageNumber + 1 }"><i class="fa-solid fa-chevron-right"></i></a>
						</div>
						<div>
							<a href="board.ask.readall.paging?pn=${pageCount }"><i class="fa-solid fa-angles-right"></i></a>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<i class="fa-solid fa-chevron-right"></i>
						</div>
						<div>
							<i class="fa-solid fa-angles-right"></i>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div>
				<button class="board_ask_buttonRed" onclick="location.href='board.ask.create.go'">문의등록</button>
			</div>
		</div>
	</div>
</body>
</html>