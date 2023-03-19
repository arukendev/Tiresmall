<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="board_faq_column">
		<div>전체</div>
		<div>주문/배송</div>
		<div>상품</div>
		<div>장착</div>
		<div>반품/교환/취소</div>
		<div>기타</div>
	</div>
	
	<div>
		<div>
			<%--
			<c:if test="${!empty 검색어 }">
			 --%>
				"ㅁㅁ"로 검색한 결과: ㅁㅁ건
			<%--
			</c:if>
			 --%>
		</div>
		
		<div>
			<select>
			    <option value="all">전체</option>
			    <option value="title">제목</option>
			    <option value="txt">내용</option>
			</select>
			<input>
			<a>조회</a>
		</div>
	</div>
	
	<div class="board_faq_listContainer">
		<c:choose>
			<c:when test="${empty faqs }">
				<div class="board_faq_none">
					<div>
						조회된 데이터가 없습니다.
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="f" items="${faqs }">
					<div class="board_faq_list">
						<div>
							Q
						</div>	
						<div class="board_faq_list_title">
							${f.f_title }
						</div>
						<div>
							A
						</div>
						<div class="board_faq_list_txt">
							${f.f_txt }
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="board_faq_buttons">
		<div></div>
		
		<c:choose>
			<c:when test="${empty faqs }">
				<div></div>
			</c:when>
			<c:otherwise>
				<div class="board_faq_pagingButtons">
					<c:choose>
						<c:when test="${pageNumber != 1 }">
							<div>
								<a href="board.faq.paging?pn=1"><i class="fa-solid fa-angles-left"></i></a>
							</div>
							<div>
								<a href="board.faq.paging?pn=${pageNumber - 1 }"><i class="fa-solid fa-chevron-left"></i></a>
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
								<div class="board_faq_pagingButtons_selected">
									<a href="board.faq.paging?pn=${page }" style="color: #fff;">${page }</a>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<a href="board.faq.paging?pn=${page }">${page }</a>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:choose>
						<c:when test="${pageNumber != pageCount }">
							<div>
								<a href="board.faq.paging?pn=${pageNumber + 1 }"><i class="fa-solid fa-chevron-right"></i></a>
							</div>
							<div>
								<a href="board.faq.paging?pn=${pageCount }"><i class="fa-solid fa-angles-right"></i></a>
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