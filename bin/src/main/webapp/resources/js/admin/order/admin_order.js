$("#datepicker" ).datepicker({
    	dateFormat: 'yy/mm/dd'
   });
    
   $("#datepicker1" ).datepicker({
		dateFormat: 'yy/mm/dd'
});



$('.order_modal_go').click(function() {
	$("#product-table").empty();
	const modal_content_td = document.querySelectorAll(".modal_content_td");
	const tire_content_td = $(this).find('.tire_content_td');
	$('#order_modal').show();
	$('#order_modal').css('z-index', '3');
	// 모달 on
	
	$("#update_modal").attr("action", "")
	$("body").css("overflow", 'hidden');

	
	
		
	let inputs = $(this).find('input');
	let arr = [];
	$(inputs).each(function (i, input) {
		arr.push($(input).val());
		// modal_content_td[i].innerText = val;
	});
	
	$.each(arr, function(i,str) {
	});
	
	modal_content_td[0].innerText = arr[0];
	modal_content_td[1].innerText = arr[9];
	modal_content_td[2].innerText = arr[2];
	modal_content_td[3].innerText = arr[3];
	modal_content_td[4].innerText = arr[10];
	modal_content_td[6].innerText = arr[11];
	modal_content_td[7].innerText = arr[12] + ' ' + arr[13] + ' ' + arr[14];
	modal_content_td[8].innerText = arr[15];
	modal_content_td[9].innerText = arr[16];
	modal_content_td[10].innerText = arr[18];
	
	modal_content_td[12].innerText = arr[17];
	modal_content_td[13].innerText = arr[7];
	modal_content_td[14].innerText = arr[8];
	modal_content_td[15].innerText = arr[5];
	
	
	let tire_tr = $(this).find('.tire_content_tr');
	console.log(tire_tr);
	
	let content = `	<tr>
						<th class="tire_th">종류</th>
						<th class="tire_th">브랜드명</th>
						<th class="tire_th">제품명</th>
						<th class="tire_th">스펙</th>
						<th class="tire_th">주문수량</th>
					</tr>`
	
		$("#product-table").append(content);
	$("#product-table").append(tire_tr);
	
	
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

});


	
	
	
	
	
	
	
	
	
})

$("#cancleModal").click(function() {
	$('#order_modal').hide();
	// 모달 off
	$("body").css("overflow", 'auto');

});