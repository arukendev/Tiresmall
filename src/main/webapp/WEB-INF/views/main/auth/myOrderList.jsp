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
      <c:forEach var="o" items="${orders}">
        <ul class="myOrder_title">
          <li>
            <span>주문번호</span>
          </li>
          <li>
            <span>상품명</span>
          </li>
          <li>
            <span>구매수량</span>
          </li>
          <li>
            <span>합계금액</span>
          </li>
          <li>
            <span>결제방법</span>
          </li>
          <li>
            <span>주문상황</span>
          </li>
        </ul>

        <!-- <c:forEach var="o" items="${orders}">
          <ul class="myOrder_items">
            <li>
              <span>상품명</span>
            </li>
            <li>
              <span>구매수량</span>
            </li>
            <li>
              <span>합계금액</span>
            </li>
            <li>
              <span>결제방법</span>
            </li>
            <li>
              <span>주문상황</span>
            </li>
          </ul>
        </c:forEach> -->
      </c:forEach>
    </div>
  </body>
</html>
