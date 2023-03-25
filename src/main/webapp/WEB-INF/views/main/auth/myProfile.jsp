<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <div class="profile_container">
      <div class="profile_titles">
        <div class="profile_title">
          <h1 class="profile_title_txt"></h1>
        </div>
        <div class="profile_subtitle">
          <i class="fa-solid fa-house"></i>
          <i class="fa-solid fa-chevron-right"></i>
          <span></span>
        </div>
      </div>

      <div class="profile_contents">
        <div class="profile_sideMenu">
          <a class="profile_sideA side_orderA" href="profile">주문조회</a>
          <a class="profile_sideA side_infoA" href="profile.myInfo">내 정보</a>
        </div>

        <div class="profile_contentsArea">
          <jsp:include page="${profile_contents}"></jsp:include>
        </div>
      </div>
    </div>
    <script>
      if (location.href.includes("myInfo")) {
        document.querySelector(".side_infoA").style.color = "var(--red)";
        document.querySelector(".profile_title_txt").innerText = "내 정보";
        document.querySelector(".profile_subtitle span").innerText = "내 정보";
      } else {
        document.querySelector(".side_orderA").style.color = "var(--red)";
        document.querySelector(".profile_title_txt").innerText = "주문 조회";
        document.querySelector(".profile_subtitle span").innerText =
          "주문 조회";
      }
      console.log(location.href.includes("myInfo"));
    </script>
  </body>
</html>
