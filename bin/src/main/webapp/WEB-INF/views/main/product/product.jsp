<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
<link rel="stylesheet" href="resources/css/main/product/main_product.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/main/product/main_product.js"></script>
</head>
<body>
<h1>${test }</h1>
	<div id="product_wrap">
		<div id="product_wrap_top">
			<div id="product_top_img">
				<img src="resources/web/main/product/note.jpg">
			</div>
			<div id="product_wrap_subtitle">
					<h1><span>국내유통 100%</span> <span>정품타이어 취급!</span></h1>
					<h2><span>TIRE<span>S</span>MALL</span>에서는 오직 정품 타이어만 취급합니다.</h2>
					<h3>오늘 주문하고 바로 장착 가능하며 직영점 장착시 차량점검 무상 서비스 제공!</h3>
			</div>
		</div>
		<div id="product_search">
			<span>총 ${theNumber }개 상품이 검색 되었습니다. </span>
			<div id="product_search_priceRange">
				<p>
  					<label for="amount">가격대:</label>
 						<input type="text" id="amount" readonly style="border:0; color:#E6CD32; font-weight:bold;">
				</p>
				<div id="slider-range"></div><button id="product_priceRange_button">검색</button>
			</div>
			<div id="product_search_type">
				<input name="carTypeA" type="radio" value=""> 전체 타입
				<input name="carTypeA" type="radio" value="1"> 승용차
				<input name="carTypeA" type="radio" value="0"> SUV
			</div>
		</div>
		<div id="product_container">
			<c:forEach items="${pGroups }" var="pGroup">
				<a href="product.detail?tg_id=${pGroup.tg_id }">
					<div class="product_item">
						<div class="product_item_hidden"></div>
						<div class="product_item_img">
						<c:choose>
							<c:when test="${pGroup.tg_img eq 'noimg'}">
								<img src="resources/web/main/product/no-tire-image.jpg">
							</c:when>
							<c:otherwise>
								<img src="${pGroup.tg_img }"> <!-- 타이어 등록 기능 되면 경로지정 -->
							</c:otherwise>					
						</c:choose>
						</div>
						<div class="product_item_title">
							<p>${pGroup.tg_brand }</p>
							<p class="item_title_p">${pGroup.tg_name }</p>
						</div>
						<div class="product_item_text">${pGroup.tg_text }</div>
						<div class="product_item_size">${pGroup.minInch }인치  ~ ${pGroup.maxInch }인치</div>
						<div class="product_item_price">
							￦<fmt:formatNumber type="currency" currencySymbol="">
								${pGroup.minPrice }
							</fmt:formatNumber>
								~ ￦<fmt:formatNumber type="currency" currencySymbol="">
								${pGroup.maxPrice }
							</fmt:formatNumber>
						</div>
						<div class="product_item_detail"><i class="fa-solid fa-magnifying-glass"></i>상세보기</div>
					</div>
				</a>
			</c:forEach>
		</div>
		<div id="product_wrap_paging" class="paginationjs paginationjs-theme-red paginationjs-big">
			<div class="paginationjs-pages">
				<ul>
					<c:choose>
						<c:when test="${curPage eq 1}">
							<li class="paginationjs-prev disabled"><a>«</a></li>
						</c:when>
						<c:otherwise>
							<li class="paginationjs-prev J-paginationjs-previous"><a href="javascript:movePage(1)">«</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach var="pNum" begin="1" end="${pageCount }">
						<c:choose>
							<c:when test="${pNum eq curPage}">
								<li class="paginationjs-page J-paginationjs-page active" ><a href="javascript:movePage(${pNum })">${pNum }</a></li>
							</c:when>
							<c:otherwise>
								<li class="paginationjs-page J-paginationjs-page" ><a href="javascript:movePage(${pNum })">${pNum }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${curPage eq pageCount}">
							<li class="paginationjs-next disabled"><a>»</a></li>
						</c:when>
						<c:otherwise>
							<li class="paginationjs-next J-paginationjs-next"><a href="javascript:movePage(${pageCount })">»</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
			
			
<script src="https://kit.fontawesome.com/772d40e343.js" crossorigin="anonymous"></script>
</body>
</html>