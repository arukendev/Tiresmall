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
	<div class="board_qna_r_column">
		<div>번호</div>
		<div>제목</div>
		<div>등록일</div>
		<div>처리현황</div>
	</div>
	
	<c:choose>
		<c:when test="${empty qnas }">
			<div class="board_qna_r_none">
				<div>
					등록된 문의내용이 없습니다
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<c:set var="num" value="${qnaCount - ((pageNumber - 1) * countPerPage) }"/>
			<c:forEach var="q" items="${qnas }">
				<div class="board_qna_r_list">
					<div>
						${num }
					</div>
					<div>
						<a href="board.qna.readdetail?q_no=${q.q_no}">${q.q_title }</a>
					</div>
					<div>
						<fmt:formatDate value="${q.q_date }" pattern="yyyy-MM-dd"/>
					</div>
					<c:choose>
						<c:when test="${!empty q.q_reply}">
							<div>
								<span style="font-weight: 500;">답변완료</span> <i class="fa-solid fa-circle-check board_qna_bounce" style="color: #07b2f6; font-size: 20px;"></i>
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
	
	<div class="board_qna_r_buttons">
		<div></div>
		
		<c:choose>
			<c:when test="${empty qnas }">
				<div></div>
			</c:when>
			<c:otherwise>
				<div class="board_qna_r_pagingButtons">
					<c:choose>
						<c:when test="${pageNumber != 1 }">
							<div>
								<a href="board.qna.read.paging?pn=1"><i class="fa-solid fa-angles-left"></i></a>
							</div>
							<div>
								<a href="board.qna.read.paging?pn=${pageNumber - 1 }"><i class="fa-solid fa-chevron-left"></i></a>
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
								<div class="board_qna_r_pagingButtons_selected">
									<a href="board.qna.read.paging?pn=${page }" style="color: #fff;">${page }</a>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<a href="board.qna.read.paging?pn=${page }">${page }</a>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pageNumber != pageCount }">
							<div>
								<a href="board.qna.read.paging?pn=${pageNumber + 1 }"><i class="fa-solid fa-chevron-right"></i></a>
							</div>
							<div>
								<a href="board.qna.read.paging?pn=${pageCount }"><i class="fa-solid fa-angles-right"></i></a>
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
			<button class="board_qna_buttonRed" onclick="location.href='board.qna.create.go'">문의등록</button>
		</div>
	</div>
</body>
</html>