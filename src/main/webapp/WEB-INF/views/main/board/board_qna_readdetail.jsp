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
	<div>
		<div class="board_qna_rd_rowAndValue">
			<div>처리현황</div>
			<c:choose>
				<c:when test="${!empty qna.q_reply}">
					<div>
						답변완료 <i class="fa-solid fa-circle-check" style="color: #ab1e21; font-size: 20px;"></i>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						답변대기
					</div>
				</c:otherwise>
			</c:choose>
			<div>제목</div>
			<div>${qna.q_title}</div>
			<div>내용</div>
			<div>${qna.q_txt}</div>
			<c:if test="${!empty qna.q_reply}">
				<div>답변내용</div>
				<div>${qna.q_reply.q_reply_txt }</div>
			</c:if>
		</div>
	
		<div class="board_qna_rd_buttons">
			<c:if test="${empty qna.q_reply}">
				<button class="board_qna_buttonRed" onclick="location.href='board.qna.update.go?q_no=' + ${qna.q_no}">수정</button>
			</c:if>
			<button class="board_qna_buttonGray" onclick="deleteQna(${qna.q_no});">삭제</button>
			<button class="board_qna_buttonGray" onclick="location.href='board.qna.read'">내 문의목록</button>
		</div>
	</div>
</body>
</html>