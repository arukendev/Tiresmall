<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/master.css" />
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
</head>
<script src="resources/js/admin/admin.js"></script>
</head>
<body>
	<div id="mainMenuba">
		<nav id="mainMenu">
			 <div class="index_logo">
              <a href="/home">
                <img src="resources/web/logo.png" style="height: 50px" />
              </a>
            </div>
			<div id="menuTitle1" onclick="location.href='admin.order.go?m=order'">주문 관리</div>
			<div id="menuTitle2" onclick="location.href='admin.tire.go?m=tire&sm=1'">타이어상품 관리</div>
			<div id="menuTitle3" onclick="location.href='admin.car.go?m=car&sm=1'">차종 관리</div>
			<div id="menuTitle4" onclick="location.href='admin.auth.go?m=auth'">회원 관리</div>
			<div id="menuTitle5" onclick="location.href='admin.store.go?m=store'">장착점 관리</div>
			<div id="menuTitle6" onclick="location.href='admin.notice.go?m=notice&sm=1'">게시판 관리</div>
		</nav>
		<input id="whatMenu" type="hidden" value="${param.m}">
	</div>
	<div id="subMenu">
		<jsp:include page="${subMenuPage }"></jsp:include>
	</div>
	<!--위 내용이 나올때는 top 120px  -->
	<div id="adminContent">
		<jsp:include page="${contentPage }"></jsp:include>
	</div>

</body>
</html>