<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="resources/js/main/auth/login_social.js"
    ></script>
  </head>
  <body>
    <div class="myOrder_list">
      <c:choose>
        <c:when test="${empty orders}">
          <div class="myOrder_nonOrder">
            <img src="resources/web/main/caution.png" style="width: 100px">
            <h1>조회된 주문이 없습니다.</h1>
          </div>
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
                          src="resources/web/main/tire/${pl.tg_img}"
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
                    <span class="myOrder_insDate_dDay"></span>
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
    <script>
      var oDate = document.querySelectorAll(".myOrder_oDate");
      var insDate = document.querySelectorAll(".myOrder_insDate_span");
      insDate.forEach((element) => {
        var insDateValue = element.innerText;
        element.innerText = insDateValue.substr(0, 10);
        var dateString = insDateValue.substr(0, 10);
        var diffInDays = new Date(dateString).getDate() - new Date().getDate();
        if (diffInDays > 0) {
          element.nextElementSibling.innerText = "D-" + diffInDays;
        } else if (diffInDays === 0) {
          element.nextElementSibling.innerText = "D-Day";
        } else {
          element.nextElementSibling.innerText = "장착일이 지났습니다!";
        }
      });
      oDate.forEach((element) => {
        var oDateValue = element.innerText;
        element.innerText = oDateValue.substr(0, 10);
      });
    </script>
  </body>
</html>
