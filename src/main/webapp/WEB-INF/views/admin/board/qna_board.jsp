<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>board</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/admin/board/qna_board.css">
<link rel="stylesheet" href="resources/css/admin/board/qna_modal.css">
</head>
<body>
	<input id="whatMenu" value="notice" type="hidden">
	<input id="sm" value="2" type="hidden"> 
	<div id="qna_modal" class="qna_modal hidden"
		style="display: none;">

		<form id="update_modal" action="qna.reply.reg.do">
		<!-- 
		<form id="update_modal" action="update.qna.do">
		 -->
			<div class="modal-wrapper">
				<div class="notice_modalcontent">
					<div class="notice_header">QnA</div>
					<div id="qna_modal_main_content">
						<input type="hidden" name="q_no" id="noInput_M">

						<table class="modal_table">
							<tr>
								<td class="left_td">회원명</td>
								<td class="modal_table_td"><input name="a_name" id="userName_M" disabled="disabled" class="modalInput" placeholder="회원명"></td>
							</tr>
							<tr>
								<td class="left_td">아이디</td>
								<td class="modal_table_td"><input name="q_id" id="userId_M" disabled="disabled" class="modalInput" placeholder="아이디"></td>
							</tr>
							<tr>
								<td class="left_td">작성일</td>
								<td class="modal_table_td"><input name="q_date" id="date_M" disabled="disabled" class="modalInput" placeholder="작성일"></td>
							</tr>
							<tr>
								<td class="left_td">내용</td>
								<td class="modal_table_td" align="center" colspan="4"><textarea name="q_txt"
									id="txtInput_M"	disabled="disabled"></textarea></td>
							</tr>
							<tr>
								<td class="left_td">답변</td>
								<td class="modal_table_td" align="center" colspan="4"><textarea name="q_reply_txt"
										id="txtInput_Reply"></textarea></td>
							</tr>
						</table>

					</div>
					<div class="modalBtn">
						<button class="modalBtn1">답변수정</button>
						<button class="modalBtn2" id="cancleModal" type="button">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>



	<div class="container sub">
		<div class="DashBoard">
			<form class="notice_form" action="search.qna.do">
				<div>
					<div class="input_box2">
						<div class="no-drag">회원명</div>
						<input name="nameInput" id="a_name" value="${search.nameInput }">
					</div>
					<div class="input_box1">
						<div class="no-drag" style="font-size: 17px;">회원아이디</div>
						<input name="idInput" id="q_id" value="${search.idInput }">
					</div>
					<div class="input_box">
						<div class="no-drag">제목</div>
						<input name="titleInput" id="q_title" value="${search.titleInput }">
					</div>
					<div class="button_box">
						<button id="searchBtn" class="noticesearchbtn">검색</button>
					</div>
				</div>


				<div class="DashBoard nb_content">
					<table class="notice_content">
						<tr>
							<th class="th_head">No</th>
							<th class="th_head">회원명</th>
							<th class="th_head">회원아이디</th>
							<th class="th_head">제목</th>
							<th class="th_head">게시일</th>
							<th class="th_head">답변여부</th>
						</tr>
						<c:if test="${empty qnas}">
							<tr>
								<td colspan="5">해당 목록이없습니다</td>
							</tr>
						</c:if>
						<c:forEach var="q" items="${qnas }" varStatus="status">
							<tr class="qna_modal_go">
								<td class="td_c1">${status.count }
									<input type="hidden" value="${q.q_no }">
								</td>
								<td class="td_c2">${q.i_name }</td>
								<td class="td_c3">${q.u_id }</td>
								<td style="display: none;">${q.q_txt}</td>
								<td class="td_c4">${q.q_title }</td>
								<td class="td_c5">
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${q.q_date }" />
								</td>
								<td style="display: none;">${q.q_txt}</td>
								<td class="td_c6">
									<input type="hidden" value="${q.q_reply_has }">	
									<c:choose>
										<c:when test="${q.q_reply_has ne 0}">완료</c:when>
										<c:otherwise>미답변</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</form>
		</div>
	</div>
	<div id="paging-box">
		<c:if test="${curPage != 1 }">
			<a style="color: black;" href="qna.page.change?p=${curPage - 1 }">이전</a>
		</c:if>

		<c:forEach var="page" begin="1" end="${pageCount }">
			<c:choose>
					<c:when test="${page eq param.p or (curPage == 1 and curPage == page)}">
						<a style="color:white; background-color: #333;" href="qna.page.change?p=${page }">${page } </a>
					</c:when>
					<c:otherwise>
						<a style="color: black;" href="qna.page.change?p=${page }">${page } </a>
					</c:otherwise>
				</c:choose>
		</c:forEach>
		<c:if test="${curPage != pageCount }">
			<a style="color: black;" href="qna.page.change?p=${curPage + 1 }">다음</a>
		</c:if>
	</div>
	<script src="resources/js/admin/board/qna_board.js"></script>
</body>
</html>