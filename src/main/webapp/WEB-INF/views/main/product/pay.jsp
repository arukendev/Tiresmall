<%@ page language = "java" contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8"%> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fud1jij2os"></script>
  </head>
  <body>
    <c:if test="${empty sessionScope.cartSession}">
      <script>
        location.href = "/home";
      </script>
    </c:if>
    <form action = "pay.complete" method = "post" id = "pay_container" class = "pay_container">
      <div class = "pay_titles">
        <div class = "pay_title_left">
          <h1>구매예약</h1>
        </div>
        <div class = "pay_title_right">
          <h2>장바구니</h2>
          <i class = "fa-solid fa-chevron-right"></i>
          <h2 class = "pay_title_point">구매예약</h2>
          <i class = "fa-solid fa-chevron-right"></i>
          <h2>예약완료</h2>
        </div>
      </div>
      <div class = "pay_content">
        <div class = "pay_list">
          <div class = "pay_subtitles">
            <span>주문 상품</span>
          </div>
          <c:forEach var = "tire" items = "${sessionScope.cartSession}">
            <div class = "pay_product">
              <div class = "pay_product_left">
                <div class = "pay_product_img">
                  <c:choose>
                    <c:when test = "${tire.tg_img eq 'noimg'}">
                      <img src = "resources/web/main/product/no-tire-image.jpg" style = "width: 150px"/>
                    </c:when>
                    <c:otherwise>
                      <img src="resources/web/main/tire/${tire.tg_img}" style="max-height: 150px"/>
                    </c:otherwise>
                  </c:choose>
                </div>
                <div class="pay_product_info">
                  <h2 href="http://localhost/home/product.brand?b=${tire.tg_brand}&p=1"class="pay_product_brand">
                    ${tire.tg_brand}
                  </h2>
                  <h1 value = "${tire.tg_id}" class="pay_product_name">
                    ${tire.tg_name}
                  </h1>
                  <div class = "pay_quantity_box">
                    <c:choose>
                      <c:when test="${tire.ti_ratio eq 0}">
                        <h2 class="pay_product_size">
                          ${tire.ti_width}R${tire.ti_inch} (${tire.ti_marking})
                        </h2>
                      </c:when>
                      <c:otherwise>
                        <h2 class="pay_product_size">
                          ${tire.ti_width}/${tire.ti_ratio}R${tire.ti_inch}
                          (${tire.ti_marking})
                        </h2>
                      </c:otherwise>
                    </c:choose>
                    <span class="pay_quantity">${tire.ti_stock}EA</span>
                  </div>
                </div>
              </div>
              <div class="pay_product_right">
                <span class="pay_product_price">
               	 	<fmt:formatNumber value="${tire.ti_allpricegp}" type="number"/>원
                </span>
                <input type="hidden" class="pay_final_price" value="${tire.ti_allpricegp}"/>
                <input type="hidden" class="pay_finalFac_price" value="${tire.ti_allpricefac}" />
              </div>
            </div>
          </c:forEach>
          <div class="pay_subtitles">
            <span>장착방법</span>
          </div>
          <ul class="pay_shipMethod">
            <li>
              <div>
                <span>장착점</span>
              </div>
              <div>
                <select class="pay_store" name="o_storeshop">
                	<c:forEach items="${store }" var="s" varStatus="status">
                		<option value="${s.b_id}">${s.b_name}</option>
                	</c:forEach>
                </select>
              </div>
            </li>
       		 <c:forEach items="${store }" var="s" end="0">
       		 	<input type="hidden" value="${s.b_mapdata }" class="mapAddre">
	      		<div id="pay_map"></div>

	            <li>
	              <div>
	                <span>장착점 주소</span>
	              </div>
	              <div>
	                <span class="pay_storeAddress">${s.b_area}&nbsp;${s.b_addr}</span>
	              </div>
	            </li>
	            <li>
	              <div>
	                <span>전화번호</span>
	              </div>
	              <div>
	                <span class="pay_storePhone">${s.b_managernumber}</span>
	              </div>
	            </li>
	            <li>
	              <div>
	                <span>영업시간</span>
	              </div>
	              <div>
	                <span>${s.b_time }</span >
	              </div>
	            </li>
            </c:forEach>
            <li>
              <div>
                <span>장착예정일</span>
              </div>
              <div>
                <input name="o_tireinstalldate" class="pay_date" />
                <span class="pay_error pay_date_confirm"></span>
              </div>
            </li>
          </ul>
          <div class="pay_subtitles">
            <span>주문자 정보</span>
          </div>
          <c:choose>
            <c:when test="${not empty sessionScope.loginMember.i_name}">
              <ul class="pay_customerInfo">
                <li>
                	<input type="hidden" name="o_sortation" value="${sessionScope.loginMember.u_no}"/>
                  	<div>
                    	<span>주문자</span>
                  	</div>
                  	<div>
                    <input  type="text"name="o_name"value="${sessionScope.loginMember.i_name}" class="pay_customer_input"/>
                    <span class="pay_error pay_customer_confirm"></span>
                  </div>
                </li>
                <li>
                  <div>
                    <span>연락처</span>
                  </div>
                  <div>
                    <input type="text" name="o_phone" value="${sessionScope.loginMember.i_phoneNum}" class="pay_phone_input" placeholder=" '-'을 제외하고 입력해주세요"/>
                    <span class="pay_error pay_phone_confirm"></span>
                  </div>
                </li>
                <li>
                  <div>
                    <span>이메일</span>
                  </div>
                  <div>
                    <input type="text" name="o_email" value="${sessionScope.loginMember.i_email}" class="pay_email_input" placeholder="example@naver.com"/>
                    <span class="pay_error pay_email_confirm"></span>
                  </div>
                </li>
                <li>
                  <div>
                    <span>차량정보</span>
                  </div>
                  <div>
                    <select name="o_caryear">
                      <option value="">연식</option>
                      <c:forEach var="years" items="${carYears}">
                        <option value="${years.carYear}">
                          ${years.carYear}
                        </option>
                      </c:forEach>
                    </select>
                    <select name="o_carbrand">
                      <option value="">제조사</option>
                      <c:forEach var="brands" items="${carBrands}">
                        <option value="${brands.cb_name}">
                          ${brands.cb_name}
                        </option>
                      </c:forEach>
                    </select>
                    <select name="o_carname">
                      <option value="">차종</option>
                      <c:forEach var="names" items="${carNames}">
                        <option value="${names.c_name}">${names.c_name}</option>
                      </c:forEach>
                    </select>
                    <span class="pay_error pay_car_confirm"></span>
                  </div>
                </li>
                <li>
                  <div>
                    <span>차량번호</span>
                  </div>
                  <div>
                    <input type="text" name="o_carnumber" value="${sessionScope.loginMember.mc_number}" class="pay_carNum_input" placeholder="123마4567" />
                    <span class="pay_error pay_carNum_confirm"></span>
                  </div>
                </li>
                <li>
                  <div>
                    <span>기타요청</span>
                  </div>
                  <div>
                    <input type="text" name="o_request" class="pay_request_input"/>
                  </div>
                </li>
              </ul>
            </c:when>
            <c:otherwise>
              <ul class="pay_customerInfo">
                <li>
                <input type="hidden" name="o_sortation" value="0" />
                  <div>
                    <span>주문자</span>
                  </div>
                  <div>
                    <input type="text"name="o_name"class="pay_customer_input"placeholder="이름을 입력해주세요"/>
                    <span class="pay_error pay_customer_confirm"></span>
                  </div>
                </li>
                <li>
                  <div>
                    <span>연락처</span>
                  </div>
                  <div>
                    <input type="text" name="o_phone" placeholder="'-'을 제외하고 입력해주세요"class="pay_phone_input"/>
                    <span class="pay_error pay_phone_confirm"></span>
                  </div>
                </li>
                <li>
                  <div>
                    <span>이메일</span>
                  </div>
                  <div>
                    <input type="text" name="o_email" class="pay_email_input"  placeholder="example@naver.com" />
                    <span class="pay_error pay_email_confirm"></span>
                  </div>
                </li>
                <li>
                  <div>
                    <span>차량정보</span>
                  </div>
                  <div>
                    <select name="o_carbrand" id="pay_o_carbrand_select">
                      <option value="">제조사</option>
                      <c:forEach var="brands" items="${carBrands}">
                        <option value="${brands.cb_name}">
                          ${brands.cb_name}
                        </option>
                      </c:forEach>
                    </select>
                    <select name="o_caryear" id="pay_o_caryear_select">
                      <option value="">연식</option>
                      <c:forEach var="years" items="${carYears}">
                        <option value="${years.carYear}">
                          ${years.carYear}
                        </option>
                      </c:forEach>
                    </select>
                    <select name="o_carname" id="pay_o_carname_select">
                      <option value="">차종</option>   
                     </select>
                    <span class="pay_error pay_car_confirm"></span>
                  </div>
                </li>
                <li>
                  <div>
                    <span>차량번호</span>
                  </div>
                  <div>
                    <input type="text" name="o_carnumber" class="pay_carNum_input"  placeholder="123마4567" />
                    <span class="pay_error pay_carNum_confirm"></span>
                  </div>
                </li>
                <li id="pay_grid_diffrent_height">
                  <div>
                    <span>기타요청</span>
                  </div>
                  <div>
                  <textarea name="o_request" id="pay_request_input" wrap="soft"></textarea>
                    <!-- <input type="text"  name="o_request" id="pay_request_input"
                    /> -->
                  </div>
                </li>
              </ul>
            </c:otherwise>
          </c:choose>
          <div class="pay_subtitles">
            <span>결제 정보</span>
          </div>
          <div class="pay_payInfo">
            <div class="pay_directpay">
              <input type="radio"  id="directpay" name="o_paymethod" value="현장결제"onchange="payChange(this)"checked/>
              <label for="directpay">현장결제</label>
            </div>
            <div class="pay_nonbankpay">
              <input type="radio" id="nonbankpay" name="o_paymethod" value="무통장" onchange="payChange(this)"/>
              <label for="nonbankpay">무통장 입금</label>
            </div>
    <!--         <div class="pay_kakaopay">
              <input type="radio"  id="kakaopay" name="o_paymethod" value="카카오" onchange="payChange(this)" />
              <label for="kakaopay">카카오페이</label>
            </div> -->
          </div>
          <div class="pay_method_info">
            <div class="pay_nonbankpay_content" style="display: none">
              <span>예금주 강민석</span>
              <span>농협 351-0252-0511-43</span>
            </div>
          </div>
          <div class="pay_method_info">
            <div class="pay_kakaopay_content" style="display: none; position: relative; top: -120px; font-weight: 500;">
              	'결제하기'를 클릭해 카카오 결제를 진행 해주세요.
            </div>
          </div>
        </div>
        <div class="pay_confirm">
          <div class="pay_nav">
            <div class="pay_nav_title">
              <h2>주문 정보</h2>
            </div>
            <div class="pay_nav_content pay_nav_origianl">
              <h2 class="pay_nav_name">소비자 가격</h2>
              <span class="pay_nav_value"></span>
            </div>
            <div class="pay_nav_content pay_nav_discount">
              <h2 class="pay_nav_name">할인 금액</h2>
              <span class="pay_nav_value"></span>
            </div>
            <div class="pay_nav_content pay_nav_price">
              <h2 class="pay_nav_name">총 결제 금액</h2>
              <span class="pay_nav_value"></span>
            </div>
            <input type="hidden" name="o_deliverymethod" value="직영점" />
            <input type="hidden" name="o_step" value="결제대기" />
          <button class="pay_nav_pay">결제하기</button>
          </div>
        </div>
      </div>
      <input id="pInput" name="pg_token" type="hidden" value="">
    </form>
	<script type="text/javascript" src="resources/js/main/order/kakaopay.js"></script>
  </body>
</html>
