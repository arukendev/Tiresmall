<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="stylesheet" href="resources/css/main/board/main_board_event_modal.css" />
</head>
<body>
	<div class="swiper mySwiper">
	    <div class="swiper-wrapper">
	    	<c:forEach var="e" items="${events }">
	    		<c:if test="${e.e_popup == 1 }">
				    <div class="swiper-slide">
						<div class="board_event_modal_card">
							<div class="board_event_modal_image">
								<a href="board.event.readdetail?e_no=${e.e_no}"><img src="resources/upload-event/${e.e_mainimg }"/></a>
							</div>
							<form class="board_event_modal_buttons" method="dialog">
								<button onclick="clickToSetBoardEventModalCookie();">오늘은 그만 보기</button>
								<div></div>
								<button>닫기</button>
							</form>
						</div>
					</div>
	    		</c:if>
	    	</c:forEach>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script>
    var swiper = new Swiper(".mySwiper", {
      effect: "coverflow",
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: "auto",
      coverflowEffect: {
        rotate: 50,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows: true,
      },
      pagination: {
        el: ".swiper-pagination",
      },
    });
</script>
</body>
</html>