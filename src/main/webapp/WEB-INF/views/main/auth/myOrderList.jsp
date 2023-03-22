<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/main/auth/login_social.js"></script>
</head>
<body id="orderList_body">

<div class="list">
	  <div class="heading">
	    <h4>Order List</h4>
	    <i class="fas fa-ellipsis-h"></i>
	  </div>
	  <!-- <form>
	    <input type="search" placeholder="Invoice Search">
	    <input type="text" placeholder="Search by Title">
	    <input type="phone" placeholder="Search by Phone">
	    <input type="submit" value="Search">
	  </form> -->
	  <div class="main">
	    <span class="invoice">
	      <span>주문번호</span>
	    </span>
	    <!--  <span class="image">
	      <span>Image</span>
	    </span>-->
	    <span class="product">
	      <span>상품명</span>
	    </span>
	    <span class="quantity">
	      <span>구매수량</span>
	    </span>
	    <span class="amount">
	      <span>합계금액</span>
	    </span>
	    <span class="status">
	      <span>결제방법</span>
	    </span>
	    <span class="phone">
	      <span>휴대전화</span>
	    </span>
	    <span class="status">
	      <span>주문상황</span>
	    </span>
	  </div>
	  <div class="items">
	  
	  <c:forEach var="o" items="${orders }" varStatus="status">
	    <div class="item">
	      <span>${o.o_ordernumber }</span>
	      <span></span>
	      <span></span>
	      <span><img src="resources/web/product/no-tire-image.jpg"> </span>
	      <span>${o.o_ordername }</span>
	      <span><fmt:formatNumber value="${o.o_price }" pattern="#,###" /></span>
	      <span>${o.o_phone }</span>
	      <button>${o.o_step }</button>
	      <i class="fas fa-ellipsis-h"></i>
	    </div>
	  </c:forEach>
	    
	  
	 
	<!--   <div class="bottom">
	    <div class="showing">
	      <span>Showing 1-30 / 150 Results</span>
	    </div>
	    <div class="number">
	      <span>Previous</span>
	      <span>1</span>
	      <span>2</span>
	      <span>3</span>
	      <span>4</span>
	      <span>Next</span>
	    </div>
	  </div> -->
	  
	  
	</div>

</div>







</body>
</html>