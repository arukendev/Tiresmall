<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event detail</title>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/admin/board/event_board.css">
<link rel="stylesheet" href="resources/css/admin/board/event_modal.css">
<link rel="stylesheet" href="resources/css/admin/tire/admin_tire.css">
</head>
<body style="text-align: center;">
	<input id="whatMenu" value="notice" type="hidden">
	<input id="sm" value="4" type="hidden"> 
	<div class="event-wrap">
		<h3>- 이벤트 상세 페이지 -</h3> 
		<div class="event-item">

			<div class="event-row">
				<div class="event-col1">고유넘버</div>
				<div class="event-col2"><span id="e_no">${event.e_no }</span></div>
				<div class="event-col3">
						<button class="event-del-btn">이벤트 삭제</button>
				</div>
			</div>
			<div class="event-row">
				<div class="event-col1">제목</div>
				<div class="event-col2">
					<span>${event.e_title }</span>
				</div>
				<div class="event-col3">
					<button class="detail-updateBtn" value="title-btn">수정</button>
				</div>
			</div>
			<div class="event-row">
				<div class="event-col1">업로드날짜</div>
				<div class="event-col2">
					<fmt:formatDate pattern="yyyy-MM-dd (E) HH:mm"
						value="${event.e_date }" />
				</div>
				<div class="event-col3"></div>
			</div>
			<div class="event-row">
				<div class="event-col1">내용</div>
				<div class="event-col2">
					<span>${event.e_content }</span>
				</div>
				<div class="event-col3">
					<button class="detail-updateBtn" value="content-btn">수정</button>
				</div>
			</div>
			<div class="event-row">
				<div class="event-col1">기간</div>
				<div class="event-col2">
					<span><fmt:formatDate pattern="MM/dd/yyyy"
							value="${event.e_duration }" /></span>
				</div>
				<div class="event-col3">
					<button class="detail-updateBtn" value="duration-btn">수정</button>
				</div>
			</div>
			<div class="event-row">
				<div class="event-col1">팝업유무</div>
				<div class="event-col2">
					<c:if test="${event.e_popup == 1 }">
						<button type="button" class="on-off" value="${event.e_no }" style="background-color: #198754">on</button>
					</c:if>
					<c:if test="${event.e_popup == 0 }">
						<button type="button" class="on-off" value="${event.e_no }" style="background-color: red">off</button>
					</c:if>
				</div>
				<div class="event-col3"></div>
			</div>
			<div class="event-row">
				<div class="event-col1">메인이미지</div>
				<div class="event-col2">
					<img src="resources/upload-event/${event.e_mainimg }">
					<input type="hidden" name="main-img-old" value="${event.e_mainimg }">
					<input type="file" name="e_mainimg" accept=".gif, .jpg, .png" class="e_img" style="display: none;">
				</div>
				<div class="event-col3">
					<button class="detail-updateBtn" value="main-btn">수정</button>
				</div>
			</div>
			<div class="event-row">
				<div class="event-col1">상세이미지</div>
				<div class="event-col2">
					<c:forEach var="detailimg" items="${detailImges }">
					<img src="resources/upload-event/${detailimg}">
				
					</c:forEach>
					<input type="hidden" name="detail-img-old" value="${event.e_detailimg }">
					<input type="file" name="e_detailimg" multiple="multiple" accept=".gif, .jpg, .png" class="e_img" style="display: none;">
				</div>
				<div class="event-col3">
				<button class="detail-updateBtn" value="detail-btn">수정</button>
				</div>
			</div>
			<div class="event-row">
				<div class="event-col1">상태</div>
				<div class="event-col2">
					<span>${event.e_status }</span> <select id="event-status"
						style="display: none;">
						<option value="진행중">진행중</option>
						<option value="마감">마감</option>
						<option value="예정">예정</option>
					</select>
				</div>
				<div class="event-col3">
					<button class="detail-updateBtn" value="status-btn">수정</button>
				</div>
			</div>
		</div>
	</div>
 <form id="uploadForm">
	 	<input type="hidden" name="e_no" value="${event.e_no }">
	 	<input type="hidden" name="e_type">
	 	<input type="hidden" name="e_mainimg" value="${event.e_mainimg }">
	 	<input type="hidden" name="e_detailimg" value="${event.e_detailimg }">
  </form>
</body>
<script type="text/javascript"
	src="resources/js/admin/board/event_detail.js"></script>
</html>