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
<link rel="stylesheet" href="resources/css/admin/board/notice_board.css">
<link rel="stylesheet" href="resources/css/admin/board/notice_modal.css">
</head>
<body>
	<input id="whatMenu" value="notice" type="hidden">
	<input id="sm" value="1" type="hidden"> 
	<div id="notice_modal" class="notice_modal hidden"
		style="display: none;">
		<form id="reg_modal" action="reg.notice.do">
			<div class="modal-wrapper">
				<div class="notice_modalcontent">
					<div class="notice_header">공지사항</div>
					<div id="notice_modal_main_content">
						<input type="hidden" name="n_no" id="idInput_M">

						<table class="modal_table" border="1">
							<tr>
								<td class="left_td">구분</td>
								<td width="100px;">
									<select name="selectOption"id="sortationSelect_M" class="notice_select">
										<option value="안내">안내</option>
										<option value="매장">매장</option>
										<option value="프로모션">프로모션</option>
									</select>
								</td>
								<td class="left_td">제목</td>
								<td><input name="n_title" id="titleInput_M"></td>
							</tr>
							<tr>
								<td class="left_td">내용</td>
								<td align="center" colspan="3"><textarea name="n_txt"
										id="txtInput_M"></textarea></td>
							</tr>
						</table>

					</div>
					<div class="modalBtn">
						<button class="modalBtn1">저장</button>
						<button class="modalBtn2" id="cancleModal" type="button">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>



	<div class="container sub">
		<div class="DashBoard">
			<form class="notice_form" action="search.do">
				<div>
					<div class="select_box">
						<div class="no-drag">구분</div>
						<select name="selectOption" id="sortationSelect"
							class="notice_select">
							<option value="0">전체</option>
							<option value="1">안내</option>
							<option value="2">매장</option>
							<option value="3">프로모션</option>
						</select>
					</div>
					<div class="input_box">
						<div class="no-drag">제목</div>
						<input name="titleInput" id="n_title" value="${searchVal }">
					</div>
					<div class="button_box">
						<button id="searchBtn" class="noticeregBtn">검색</button>
						<button type="button" class="noticeregBtn"
							id="notice_reg_modal">신규 등록</button>
					</div>
				</div>


				<div class="DashBoard nb_content">
					<table class="notice_content">
						<tr>
							<th class="th_head">No</th>
							<th class="th_head">구분</th>
							<th class="th_head">제목</th>
							<th class="th_head">게시일</th>
							<th class="th_head">관리</th>
						</tr>
						<c:if test="${empty notices}">
							<tr>
								<td colspan="5">해당 목록이없습니다</td>
							</tr>
						</c:if>
						<c:forEach var="n" items="${notices }" varStatus="status">
							<tr>
								<td class="td_c1">${status.count }</td>
								<td class="td_c2">${n.n_sortation }</td>
								<td class="td_c3">${n.n_title }</td>
								<td class="td_c4"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm:ss" value="${n.n_date }" /></td>
								<td class="td_c5">
									<div class="tdBtn">
										<button id="updBtn" type="button"
											onclick="updateNotice('${n.n_no}','${n.n_sortation }','${n.n_title }','${n.n_txt } ','${n.n_date }')">수정</button>
										<button id="delBtn" type="button"
											onclick="deleteNotice(${n.n_no})">삭제</button>
									</div>
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
			<a style="color: black;" href="notice.page.change?p=${curPage - 1 }">이전</a>
		</c:if>

		<c:forEach var="page" begin="1" end="${pageCount }">
			<c:choose>
					<c:when test="${page eq param.p or (curPage == 1 and curPage == page)}">
						<a style="color:white; background-color: #333;" href="notice.page.change?p=${page }">${page } </a>
					</c:when>
					<c:otherwise>
						<a style="color: black;" href="notice.page.change?p=${page }">${page } </a>
					</c:otherwise>
				</c:choose>
		</c:forEach>
		<c:if test="${curPage != pageCount }">
			<a style="color: black;" href="notice.page.change?p=${curPage + 1 }">다음</a>
		</c:if>
	</div>
	<script src="resources/js/admin/board/notice_board.js"></script>
</body>
</html>