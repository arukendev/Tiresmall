<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
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

      <form action="nonmember.go" method="post" class="nonMember_form">
        <span>연락처를 입력해주세요</span>
        <input type="text" name="o_phone" placeholder="-을 제외하고 입력해주세요"/>
        <button>입력</button>
      </form>
      <div class="nonMember_contents">
        <c:choose>
          <c:when test="${empty orders}">
            <div class="nonMember_nonOrder">
              <img src="resources/web/main/caution.png" style="width: 100px">
              <h1>조회된 주문이 없습니다.</h1>
            </div>
          </c:when>
          <c:otherwise>
            <c:forEach var="o" items="${orders}">
              <h1 class="nonMember_num">주문번호: ${o.o_ordernumber}</h1>
              <ul class="nonMember_order">
                <li class="nonMember_title">
                  <div>
                    <span>주문일자: </span
                    ><span class="nonMember_oDate">${o.o_orderdate}</span>
                  </div>
                  <div>
                    <span>장착일</span>
                  </div>
                  <div>
                    <span>주문상태</span>
                  </div>
                </li>
                <c:forEach var="pl" items="${o.productList}">
                  <li class="nonMember_items">
                    <div class="nonMember_product_img">
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
                    <div class="nonMember_product_info">
                      <span class="nonMember_product_brand"
                        >${pl.tg_brand}</span
                      >
                      <span class="nonMember_product_name">${pl.tg_name}</span>
                      <div class="nonMember_quantity_box">
                        <c:choose>
                          <c:when test="${pl.ti_ratio eq 0}">
                            <h2 class="nonMember_product_size">
                              ${pl.ti_width}R${pl.ti_inch} (${pl.ti_marking})
                            </h2>
                          </c:when>
                          <c:otherwise>
                            <h2 class="nonMember_product_size">
                              ${pl.ti_width}/${pl.ti_ratio}R${pl.ti_inch}
                              (${pl.ti_marking})
                            </h2>
                          </c:otherwise>
                        </c:choose>
                        <span class="nonMember_quantity">${pl.ti_stock}EA</span>
                      </div>
                    </div>
                    <div class="nonMember_insDate">
                      <span class="nonMember_insDate_span"
                        >${o.o_tireinstalldate}</span
                      >
                      <span class="nonMember_insDate_dDay"></span>
                    </div>
                    <div class="nonMember_step">
                      <span>${o.o_step}</span>
                    </div>
                  </li>
                </c:forEach>
                <li class="nonMember_last">
                  <div><span>장착점: </span><span>${o.o_storeshop}</span></div>
                  <div>
                    <span>결제금액: </span>
                    <span class="nonMember_cost">${o.o_price}</span>
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
        document.querySelector(".nonMember_contents").style.display = "flex";
        document.querySelector(".nonMember_form").style.display = "none";
      } else {
        document.querySelector(".nonMember_contents").style.display = "none";
        document.querySelector(".nonMember_form").style.display = "flex";
      }
      var oDate = document.querySelectorAll(".nonMember_oDate");
      var insDate = document.querySelectorAll(".nonMember_insDate_span");
      var oCost = document.querySelectorAll(".nonMember_cost");
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
      oCost.forEach((element) => {
        var oCostValue = element.innerText;
        element.innerText = parseInt(oCostValue).toLocaleString() + "원";
      })
    </script>
  </body>
</html>
