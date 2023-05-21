<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>order</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"
	integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/css/admin/order/admin_order.css">
<link rel="stylesheet"
	href="resources/css/admin/order/admin_order_modal.css">
</head>
<body>
	<input id="whatMenu" value="order" type="hidden">

	<div id="order_modal" class="order_modal hidden" style="display: none;">


		<div class="modal-wrapper">
			<div class="order_modalcontent">
				<div class="order_header">주문 관리</div>
				<div id="admin_order_contain">
					<table class="modal_table">
						<tr>
							<td class="left_td">주문번호</td>
							<td class="modal_content_td"></td>
							<td class="left_td">주문일시</td>
							<td class="modal_content_td"></td>
						</tr>
						<tr>
							<td class="left_td">주문자명</td>
							<td class="modal_content_td"></td>
							<td class="left_td">연락처</td>
							<td class="modal_content_td"></td>
						</tr>
						<tr>
							<td class="left_td">회원아이디</td>
							<td class="modal_content_td"></td>
							<td class="left_td">광고동의</td>
							<td class="modal_content_td"></td>
						</tr>
						<tr>
							<td class="left_td">차량번호</td>
							<td class="modal_content_td"></td>
							<td class="left_td">차종</td>
							<td class="modal_content_td"></td>
						</tr>
						<tr>
							<td class="left_td">주문명</td>
							<td class="modal_content_td"></td>
							<td class="left_td">배송방법</td>
							<td class="modal_content_td"></td>
						</tr>
						<tr>
							<td class="left_td_long">주문자메모</td>
							<td colspan="3" class="modal_content_td long"></td>
						</tr>
						<tr>
							<td class="left_td_tire">주문상품 1종</td>
							<td colspan="3" class="modal_content_td tire ">
								<table style="width: 100%" id="product-table">


								</table>

							</td>
						</tr>
						<tr>
							<td class="left_td_long">배송지</td>
							<td colspan="3" class="modal_content_td long"></td>
						</tr>
						<tr>
							<td class="left_td">결제방법</td>
							<td class="modal_content_td"></td>
							<td class="left_td">주문금액</td>
							<td class="modal_content_td"></td>
						</tr>
						<tr>
							<td class="left_td_long">방문예약일</td>
							<td class="modal_content_td long"></td>
							<td class="modal_content_td" colspan="2">직영점 방문 예약일입니다. 상품을
								준비하고 주문자에게 해피콜해주세요.</td>
						</tr>
						<tr>
							<td class="left_td_long">주문진행</td>
							<td colspan="3" class="modal_content_td long"><label>
									<input class="modal-label" type="radio" name="o_step"
									value="결제대기">결제대기
							</label> <label> <input class="modal-label" type="radio"
									name="o_step" value="결제완료">결제완료
							</label> <label> <input class="modal-label" type="radio"
									name="o_step" value="배송준비중">배송준비중
							</label> <label> <input class="modal-label" type="radio"
									name="o_step" value="배송중">배송중
							</label> <label> <input class="modal-label" type="radio"
									name="o_step" value="배송완료">배송완료
							</label> <label> <input class="modal-label" type="radio"
									name="o_step" value="주문취소">주문취소
							</label></td>
						</tr>
						<tr>
							<td class="left_td">배송사명</td>
							<td class="modal_content_td"><input class="d-input">
							</td>
							<td class="left_td">송장번호</td>
							<td class="modal_content_td"><input class="d-input">
							</td>
						</tr>
					</table>
				</div>
				<form id="update_modal" action="update.order.do">
					<div class="modalBtn">
						<input type="hidden" name="o_no" id="o_no"> 
						<input type="hidden" name="o_step" id="o_step">
						<button class="modalBtn0" id="updateModal" type="button">저장</button>
						<button class="modalBtn2 modal-del" id="deleteModal" type="button">삭제</button>
						<button class="modalBtn2" id="cancleModal" type="button">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="container">
		<div>
			<form class="order_form" action="search.order.do">
				<div>
					<div class="input_box1">
						<div class="no-drag">기간검색</div>
						<input type="text" id="datepicker" maxlength="10" placeholder="시작"
							autocomplete="off" name="dateSearch1">&nbsp;~<input
							type="text" id="datepicker1" placeholder="종료" maxlength="10"
							autocomplete="off" name="dateSearch2">
					</div>
					<div class="input_box2">
						<div class="no-drag">주문자명</div>
						<input name="nameInput" id="o_name">
					</div>
					<div class="input_box3">
						<div class="no-drag" style="font-size: 17px;">주문자전화</div>
						<input name="phoneInput" placeholder="010 제외" id="o_phone">
					</div>
					<div class="input_box4">
						<div class="no-drag">주문번호</div>
						<input name="orderNumberInput" id="o_ordernumber">
					</div>
					<div class="button_box">
						<button id="searchBtn" class="orderBtn">검색</button>
					</div>
				</div>
			</form>
		</div>
		<div class="order_content">
			<table class="order_table">
				<tr>
					<th class="th_head" style="border-left-color: #343a40;">No</th>
					<th class="th_head">회원구분</th>
					<th class="th_head">주문번호</th>
					<th class="th_head">주문일시</th>
					<th class="th_head">주문자명</th>
					<th class="th_head">주문자전화</th>
					<th class="th_head">주문명</th>
					<th class="th_head">총금액</th>
					<th class="th_head">결제방법</th>
					<th class="th_head">배송방법</th>
					<th class="th_head" style="border-right-color: #343a40;">STEP</th>
				</tr>
				<c:if test="${empty orders}">
					<tr>
						<td colspan="11">해당 목록이없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="o" items="${orders }" varStatus="status">
					<tr class="order_modal_go">
						<td style="display: none;"><input name="o_ordernumber"
							value="${o.o_ordernumber }" id="ordernumber_M"> <input
							name="o_step" value="${o.o_step }" id="orderStep_M"> <input
							name="o_name" value="${o.o_name }" id="userName_M"> <input
							name="o_phone" value="${o.o_phone }" id="userPhoneNum_M">
							<input name="o_no" value="${o.o_no }" id="orderNo_M"> <input
							name="o_tireinstalldate" value="${o.o_tireinstalldate }"
							id="tireInstallDate_M"> <input name="o_deliverymethod"
							value="${o.o_deliverymethod }" id="deliveryMethod_M"> <input
							name="o_paymethod" value="${o.o_paymethod }"
							id="orderPayMethod_M"> <input name="o_price"
							value="${o.o_price }" id="storeShop_M"> <input
							name="o_orderdate" value="${o.o_orderdate }" id="orderDate_M">
							<input name="o_sortation" value="${o.o_sortation }"
							id="userSortation_M"> <input name="o_carnubmer"
							value="${o.o_carnumber }" id="carNumber_M"> <input
							name="o_caryear" value="${o.o_caryear }" id="ocy_M"> <input
							name="o_carbrand" value="${o.o_carbrand }" id="ocb_M"> <input
							name="o_carname" value="${o.o_carname }" id="ocn_M"> <input
							name="o_ordername" value="${o.o_ordername }" id="orderName_M">
							<input name="o_deliverymethod" value="${o.o_deliverymethod }"
							id="deliveryMethod_M"> <input name="o_storeshop"
							value="${o.o_storeshop }" id="orderStoreShop_M"> <input
							name="o_request" value="${o.o_request }" id="orederReq_M">
							<table>
								<c:forEach var="ordered_tire" items="${o.o_products }">
									<tr class="tire_content_tr">
										<td class="tire_content_td">타이어<input type="hidden"
											value="${ordered_tire.ti_id }">
										</td>
										<td class="tire_content_td">${ordered_tire.tg_brand }</td>
										<td class="tire_content_td">${ordered_tire.tg_name }</td>
										<td class="tire_content_td">${ordered_tire.ti_width }/${ordered_tire.ti_ratio }R${ordered_tire.ti_inch }<%-- ${ordered_tire.ti_marking } --%>
										</td>
										<td class="tire_content_td">${ordered_tire.ti_count }</td>
									</tr>
								</c:forEach>
							</table></td>

						<td class="td_c1">${status.count + (curPage-1)*count}</td>
						<td class="td_c2">${o.o_sortation }</td>
						<td class="td_c3">${o.o_ordernumber }</td>
						<td class="td_c4"><fmt:formatDate
								pattern="yyyy-MM-dd HH:mm:ss" value="${o.o_orderdate }" /></td>
						<td class="td_c00" style="display: none"><fmt:formatDate
								pattern="yyyy-MM-dd" value="${o.o_tireinstalldate }" /></td>
						<td class="td_c5">${o.o_name }</td>
						<td class="td_c6">${o.o_phone }</td>
						<td class="td_c7">${o.o_ordername }</td>
						<td class="td_c8">${o.o_price }</td>
						<td class="td_c9">${o.o_paymethod }</td>
						<td class="td_c10">${o.o_deliverymethod }</td>
						<td class="td_c11"><input type="hidden" value="${o.o_step }">
							<c:choose>
								<c:when test="${o.o_step eq '결제완료'}">
												결제완료
												</c:when>
								<c:when test="${o.o_step eq '결제대기'}">
												결제대기
												</c:when>
								<c:when test="${o.o_step eq '배송준비중'}">
												배송준비중
												</c:when>
								<c:when test="${o.o_step eq '배송중'}">
												배송중
												</c:when>
								<c:when test="${o.o_step eq '배송완료'}">
												배송완료
												</c:when>
								<c:when test="${o.o_step eq '주문취소'}">
												주문취소
												</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="paging-box">
		<c:if test="${curPage != 1 }">
			<a style="color: black;" href="order.page.change?p=${curPage - 1 }">이전</a>
		</c:if>

		<c:forEach var="page" begin="1" end="${pageCount }">
			<c:choose>
				<c:when
					test="${page eq param.p or (curPage == 1 and curPage == page)}">
					<a style="color: white; background-color: #333;"
						href="order.page.change?p=${page }">${page } </a>
				</c:when>
				<c:otherwise>
					<a style="color: black;" href="order.page.change?p=${page }">${page }
					</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${curPage != pageCount }">
			<a style="color: black;" href="order.page.change?p=${curPage + 1 }">다음</a>
		</c:if>
	</div>
	<script src="resources/js/admin/order/admin_order.js"></script>

</body>
</html>