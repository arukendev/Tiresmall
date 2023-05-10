$("#datepicker" ).datepicker({
    	dateFormat: 'yy/mm/dd',
    	maxDate: 0
});
    
$("#datepicker1" ).datepicker({
		dateFormat: 'yy/mm/dd',
		maxDate: 0
});

$('.order_modal_go').click(function() {
	$("#product-table").empty();
	const modal_content_td = document.querySelectorAll(".modal_content_td");
	const tire_content_td = $(this).find('.tire_content_td');
	$('#order_modal').show();
	$('#order_modal').css('z-index', '3');
	// 모달 on
	
	
	/* $("body").css("overflow", 'hidden'); */ // 모달 스크롤 기능 view 합친후에 주석제거 요망

	$('#deleteModal').click(function() {
		var odNo = $("#orderNo_M").val();
		if (!confirm('정말 삭제 하시겠습니까?')) {
			// 취소
		} else {
			$.ajax({
				type: "GET",
				url: "delete.order.do",
				data: {o_no:odNo},
				success: function(result) {
					if (result === 1) {
						location.href = "admin.order.go";
					} else {
						console.log("삭제 실패");
					}
				}
			})
			
		}
	})
		
	let inputs = $(this).find('input');
	let arr = [];
	$(inputs).each(function (i, input) {
		arr.push($(input).val());
		// modal_content_td[i].innerText = val;
	});
	console.log("1 번째  "+arr[1]);
	console.log("2 번째  "+arr[2]);
	console.log("3 번째  "+arr[3]);
	console.log("4 번째  "+arr[4]);
	console.log("5 번째  "+arr[5]);
	console.log("6 번째  "+arr[6]);
	console.log("7 번째  "+arr[7]);
	console.log("8 번째  "+arr[8]);
	console.log("9 번째  "+arr[9]);
	console.log("10 번째  "+arr[10]);
	console.log("11 번째  "+arr[11]);
	console.log("12 번째  "+arr[12]);
	console.log("13 번째  "+arr[13]);
	console.log("14 번째  "+arr[14]);
	console.log("15 번째  "+arr[15]);
	console.log("16 번째  "+arr[16]);
	console.log("17 번째  "+arr[17]);
	console.log("18 번째  "+arr[18]);
	console.log("19 번째  "+arr[19]);
	console.log("20 번째  "+arr[20]);

	
	// console.log(arr);
	modal_content_td[0].innerText = arr[0];									// 주문번호
	modal_content_td[1].innerText = $(this).find(".td_c4").text(); 			// 주문일시
	modal_content_td[2].innerText = arr[2];									// 주문자명
	modal_content_td[3].innerText = arr[3];									// 연락처
	modal_content_td[4].innerText = arr[10];								// 회원아이디
	modal_content_td[6].innerText = arr[11];								// 차량번호
	modal_content_td[7].innerText = arr[12] + ' ' + arr[13] + ' ' + arr[14];// 차종 (null가능)
	modal_content_td[8].innerText = arr[15];								// 주문명
	modal_content_td[9].innerText = arr[16];								// 배송방법
	modal_content_td[10].innerText = arr[18];								// 주문자메모
	modal_content_td[12].innerText = arr[17];								// 배송지
	modal_content_td[13].innerText = arr[7];								// 결제방법
	modal_content_td[14].innerText = arr[8]+"원";								// 주문금액
	modal_content_td[15].innerText = $(this).find(".td_c00").text();		// 방문예약일
	
	/*	if(arr[5]!=''){
		modal_content_td[16].innerText = '직영점 방문 예약일입니다. 상품을 준비하고 주문자에게 해피콜해주세요.';		
	}else {
		modal_content_td[16].innerText =  '';
	}*/
	
	//수정
	$('#updateModal').click(function() {
		
		console.log($('#orderNo_M').val());
		console.log($(".modal-label:checked").val());
		console.log(arr[19]);
		$("#o_no").val(arr[4]);
		console.log($("#o_no").val());
		$("#o_step").val($(".modal-label:checked").val());
		
		$("#update_modal").submit();

	})
	
	let tire_tr = $(this).find('.tire_content_tr');
	let tire_tr2 = $(tire_tr).clone();
	let content = `<tr>
						<th class="tire_th"style="border-left-color: black;">종류</th>
						<th class="tire_th">브랜드명</th>
						<th class="tire_th">제품명</th>
						<th class="tire_th">스펙</th>
						<th class="tire_th"style="border-right-color: black;">주문수량</th>
					</tr>`
		$("#product-table").append(content);
		$("#product-table").append(tire_tr2);
	
	
	$('.modal-label').each(function(i, rInput) {
		if(arr[1] == rInput.value){
			$(rInput).attr("checked", "checked");
		}
	})

	// modal_content_td[15].innerText = arr[1];

	window.addEventListener("keydown", (e) => {
		if(e.keyCode == 27){
			$("#cancleModal").trigger("click");
		}
		if(e.keyCode == 13){
			$("#updateModal").trigger("click");
		}
	});
		
	
})

$("#cancleModal").click(function() {
	$('#order_modal').hide();
	// 모달 off
	$("body").css("overflow", 'auto');
});

//검색 엔터로 검색
window.addEventListener("keydown", (e) => {

	if(e.keyCode == 13){
		$(".orderBtn").trigger("click");
	}
});

