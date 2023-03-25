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
	<div class="board_qna_home">
		<div>무엇을 도와드릴까요?</div>
		<div>
			<form class="board_faq_search_iroiro" action="board.faq.read.search">
				<select name="faqSearchSelection">
				    <option value="1" <c:if test="${faqSearchSelectionAfterSearch == 1 }">selected="selected"</c:if>>전체</option>
				    <option value="2" <c:if test="${faqSearchSelectionAfterSearch == 2 }">selected="selected"</c:if>>제목</option>
				    <option value="3" <c:if test="${faqSearchSelectionAfterSearch == 3 }">selected="selected"</c:if>>내용</option>
				</select>
				<input name="faqSearch" value=${faqSearchAfterSearch }>
				<button>조회</button>
			</form>
		</div>		
		<div>
			<div onclick="location.href='board.faq.read.search?f_sortation=주문/배송'" style="cursor:pointer;">주문/배송</div>
			<div onclick="location.href='board.faq.read.search?f_sortation=상품'" style="cursor:pointer;">상품</div>
			<div onclick="location.href='board.faq.read.search?f_sortation=장착'" style="cursor:pointer;">장착</div>
			<div onclick="location.href='board.faq.read.search?f_sortation=반품/교환/취소'" style="cursor:pointer;">반품/교환/취소</div>
		</div>
		<div>
			<a href="board.qna.check">
				<img src="resources/web/main/board/qnalogo.png"/>
			</a>
			<a class="board_sideMenuList" href="board.qna.check">1:1문의하기</a>
		</div>
		<div>
			<img src="resources/web/main/board/kakaologo.png" onclick="board_openKakao_new()"/>
			<a href="javascript:board_openKakao_new()" style="cursor: pointer">카카오톡상담하기</a>
		</div>
	</div>
</body>
</html>