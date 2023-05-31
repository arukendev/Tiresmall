<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>



<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>event board</title>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet" href="resources/css/admin/board/event_board.css">
<link rel="stylesheet" href="resources/css/admin/board/event_modal.css">
</head>
<body>
	<input id="whatMenu" value="notice" type="hidden">
	<input id="sm" value="4" type="hidden">
	<div id="event-modal" class="event_modal hidden" style="display: none;">

		<form id="event-reg-form" action="event.reg" enctype="multipart/form-data" method="post">
			<div class="modal-wrapper">
				<div class="notice_modalcontent">
					<div class="notice_header">Event</div>
					<div>
						<table class="modal_table">
							<tr>
								<td class="left_td">제목</td>
								<td>
									<input name="e_title" id="e_title"
									class="modalInput" required="required">
								</td>
							</tr>
							<tr>
								<td class="left_td">내용</td>
								<td>
									<textarea name="e_content"
										id="e_content" required="required"></textarea>
								</td>
							</tr>
							<tr>
								<td class="left_td">종료일</td>
								<td>
									<input name="e_duration" id="e_duration" autocomplete="off" required="required" maxlength="10">
								</td>
							</tr>
							<tr>
								<td class="left_td">메인이미지</td>
								<td align="center">
									<input type="file" name="mainimg" id="e_mainimg" required="required">
								</td>
							</tr>
							<tr>
								<td class="left_td">상세이미지</td>
								<td align="center">
									<input type="file" multiple="multiple" name="detailimg[]" id="e_detailimg" required="required">
								</td>
							</tr>
							<tr>
								<td class="left_td">상태</td>
								<td align="center">
								<label>
									<input type="radio" name="e_status" value="진행중" checked="checked"> 진행중&nbsp;&nbsp;
								</label>
								<label>
									<input type="radio" name="e_status" value="마감"> 마감&nbsp;&nbsp;
								</label>
								<label>
									<input type="radio" name="e_status" value="예정"> 예정&nbsp;&nbsp;
								</label>
								</td>
							</tr>
						</table>

					</div>
					<div class="modalBtn">
						<button class="modalBtn1">등록</button>
						<button class="modalBtn2" id="cancleModal" type="button">취소</button>
					</div>
				</div>
			</div>
		</form>
	</div>



	<div class="container sub">
		<div class="DashBoard">
				<div class="DashBoard nb_content">
					<div id="event-reg-btn-box">수정하시려면 사진이나 제목을 눌러주세요.
						<button id="event-reg-btn" class= "noticeregBtn">신규 등록</button>
					</div>
					<div id="admin-event-table-content">
						<table class="notice_content">
							<tr>
								<th class="th_head">No</th>
								<th class="th_head">메인 이미지</th>
								<th class="th_head">제목</th>
								<th class="th_head">등록일</th>
								<th class="th_head">마감 기한</th>
								<th class="th_head">팝업 유무</th>
								<th class="th_head">상태</th>
	
							</tr>
							<c:if test="${empty events}">
								<tr>
									<td colspan="5">해당 목록이없습니다</td>
								</tr>
							</c:if>
							<c:forEach var="e" items="${events }" varStatus="status">
								<tr class="event-tr">
									<td class="td_c1">${status.count }</td>
									<td class="td_c3"
										onclick="location.href='event.detail?e_no=${e.e_no }'"><img
										alt="" src="resources/upload-event/${e.e_mainimg }"></td>
									<td class="td_c4"
										onclick="location.href='event.detail?e_no=${e.e_no }'">
										<div id="admin-event-table-td-padding">
											${e.e_title }
										</div>	
									</td>
									<td class="td_c2">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${e.e_date }" />
									</td>
	
									<td class="td_c2">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${e.e_duration }" />
									</td>
									<td class="td_c1">
										<c:if test="${e.e_popup == 1 }">
											<button type="button" class="admin_printBTN on-off" value="${e.e_no }">
												on
											</button>
										</c:if> 
										<c:if test="${e.e_popup == 0 }">
											<button type="button" class="admin_notPrintBTN on-off" value="${e.e_no }">
												off
											</button>
										</c:if>
									</td>
									<td class="td_c2">
										<c:choose>
											<c:when test="${e.e_status eq '진행중' }">
												<button type="button" class="admin-event-status-progress event-status" value="${e.e_no }">
													진행중
												</button>
											</c:when>
											<c:when test="${e.e_status eq '마감' }">
												<button type="button" class="admin-event-status-deadline event-status" value="${e.e_no }">
													마감
												</button>
											</c:when>
											<c:when test="${e.e_status eq '예정' }">
												<button type="button" class="admin-event-status-planning event-status" value="${e.e_no }">
													예정
												</button>
											</c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
		</div>
	</div>
	<div id="paging-box">
		<c:if test="${curPage != 1 }">
			<a style="color: black;" href="event.page.change?p=${curPage - 1 }">이전</a>
		</c:if>

		<c:forEach var="page" begin="1" end="${pageCount }">
			<c:choose>
				<c:when test="${page eq param.p or (curPage == 1 and curPage == page)}">
					<a style="color: white; background-color: #333;"
						href="event.page.change?p=${page }">${page }
					</a>
				</c:when>
				<c:otherwise>
					<a style="color: black;" href="event.page.change?p=${page }">${page }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${curPage != pageCount }">
			<a style="color: black;" href="event.page.change?p=${curPage + 1 }">다음</a>
		</c:if>
	</div>
	<script src="resources/js/admin/board/event_board.js"></script>
</body>
</html>