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
<link rel="stylesheet" href="resources/css/main/product/main_product.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/main/product/main_product.js"></script>
</head>
<body>
<h1>${test }</h1>
	<div id="product_wrap">
		<div id="product_wrap_top">
			<div id="product_top_img">
				<img src="resources/web/main/product/product-banner.png">
			</div>
		</div>
		<div id="product_search">
			<span>총 ${theNumber }개 상품이 검색 되었습니다. </span>
			<div id="product_search_type">
				<input name="carTypeA" type="radio" value=""> 전체 타입
				<input name="carTypeA" type="radio" value="sedan"> 승용차 추천
				<input name="carTypeA" type="radio" value="suv"> SUV 추천
			</div>
		</div>
		<div id="product_container">
			<c:forEach items="${pGroups }" var="pGroup">
				<a href="product.detail?tg_id=${pGroup.tg_id }">
					<div class="product_item">
						<div class="product_item_hidden">
						</div>
						<div class="product_item_img">
							<c:choose>
								<c:when test="${pGroup.tg_img eq 'noimg'}">
									<img src="resources/web/main/product/no-tire-image.jpg">
								</c:when>
								<c:otherwise>
									<img src="resources/web/main/tire/${pGroup.tg_img }"> <!-- 타이어 등록 기능 되면 경로지정 -->
								</c:otherwise>					
							</c:choose>
						</div>
						<div class="product_item_title">
							<p>${pGroup.tg_brand }</p>
							<p class="item_title_p">${pGroup.tg_name }</p>
						</div>
						<div class="product_item_size">${pGroup.minInch }인치  ~ ${pGroup.maxInch }인치
						</div>
						<div class="product_item_price">
								<input type="hidden" class="pl_dcRate" value="${pGroup.tg_dcrate}">
							&#8361; <span class="pl_minPriceSpan">${pGroup.minPrice }</span>
								<input type="hidden" class="pl_minPrice" value="${pGroup.minPrice}">
								~ &#8361;  <span class="pl_maxPriceSpan">${pGroup.maxPrice }</span>
								<input type="hidden" class="pl_maxPrice" value="${pGroup.maxPrice}">
						</div>
						<div class="product_item_detail"><i class="fa-solid fa-magnifying-glass"></i>상세보기</div>
					</div>
				</a>
			</c:forEach>
		</div>
		
		<div id="product_paging">
			<div></div>
			
			<div class="product_pagingButtons">
				<c:choose>
					<c:when test="${curPage != 1 }">
						<div>
							<a href="javascript:movePage(1)"><i class="fa-solid fa-angles-left"></i></a>
						</div>
						<div>
							<a href="javascript:movePage(${curPage - 1 })"><i class="fa-solid fa-chevron-left"></i></a>
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
						<c:when test="${page == curPage }">
							<div class="product_pagingButtons_selected">
								<a href="javascript:movePage(${page })" style="color: #fff;">${page }</a>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<a href="javascript:movePage(${page })">${page }</a>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${curPage != pageCount and pageCount != 0}">
						<div>
							<a href="javascript:movePage(${curPage + 1 })"><i class="fa-solid fa-chevron-right"></i></a>
						</div>
						<div>
							<a href="javascript:movePage(${pageCount })"><i class="fa-solid fa-angles-right"></i></a>
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
			<div></div>
		</div>
		
		
		<!-- <div id="product_nav">
			<div class="product_nav_brand">
				<a href="product.brand?b=&p=1">
					<div id="product_brand_all">All</div>
				</a>
				<div class="product_nav_brandNameBadge">모든 브랜드</div>
			</div>
			<div class="product_nav_brand">
				<a href="product.brand?b=넥센&p=1">
					<div class="product_brand_img"><img src="resources/web/main/product/nexen-logo.png"></div>
				</a>
				<div class="product_nav_brandNameBadge">넥센타이어</div>
			</div>
			<div class="product_nav_brand">
				<a href="product.brand?b=한국&p=1">
					<div class="product_brand_img"><img src="resources/web/main/product/hankook-logo.png"></div>
				</a>
				<div class="product_nav_brandNameBadge">한국타이어</div>
			</div>
			<div class="product_nav_brand">
				<a href="product.brand?b=콘티넨탈&p=1">
					<div class="product_brand_img"><img src="resources/web/main/product/continental-logo.png"></div>
				</a>
				<div class="product_nav_brandNameBadge">콘티넨탈타이어</div>
			</div>
			<div class="product_nav_brand">
				<a href="product.brand?b=피렐리&p=1">
					<div class="product_brand_img"><img src="resources/web/main/product/pirelli-logo.png"></div>
				</a>
				<div class="product_nav_brandNameBadge">피렐리타이어</div>
			</div>
			<div class="product_nav_brand">
				<a href="product.brand?b=미쉐린&p=1">
					<div class="product_brand_img"><img src="resources/web/main/product/michelin-logo.png"></div>
				</a>
				<div class="product_nav_brandNameBadge">미쉐린타이어</div>
			</div>
		</div> -->
			
			
<script src="https://kit.fontawesome.com/772d40e343.js" crossorigin="anonymous"></script>
</body>
</html>