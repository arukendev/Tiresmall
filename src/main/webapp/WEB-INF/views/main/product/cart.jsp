<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <div class="cart_container">
      <div class="cart_titles">
        <div class="cart_title_left">
          <h1>장바구니</h1>
        </div>
        <div class="cart_title_right">
          <h2 class="cart_title_point">장바구니</h2>
          <i class="fa-solid fa-chevron-right"></i>
          <h2>구매예약</h2>
          <i class="fa-solid fa-chevron-right"></i>
          <h2>예약완료</h2>
        </div>
      </div>
      <div class="cart_content">
        <c:choose>
          <c:when test="${empty sessionScope.cartSession}">
            <div class="cart_empty">
              <img src="resources/web/main/caution.png" style="width: 100px">
              <h1>장바구니가 비었습니다.</h1>
            </div>
          </c:when>
          <c:otherwise>
            <div class="cart_list">
              <c:forEach var="tire" items="${sessionScope.cartSession}">
                <div class="cart_product">
                  <button class="cart_product_delete" onclick="cartDelete(${tire.ti_id})">
                    <i class="fa-solid fa-xmark"></i>
                  </button>
                  <div class="cart_product_left">
                    <div class="cart_product_img">
                      <c:choose>
                        <c:when test="${tire.tg_img eq 'noimg'}">
                        <img 
                          src="resources/web/main/product/no-tire-image.jpg"
                          style="width: 150px"
                         />
                        </c:when>
                        <c:otherwise>
                        <img
                          src="resources/web/main/tire/${tire.tg_img}"
                          style="max-height: 150px"
                        />
                        </c:otherwise>
                      </c:choose>
                    </div>
                    <div class="cart_product_info">
                      <a href="http://localhost/home/product.brand?b=${tire.tg_brand}&p=1" class="cart_product_brand">${tire.tg_brand}</a>
                      <a href="product.detail?tg_id=${tire.tg_id}" class="cart_product_name">${tire.tg_name}</a>
                      <div class="cart_quantity_box">
                        <c:choose>
                          <c:when test="${tire.ti_ratio eq 0}">
                            <h2 class="cart_product_size">${tire.ti_width}R${tire.ti_inch} (${tire.ti_marking})</h2>
                          </c:when>
                          <c:otherwise>
                            <h2 class="cart_product_size">${tire.ti_width}/${tire.ti_ratio}R${tire.ti_inch} (${tire.ti_marking})</h2>
                          </c:otherwise>
                        </c:choose>
                        <button class="cart_minus_button" onclick="changeCartQuantity(this, false)">
                          <i class="fa-solid fa-minus"></i>
                        </button>
                        <input
                          type="text"
                          class="cart_quantity_input"
                          value="${tire.ti_stock}"
                          readonly
                        />
                        <button class="cart_plus_button" onclick="changeCartQuantity(this, true)">
                          <i class="fa-solid fa-plus"></i>
                        </button>
                      </div>
                    </div>
                  </div>
                  <div class="cart_product_right">
                    <span class="cart_product_price"></span>
                  </div>
                  <input type="hidden" class="cart_tg_id" value="${tire.tg_id}">
                  <input type="hidden" class="cart_tg_brand" value="${tire.tg_brand}">
                  <input type="hidden" class="cart_tg_name" value="${tire.tg_name}">
                  <input type="hidden" class="cart_tg_img" value="${tire.tg_img}">
                  <input type="hidden" class="cart_tg_dcrate" value="${tire.tg_dcrate}">
                  <input type="hidden" class="cart_ti_id" value="${tire.ti_id}">
                  <input type="hidden" class="cart_ti_width" value="${tire.ti_width}">
                  <input type="hidden" class="cart_ti_ratio" value="${tire.ti_ratio}">
                  <input type="hidden" class="cart_ti_inch" value="${tire.ti_inch}">
                  <input type="hidden" class="cart_ti_stock" value="${tire.ti_stock}">
                  <input type="hidden" class="cart_ti_pricegp" value="${tire.ti_pricegp}">
                  <input type="hidden" class="cart_ti_pricefac" value="${tire.ti_pricefac}">
                  <input type="hidden" class="cart_ti_marking" value="${tire.ti_marking}">
                  <input type="hidden" class="cart_final_price" value="${tire.ti_allpricegp}" />
                  <input type="hidden" class="cart_finalFac_price" value="${tire.ti_allpricefac}"/>
                </div>
              </c:forEach>
            </div>
            <div class="cart_confirm">
              <div class="cart_nav">
                <div class="cart_nav_title">
                  <h2>주문 정보</h2>
                </div>
                <div class="cart_nav_content cart_nav_origianl">
                  <h2 class="cart_nav_name">소비자 가격</h2>
                  <span class="cart_nav_value"></span>
                </div>
                <div class="cart_nav_content cart_nav_discount">
                  <h2 class="cart_nav_name">할인 금액</h2>
                  <span class="cart_nav_value"></span>
                </div>
                <div class="cart_nav_content cart_nav_price">
                  <h2 class="cart_nav_name">총 결제 금액</h2>
                  <span class="cart_nav_value"></span>
                </div>
                <button class="cart_nav_pay" onclick="location.href = 'pay.go'">구매예약</button>
              </div>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </body>
</html>
