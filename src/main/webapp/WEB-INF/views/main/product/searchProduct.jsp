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
			<span>총 ${count }개 상품이 검색 되었습니다. </span>
			<div id="product_search_type">
				<input name="carTypeA" type="radio" value=""> 전체 타입
				<input name="carTypeA" type="radio" value="sedan"> 승용차 추천
				<input name="carTypeA" type="radio" value="suv"> SUV 추천
			</div>
		</div>
		<div id="product_container">
			<c:forEach items="${pGroups }" var="pGroup">
				<a href="product.detail?tg_id=${pGroup.tg_id }
						&ti_width=${pGroup.ti_width }&ti_ratio=${pGroup.ti_ratio }&ti_inch=${pGroup.ti_inch }&result_price=${pGroup.result_price}">
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
						<div class="product_item_size">
							<c:choose>
								<c:when test="${pGroup.ti_ratio != 0 }">
									${pGroup.ti_width }/${pGroup.ti_ratio }R${pGroup.ti_inch }
								</c:when>
								<c:otherwise>
									${pGroup.ti_width }R${pGroup.ti_inch }
								</c:otherwise>
							</c:choose>
						</div>
						<div class="product_item_price">
								<input type="hidden" class="pl_dcRate" value="${pGroup.tg_dcrate}">
								<span class="detail_discount">${pGroup.tg_dcrate}%</span>
             				   	&#8361;<span class="detail_final_price">
             				   		<fmt:formatNumber value="${pGroup.result_price }"  type="number"/>
             				   	</span>
                				<span class="detail_not_price">&#8361;
                					<fmt:formatNumber value="${pGroup.ti_pricefac }"  type="number"/>
                				</span>
							
								<input type="hidden" class="pl_minPrice" value="${pGroup.ti_pricefac}">
						</div>
						<div class="product_item_detail">
							<i class="fa-solid fa-magnifying-glass"></i>상세보기
						</div>
					</div>
					
				</a>
			</c:forEach>
		</div>
		
			
<script src="https://kit.fontawesome.com/772d40e343.js" crossorigin="anonymous"></script>
</body>
</html>