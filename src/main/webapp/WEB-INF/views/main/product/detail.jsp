<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.3.js"integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="crossorigin="anonymous"></script>
  </head>
  <body>
    <div class="detail_brand" style="background-color: var(--${product.tg_brand})">
      <div class="detail_brand_wrapper">
        <img src="resources/web/main/product/${product.tg_brand}.png" />
      </div>
    </div>
    <div class="detail_container">
      <div class="detail_product">
        <div class="detail_img">
          <c:choose>
            <c:when test="${product.tg_img eq 'noimg'}">
              <img src="resources/web/main/product/no-tire-image.jpg" />
            </c:when>
            <c:otherwise>
              <img src="resources/web/main/tire/${product.tg_img}"style="width: 300px"/>
            </c:otherwise>
          </c:choose>
        </div>
        <div class="detail_info">
          <div class="detail_titles">
            <h1>${product.tg_name}</h1>
            <h3>${product.tg_text}</h3>
          </div>
          <div class="detail_option">
            <div class="detail_option_content">
              <h5>사이즈 선택</h5>
              <span class="detail_option_txt">
              	<button class="detail_choose">사이즈 선택하기</button>
                <button class="detail_method">사이즈 확인방법</button>
               </span>
            </div>
            <div class="detail_option_content">
              <h5>사이즈(마킹)</h5>
              <span class="detail_option_txt detail_option_size">
              		<c:choose>
              			<c:when test="${searchProduct.ti_ratio != 0}">
              					${searchProduct.ti_width}/
              					${searchProduct.ti_ratio}R
              					${searchProduct.ti_inch}&nbsp;
              					(${searchProduct.ti_marking})
              			</c:when>
              			<c:otherwise>
              					${searchProduct.ti_width}R
              					${searchProduct.ti_inch}&nbsp;
              					(${searchProduct.ti_marking})
              			</c:otherwise>
              		</c:choose>
              </span>
            </div>
            <div class="detail_option_content">
              <h5>배송비</h5>
              <span class="detail_option_txt">직영점 방문장착시 배송비무료</span>
            </div>
            <div class="detail_option_content">
              <h5>장착비</h5>
              <span class="detail_option_txt" >장착비 별도 / 표준공임표 참조
              		<button class="detail_standard">표준공임표</button>
              </span>
            </div>
            <div class="detail_option_content">
              <h5>제조일자</h5>
              <span class="detail_option_txt">
              		국내브랜드 6개월 이내 제품 / 수입브랜드 1년 이내 제품
              </span>
            </div>
          </div>
          <div class="detail_price_wrapper" style="display: none">
            <div class="detail_price">
              <div class="detail_quantity">
                <h5>수량</h5>
                <div class="detail_quantity_box">
                  <button class="detail_minus">
                    <i class="fa-solid fa-minus"></i>
                  </button>
                  <input class="detail_quantity_input"type="text"value="1" readonly/>
                  <button class="detail_plus">
                    <i class="fa-solid fa-plus"></i>
                  </button>
                </div>
              </div>
              <div class="detail_final">
                <span class="detail_discount">${product.tg_dcrate}%</span>
                <span class="detail_final_price"><fmt:formatNumber value="${searchProduct.result_price}"  type="number"/>원</span>
                <span class="detail_not_price"><fmt:formatNumber value="${searchProduct.ti_pricefac}"  type="number"/>원</span>
              </div>
            </div>
          </div>
          <div class="detail_buy">
            <input class="product_tg_id"type="hidden" value="${product.tg_id}"/>
            <input class="product_tg_brand"type="hidden"value="${product.tg_brand}"/>
            <input class="product_tg_name" type="hidden" value="${product.tg_name}"/>
            <input class="product_tg_img" type="hidden"  value="${product.tg_img}"/>
            <input class="product_tg_dcrate" type="hidden" value="${product.tg_dcrate}"/>
            <input class="product_ti_id" type="hidden" value="${searchProduct.ti_id}" />
            <input class="product_ti_width" type="hidden" value="${searchProduct.ti_width}"/>
            <input class="product_ti_ratio" type="hidden" value="${searchProduct.ti_ratio}"/>
            <input class="product_ti_inch" type="hidden" value="${searchProduct.ti_inch}"/>
            <input class="product_ti_marking" type="hidden" value="${searchProduct.ti_marking}"/>
            <input class="product_ti_pricegp" type="hidden" value="${searchProduct.result_price}" />
            <input class="product_ti_pricefac" type="hidden" value="${searchProduct.ti_pricefac}"/>
            <input class="product_result_price" type="hidden" value="${searchProduct.result_price}"/>
            <button class="detail_cart" onclick="insertToCart(false)">
             	  장바구니
            </button>
            <button class="detail_go_buy" onclick="insertToCart(true)">
           		   구매예약
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="detail_nav">
      <ul class="detail_nav_ul">
        <li class="detail_nav_li detail_nav_detail detail_nav_li_active">
        	  상품정보
        </li>
        <li class="detail_nav_li detail_nav_confirm">구매 전 확인사항</li>
        <li class="detail_nav_li detail_nav_guide">타이어 장착 안내</li>
        <li class="detail_nav_li detail_nav_info">
         	 배송 / 반품 / 교환 / AS 안내
        </li>
      </ul>
    </div>
    <div class="detail_container">
      <div class="detail_include">
        <ul class="detail_include_detail">
          <li>
            <c:choose>
              <c:when test="${product.tg_detail eq 'noimg'}">
                <img src="resources/web/main/product/no-tire-image.jpg" />
              </c:when>
              <c:otherwise>
                <c:forEach var="dImg" items="${detailImg}">
               		 <img src="resources/web/main/tire/${dImg}"style="max-width: 1200px"/>
                </c:forEach>
              </c:otherwise>
            </c:choose>
          </li>
        </ul>
        <ul class="detail_include_confirm" style="display: none">
          <li class="detail_include_txt">
            <div>
              <h1>
                1. 대전 타이어쇼핑몰 쇼핑몰 에서 판매하는 타이어는 믿어도
               	 되나요?
              </h1>
              <p>
               	 대전 타이어쇼핑몰에서 판매중인 모든 타이어는 국내 정식 유통된
               	 제품으로서 6개월 ~ 1년 이내 제조된 타이어를 판매 합니다.
              </p>
              <p>
             	   또한 정품타이어가 아닌 경우 200% 보상하며, 공정거래위원회 고시
             	   소비자 분쟁 해결 기준에 의거교환 또는 보상을 받을 수 있습니다.
              </p>
              <p>
                AS 문의는 대전 타이어쇼핑몰 고객센터 010-5125-8008 또는 해당
               	 수입/제조사 고객센터로 문의하시기 바랍니다.
              </p>
            </div>
            <div>
              <h1>2. 타이어 배송 기간 과 당일 장착은 가능하나요?</h1>
              <p>
               	 타이어 택배 는 보통 제품준비 에서 배송 까지 2~3일 정도 소요 되며
                	도서 산간 지역은 6일 이내 배송됩니다.
              </p>
              <p>
               	 당일장착 서비스는 대전 타이어쇼핑몰 당일장착점 에서만 가능하며
                	제휴 장착점을 이용시 당일장착 은 불가능 합니다.
              </p>
            </div>
            <div>
              <h1>3. 타이어 제조일자는 어떻게 확인 하나요?</h1>
              <p>
                	타이어 옆면에 표시되어 있는 DOT 4자리 숫자를 확인하시면 됩니다.
                - (예) 2019 - 19년 20주 생산분 입니다.
              </p>
              <p>
               	 대전 타이어쇼핑몰 쇼핑몰에서 판매하는 타이어는 국내제조사
                6개월이내, 수입제조사 1년이내 제품으로 판매중 입니다.
              </p>
            </div>
          </li>
        </ul>
        <ul class="detail_include_guide" style="display: none">
          <li class="detail_include_txt">
            <div>
              <h1>1. 타이어 구매 예약 후 타이어 장착은 어떻게 하나요 ?</h1>
              <p>
            	    예약 하신 타이어는 타이어쇼핑몰 직영점 에서 당일 장착이 가능하며
             	   별도의 공임이 발생합니다.
              </p>
              <p>
              	  타이어 선택 후 원하시는 장착일을 선택하시고 지정한 날짜에 방문
              	  후 장착하시면 됩니다.
              </p>
            </div>
            <div>
              <h1>2. 타이어 장착은 원하는 시간에 가능한가요 ?</h1>
              <p>
                	장착일 지정 후 예약 완료 시 해피콜을 드리며 통화 후 원하시는
               	 시간을 예약하시면 가능합니다.
              </p>
              <p>
               	단, 간혹 작업이 밀리는 시간이 있으니 방문 후 기다리는 시간이
               	 발생할 수 있으니 이전 양해 부탁드립니다.
              </p>
            </div>
            <div>
              <h1>3. 타이어 비용 및 장착비용 결제는 어떻게 하나요 ?</h1>
              <p>
               	 타이어를 예약 후 타이어쇼핑몰 직영점 으로 방문하시어 장착 완료
               	 후 현장에서 결제 해주시면 됩니다.
              </p>
              <p>
             	   단, 타이어비용 이외에 장착비용이 발생하며 표준 공임표를
                참조해주세요.
              </p>
            </div>
          </li>
        </ul>
        <ul class="detail_include_info" style="display: none">
          <li class="detail_include_txt">
            <div>
              <h1>1. 배송안내</h1>
              <p>- 배송비용 : 무료배송 ( 단,도서산간 지역은 추가비용발생 )</p>
              <p>
                - 배송기간 : 오후 4시 이전 주문시 당일 발송 / 평균 배송기간
                2~3일 소요 ( 해당제품 재고 일시품절시 배송기간 추가 )
              </p>
            </div>
            <div>
              <h1>2. 반품 및 교환 안내</h1>
              <p>- 제품의 하자 및 오배송으로 인한 반품은 택배비 무료</p>
              <p>
                - 단순변심으로 인한 교환/환불은 제품 수령 후 7일 이내 가능하며
                왕복배송비용은 고객부담
              </p>
            </div>
            <div>
              <h1>3. 교환불가</h1>
              <p>- 타이어 장착을 한경우는 반품/교환이 불가능</p>
              <p>- 반품/교환 기간이 경과된 경우 불가능</p>
              <p>
                - 소비자의 책임으로 인한 상품의 훼손 및 멸실이 발생한 경우
                불가능
              </p>
              <p>- 타이어 장착에 흔적인 있는 경우 불가능</p>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <dialog class="detail_size_selector">
      <form method="dialog">
        <div class="detail_dialog_title">
          <span>사이즈선택</span>
          <button><i class="fa-solid fa-xmark"></i></button>
        </div>
        <div class="size_wrapper"></div>
      </form>
    </dialog>
    <dialog class="detail_size_guide">
      <form method="dialog">
        <button><i class="fa-solid fa-xmark"></i></button>
      </form>
      <img src="resources/web/main/product/tireGuideImg.png" />
    </dialog>
    <dialog class="detail_standard_table">
      <form method="dialog">
        <button><i class="fa-solid fa-xmark"></i></button>
      </form>
      <ul class="detail_standard_ul">
        <li class="detail_standard_li detail_standard_title">
          <span class="detail_standard_size">사이즈</span>
          <span class="detail_standard_price">가격</span>
        </li>
        <li class="detail_standard_li">
          <span class="detail_standard_size">16인치 이하</span>
          <span class="detail_standard_price">8,000원</span>
        </li>
        <li class="detail_standard_li">
          <span class="detail_standard_size">17인치</span>
          <span class="detail_standard_price">8,000원</span>
        </li>
        <li class="detail_standard_li">
          <span class="detail_standard_size">18인치</span>
          <span class="detail_standard_price">8,000원</span>
        </li>
        <li class="detail_standard_li">
          <span class="detail_standard_size">19인치</span>
          <span class="detail_standard_price">15,000원</span>
        </li>
        <li class="detail_standard_li">
          <span class="detail_standard_size">20인치</span>
          <span class="detail_standard_price">15,000원</span>
        </li>
        <li class="detail_standard_li">
          <span class="detail_standard_size">21인치 이상</span>
          <span class="detail_standard_price">장착점 문의</span>
        </li>
      </ul>
      <div class="detail_standard_add">
        <span>런플렛타이어, 공기압센서(TPMS), 페타이어처리비용</span>
        <span>5,000원</span>
      </div>
      <div class="detail_standard_add">
        <span>모든 금액은 VAT포함 금액이며 1본당 공임비용 입니다.</span>
      </div>
    </dialog>
    <dialog class="detail_cart_dialog">
      <form method="dialog">
        <div class="detail_cart_dialog_txt">
          <span>상품이 장바구니에 담겼습니다.</span>
          <h1>장바구니로 이동하시겠습니까?</h1>
        </div>
        <button class="detail_cart_confirm" onclick="location.href = 'cart'">
          확인
        </button>
        <button class="detail_cart_cancel">취소</button>
      </form>
    </dialog>
    <dialog class="detail_cart_dialog">
      <form method="dialog">
        <div class="detail_cart_dialog_txt">
          <span>이미 장바구니에 담긴 상품입니다.</span>
          <h1>장바구니로 이동하시겠습니까?</h1>
        </div>
        <button class="detail_cart_confirm" onclick="location.href = 'cart'">
          확인
        </button>
        <button class="detail_cart_cancel">취소</button>
      </form>
    </dialog>
    <dialog class="detail_size_warning">
      <form method="dialog">
        <div class="detail_cart_dialog_txt">
          <span>사이즈를 선택해주세요.</span>
        </div>
        <button>닫기</button>
      </form>
    </dialog>
    <script src="resources/js/main/product/product_detail.js"></script>
  </body>
</html>
