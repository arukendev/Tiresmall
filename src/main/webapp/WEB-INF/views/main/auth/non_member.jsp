<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="resouces/css/main/auth/nonmember.css" />
    <title>Insert title here</title>
  </head>
  <body>
    <div class="nonmember_container">
      <div class="nonmember_titles">
        <div class="nonmember_title">
          <h1 class="nonmember_title_txt">비회원 주문조회</h1>
        </div>
        <div class="nonmember_subtitle">
          <i class="fa-solid fa-house"></i>
          <i class="fa-solid fa-chevron-right"></i>
          <span>비회원 주문조회</span>
        </div>
      </div>

      <form action="nonmember.go" method="post" class="nonmember_form">
        <span>핸드폰 번호를 입력해주세요</span>
        <input type="text" name="o_phone" />
        <button>입력</button>
      </form>
      <div class="nonmember_contents">
        <c:choose>
          <c:when test="${empty orders}">
            <div class="myOrder_nonOrder">주문없엉</div>
          </c:when>
          <c:otherwise>
            <c:forEach var="o" items="${orders}">
              <h1 class="myOrder_num">주문번호: ${o.o_ordernumber}</h1>
              <ul class="myOrder_order">
                <li class="myOrder_title">
                  <div>
                    <span>주문일자: </span
                    ><span class="myOrder_oDate">${o.o_orderdate}</span>
                  </div>
                  <div>
                    <span>장착일</span>
                  </div>
                  <div>
                    <span>주문상태</span>
                  </div>
                </li>
                <c:forEach var="pl" items="${o.productList}">
                  <li class="myOrder_items">
                    <div class="myOrder_product_img">
                      <c:choose>
                        <c:when test="${pl.tg_img eq 'noimg'}">
                          <img
                            src="resources/web/main/product/no-tire-image.jpg"
                            style="width: 100px"
                          />
                        </c:when>
                        <c:otherwise>
                          <img
                            src="resources/web/main/tire/${pl.tg_img}.jpg"
                            style="width: 100px"
                          />
                        </c:otherwise>
                      </c:choose>
                    </div>
                    <div class="myOrder_product_info">
                      <span class="myOrder_product_brand">${pl.tg_brand}</span>
                      <span class="myOrder_product_name">${pl.tg_name}</span>
                      <div class="myOrder_quantity_box">
                        <c:choose>
                          <c:when test="${pl.ti_ratio eq 0}">
                            <h2 class="myOrder_product_size">
                              ${pl.ti_width}R${pl.ti_inch} (${pl.ti_marking})
                            </h2>
                          </c:when>
                          <c:otherwise>
                            <h2 class="myOrder_product_size">
                              ${pl.ti_width}/${pl.ti_ratio}R${pl.ti_inch}
                              (${pl.ti_marking})
                            </h2>
                          </c:otherwise>
                        </c:choose>
                        <span class="myOrder_quantity">${pl.ti_stock}EA</span>
                      </div>
                    </div>
                    <div class="myOrder_insDate">
                      <span class="myOrder_insDate_span"
                        >${o.o_tireinstalldate}</span
                      >
                    </div>
                    <div class="myOrder_step">
                      <span>${o.o_step}</span>
                    </div>
                  </li>
                </c:forEach>
                <li class="myOrder_last">
                  <div><span>장착점: </span><span>${o.o_storeshop}</span></div>
                  <div>
                    <span>결제금액: </span>
                    <span>
                      <fmt:formatNumber
                        value="${o.o_price}"
                        type="currency"
                        currencySymbol=""
                      />원
                    </span>
                  </div>
                </li>
              </ul>
            </c:forEach>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
    <script>
      if (location.href.includes("go")) {
        document.querySelector(".nonmember_contents").style.display = "flex";
        document.querySelector(".nonmember_form").style.display = "none";
      } else {
        document.querySelector(".nonmember_contents").style.display = "none";
        document.querySelector(".nonmember_form").style.display = "flex";
      }
      var oDate = document.querySelectorAll(".myOrder_oDate");
      var insDate = document.querySelectorAll(".myOrder_insDate_span");
      insDate.forEach((element) => {
        var insDateValue = element.innerText;
        element.innerText = insDateValue.substr(0, 10);
      });
      oDate.forEach((element) => {
        var oDateValue = element.innerText;
        element.innerText = oDateValue.substr(0, 10);
      });
    </script>
  </body>
</html>
